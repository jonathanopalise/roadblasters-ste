    move.l a6,usp
    lea $ffff8a20.w,a6
    move.w #2,(a6)+            ; source x increment 8a20
    move.w #0,(a6)             ; source y increment 8a22
    addq.l #6,a6               ; source address 8a24
    move.w #-1,(a6)+           ; endmask1 8a28
    move.w #-1,(a6)+           ; endmask2 8a2a
    move.w #-1,(a6)+           ; endmask3 8a2c
    move.w #8,(a6)+            ; dest x increment 8a2e
    move.w #8,(a6)             ; dest y increment 8a30
    addq.l #6,a6               ; dest address 8a32
    move.w #20,(a6)            ; xcount 8a36
    addq.l #4,a6               ; ycount 8a38
    move.w #$0203,(a6)         ; hop/op 8a3a
    move.b #0,3(a6)            ; skew etc 8a3d
    move.l usp,a6

    addq.l #1,d0               ; increment ycount

    ; we draw the leftBackgroundOnRightSide first
    ; then we draw the rightBackgroundOnLeftSide
    ; skew for both spans is the same
    ; rightBackgroundOnLeftSide may overlap leftBackgroundOnRightSide:
    ;     - only when skew > 0
    ;     - in this situation, words written by rightBackgroundOnLeftSide += 1
    ;     - apply endmask3 to rightBackgroundOnLeftSide to overlap incorrect parts of leftBackgroundOnRightSide
    ;     - might need to apply endmask1 to rightBackgroundOnLeftSide instead when words to write = 1

    ; first draw the left half of the background on the right side of the screen (leftBgOnRightSide)
    ; then draw the right half of the background on the left side of the screen (rightBgOnLeftSide)
    ; drawing of rightBgOnLeftSide =
    ;     need to change source offset as we currently do, except source address + 160
    ;     DRAWN ON LEFT SIDE OF SCREEN
    ;     endmask1/endmask2/endmask3 must be ffff by default
    ;     note that endmask1 is used instead of endmask3 when drawing one word
    ;
    ;     calculations:
    ;     - skew = bgShift & 15;
    ;     - words = (bgShift >> 4) + 1
    ;     - sourceOffsetChange = (existing calculation)
    ;     - also need to change sourceyadd - subtract number of words * 2
    ;     - endmask3 = lookup_table[skew] - remember to multiply
    ;
    ;     bgShift   skew   words endmask3(or alternative)   description
    ;     0         0      0     (not applicable)           draw nothing
    ;     1         1      1     1000 0000 0000 0000        1 pixel total, 1 pixel overlapping leftBgOnRightSide, 1 word drawn
    ;     2         2      1     1100 0000 0000 0000        2 pixels total, 2 pixels overlapping leftBgOnRightSide, 1 word drawn
    ;     3         3      1     1110 0000 0000 0000        3 pixels total, 3 pixels overlapping, 1 word drawn
    ;     ......
    ;     14        14     1     1111 1111 1111 1100        14 pixels total, 14 pixels overlapping leftBgOnRightSide, 1 word drawn
    ;     15        15     1     1111 1111 1111 1110        15 pixels total, 15 pixels overlapping leftBgOnRightSide, 1 word drawn
    ;     16        0      2     1111 1111 1111 1111        16 pixels total, no overlapping leftBgOnRightSide, 2 words drawn 
    ;     17        1      2     1000 0000 0000 0000        17 pixels total, 1 pixel overlapping leftBgOnRightSide, 2 words drawn
    ;     ......
    ;     30        14     2     1111 1111 1111 1100        30 pixels total, 14 pixels overlapping leftBgOnRightSide, 2 words drawn
    ;     31        15     2     1111 1111 1111 1110        31 pixels total, 15 pixels overlapping leftBgOnRightSide, 2 words drawn
    ;     32        0      3     1111 1111 1111 1111        32 pixels total, no overlapping leftBgOnRightSide, 3 words drawn
    ;     33        1      3     1000 0000 0000 0000        33 pixels total, 1 pixel overlapping leftBgOnRightSide, 3 words drawn
    ;     ......
    ;     303       15     
    ;     304       0      20    1111 1111 1111 1111        304 pixels total, no overlapping leftBgOnRightSide, 20 words drawn
    ;     305       1      20    1000 0000 0000 0000        305 pixels total, 1 pixel overlapping leftBgOnRightSide, 20 words drawn
    ;     ......
    ;     319       15     20    1111 1111 1111 1110        319 pixels total, 15 pixels overlapping leftBgOnRightSide
    ;
    ; if backgroundShift = 0, only draw leftBgOnRightSide then end
    ; if skew > 0:
    ;     we need to draw an additional word of the rightBackgroundOnLeftSide
    ;     rightBackgroundOnLeftSide will overlap leftBackgroundOnRightSide
    ;     there will need to be an endmask3 value on rightBackgroundOnLeftSide that makes sure only the first "skew" left bits are written
    ;         (might need to populate endmask1 as well if only one word being written)


    ; leftBgOnRightSide:
    ;
    ; bgShift   skew   words   addToDestination
    ; 0         0      20      0
    ; 1         1      20      0
    ; 2         2      20      0
    ; ....
    ; 14        14     20      0
    ; 15        15     20      0
    ; 16        0      19      8
    ; 17        1      19      8
    ; 18        2      19      8
    ; ....
    ; 30        14     19      8
    ; 31        15     19      8
    ; 32        0      18      16
    ; 33        1      18      16
    ;
    ; calculations:
    ;   - skew = bgShift & 15
    ;   - words = 20 - (bgShift >> 4)
    ;   - addToDestination = (bgShift >> 1) & 0xf8
    ;   - sourceyadd = 160 - (number of words * 2)?


left_bg_on_right_side:
    move.w background_shift,d2
    move.w d2,d3
    moveq.l #0,d5
    move.w d2,d5
    and.w #$f,d2
    or.w #$80,d2
    move.b d2,$ffff8a3d.w      ; skew 8a3d

    move.w #20,d4
    lsr.w #4,d3
    sub.w d3,d4                ; number of words
    move.w d4,$ffff8a36.w      ; xcount 8a36 = numberOfWords

    move.l a0,-(a7)            ; save destination address
    move.l a1,-(a7)            ; save destination address

    lsr.w #1,d5
    and.w #$f8,d5
    add.l d5,a0    

    move.w #160,d5
    add.w d4,d4
    sub.w d4,d5
    move.w d5,$ffff8a22.w      ; source y increment 8a22 = (20-numberOfWords)*2

    macro draw_plane
    move.l a1,$ffff8a24.w      ; source address 8a24
    move.l a0,$ffff8a32.w      ; dest address 8a32
    move.w d0,$ffff8a38.w      ; ycount 8a3a
    move.b #$c0,$ffff8a3c.w    ; blitter control 8a3c
    endm

    macro advance_src_dst
    addq.l #2,a0
    lea $2828(a1),a1
    endm

    draw_plane
    advance_src_dst
    draw_plane
    advance_src_dst
    draw_plane
    advance_src_dst
    draw_plane

    ; end of left_bg_on_right_side

    move.l (a7)+,a1            ; restore destination address
    move.l (a7)+,a0            ; restore destination address

right_bg_on_left_side:
    move.w background_shift,d2
    tst.w d2
    beq no_right_bg_on_left_side

    move.w d2,d3
    move.w d2,d4

    and.w #15,d2               ; this is the skew value
    or.w #$80,d2               ; force extra source read, d2 is now skew|fxsr
    move.b d2,$ffff8a3d.w      ; skew 8a3d

    lsr.w #3,d3                ; bring background shift into a 0-39 range
    and.w #254,d3              ; round background shift to the nearest word
    sub.l d3,a1
    lea 40(a1),a1              ; add 320 pixels in single bitplane, a1 is now base sourceAddress

    lsr.w #4,d4
    addq.w #1,d4               ; numberOfWords = (background_shift >> 4) + 1
    move.w d4,$ffff8a36.w      ; xcount 8a36 = numberOfWords

    move.w #20,d5
    sub.w d4,d5
    add.w d5,d5
    move.w d5,$ffff8a22.w      ; source y increment 8a22 = (20-numberOfWords)*2
    add.w d5,d5
    add.w d5,d5
    add.w #8,d5                ; dest y increment = ((20-numberOfWords)*8)+8
    move.w d5,$ffff8a30.w      ; dest y increment 8a30

    draw_plane
    advance_src_dst
    draw_plane
    advance_src_dst
    draw_plane
    advance_src_dst
    draw_plane

no_right_bg_on_left_side:

    rts

background_shift:
    dc.w 0



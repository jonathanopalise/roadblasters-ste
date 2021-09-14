    ORG $11cf8

    include generated/symbols_0x80000.inc

draw_road:
    ; a5 is back buffer destination pointer
    ; a6 is road source metadata

    lea $ffff8a20.w,a6
    move.w #8,(a6)+            ; source x increment 8a20
    move.w #-158,(a6)          ; source y increment 8a22
    addq.l #6,a6
    move.w #-1,(a6)+           ; endmask1 8a28
    move.w #-1,(a6)+           ; endmask2 8a2a
    move.w #-1,(a6)+           ; endmask3 8a2c
    move.w #8,(a6)+            ; dest x increment 8a2e
    move.w #-150,(a6)          ; dest y increment 8x30
    addq.l #6,a6
    move.w #20,(a6)           ; xcount 8a36
    addq.l #4,a6
    move.w #$0203,(a6)        ; hop/op 8a3a
    lea $ffff8a38.w,a4      ; ycount
    lea $ffff8a24.w,a3      ; source
    lea $ffff8a3a.w,a2      ; hop/op
    ;lea $ffff8a3c.w,a1      ; linenum (to start blitter)
    lea.l byte_offsets,a0

    ; data starts at 3D5A6
    lea $3d5a6,a6
    move.l $4686e,a5
    add.w #$6860,a5

label_11d08:
    move.w (a6),d0
    cmp.w #-1,d0
    beq.s exit_draw_road

    add.b $3e608.l,d0
    move.l a0,a1

    moveq.l #0,d4
    btst.l #6,d0
    beq not_alternate
    add.l #99*4,a1
not_alternate:

    ; then my stuff

    move.w 4(a6),d0
    neg.w d0

    move.w 2(a6),d1
    add.w 6(a6),d1
    sub.w #90,d1
    muls d1,d0
    asr.l #8,d0
    move.w d0,d1

    neg.w d1
    ext.l d1                 ; d1 is the shift value for the current line
    add.l #16,d1
    move.l d1,d3             ; copy to d3
    and.b #15,d3             ; convert to skew value
    asr.w #1,d1              ; shift the source data pointer to the correct start point
    and.b #$f8,d1
    or.w #$c080,d3           ; hog mode

    move.l (a1),d2
    add.l d4,d2
    sub.l d1,d2

    move.l d2,(a3)          ; source
    move.l a5,$ffff8a32.w     ; destination
    move.w #$4,(a4)           ; ycount
    move.w d3,$ffff8a3c.w        ; blitter control

label_11fec:
    addq.l #4,a0
    sub.w #$a0,a5
    add.w #$c,a6
    bra label_11d08

exit_draw_road:
    jmp $11ff8 



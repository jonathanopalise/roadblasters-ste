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
    lea $ffff8a3c.w,a1      ; linenum (to start blitter)
    lea.l byte_offsets,a0

    lea $3d5a6,a6
    move.l $4686e,a5
    add.w #$6860,a5

label_11d08:
    move.w (a6),d0
    cmp.w #-1,d0
    beq.s exit_draw_road

    ; then my stuff

    ;ext.l d1                 ; d1 is the shift value for the current line
    ;move.l d1,d3             ; copy to d3
    ;and.b #15,d3             ; convert to skew value
    ;asr.w d5,d1              ; shift the source data pointer to the correct start point
    ;and.b #$f8,d1

    ;lsr.w #2,d0              ; bring the road width value into a 0-255 range
    ;and.w #$3fc,d0           ; bring the road width value into a 0-255 range

    move.l (a0),(a3)          ; source
    move.l a5,$ffff8a32.w     ; destination
    move.w #$4,(a4)           ; ycount
    move.b #$c0,(a1)          ; blitter control

    ;move.l a5,a1
    ;rept 20
    ;move.l d1,(a1)+
    ;move.l d1,(a1)+
    ;endr

label_11fec:
    addq.l #4,a0
    sub.w #$a0,a5
    add.w #$c,a6
    bra label_11d08

exit_draw_road:
    jmp $11ff8 


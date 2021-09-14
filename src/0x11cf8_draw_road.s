    ORG $11cf8

    include generated/symbols_0x80000.inc

draw_road:
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
    ;lea $ffff8a38.w,a5      ; ycount
    ;lea $ffff8a24.w,a3      ; source
    ;lea $ffff8a3a.w,a2      ; hop/op
    ;lea $ffff8a3c.w,a6      ; linenum (to start blitter)
    ;moveq.l #1,d5 ; d5 is now free for use
    lea.l byte_offsets,a0
    ;move.l a0,usp
    ;lea.l gfx_data(pc),a0
    ;move.l a0,d6

    lea $3d5a6,a6
    move.l $4686e,a5
    add.w #$6860,a5

label_11d08:
    move.w (a6),d0
    cmp.w #-1,d0
    beq.s exit_draw_road

    ; then my stuff

    move.l a5,a1
    rept 20
    move.l d1,(a1)+
    move.l d1,(a1)+
    endr

label_11fec:
    sub.w #$a0,a5
    add.w #$c,a6
    bra label_11d08

exit_draw_road:
    jmp $11ff8 



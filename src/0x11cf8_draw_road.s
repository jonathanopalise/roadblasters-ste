    ORG $11cf8

    include generated/symbols_0x80000.inc

draw_road:
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



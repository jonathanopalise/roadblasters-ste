draw_road_span:

    move.l a5,a1

    rept 20
    move.l d1,(a1)+
    move.l d1,(a1)+
    endr

    ;lea 160(a1),a1

    jmp $11fec


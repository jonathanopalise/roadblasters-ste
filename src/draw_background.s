draw_background:
    move.l a6,usp
    lea $ffff8a20.w,a6
    move.w #2,(a6)+            ; source x increment 8a20
    move.w #0,(a6)             ; source y increment 8a22
    addq.l #6,a6               ; source address 8a24
    move.w #-1,(a6)+           ; endmask1 8a28
    move.w #-1,(a6)+           ; endmask2 8a2a
    move.w #-1,(a6)+           ; endmask3 8a2c
    move.w #8,(a6)+            ; dest x increment 8a2e
    move.w #0,(a6)             ; dest y increment 8x30
    addq.l #6,a6               ; dest address 8a32
    move.w #20,(a6)            ; xcount 8a36
    addq.l #4,a6               ; ycount 8a38
    move.w #$0203,(a6)         ; hop/op 8a3a
    move.b #0,3(a6)            ; skew etc 8a3d
    move.l usp,a6

    move.l a1,$ffff8a24.w      ; source address 8a24
    move.l a0,$ffff8a32.w      ; dest address 8a32
    move.w d0,$ffff8a38.w      ; ycount 8a3a
    move.b #$c0,$ffff8a3c.w    ; blitter control 8a3c

    addq.l #2,a0
    lea $2828(a1),a1

    move.l a2,$ffff8a24.w      ; source address 8a24
    move.l a0,$ffff8a32.w      ; dest address 8a32
    move.w d0,$ffff8a38.w      ; ycount 8a3a
    move.b #$c0,$ffff8a3c.w    ; blitter control 8a3c

    addq.l #2,a0
    lea $2828(a1),a1

    move.l a3,$ffff8a24.w      ; source address 8a24
    move.l a0,$ffff8a32.w      ; dest address 8a32
    move.w d0,$ffff8a38.w      ; ycount 8a3a
    move.b #$c0,$ffff8a3c.w    ; blitter control 8a3c

    addq.l #2,a0
    lea $2828(a1),a1

    move.l a4,$ffff8a24.w      ; source address 8a24
    move.l a0,$ffff8a32.w      ; dest address 8a32
    move.w d0,$ffff8a38.w      ; ycount 8a3a
    move.b #$c0,$ffff8a3c.w    ; blitter control 8a3c

    rts


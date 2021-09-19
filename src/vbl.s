vbl:
    movem.l d0-d7/a0-a6,-(sp)
    jsr $14bf8
    movem.l (sp)+,d0-d7/a0-a6
    rte


;new_raster_routine:

;    subq.b #1,raster_count
;    beq.s final_bar

;    move.l    a0,usp
;    addq.l    #2,current_gradient_address
;    move.l    current_gradient_address(pc),a0
;    move.w    (a0),$ffff825e.w
;    move.l    usp,a0
;    clr.b     $fffffa1b.w
;    move.b    #4,$fffffa21.w
;    move.b    #8,$fffffa1b.w
;    bclr      #0,$fffffa0f.w
;    rte

;final_bar:
;    clr.b     $fffffa1b.w
;final_bar_line_count_instruction:
;    move.b    #$68,$fffffa21.w
;    move.b    #8,$fffffa1b.w
;final_bar_vector_instruction:
;    move.l    #$70684,$0120.w
;    bclr      #0,$fffffa0f.w
;    rte


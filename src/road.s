; disassembly - grazey/PHF


	opt	x+,w-

	text
begin
	movea.l	4(a7),a5
	move.l	4(a5),l04a4
	move.l	24(a5),d1
	add.l	28(a5),d1
	move.l	d1,l04b6
	clr.l	-(a7)
	move.w	#$20,-(a7)	; Super
	trap	#1
	addq.w	#6,a7

	move.l	d0,l0415
	dc.b	$a0,$a
	sf	l04de
	bsr	l0124
	bsr	l0068
	jsr	l0351
	moveq	#0,d0
	nop
	nop
	move.b	d0,l0004
	move.w	#0,d0
	bra	l0000
	move.b	l0004,d1
	cmp.b	d0,d1
	bne.b	l0001
	moveq	#$a,d0
	bsr	l0002
	move.b	d0,l0004
	moveq	#$a,d0
	bsr	l0002
	move.b	l0004,d1
	cmp.b	d0,d1
	bne.b	l0001
l0000	bra	l0005
l0001	moveq	#8,d0
	bsr	l0002
	move.b	d0,l0004
	move.w	#8,d0
	bsr	l0002
	move.b	l0004,d1
	cmp.b	d0,d1
	beq.b	l0005
	clr.l	l0011
	bra.b	l0005
l0002	move.w	#1,-(a7)
	move.w	#0,-(a7)
	move.w	#$4f,-(a7)
	move.w	d0,-(a7)
	move.w	#0,-(a7)
	clr.l	-(a7)
	move.l	l04a9,-(a7)
	move.w	#8,-(a7)	; Floppy Read sector
	trap	#$e
	adda.l	#$14,a7
	movea.l	l04a9,a0
	move.w	#$10,d1
	move.b	#0,d0
l0003	move.b	(a0)+,d2
	eor.b	d2,d0
	dbf	d1,l0003
	rts

l0004	dc.b	0,0
l0005	move.w	#$46,d0
	nop
	nop
	move.b	d0,l0008
	move.w	#$aa,d0
	bra	l0009
	move.b	l0008,d1
	cmp.b	d0,d1
	bne.b	l0009
	moveq	#9,d0
	bsr	l0006
	move.b	d0,l0008
	move.w	#9,d0
	bsr	l0006
	move.b	l0008,d1
	cmp.b	d0,d1
	bne.b	l0009
	clr.l	l0026
	bra.b	l0009
l0006	move.w	#1,-(a7)
	move.w	#0,-(a7)
	move.w	#$4f,-(a7)
	move.w	d0,-(a7)
	move.w	#0,-(a7)
	clr.l	-(a7)
	move.l	l04a9,-(a7)
	move.w	#8,-(a7)
	trap	#$e	; Read sector
	adda.l	#$14,a7
	movea.l	l04a9,a0
	move.w	#$10,d1
	move.b	#0,d0
l0007	move.b	(a0)+,d2
	eor.b	d2,d0
	dbf	d1,l0007
	rts

l0008	dc.b	0,0
l0009	st	l04cb
	move.b	#$f,l03c7
	moveq	#3,d0
	jsr	music
	move.l	#l04a7,l046b
	lea	l040c,a0
	jsr	l0366
	move.w	#$c8,l049e
	bsr	l0238
	move.w	#9,d0
	bra	l000d
	move.b	d0,l000c
	move.w	#9,d0
	bsr	l000a
	move.b	l000c,d1
	cmp.b	d0,d1
	bne.b	l000d
	moveq	#9,d0
	bsr	l000a
	move.b	d0,l000c
	move.w	#9,d0
	bsr	l000a
	move.b	l000c,d1
	cmp.b	d0,d1
	bne.b	l000d
	clr.l	music
	bra.b	l000d

l000a	move.w	#1,-(a7)
	move.w	#0,-(a7)
	move.w	#$4f,-(a7)
	move.w	d0,-(a7)
	move.w	#0,-(a7)
	clr.l	-(a7)
	move.l	l04a9,-(a7)
	move.w	#8,-(a7)	; Floppy Read?!
	trap	#$e
	adda.l	#$14,a7

	movea.l	l04a9,a0
	move.w	#$10,d1
	move.b	#0,d0
l000b	move.b	(a0)+,d2
	eor.b	d2,d0
	dbf	d1,l000b
	rts

l000c	dc.b	0,0
l000d	bsr	l02be
	bsr	l006a
	bsr	l031d
	bsr	l01b5
	bsr	l021b
	bra.b	l0011
	dc.b	0,'p'
	dc.l	l0010
	bsr.b	l000e
	move.b	l0010,d1
	cmp.b	d0,d1
	bne.b	l0011
	bsr	l000e
	move.b	d0,l0010
	bsr	l000e
	move.b	l0010,d1
	cmp.b	d0,d1
	bne.b	l0011
	clr.l	l0239
	bra.b	l0011
l000e	move.w	#1,-(a7)
	move.w	#0,-(a7)
	move.w	#$4f,-(a7)
	move.w	#9,-(a7)
	move.w	#0,-(a7)
	clr.l	-(a7)
	move.l	l04a9,-(a7)
	move.w	#8,-(a7)	; Floppy Read
	trap	#$e
	adda.l	#$14,a7

	movea.l	l04a9,a0
	moveq	#$10,d1
	clr.b	d0
l000f	move.b	(a0)+,d2
	eor.b	d2,d0
	dbf	d1,l000f
	rts

l0010	dc.b	0,0

l0011	moveq	#2,d0
	jsr	music
	lea	l040c,a0
	jsr	l0366
	lea	l04aa,a1
	lea	l035b,a0
	jsr	l0356
	move.w	#$c8,l049e
	bsr	l0238
	move.w	#$12c,l04dc
l0012	move.w	#1,l04ab
l0013	tst.w	l04ab
	bne.b	l0013
	andi.b	#1,l0420
	bne.b	l0014
	bsr	l001d
	cmp.b	#$ff,d0
	beq.b	l0015
	cmp.b	#$1b,d0
	beq	l01d0
	bsr	l0022
l0014	jsr	music+($e*2)
	bsr	l0026
	tst.b	l04cb
	beq.b	l0015
	jsr	music+($e*3)
l0015	subq.w	#1,l04dc
	bne.b	l0012
l0016	move.w	#$12c,l0416
	bra	l01d0
l0017	bsr	l0281
	jsr	music+($e*2)
	move.w	#$12c,l04dc
	clr.w	l041f
l0018	move.w	#1,l04ab
l0019	tst.w	l04ab
	bne.b	l0019
	andi.b	#1,l0420
	bne.b	l001a
	bsr	l001d
	cmp.b	#$1b,d0
	beq	l01d0
	cmp.b	#$ff,d0
	beq.b	l001b
	bsr	l0022
l001a	jsr	music+($e*2)
	bsr	l0026
	tst.b	l04cb
	beq.b	l001b
	jsr	music+($e*3)
l001b	subq.w	#1,l04dc
	bne.b	l0018
	bra	l0011
	rts

l001c	bsr	l0354
	bsr	l0069
	dc.b	$a0,9

	move.l	l0415,-(a7)
	move.w	#$20,-(a7)
	trap	#1
	addq.w	#6,a7

	clr.w	-(a7)
	trap	#1
l001d	move.w	#$b,-(a7)	; check key buff
	trap	#1
	addq.w	#2,a7
	tst.w	d0
	bmi.b	l001e
	move.b	#$ff,d0
	rts

l001e	move.w	#7,-(a7)	; Read keyb
	trap	#1
	addq.w	#2,a7
	move.w	d0,-(a7)
	bsr	l001f
	move.w	(a7)+,d0
	rts

l001f	clr.w	l041f
l0020	move.w	#$b,-(a7)
	trap	#1
	addq.w	#2,a7
	tst.w	d0
	bpl.b	l0021

	move.w	#7,-(a7)	; Read keyb
	trap	#1
	addq.w	#2,a7
	bra.b	l0020
l0021	rts

l0022	cmp.b	#$4d,d0
	beq.b	l0024
	cmp.b	#$6d,d0
	beq.b	l0024
	cmp.b	#$6a,d0
	beq.b	l0023
	cmp.b	#$4a,d0
	bne.b	l0025
l0023	bra	l0067
l0024	bra	l0066
l0025	rts

l0026	tst.w	l04ab
	bne.b	l0026
	clr.b	l0472
	move.w	l0469,-(a7)
	move.w	l046c,-(a7)
	move.w	#$f,l0469
	clr.w	l046c
	move.b	#0,l04d3
	move.w	#0,l041c
	move.l	#l04a9,l046b
	lea	l040e,a0
	jsr	l0366
	bsr	l0330
	lea	l04ae,a0
	lea	l035d,a1
	lea	l0359,a2
	lea	l035b,a3
	moveq	#7,d0
l0027	move.l	2(a1),(a0)+
	move.l	2(a2),28(a0)
	move.l	2(a3),60(a0)
	adda.w	#$a,a1
	adda.w	#$a,a2
	adda.w	#$a,a3
	dbf	d0,l0027
	lea	l04aa,a1
	lea	l035d,a0
	jsr	l0356
	lea	l04aa,a1
	lea	l0359,a0
	jsr	l0356
	lea	l04aa,a1
	lea	l035b,a0
	jsr	l0356
	move.w	l049d,-(a7)
	move.w	l049e,-(a7)
	move.w	#$c8,l049d
	move.w	#$c8,l049e
	bsr	l0240
	movea.l	l04a9,a0
	adda.w	#$d20,a0
	move.w	#$7a,d0
l0028	adda.w	#$20,a0
	andi.w	#$ff00,-8(a0)
	andi.w	#$ff00,-6(a0)
	andi.w	#$ff00,-4(a0)
	andi.w	#$ff00,-2(a0)
	moveq	#$17,d1
l0029	clr.l	(a0)+
	dbf	d1,l0029
	andi.w	#$ff,(a0)
	andi.w	#$ff,2(a0)
	andi.w	#$ff,4(a0)
	andi.w	#$ff,6(a0)
	adda.w	#$20,a0
	dbf	d0,l0028
	bsr	l0041
	bsr	l0355
	move.l	#l04a7,l046b
	move.b	l0420,l042e
l002a	bsr	l001d
	cmp.b	#$1b,d0
	beq	l0037
	cmp.b	#$d,d0
	beq.b	l002d
	cmp.b	#$ff,d0
	beq.b	l002c
	andi.b	#$1f,d0
	addi.b	#$40,d0
	cmp.b	#$4a,d0
	bne.b	l002b
	bsr	l0067
	bra.b	l002c
l002b	cmp.b	#$4d,d0
	bne.b	l002c
	bsr	l0066
l002c	move.b	l0420,d0
	move.b	l042e,d1
	eor.b	d0,d1
	move.b	d0,l042e
	btst	#0,d1
	beq	l0038
	btst	#0,d0
	beq	l0038
l002d	move.b	l04d3,d0
	bne.b	l002e
	lea	l03de,a0
	bsr	l0266
	bra	l003a
l002e	cmp.b	#1,d0
	bne.b	l002f
	not.b	l04cb
	bra	l003c
l002f	cmp.b	#2,d0
	bne.b	l0030
	bsr	l0066
	bra	l0040
l0030	cmp.b	#3,d0
	bne.b	l0031
	bsr	l0067
	bra	l0040
l0031	cmp.b	#4,d0
	bne.b	l0032
	adda.w	#$c,a7
	bra	l0017
l0032	cmp.b	#5,d0
	bne.b	l0033
	addq.w	#4,a7
	move.w	(a7)+,l046c
	move.w	(a7)+,l0469
	adda.w	#4,a7
	bra	l0016
l0033	cmp.b	#6,d0
	bne.b	l0037
l0034	tst.b	l0420
	bne.b	l0034
l0035	bsr	l0355
l0036	tst.w	l04ab
	bne.b	l0036
	move.w	(a7)+,l049e
	move.w	(a7)+,l049d
	move.w	(a7)+,l046c
	move.w	(a7)+,l0469
	lea	l04ae,a1
	lea	l035d,a0
	bsr	l0356
	lea	l04af,a1
	lea	l0359,a0
	bsr	l0356
	lea	l04b0,a1
	lea	l035b,a0
	bsr	l0356
	rts

l0037	addq.w	#4,a7
	move.w	(a7)+,l046c
	move.w	(a7)+,l0469
	addq.w	#4,a7
	bra	l01cf
l0038	btst	#1,l0420
	bne.b	l0035
	move.w	l041c,d0
	ext.l	d0
	divu	#$14,d0
	cmp.b	#8,d0
	bcs.b	l0039
	moveq	#7,d0
l0039	move.b	l04d3,d1
	move.b	d0,l04d3
	cmp.b	d0,d1
	beq	l002a
	bsr	l0041
	bra	l002a
l003a	andi.b	#3,l0420
	bne.b	l003a
l003b	bsr	l001d
	cmp.b	#$ff,d0
	bne.b	l003d
	andi.b	#3,l041f
	beq.b	l003b
l003c	andi.b	#3,l0420
	bne.b	l003c
l003d	movea.l	l04a7,a0
	adda.w	#$d20,a0
	move.w	#$7a,d0
l003e	adda.w	#$20,a0
	andi.w	#$ff00,-8(a0)
	andi.w	#$ff00,-6(a0)
	andi.w	#$ff00,-4(a0)
	andi.w	#$ff00,-2(a0)
	moveq	#$17,d1
l003f	clr.l	(a0)+
	dbf	d1,l003f
	andi.w	#$ff,(a0)
	andi.w	#$ff,2(a0)
	andi.w	#$ff,4(a0)
	andi.w	#$ff,6(a0)
	adda.w	#$20,a0
	dbf	d0,l003e
	clr.b	l042e
	bsr	l0041
	bra	l002a
l0040	bra	l002a
l0041	lea	l0048,a0
	tst.b	l04cb
	bsr	l0043
	lea	l0047,a0
	movea.l	a0,a1
	move.b	l04d3,d0
	add.b	d0,d0
l0042	cmpi.b	#$71,(a1)+
	bne.b	l0042
	subq.b	#1,d0
	bpl.b	l0042
	subq.l	#1,a1
	move.b	#$70,(a1)
	move.l	a1,-(a7)
	bsr	l0266
	movea.l	(a7)+,a1
	move.b	#$71,(a1)
	rts

l0043	beq.b	l0044
	move.l	#$4f464620,d0
	bra.b	l0045
l0044	move.l	#$4f4e2020,d0
l0045	moveq	#3,d1
l0046	rol.l	#8,d0
	move.b	d0,(a0)+
	dbf	d1,l0046
	rts

l0047	dc.b	$1b,'h',$1b,'YJ(',$1b,'b'
	dc.b	2,$1b,'q SHOWINFO ',$1b,'q'
	dc.b	$1b,'Y\(',$1b,'b',6,$1b
	dc.b	'q MUSIC '
l0048	dc.b	'OFF ',$1b,'q',$1b,'Y'
	dc.b	'n(',$1b,'b',$c,$1b,'q '
	dc.b	'MOUSE M '
	dc.b	$1b,'q',$1b,'Y{(',$1b,'b'
	dc.b	$c,$1b,'q JOYS'
	dc.b	'TICK J ',$1b
	dc.b	'q',$1b,'YJ6',$1b,'b',$d
	dc.b	$1b,'q HI SCORES ',$1b,'q',$1b
	dc.b	'YW6',$1b,'b',$d,$1b,'q'
	dc.b	' DEMO ',$1b,'q'
	dc.b	$1b,'Yd6',$1b,'b',$d,$1b
	dc.b	'q CONTINUE ',$1b,'q',$1b,'Yr'
	dc.b	'6',$1b,'b',$d,$1b,'q S'
	dc.b	'TART ESC'
	dc.b	' ',$1b,'q',$1b,'l',$1b,'q',0

l0049	move.l	#l04a7,l046b
	clr.b	1(a6)
	movea.l	a6,a0
	addq.w	#2,a0
l004a	move.l	a0,-(a7)
	move.l	a6,-(a7)
	bsr	l001d
	movea.l	(a7)+,a6
	movea.l	(a7)+,a0
	tst.b	d0
	bmi.b	l004a
	cmp.b	#$d,d0
	beq	l004f
	cmp.b	#$20,d0
	bcc.b	l004c
	subq.b	#1,1(a6)
	bpl.b	l004b
	clr.b	1(a6)
	bra.b	l004a
l004b	move.w	#$20,d1
	move.b	d1,-(a0)
	subi.w	#8,l046d
	clr.w	d2
	bra.b	l004e
l004c	cmp.b	#$61,d0
	bcs.b	l004d
	andi.b	#$1f,d0
	addi.b	#$40,d0
l004d	clr.w	d1
	move.b	d0,d1
	move.b	1(a6),d0
	cmp.b	(a6),d0
	beq.b	l004a
	moveq	#8,d2
	addq.b	#1,1(a6)
	move.b	d1,(a0)+
	clr.b	(a0)
l004e	move.l	a0,-(a7)
	move.l	a6,-(a7)
	move.w	d2,-(a7)
	move.l	l046d,d0
	bsr	l027c
	move.w	(a7)+,d2
	movea.l	(a7)+,a6
	movea.l	(a7)+,a0
	add.w	d2,l046d
	bra.b	l004a
l004f	rts

l0050	cmpi.w	#$14,l0417
	bne.b	l0054
	move.w	l0421,d0
	add.w	d0,d0
	add.w	d0,l041b
	bpl.b	l0051
	clr.w	l041b
l0051	cmpi.w	#$140,l041b
	bcs.b	l0052
	move.w	#$13f,l041b
l0052	move.w	l0422,d0
	add.w	d0,d0
	add.w	d0,l041c
	bpl.b	l0053
	clr.w	l041c
l0053	cmpi.w	#$c8,l041c
	bcs.b	l0054
	move.w	#$c7,l041c
l0054	rts

l0055	cmpi.w	#8,l0417
	bne	l005f
	movem.l	a1/d0,-(a7)
	lea	l041a,a1
	move.b	(a0)+,d0
	move.b	d0,(a1)+
	andi.b	#3,d0
	lsr.w	#1,d0
	bcc.b	l0056
	ori.b	#2,d0
l0056	move.b	d0,l0420
	move.b	(a0)+,d0
	move.b	d0,(a1)+
	ext.w	d0
	add.w	d0,l041b
	bpl.b	l0057
	clr.w	l041b
l0057	cmpi.w	#$140,l041b
	bcs.b	l0058
	move.w	#$13f,l041b
l0058	ext.w	d0
	beq.b	l005a
	bpl.b	l0059
	moveq	#$ff,d0
	bra.b	l005a
l0059	moveq	#1,d0
l005a	move.w	d0,l041d
	move.b	(a0)+,d0
	move.b	d0,(a1)+
	ext.w	d0
	add.w	d0,l041c
	bpl.b	l005b
	clr.w	l041c
l005b	cmpi.w	#$c8,l041c
	bcs.b	l005c
	move.w	#$c7,l041c
l005c	move.w	l041c,d0
	move.w	#1,l041e
l005d	subi.w	#$43,d0
	bcs.b	l005e
	subq.w	#1,l041e
	bra.b	l005d
l005e	movem.l	(a7)+,a1/d0
l005f	rts

l0060	cmpi.w	#$14,l0417
	bne	l0065
	movem.l	d0-d1,-(a7)
	move.b	2(a0),d0
	move.b	d0,d1
	lsr.b	#7,d1
	move.b	d1,l0420
	clr.l	l041d
	btst	#2,d0
	beq.b	l0061
	move.w	#$ffff,l041d
l0061	btst	#3,d0
	beq.b	l0062
	move.w	#1,l041d
l0062	btst	#0,d0
	beq.b	l0063
	move.w	#$ffff,l041e
l0063	btst	#1,d0
	beq.b	l0064
	move.w	#1,l041e
l0064	move.l	l041d,l0421
	movem.l	(a7)+,d0-d1
l0065	rts

l0066	move.w	#8,l0417
	move.w	#8,-(a7)
	move.w	#4,-(a7)
	move.w	#3,-(a7)	
	trap	#$d
	addq.w	#6,a7
	rts

l0067	move.w	#$14,l0417
	move.w	#$14,-(a7)
	move.w	#4,-(a7)
	move.w	#3,-(a7)	
	trap	#$d
	addq.w	#6,a7
	rts

l0068	move.w	#$22,-(a7)	keyboard table
	trap	#$e	
	addq.w	#2,a7

	movea.l	d0,a0
	move.l	24(a0),l0419
	move.l	16(a0),l0418
	move.l	#l0060,24(a0)
	move.l	#l0055,16(a0)
	bra.b	l0066

l0069	move.w	#$22,-(a7)
	trap	#$e
	addq.w	#2,a7

	movea.l	d0,a0
	move.l	l0418,16(a0)
	move.l	l0419,24(a0)
	move.w	#8,-(a7)
	move.w	#4,-(a7)
	move.w	#3,-(a7)
	trap	#$d
	addq.w	#6,a7
	move.w	#8,l0417
	rts

l006a	moveq	#1,d0
	lea	l0423,a0
	lea	l04a1,a1
	clr.b	(a1)
l006b	move.w	d0,-(a7)
	move.l	a1,(a0)+
	move.w	d0,d1
	addi.w	#$f,d1
	lsr.w	#4,d1
	move.w	d1,(a0)+
	move.w	d0,d1
	andi.w	#$f,d1
	bne.b	l006c
	moveq	#$10,d1
l006c	move.w	#$ffff,d2
	lsr.w	d1,d2
	move.w	d2,(a0)+
	swap	d0
	clr.w	d0
	lsr.l	#3,d0
	moveq	#7,d2
	clr.l	d3
	clr.b	d4
	moveq	#7,d5
l006d	move.l	d3,d6
	move.l	d3,d1
	add.l	d0,d1
	move.l	d1,d3
	swap	d6
	swap	d1
	sub.w	d6,d1
	subq.w	#1,d1
	bmi.b	l0071
l006e	bclr	d2,(a1)
	tst.b	d4
	beq.b	l006f
	bset	d2,(a1)
l006f	subq.w	#1,d2
	bpl.b	l0070
	addq.w	#1,a1
	clr.b	(a1)
	clr.b	1(a1)
	moveq	#7,d2
l0070	dbf	d1,l006e
l0071	eori.b	#1,d4
	dbf	d5,l006d
	move.w	(a7)+,d0
	move.l	a1,d1
	addq.l	#2,d1
	bclr	#0,d1
	movea.l	d1,a1
	addq.w	#1,d0
	cmp.w	#$280,d0
	bne.b	l006b
	rts

l0072	tst.w	l04b7
	bne.b	l0076
	tst.w	l04b8
	bne.b	l0076
	move.w	l04d9,d0
	cmpi.w	#5,l0446
	bcc.b	l0073
	lsr.w	#1,d0
l0073	tst.w	l04b3
	beq.b	l0075
	sub.w	d0,l04b3
	bmi.b	l0074
	clr.w	l044e
	rts

l0074	clr.w	l04b3
l0075	sub.w	d0,l04b4
	bmi.b	l0077
l0076	clr.w	l044e
	rts

l0077	clr.w	l04b4
	st	l044e
	rts

l0078	move.w	l04b7,d0
	beq.b	l007d
	cmp.w	#1,d0
	bne.b	l0079
	clr.w	l0453
l0079	addq.w	#1,d0
	move.w	d0,l04b7
	move.w	l0426,d0
	addi.w	#$ff,d0
	lsr.w	#8,d0
	cmpi.w	#4,l04c7
	bne.b	l007a
	lsl.w	#1,d0
l007a	add.w	d0,l0453
	move.w	#$ffff,l041d
	move.w	l0451,d0
	addi.w	#$1f,d0
	andi.w	#$ffc0,d0
	bmi.b	l007c
	bne.b	l007b
	clr.w	l041d
l007b	neg.w	l041d
l007c	clr.w	l041f
	bra	l008a
l007d	move.w	l04b8,d0
	beq.b	l0080
	addq.w	#1,d0
	move.w	d0,l04b8
	move.w	l0447,d0
	lsr.w	#4,d0
	addq.w	#2,d0
	sub.w	d0,l0447
	bcc.b	l007e
	clr.w	l0447
l007e	move.w	#$ffff,l041d
	move.w	l0452,d0
	bmi.b	l007f
	neg.w	l041d
l007f	clr.w	l041f
	bra	l0089
l0080	tst.b	l04da
	beq.b	l0082
	moveq	#5,d0
	move.w	l0451,d1
	bmi.b	l0081
	neg.w	d0
l0081	add.w	d0,l0451
	move.w	l0451,d2
	eor.w	d2,d1
	bpl.b	l0082
	clr.w	l04da
l0082	tst.b	l04d7
	beq.b	l0083
	move.b	l04d8,d0
	ext.w	d0
	muls	#8,d0
	add.w	l0450,d0
	addi.w	#$20,d0
	andi.w	#$3f,d0
	subi.w	#$20,d0
	move.w	d0,l0450
	subq.b	#8,l04d7
	clr.w	l041d
	clr.w	l041e
	clr.w	l041f
	bra	l0094
l0083	tst.w	l0416
	beq.b	l0085
	clr.w	d0
	move.w	#$ffff,l041e
	bset	#0,l0420
	move.w	l0451,d7
	addi.w	#$10,d7
	andi.w	#$ffe0,d7
	beq.b	l0084
	moveq	#$ff,d0
	tst.w	d7
	bmi.b	l0084
	moveq	#1,d0
l0084	move.w	d0,l041d
	bra	l008a
l0085	cmpi.w	#8,l0417
	bne.b	l008a
	move.w	l041b,d0
	sub.w	l03e0,d0
	bmi.b	l0086
	cmp.w	#$100,d0
	bmi.b	l0088
	move.w	#$100,d0
	bra.b	l0087
l0086	cmp.w	#$ff00,d0
	bpl.b	l0088
	move.w	#$ff00,d0
l0087	move.w	l041b,d1
	sub.w	d0,d1
	move.w	d1,l03e0
l0088	ext.l	d0
	divs	#$a,d0
	move.w	d0,l0450
	bra	l0090
l0089	move.w	#$10,d5
	bra.b	l008b
l008a	move.w	#5,d5
l008b	move.w	l041d,d0
	beq.b	l008d
	add.w	d0,d0
	add.w	l0450,d0
	cmp.w	d5,d0
	bmi.b	l008c
	move.w	d5,d0
l008c	neg.w	d5
	cmp.w	d5,d0
	bpl.b	l008f
	move.w	d5,d0
	bra.b	l008f
l008d	move.w	l0450,d0
	beq	l0090
	bmi.b	l008e
	subq.w	#2,d0
l008e	addq.w	#1,d0
l008f	move.w	d0,l0450
l0090	moveq	#$ff,d3
	move.w	l0450,d1
	bpl.b	l0091
	neg.w	d1
	neg.w	d3
l0091	cmpi.w	#$14,l0417
	bne.b	l0092
	cmp.b	#4,d1
	bcc.b	l0092
	lsr.w	#1,d1
l0092	lea	l040a,a0
	move.w	d1,d6
	move.w	l0446,d0
	clr.w	d2
	neg.w	d6
	addi.w	#$10,d6
	mulu	#8,d6
	move.b	0(a0,d6.w),d2
	mulu	#$28,d2
	muls	d3,d2
	muls	d2,d0
	tst.w	l04b8
	bne.b	l0093
	add.l	d0,l0451
l0093	move.w	l0446,d0
	clr.w	d2
	mulu	#8,d1
	move.b	0(a0,d1.w),d2
	addi.w	#$96,d2
	mulu	#$32,d2
	mulu	d2,d0
	lsr.l	#8,d0
	move.w	d0,l0426
l0094	move.w	l044a,d1
	cmpi.b	#1,l0449
	bcs.b	l0096
	clr.w	d3
	clr.l	d2
	move.w	l0426,d2
	mulu	#$19,d2
	divu	d1,d2
	ext.l	d2
	lsl.l	#8,d2
	cmpi.b	#1,l0449
	beq.b	l0095
	neg.l	d2
l0095	add.l	d2,l0451
	asl.l	#1,d2
	swap	d2
	add.w	d2,l0465
l0096	move.w	l0451,d0
	tst.w	d0
	bpl.b	l0097
	neg.w	d0
l0097	move.w	l0438,d7
	cmp.w	d7,d0
	bcs	l009a
	move.w	l0446,d1
	mulu	#$1e,d1
	sub.w	d1,l0447
	bcc.b	l0098
	clr.w	l0447
l0098	addi.w	#$30,d7
	cmp.w	d7,d0
	bcs	l009a
	move.w	d7,d0
	tst.w	l0451
	bpl.b	l0099
	neg.w	d0
l0099	move.w	d0,l0451
l009a	tst.b	l04d1
	bne	l009f
	tst.w	l044e
	bne	l009e
	tst.w	l04da
	bne.b	l009e
	tst.w	l04b8
	bne.b	l009e
	tst.b	l04d0
	bne.b	l009c
	cmpi.w	#8,l0417
	bne.b	l009b
	btst	#0,l0420
	beq	l009e
	bra.b	l009c
l009b	tst.w	l041e
	bpl.b	l009e
l009c	tst.w	l04c3
	bne.b	l009d
	tst.w	l0447
	bne.b	l009d
	move.w	l0450,d0
	addq.w	#1,d0
	cmp.w	#3,d0
	bcc.b	l009d
	tst.w	l04be
	bne.b	l009d
	move.w	#1,l04c3
l009d	addi.w	#$514,l0447
	bcc.b	l009e
	move.w	#$ffff,l0447
l009e	cmpi.w	#8,l0417
	bra.b	l009f
	cmpi.w	#1,l041e
	bne.b	l009f
	move.w	l0446,d0
	lsl.w	#1,d0
	sub.w	d0,l0447
	bcc.b	l009f
	clr.w	l0447
l009f	move.w	l0446,d1
	mulu	d1,d1
	lsr.w	#6,d1
	addi.w	#$12c,d1
	tst.w	l044e
	beq.b	l00a0
	addi.w	#$12c,d1
l00a0	sub.w	d1,l0447
	bcc.b	l00a1
	clr.w	l0447
l00a1	move.w	l0447,d0
	lsr.w	#5,d0
	andi.w	#$fffe,d0
	lea	l040b,a0
	move.w	0(a0,d0.w),d0
	lsr.w	#7,d0
	move.w	d0,l0446
	tst.b	l04d1
	tst.b	l04d1
	bne	l00ad
	tst.w	l04b7
	bne	l00b1
	tst.w	l04b8
	bne	l00b1
	lea	l0460,a0
	lea	l0463,a1
	lea	l0437,a2
	move.w	6(a2),d3
	move.w	l0451,d7
	clr.l	d0
l00a2	move.w	(a0)+,d2
	bmi	l00b1
	move.w	d2,d0
	add.w	d0,d0
	move.w	0(a1,d0.w),d1
	addi.w	#$c,d1
	move.w	(a0)+,d0
	moveq	#$ff,d6
	add.w	d7,d0
	bpl.b	l00a3
	neg.w	d6
	neg.w	d0
l00a3	ext.l	d0
	cmp.w	d0,d1
	bcs.b	l00a2
	cmp.w	#$3d,d2
	bcs.b	l00a4
	cmp.w	#$3f,d2
	bcc.b	l00a4
	moveq	#6,d0
	jsr	l03d7
	move.b	#$a,l04ce
	addi.w	#$500,l04b3
	cmpi.w	#$3300,l04b3
	bcs.b	l00a2
	move.w	#$3300,l04b3
	bra.b	l00a2
l00a4	cmp.w	#$4d,d2
	bne.b	l00a5
	move.b	#$40,l04d7
	move.b	d6,l04d8
	moveq	#$e,d0
	jsr	l03d7
	bra.b	l00a2
l00a5	cmp.b	#$51,d2
	bne.b	l00a6
	cmpi.w	#4,l04c7
	beq	l00b1
l00a6	tst.w	l04dd
	bne	l00b1
	cmpi.w	#2,l04c7
	beq	l00b1
	cmpi.w	#3,l04c7
	bne.b	l00a9
	lea	l0425,a3
	moveq	#$1d,d2
l00a7	tst.w	12(a3)
	beq.b	l00a8
	lea	22(a3),a3
	dbf	d2,l00a7
	bra	l00a2
l00a8	move.w	#$44,(a3)
	move.w	l04d6,2(a3)
	move.w	-2(a0),4(a3)
	move.w	#5,8(a3)
	move.w	#$10,12(a3)
	move.w	#1,14(a3)
	move.w	#0,16(a3)
	move.w	#0,18(a3)
	bra	l00a2
l00a9	st	l04d1
	clr.w	l0424
	clr.w	l04be
	clr.w	l04bd
	clr.b	l04cd
	clr.w	l04c7
	bsr	music+$62
	moveq	#$10,d0
	jsr	l03d7
	lea	l0425,a0
	moveq	#$1d,d0
l00aa	move.w	12(a0),d1
	beq.b	l00ac
	cmp.w	#9,d1
	bcc.b	l00ab
	cmp.w	#6,d1
	bcc.b	l00ac
l00ab	move.w	#$10,12(a0)
l00ac	lea	22(a0),a0
	dbf	d0,l00aa
	bra	l00b1
l00ad	subi.w	#$1000,l0447
	bcc.b	l00ae
	clr.w	l0447
l00ae	move.w	l0424,d7
	addq.w	#1,d7
	cmp.w	#$f,d7
	bcs.b	l00af
	clr.w	d7
	tst.w	l0447
	beq.b	l00b0
l00af	move.w	d7,l0424
	bra.b	l00b1
l00b0	sf	l04d1
	st	l04da
	bsr	music+$54
l00b1	tst.w	l04da
	bne	l00be
	lea	0.l,a1
	clr.w	d4
	tst.b	l04d1
	beq.b	l00b2
	move.w	l0424,d7
	mulu	#6,d7
	lea	l03e3,a0
	move.w	4(a0,d7.w),d5
	move.w	l0451,d6
	move.w	0(a0,d7.w),d7
	neg.w	d6
	moveq	#1,d0
	bra	l00bc
l00b2	move.w	l04c3,d0
	beq.b	l00b4
	move.w	d0,d7
	subq.w	#1,d7
	lsr.w	#1,d7
	addi.w	#$24,d7
	addq.w	#1,d0
	cmp.w	#9,d0
	bne.b	l00b3
	clr.w	d0
l00b3	move.w	d0,l04c3
	move.w	d7,-(a7)
	move.w	d4,-(a7)
	moveq	#7,d0
	jsr	l03d7
	move.w	(a7)+,d4
	move.w	(a7)+,d7
	bra	l00bb
l00b4	tst.w	l04b7
	beq.b	l00b5
	move.w	l0453,d0
	move.w	#$4f,d7
	clr.w	d4
	move.w	l0451,d6
	neg.w	d6
	clr.w	d5
	bra	l00bc
l00b5	move.w	l0450,d7
	lea	l0400,a0
	cmpi.w	#3,l04c7
	bne.b	l00b7
	move.w	l04c8,d0
	subi.w	#$1e,d0
	bcs.b	l00b6
	andi.w	#4,d0
	bne.b	l00b7
l00b6	lea	l0402,a0
l00b7	move.w	l04be,d0
	beq.b	l00b9
	lea	l0404,a1
	cmp.b	#4,d0
	beq.b	l00b8
	lea	l0401,a1
	cmp.b	#3,d0
	beq.b	l00b8
	lea	l0403,a1
	cmp.b	#2,d0
	beq.b	l00b8
	lea	l0405,a1
l00b8	adda.w	d7,a1
l00b9	move.w	l0451,d2
	neg.w	d2
	move.b	32(a0,d7.w),d7
	bpl.b	l00ba
	neg.b	d7
	bset	#15,d4
l00ba	ext.w	d7
l00bb	clr.w	d5
	moveq	#1,d0
	move.w	l0451,d6
	neg.w	d6
l00bc	lea	l04d4,a6
	movem.l	a0-a6/d0-d7,-(a7)
	lsl.w	#3,d6
	bsr	l01c1
	movem.l	(a7)+,a0-a6/d0-d7
	cmpa.l	#0,a1
	beq.b	l00be
	lea	l0407,a3
	move.b	(a1),d7
	bpl.b	l00bd
	lea	l0408,a3
	neg.b	d7
l00bd	ext.w	d7
	adda.w	d7,a3
	adda.w	d7,a3
	move.w	d2,d6
	move.b	(a3)+,d2
	ext.w	d2
	lsl.w	#3,d6
	lsl.w	#3,d2
	sub.w	d2,d6
	move.b	(a3),d5
	ext.w	d5
	add.w	d5,d5
	bsr	l01c1
l00be	clr.l	d0
	move.w	l0446,d0
	cmpi.w	#4,l04c7
	bne.b	l00bf
	lsl.w	#1,d0
l00bf	move.w	#$30,d2
l00c0	subi.w	#$64,d0
	bcs.b	l00c1
	addq.w	#1,d2
	bra.b	l00c0
l00c1	addi.w	#$64,d0
	move.w	#$30,d1
l00c2	subi.w	#$a,d0
	bcs.b	l00c3
	addq.w	#1,d1
	bra.b	l00c2
l00c3	addi.w	#$3a,d0
	lea	l045d,a0
	move.b	d0,-(a0)
	move.b	d1,-(a0)
	move.b	d2,-(a0)
	subi.b	#$30,d0
	subi.b	#$30,d1
	subi.b	#$30,d2
	lsl.w	#4,d1
	lsl.w	#8,d2
	or.w	d1,d0
	or.w	d2,d0
	lsr.w	#4,d0
	lsr.w	#4,d0
	abcd	d0,d0
	abcd	d0,d0
	move.w	l04b2,d2
	bra	l00f7
l00c4	tst.b	l04d1
	bne	l00d8
	tst.w	l04da
	bne	l00d8
	tst.w	l04b7
	bne	l00d8
	tst.w	l04b8
	bne	l00d8
	tst.w	l0416
	beq	l00c5
	move.w	l0454,d0
	lsr.w	#1,d0
	bra	l00c8
l00c5	tst.b	l04d0
	bne	l00c6
	cmpi.w	#$14,l0417
	bne	l00c7
	cmpi.w	#1,l041e
	bne	l00c7
l00c6	tst.w	l04be
	beq	l00c7
	tst.w	l04c7
	beq	l00cd
l00c7	move.w	l041f,d0
	cmpi.w	#8,l0417
	bne.b	l00c8
	lsr.w	#1,d0
l00c8	move.w	l042e,d1
	eor.w	d0,d1
	move.w	d0,l042e
	tst.b	l04d1
	bne.b	l00c9
	btst	#0,d0
	bne.b	l00ca
l00c9	clr.w	l04c6
	clr.b	l04cd
	bra	l00d8
l00ca	btst	#0,d1
	bne	l00d4
	move.b	l04cd,d2
	beq.b	l00cc
	addq.b	#1,d2
	move.b	d2,l04cd
	cmp.b	#3,d2
	bne	l00d8
	move.b	#1,l04cd
	subi.w	#$30,l04c5
	bpl.b	l00cb
	clr.w	l04c5
	clr.w	l04be
	clr.w	l04bd
	clr.b	l04cd
l00cb	moveq	#$f,d0
	move.w	#$8001,d1
	bra	l00d5
l00cc	addq.w	#1,l04c6
	cmpi.w	#5,l04c6
	bcs	l00d8
l00cd	clr.w	l04c6
	clr.b	l04cd
	move.w	l04be,d1
	beq	l00d8
	cmp.w	#1,d1
	bne.b	l00ce
	move.b	#2,l04cd
	bra	l00d8
l00ce	tst.w	l04c7
	bne	l00d8
	move.w	d1,l04c7
	move.w	#1,l04c8
	subq.w	#1,l04c4
	bne.b	l00cf
	clr.w	l04be
	clr.w	l04bd
l00cf	cmp.w	#2,d1
	bne.b	l00d2
	tst.w	l04dd
	beq	l00d4
	lea	l0425,a0
	moveq	#$1d,d2
l00d0	move.w	12(a0),d1
	beq.b	l00d1
	cmp.b	#6,d1
	beq.b	l00d1
	cmp.b	#7,d1
	beq.b	l00d1
	cmp.b	#8,d1
	beq.b	l00d1
	cmp.b	#$10,d1
	bcc.b	l00d1
	clr.w	12(a0)
l00d1	lea	22(a0),a0
	dbf	d2,l00d0
	clr.w	l04dd
	bra.b	l00d4
l00d2	moveq	#$c,d0
	cmp.w	#3,d1
	beq.b	l00d3
	moveq	#5,d0
l00d3	jsr	l03d7
	bra	l00d8
l00d4	moveq	#1,d0
	moveq	#1,d1
l00d5	move.w	d1,-(a7)
	jsr	l03d7
	move.w	(a7)+,d1
	moveq	#9,d0
	lea	l042f,a0
l00d6	tst.w	(a0)
	beq.b	l00d7
	adda.w	#$10,a0
	dbf	d0,l00d6
	bra	l00d8
l00d7	move.w	d1,(a0)
	move.w	l0450,d0
	lea	l03df,a1
	move.b	32(a1,d0.w),d0
	cmp.b	#$80,d0
	beq.b	l00d8
	ext.w	d0
	move.w	d0,2(a0)
	clr.l	4(a0)
	move.l	#$10000,8(a0)
	move.w	#$32,12(a0)
	move.w	#$32,14(a0)
l00d8	lea	l042f,a0
	moveq	#9,d0
l00d9	move.w	d0,-(a7)
	tst.w	(a0)
	beq	l00e8
	moveq	#1,d3
	move.w	2(a0),d1
	bpl.b	l00da
	neg.w	d1
	neg.l	d3
l00da	lea	l040a,a1
	mulu	#8,d1
	move.w	d1,d6
	neg.w	d6
	addi.w	#$80,d6
	clr.w	d0
	move.b	0(a1,d6.w),d0
	muls	d3,d0
	muls	14(a0),d0
	muls	#$15e,d0
	add.l	d0,4(a0)
	cmpi.w	#$12c,4(a0)
	bcs	l00db
	cmpi.w	#$fed4,4(a0)
	bcs	l00dc
l00db	clr.w	d2
	move.b	0(a1,d1.w),d2
	mulu	14(a0),d2
	mulu	#$190,d2
	add.l	d2,8(a0)
	cmpi.w	#$3e8,8(a0)
	bcs	l00de
l00dc	btst	#7,(a0)
	bne.b	l00dd
	cmpi.w	#2,l04c7
	beq.b	l00dd
	subq.w	#1,l04b2
	bne.b	l00dd
	move.w	#1,l04b2
l00dd	clr.w	(a0)
	bra	l00e8
l00de	swap	d0
	tst.w	d0
	bpl.b	l00df
	neg.w	d0
l00df	lsr.w	#1,d0
	addq.w	#7,d0
	swap	d2
	addq.w	#7,d2
	lea	l0463,a1
	lea	l03e4,a2
	moveq	#$1d,d7
	lea	l0425,a6
l00e0	move.w	12(a6),d3
	beq	l00e6
	cmp.w	#4,d3
	bne.b	l00e1
	tst.w	2(a6)
	beq	l00e6
l00e1	lsl.w	#1,d3
	move.w	-2(a2,d3.w),d4
	lsl.w	#1,d4
	move.w	0(a1,d4.w),d4
	lsl.w	#1,d4
	move.w	8(a6),d1
	sub.w	8(a0),d1
	add.w	d2,d1
	asr.w	#1,d1
	bmi	l00e6
	cmp.w	d2,d1
	bcc	l00e6
	move.w	4(a6),d1
	add.w	20(a6),d1
	sub.w	4(a0),d1
	add.w	d4,d1
	add.w	d0,d1
	asr.w	#1,d1
	bmi	l00e6
	sub.w	d4,d1
	sub.w	d0,d1
	bpl	l00e6
	cmp.w	#$20,d3
	bcc	l00e7
	lea	l03e5,a1
	lsl.w	#1,d3
	move.w	2(a1,d3.w),d0
	beq.b	l00e2
	movem.l	a6/a0-a1/d3,-(a7)
	jsr	l03d7
	movem.l	(a7)+,a6/a0-a1/d3
l00e2	move.w	0(a1,d3.w),d2
	beq.b	l00e7
	bmi.b	l00e5
	move.w	d2,d0
	ext.l	d0
	move.w	l04b2,d2
	subq.w	#1,d2
	move.l	a0,-(a7)
	bsr	l00f7
	movea.l	(a7)+,a0
	btst	#2,19(a6)
	beq.b	l00e3
	move.w	#7,12(a6)
	bclr	#5,19(a6)
	move.w	#$3e,(a6)
	move.b	#$32,16(a6)
	bra.b	l00e4
l00e3	move.w	#$10,12(a6)
l00e4	btst	#7,(a0)
	bne.b	l00e5
	move.w	l04b2,d0
	addq.w	#1,d0
	cmp.w	#$b,d0
	beq.b	l00e5
	move.w	d0,l04b2
l00e5	clr.w	(a0)
	bra	l00e8
l00e6	lea	22(a6),a6
	dbf	d7,l00e0
l00e7	clr.w	d4
	move.w	4(a0),d6
	move.w	12(a0),d5
	move.w	8(a0),d0
	moveq	#$50,d7
	lea	l04d4,a6
	move.l	a0,-(a7)
	lsl.w	#3,d6
	bsr	l01c1
	movea.l	(a7)+,a0
l00e8	move.w	(a7)+,d0
	adda.w	#$10,a0
	dbf	d0,l00d9
	move.w	#$ffff,l04c9
	cmpi.w	#2,l04c7
	bne	l00ee
	move.w	l04c8,d0
	addq.w	#1,d0
	cmp.w	#$29,d0
	bne.b	l00e9
	move.w	#$7d0,l04dd
	clr.w	l04c8
	clr.w	l04c7
	bra	l00ee
l00e9	move.w	d0,l04c8
	cmp.w	#$a,d0
	bne.b	l00ed
	moveq	#$b,d0
	jsr	l03d7
	lea	l0425,a0
	moveq	#$1d,d0
l00ea	move.w	12(a0),d1
	beq.b	l00ec
	cmp.b	#6,d1
	beq.b	l00ec
	cmp.b	#7,d1
	beq.b	l00ec
	cmp.b	#8,d1
	beq.b	l00ec
	cmp.b	#$10,d1
	bcc.b	l00ec
	btst	#2,19(a0)
	beq.b	l00eb
	move.w	#7,12(a0)
	move.w	#$3e,(a0)
	move.b	#$32,16(a0)
l00eb	bclr	#2,18(a0)
	bclr	#5,19(a0)
	clr.w	2(a0)
l00ec	lea	22(a0),a0
	dbf	d0,l00ea
	bra.b	l00ee
l00ed	bcs.b	l00ee
	cmp.w	#$15,d0
	bcc.b	l00ee
	subi.w	#$b,d0
	move.w	d0,l04c9
l00ee	cmpi.w	#3,l04c7
	bne.b	l00ef
	addq.w	#1,l04c8
	cmpi.w	#$32,l04c8
	bne.b	l00ef
	clr.w	l04c8
	clr.w	l04c7
	bsr	music+($e*5)
l00ef	lea	l0432,a0
	moveq	#9,d0
l00f0	move.w	d0,-(a7)
	tst.w	(a0)
	beq.b	l00f3
	move.w	2(a0),d0
	add.w	d0,4(a0)
	move.w	6(a0),d0
	sub.w	d0,8(a0)
	bpl.b	l00f2
	cmpi.w	#4,l04c7
	beq.b	l00f1
	movea.l	l0462,a2
	cmpa.l	#l0461,a2
	bcc.b	l00f1
	move.w	#$4c,(a2)+
	move.w	4(a0),(a2)+
	move.w	#$ffff,(a2)
	move.l	a2,l0462
l00f1	clr.w	(a0)
	bra.b	l00f3
l00f2	move.l	a0,-(a7)
	moveq	#$4c,d7
	move.w	4(a0),d6
	moveq	#$32,d5
	clr.w	d4
	move.w	8(a0),d0
	lea	l04d4,a6
	lsl.w	#3,d6
	bsr	l01c1
	movea.l	(a7)+,a0
l00f3	move.w	(a7)+,d0
	lea	10(a0),a0
	dbf	d0,l00f0
	rts

l00f4	lea	l042f,a0
	moveq	#9,d0
l00f5	clr.w	(a0)
	lea	16(a0),a0
	dbf	d0,l00f5
	lea	l0432,a0
	moveq	#9,d0
l00f6	clr.w	(a0)
	lea	10(a0),a0
	dbf	d0,l00f6
	move.w	#$ffff,l04c9
	clr.w	l04c7
	rts

l00f7	lea	l0444,a0
	lea	l04c1,a2
	lea	l045e,a1
	move.b	d0,-(a1)
	lsr.l	#8,d0
	move.b	d0,-(a1)
	lsr.l	#8,d0
	move.b	d0,-(a1)
	lsr.l	#8,d0
	move.b	d0,-(a1)
l00f8	addq.w	#4,a1
	abcd	-(a1),-(a0)
	abcd	-(a1),-(a0)
	abcd	-(a1),-(a0)
	abcd	-(a1),-(a0)
	addq.w	#4,a0
	addq.w	#4,a1
	abcd	-(a1),-(a2)
	abcd	-(a1),-(a2)
	abcd	-(a1),-(a2)
	abcd	-(a1),-(a2)
	addq.w	#4,a2
	dbf	d2,l00f8
	rts

l00f9	lea	l0425,a6
	moveq	#$1d,d0
l00fa	clr.w	12(a6)
	adda.w	#$16,a6
	dbf	d0,l00fa
	rts

l00fb	clr.b	l04cc
	lea	l0425,a6
	moveq	#$1d,d0
l00fc	move.w	d0,-(a7)
	move.w	12(a6),d0
	beq	l0112
	cmp.w	#$10,d0
	bcs.b	l00fe
	cmp.w	#$17,d0
	bcc.b	l00fe
	addq.w	#1,d0
	move.w	d0,12(a6)
	cmp.w	#$17,d0
	bne.b	l00fd
	clr.w	12(a6)
	bra	l0112
l00fd	add.w	d0,d0
	lea	l03e4,a0
	move.w	0(a0,d0.w),(a6)
	bra	l0107
l00fe	cmp.w	#8,d0
	beq	l0113
	cmp.w	#$b,d0
	beq	l011a
	cmp.w	#9,d0
	beq	l011e
	cmp.w	#$a,d0
	bne.b	l00ff
	st	l04cc
l00ff	tst.w	2(a6)
	beq.b	l0107
	btst	#5,19(a6)
	beq.b	l0107
	cmpi.w	#9,12(a6)
	bne.b	l0100
	move.w	l0451,d0
	neg.w	d0
	bra.b	l0103
l0100	move.w	l0451,d0
	addi.w	#$5a,d0
	divs	#$3c,d0
	bpl.b	l0101
	clr.w	d0
l0101	cmp.w	#3,d0
	bcs.b	l0102
	moveq	#2,d0
l0102	subq.w	#1,d0
	muls	#$ffc4,d0
	bra.b	l0103
	move.w	14(a6),d0
	muls	#$3c,d0
l0103	move.w	4(a6),d1
	move.w	d0,d2
	moveq	#8,d3
	sub.w	d1,d2
	beq.b	l0106
	bpl.b	l0104
	neg.w	d3
	neg.w	d2
l0104	cmp.w	#9,d2
	bcc.b	l0105
	move.w	d0,4(a6)
	bra.b	l0106
l0105	add.w	d3,4(a6)
	bra.b	l0107
l0106	cmpi.w	#4,12(a6)
	bne.b	l0107
	move.w	#$ffff,2(a6)
	bclr	#5,19(a6)
l0107	move.w	2(a6),d1
	move.w	l04d6,d0
	sub.w	d0,d1
	move.w	8(a6),d0
	move.w	d0,d3
	add.w	d1,d0
	move.w	d0,8(a6)
	btst	#2,18(a6)
	beq	l010a
	cmp.w	#$190,d3
	bcs	l010a
	cmp.w	#$190,d0
	bcc	l010a
	lea	l0425,a1
	moveq	#$1d,d2
l0108	tst.w	12(a1)
	beq.b	l0109
	lea	22(a1),a1
	dbf	d2,l0108
	bra.b	l010a
l0109	move.w	#$4a,(a1)
	move.w	#$18,2(a1)
	move.w	14(a6),d2
	move.w	d2,14(a1)
	muls	#$3c,d2
	move.w	d2,4(a1)
	move.w	#$190,8(a1)
	move.w	#9,12(a1)
	move.w	#$3200,16(a1)
	move.w	#$268,18(a1)
	bclr	#2,18(a6)
l010a	tst.w	d0
	bmi	l010b
	cmpi.w	#$3000,8(a6)
	bcs	l010f
	clr.l	d1
l010b	btst	#15,d1
	beq	l010e
	move.w	12(a6),d0
	cmp.w	#$10,d0
	bcs.b	l010c
	cmp.w	#$17,d0
	bcs.b	l010e
l010c	cmp.w	#4,d0
	bne.b	l010d
	btst	#5,19(a6)
	beq.b	l010d
	move.w	l04d6,2(a6)
	addi.w	#$18,2(a6)
	move.w	#5,8(a6)
	bra	l010f
l010d	movea.l	l0462,a2
	cmpa.l	#l0461,a2
	bcc.b	l010e
	move.w	(a6),(a2)+
	move.w	4(a6),(a2)+
	move.w	#$ffff,(a2)
	move.l	a2,l0462
l010e	clr.w	12(a6)
	bra	l0112
l010f	cmpi.w	#4,12(a6)
	bne.b	l0110
	tst.w	2(a6)
	beq.b	l0112
l0110	move.w	8(a6),d0
	beq.b	l0112
	move.w	(a6),d7
	andi.w	#$7fff,d7
	move.w	4(a6),d6
	clr.w	d5
	move.b	16(a6),d5
	move.w	(a6),d4
	andi.w	#$8000,d4
	lea	20(a6),a6
	lsl.w	#3,d6
	bsr	l01c1
	lea	-20(a6),a6
	move.w	(a6),d0
	andi.w	#$7fff,d0
	cmp.w	#$3d,d0
	beq.b	l0111
	cmp.w	#$3e,d0
	beq.b	l0111
	cmp.w	#$4a,d0
	bne.b	l0112
l0111	moveq	#$4b,d7
	move.w	4(a6),d6
	clr.w	d5
	clr.w	d4
	move.w	8(a6),d0
	move.l	a6,-(a7)
	lea	l04d4,a6
	lsl.w	#3,d6
	bsr	l01c1
	movea.l	(a7)+,a6
l0112	move.w	(a7)+,d0
	lea	22(a6),a6
	dbf	d0,l00fc
	rts

l0113	move.w	6(a6),d0
	cmp.w	#$28,d0
	bcc.b	l0114
	subi.w	#$1a,d0
	moveq	#$61,d1
	clr.w	d2
	bra.b	l0118
l0114	cmp.w	#$3c,d0
	bcc.b	l0115
	moveq	#$e,d0
	moveq	#$61,d1
	clr.w	d2
	bra.b	l0118
l0115	bne.b	l0116
	move.w	#$92,l042c
	move.w	#$19,l042a
	move.w	#1,l042d
	move.w	18(a6),d1
	andi.w	#$18,d1
	lsr.w	#3,d1
	move.w	d1,l042b
	addq.w	#1,d1
	move.w	d1,l04bd
l0116	cmp.w	#$54,d0
	bcs.b	l0117
	subi.w	#$54,d0
	lsl.w	#2,d0
	neg.w	d0
	addi.w	#$71,d0
	move.w	d0,d1
	moveq	#$22,d0
	moveq	#$19,d2
	bra.b	l0118
l0117	subi.w	#$3c,d0
	lsr.w	#1,d0
	mulu	#3,d0
	lea	l03e1,a0
	adda.w	d0,a0
	clr.w	d0
	clr.w	d1
	clr.w	d2
	move.b	(a0)+,d1
	move.b	(a0)+,d0
	move.b	(a0)+,d2
l0118	move.w	d0,l0428
	move.l	l0451,d0
	lsl.l	#1,d0
	swap	d0
	add.w	d0,d1
	bpl.b	l0119
	cmpi.w	#$50,6(a6)
	bcs.b	l0119
	clr.w	12(a6)
	bra	l0112
l0119	move.w	d1,l0427
	move.w	d2,l0429
	addq.w	#2,6(a6)
	bra	l0112
l011a	move.w	#$8052,(a6)
	move.w	#$78,4(a6)
	tst.w	14(a6)
	bpl.b	l011b
	andi.w	#$7fff,(a6)
	neg.w	4(a6)
l011b	move.w	8(a6),d0
	cmp.w	#$190,d0
	bcs	l0107
	sub.w	l04d6,d0
	cmp.w	#$190,d0
	bcc	l0107
	lea	l0432,a0
	moveq	#9,d0
l011c	tst.w	(a0)
	beq.b	l011d
	lea	10(a0),a0
	dbf	d0,l011c
	bra	l0107
l011d	st	(a0)
	move.w	4(a6),d0
	move.w	d0,4(a0)
	neg.w	d0
	asr.w	#3,d0
	move.w	d0,2(a0)
	asr.w	#2,d0
	add.w	d0,2(a0)
	move.w	8(a6),8(a0)
	move.w	#$32,6(a0)
	move.l	a6,-(a7)
	moveq	#1,d0
	jsr	l03d7
	movea.l	(a7)+,a6
	bra	l0107
l011e	clr.w	d0
	move.b	17(a6),d0
	addi.b	#$10,d0
	move.b	d0,17(a6)
	bpl.b	l011f
	neg.b	d0
l011f	lea	l040a,a5
	move.b	0(a5,d0.w),d0
	mulu	#$32,d0
	lsr.w	#8,d0
	move.b	d0,16(a6)
	bra	l00ff
l0120	move.w	l042b,d0
	bpl	l0121
	rts

l0121	addq.w	#1,l042d
	move.w	l042a,d1
	add.w	l042d,d1
	cmp.w	#$a0,d1
	bcs.b	l0122
	move.w	l04be,l04bd
	move.w	#$ffff,l042b
	rts

l0122	cmp.w	#$6e,d1
	bcs	l0123
	tst.b	l04d1
	bne	l0123
	tst.w	l04da
	bne	l0123
	move.w	l0451,d2
	addi.w	#$10,d2
	cmp.w	#$20,d2
	bcc.b	l0123
	addq.w	#1,d0
	move.w	d0,l04be
	move.w	d0,l04bd
	clr.b	l04cd
	move.w	#3,l04c4
	move.w	#$a00,l04c5
	move.w	#$ffff,l042b
	moveq	#2,d0
	jsr	l03d7
	rts

l0123	move.w	d1,l042a
	addi.w	#$1a,d0
	lsl.w	#2,d0
	lea	l03e2,a0
	movea.l	0(a0,d0.w),a6
	adda.l	a0,a6
	move.w	(a6)+,d4
	move.w	(a6)+,d5
	move.w	l042a,d7
	move.w	l042c,d6
	move.l	l0451,d0
	lsl.l	#1,d0
	swap	d0
	add.w	d0,d6
	clr.w	d0
	bra	l024a
	rts

l0124	lea	l03e2,a0
	moveq	#$27,d0
l0125	movea.l	(a0)+,a1
	cmpa.l	#0,a1
	beq	l0128
	adda.l	#l03e2,a1
	move.w	(a1)+,d1
	move.w	(a1)+,d2
	move.w	d1,d3
	mulu	d2,d3
	movea.l	a1,a2
	movea.l	a2,a3
	adda.w	d3,a3
	adda.w	d3,a3
	move.w	d3,d6
	mulu	#8,d3
	movea.l	a3,a4
	adda.w	d3,a2
	adda.w	d3,a3
	subq.w	#1,d3
l0126	move.b	-(a2),-(a3)
	dbf	d3,l0126
	subq.w	#1,d6
l0127	move.w	(a4)+,d1
	move.w	(a4)+,d2
	move.w	(a4)+,d3
	move.w	(a4)+,d4
	move.w	d1,d5
	or.w	d2,d5
	or.w	d3,d5
	or.w	d4,d5
	not.w	d5
	move.w	d5,(a1)+
	move.w	d1,(a1)+
	move.w	d2,(a1)+
	move.w	d3,(a1)+
	move.w	d4,(a1)+
	dbf	d6,l0127
l0128	dbf	d0,l0125
	rts

	move.b	-(a0),d2
	add.b	-(a1),d2
	subi.b	#$31,d2
	add.b	d0,d2
	clr.w	d0
l0129	cmp.b	d1,d2
	bcs.b	l012a
	sub.b	d1,d2
	addq.w	#1,d0
	bra.b	l0129
l012a	addi.b	#$30,d2
	move.b	d2,(a1)
	rts

l012b	lea	l0460,a0
	movea.l	l044b,a6
	move.w	l0426,d0
	addi.w	#$ff,d0
	lsr.w	#8,d0
	tst.w	l04b7
	beq.b	l012c
	clr.w	d0
l012c	cmpi.w	#4,l04c7
	bne.b	l012d
	lsl.w	#1,d0
	addq.w	#1,l04c8
	cmpi.w	#$32,l04c8
	bne.b	l012d
	clr.w	l04c7
l012d	move.w	d0,l04d6
	tst.w	l04b7
	bne	l0143
	add.b	d0,l0445
	tst.w	l04dd
	beq.b	l012e
	sub.w	d0,l04dd
	bgt.b	l012e
	clr.w	l04dd
l012e	add.w	d0,l0444
	move.w	l04bb,d1
	bmi	l0134
	beq.b	l0133
	sub.w	d0,l04bb
	bgt.b	l0133
	tst.b	l04cb
	beq.b	l012f
	move.w	d0,-(a7)
	moveq	#4,d0
	bsr	music
	move.w	(a7)+,d0
l012f	clr.w	l04bb
	cmpi.w	#$1388,l04bc
	bcs.b	l0131
	cmpi.w	#4,l04c7
	beq.b	l0130
	move.w	#1,l04b8
	move.w	l0451,l0452
	bra.b	l0133
l0130	move.w	#1,l04b7
	clr.w	l04b8
	bra.b	l0133
l0131	move.w	l04b3,d1
	add.w	l04b5,d1
	cmp.w	#$3300,d1
	bcs.b	l0132
	move.w	#$3300,d1
l0132	move.w	d1,l04b3
l0133	sub.w	d0,l04bc
	bpl.b	l0134
	move.l	#$ffffffff,l04bb
l0134	lea	l0460,a0
	movea.l	l044b,a6
	lea	l0434,a1
	moveq	#1,d1
l0135	tst.w	(a1)
	beq.b	l0138
	sub.w	d0,2(a1)
	bpl.b	l0138
	move.w	6(a1),d2
l0136	move.w	4(a1),(a0)+
	move.w	8(a1),(a0)+
	cmpi.w	#2,(a1)
	bne.b	l0137
	neg.w	8(a1)
l0137	add.w	d2,2(a1)
	bmi.b	l0136
l0138	adda.w	#$a,a1
	dbf	d1,l0135
l0139	move.w	l0444,d5
	move.w	l044c,d0
	sub.w	d5,d0
	bgt	l0143
	neg.w	d0
	move.w	d0,d5
	move.w	d5,l0444
	move.w	(a6)+,d0
	move.w	d0,d1
	lsr.w	#8,d1
	andi.w	#$ff,d0
	move.w	d0,l044c
	cmp.b	#7,d1
	bne.b	l013a
	move.w	(a6)+,l044c
	bra	l013f
l013a	cmp.b	#0,d1
	bne	l013b
	move.w	(a6)+,d0
	clr.w	d1
	move.b	d0,d1
	move.w	d1,l0448
	lsr.w	#8,d0
	andi.w	#$f0,d0
	move.w	d0,l044a
	bra	l013f
l013b	cmp.b	#8,d1
	bne.b	l013c
	clr.w	d0
	move.b	(a6)+,d0
	move.w	d0,(a0)+
	move.b	(a6)+,d0
	ext.w	d0
	move.w	d0,(a0)+
	addq.w	#2,a6
	bra	l013f
l013c	cmp.b	#9,d1
	bne	l013e
l013d	addq.w	#2,a6
	bra	l013f
l013e	cmp.b	#$b,d1
	beq.b	l013d
	mulu	#$a,d1
	lea	l0430,a1
	adda.w	d1,a1
	move.w	d5,2(a1)
	move.b	(a6)+,5(a1)
	move.b	(a6)+,7(a1)
	move.b	(a6)+,d0
	ext.w	d0
	move.w	d0,8(a1)
	move.b	(a6)+,d0
	ext.w	d0
	move.w	d0,(a1)
l013f	move.w	(a6),d1
	lsr.w	#8,d1
	cmp.b	#6,d1
	bne.b	l0140
	move.w	2(a6),d0
	lea	l03f8,a6
	adda.w	d0,a6
	bra.b	l013f
l0140	cmp.b	#4,d1
	bne.b	l0141
	move.w	2(a6),d0
	addq.w	#4,a6
	movea.l	l0459,a3
	move.l	a6,(a3)+
	move.l	a3,l0459
	lea	l03f8,a6
	adda.w	d0,a6
	bra.b	l013f
l0141	cmp.b	#5,d1
	bne.b	l0142
	movea.l	l0459,a3
	movea.l	-(a3),a6
	move.l	a3,l0459
	bra.b	l013f
l0142	move.l	a6,l044b
	bra	l0139
l0143	move.w	#$ffff,(a0)
	move.l	a0,l0462
	lea	l043f,a5
	move.w	l044a,d0
	andi.w	#$f0,d0
	move.w	l0448,d1
	lsl.b	#2,d1
	or.b	d1,d0
	lsl.w	#8,d0
	move.w	d0,(a5)
	neg.w	d5
	add.w	l044c,d5
	lea	l0457,a0
	lea	l0458,a1
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	movea.l	l0459,a3
	adda.w	#$10,a3
	lea	l0434,a0
	lea	l0436,a1
	moveq	#9,d0
l0144	move.w	(a0)+,(a1)+
	dbf	d0,l0144
	lea	l043b,a4
	clr.l	d7
l0145	move.w	(a6)+,d1
	move.w	d1,d0
	andi.w	#$ff,d0
	lsr.w	#8,d1
	cmp.b	#6,d1
	bne.b	l0146
	move.w	(a6),d0
	lea	l03f8,a6
	adda.w	d0,a6
	bra.b	l0145
l0146	cmp.b	#4,d1
	bne.b	l0147
	move.w	(a6)+,d0
	move.l	a6,(a3)+
	lea	l03f8,a6
	adda.w	d0,a6
	bra.b	l0145
l0147	cmp.b	#5,d1
	bne.b	l0148
	movea.l	-(a3),a6
	bra.b	l0145
l0148	cmp.b	#7,d1
	bne.b	l014a
	move.w	(a6)+,d0
	bra	l0155
l0149	addq.w	#2,a6
	bra	l0155
l014a	cmp.b	#9,d1
	bne	l0150
	cmp.w	#$3e8,d5
	bcc.b	l0149
	move.w	d5,d1
	add.w	l04d6,d1
	cmp.w	d1,d5
	bcc.b	l0149
	cmp.w	#$3e8,d1
	bcs.b	l0149
	lea	l0425,a1
	moveq	#$1d,d2
l014b	tst.w	12(a1)
	beq.b	l014c
	lea	22(a1),a1
	dbf	d2,l014b
	bra.b	l0149
l014c	move.w	(a6)+,18(a1)
	move.w	18(a1),d2
	andi.w	#$18,d2
	lsl.w	#1,d2
	move.w	d2,2(a1)
	clr.w	6(a1)
	move.w	d5,8(a1)
	move.w	18(a1),d2
	andi.w	#3,d2
	subq.w	#1,d2
	move.w	d2,14(a1)
	muls	#$3c,d2
	move.w	d2,4(a1)
	move.w	18(a1),d2
	andi.w	#$3c0,d2
	lsr.w	#6,d2
	move.w	d2,12(a1)
	cmp.w	#4,d2
	bne.b	l014d
	asl	4(a1)
l014d	clr.w	16(a1)
	cmp.w	#6,d2
	bne.b	l014e
	move.b	#$32,16(a1)
l014e	lea	l03e4,a2
	add.w	d2,d2
	move.w	-2(a2,d2.w),(a1)
	cmpi.w	#2,l04c7
	beq	l014f
	tst.w	l04dd
	beq	l0155
l014f	cmpi.w	#6,12(a1)
	beq	l0155
	clr.w	2(a1)
	bra	l0155
l0150	cmp.b	#$b,d1
	bne.b	l0151
	move.w	d5,l04bb
	move.w	(a6),l04bc
	add.w	d5,l04bc
	bra	l0149
l0151	cmp.b	#0,d1
	bne.b	l0152
	move.w	d5,2(a5)
	sub.w	d7,2(a5)
	move.w	d5,d7
	addq.w	#4,a5
	move.b	(a6)+,d1
	move.b	(a6)+,d2
	lsl.b	#2,d2
	or.b	d2,d1
	lsl.w	#8,d1
	move.w	d1,(a5)
	cmpa.l	#l0440,a5
	bcc.b	l0156
	bra	l0155
l0152	cmp.b	#8,d1
	bne	l0153
	move.b	(a6)+,(a4)
	move.b	(a6)+,d2
	ext.w	d2
	lsl.w	#3,d2
	move.w	d2,2(a4)
	move.b	(a6)+,1(a4)
	move.w	d5,4(a4)
	clr.w	8(a4)
	move.l	#l04d4,12(a4)
	adda.w	#$10,a4
	addq.w	#1,a6
	bra.b	l0155
l0153	lea	l0431,a1
	mulu	#$a,d1
	adda.w	d1,a1
	tst.w	(a1)
	beq.b	l0154
	bsr	l015c
l0154	move.w	d5,2(a1)
	clr.w	d1
	move.b	(a6)+,d1
	move.w	d1,4(a1)
	move.b	(a6)+,d1
	move.w	d1,6(a1)
	move.b	(a6)+,d1
	ext.w	d1
	move.w	d1,8(a1)
	move.b	(a6)+,d1
	ext.w	d1
	move.w	d1,(a1)
l0155	add.w	d0,d5
	bcs.b	l0156
	bmi.b	l0156
	cmp.w	#$7d0,d5
	bcs	l0145
l0156	move.w	#$3e8,d5
	lea	l0436,a1
	moveq	#1,d0
l0157	tst.w	(a1)
	beq.b	l0158
	bsr	l015c
l0158	adda.w	#$a,a1
	dbf	d0,l0157
	move.l	a4,l044f
	move.w	#$ffff,4(a4)
	move.w	#$ffff,2(a5)
	rts

l0159	movem.w	d0-d1,-(a7)
	cmp.w	#$100,d7
	bcs.b	l015a
	move.w	d7,d1
	addi.w	#$64,d1
	move.l	#$c800,d0
	divu	d1,d0
	bra.b	l015b
l015a	add.w	d7,d7
	move.w	0(a5,d7.w),d0
	lsr.w	#1,d7
l015b	move.w	#$a8,d6
	sub.w	l04c2,d6
	add.w	l0433,d6
	muls	d0,d6
	asr.l	#8,d6
	asr.w	#1,d6
	add.w	l04c2,d6
	movem.w	(a7)+,d0-d1
	rts

l015c	move.w	d7,-(a7)
	move.w	8(a1),d4
	lsl.w	#3,d4
	lea	l043b,a0
	move.w	2(a1),d1
	bpl.b	l015e
l015d	add.w	6(a1),d1
	bmi.b	l015d
l015e	move.w	#$3e8,d2
l015f	cmpa.l	a0,a4
	beq.b	l0161
	cmp.w	4(a0),d1
	bcs.b	l0160
	adda.w	#$10,a0
	bra.b	l015f
l0160	move.w	4(a0),d2
l0161	cmpa.l	#l043c,a0
	beq	l016a
	cmp.w	d2,d5
	bpl.b	l0162
	move.w	d5,d2
l0162	sub.w	d1,d2
	bmi	l016a
	ext.l	d2
	divu	6(a1),d2
	addq.w	#1,d2
	move.w	d2,d3
	mulu	#$10,d3
	movea.l	a4,a2
	adda.w	d3,a2
	move.l	a4,d3
	sub.l	a0,d3
	cmpa.l	#l043c,a2
	ble	l0163
	suba.l	#l043c,a2
	add.w	a2,d3
	adda.w	a2,a4
	lea	l043c,a2
l0163	move.l	a2,-(a7)
	divu	#$10,d3
	beq.b	l0165
	subq.w	#1,d3
l0164	move.l	-(a4),-(a2)
	move.l	-(a4),-(a2)
	move.l	-(a4),-(a2)
	move.l	-(a4),-(a2)
	dbf	d3,l0164
l0165	movea.l	(a7)+,a4
	move.b	5(a1),d3
	lsl.w	#8,d3
	move.w	(a1),d6
	clr.w	d7
	cmp.b	#3,d6
	bne.b	l0166
	move.w	#$8000,d7
l0166	subq.w	#1,d2
l0167	move.l	#l04d4,12(a0)
	move.w	d3,(a0)+
	move.w	d4,(a0)+
	move.w	d1,(a0)+
	move.w	d7,2(a0)
	adda.w	#$a,a0
	add.w	6(a1),d1
	cmp.w	#2,d6
	bne.b	l0168
	neg.w	d4
l0168	dbf	d2,l0167
	move.w	d1,d6
	cmp.w	d5,d1
	bcc	l016a
l0169	cmp.w	4(a0),d1
	bcs	l015e
	cmpa.l	a0,a4
	beq	l015e
	adda.w	#$10,a0
	bra.b	l0169
l016a	move.w	(a7)+,d7
	rts

l016b	bsr	l0266
l016c	clr.w	d1
	move.b	(a0)+,d1
	beq.b	l016e
	move.l	l046d,d0
	bsr	l0277
	move.w	#3,l04ab
l016d	tst.w	l04ab
	bne.b	l016d
	addq.w	#8,l046d
	bra.b	l016c
l016e	bsr	l0266
	rts

l016f	tst.w	l04ab
	bne.b	l016f
	bsr	music+$62
	bsr	music+($e*2)
	move.w	l04db,d0
	addi.w	#$300,d0
	cmp.w	#$1500,d0
	bcs.b	l0170
	move.w	#$1500,d0
l0170	move.w	d0,l04b4
	move.l	#l04a7,l046b
	subq.b	#1,l04cf
	move.b	l04cf,d0
	addi.b	#$30,d0
	move.b	d0,l03f4
	lea	l03f1,a0
	bsr	l016b
	lea	l03f2,a0
	cmpi.b	#1,l04cf
	beq.b	l0171
	lea	l03f3,a0
l0171	bsr	l016b
	move.w	#$96,l03e7
l0172	move.w	#1,l04ab
l0173	tst.w	l04ab
	bne.b	l0173
	bsr	l001d
	tst.b	d0
	bpl.b	l0174
	subq.w	#1,l03e7
	bpl.b	l0172
l0174	tst.w	l0416
	bne	l0017
	tst.b	l04cf
	bne	l01dd
	lea	l03f5,a0
	bsr	l016b
l0175	move.l	l0443,d0
	lea	l03da,a0
	cmp.l	(a0),d0
	bcs	l0017
	move.l	d0,(a0)
	moveq	#4,d1
l0176	subq.w	#4,a0
	cmp.l	(a0),d0
	bcs.b	l0177
	move.l	(a0),4(a0)
	move.l	d0,(a0)
	subq.b	#1,d1
	bne.b	l0176
l0177	move.w	d1,l03e6
	lea	l03dd,a0
l0178	cmp.b	#4,d1
	beq.b	l017b
	movea.l	a0,a1
	suba.w	#$1d,a0
	movea.l	a0,a2
	adda.w	#8,a2
	adda.w	#8,a1
	moveq	#6,d0
l0179	move.b	(a2)+,(a1)+
	dbf	d0,l0179
	addq.w	#4,a2
	addq.w	#4,a1
	moveq	#9,d0
l017a	move.b	(a2)+,(a1)+
	dbf	d0,l017a
	addq.b	#1,d1
	bra.b	l0178
l017b	adda.w	#8,a0
	lea	l03ef,a1
	moveq	#6,d0
l017c	move.b	(a1)+,(a0)+
	dbf	d0,l017c
	addq.w	#4,a0
	move.l	a0,-(a7)
	moveq	#$20,d0
	moveq	#9,d1
l017d	move.b	d0,(a0)+
	dbf	d1,l017d
	lea	l03dc,a0
	move.w	l03e6,d0
	mulu	#$1d,d0
	adda.w	d0,a0
	move.b	#4,6(a0)
	move.l	a0,-(a7)
	st	l04de
	bsr	l0281
	movea.l	(a7)+,a0
	move.b	#$f,6(a0)
	move.w	l03e6,d1
	mulu	#$1d,d1
	lea	l03dc,a1
	lea	l03e8,a0
	move.b	17(a1,d1.w),2(a0)
	move.b	18(a1,d1.w),3(a0)
	bsr	l0266
l017e	bsr	l001d
	cmp.b	#$ff,d0
	bne.b	l017e
	lea	l03ea,a6
	move.w	#$a0a,(a6)
	bsr	l0049
	move.b	l03eb,d0
	lea	l03ec,a6
	movea.l	(a7)+,a0
	ext.w	d0
	subq.w	#1,d0
	bmi.b	l0180
l017f	move.b	(a6)+,(a0)+
	dbf	d0,l017f
l0180	lea	l03e9,a0
	bsr	l0266
	sf	l04de
	move.w	#$777,$ff8248.l
	bra	l0017
l0181	lea	l0437,a6
	lea	l0441,a5
	clr.w	d4
l0182	move.w	(a6),d7
	move.w	d7,d5
	cmp.w	#$ffff,d7
	beq.b	l0185
	cmp.w	#$100,d7
	bcc.b	l0183
	add.w	d7,d7
	move.w	0(a5,d7.w),4(a6)
	bra.b	l0184
l0183	move.w	d7,d1
	addi.w	#$64,d1
	move.l	#$c800,d0
	divu	d1,d0
	move.w	d0,4(a6)
l0184	move.w	#3,8(a6)
	move.w	#$5a,6(a6)
	clr.w	10(a6)
	adda.w	#$c,a6
	bra.b	l0182
l0185	rts

l0186	lea	l043b,a6
	lea	l0441,a5
l0187	move.w	4(a6),d7
	move.w	d7,d5
	cmp.w	#$ffff,d7
	beq	l018b
	cmp.w	#$100,d7
	bcc.b	l0188
	add.w	d7,d7
	move.w	0(a5,d7.w),d0
	bra.b	l0189
l0188	move.w	d7,d1
	addi.w	#$64,d1
	move.l	#$c800,d0
	divu	d1,d0
l0189	or.w	d0,8(a6)
	move.w	4(a6),d7
	bsr	l0159
	move.w	d6,10(a6)
	adda.w	#$10,a6
	cmpa.l	#l043e,a6
	bcc.b	l018a
	bra.b	l0187
l018a	move.w	#$ffff,4(a6)
l018b	move.l	a6,l044f
	rts

l018c	clr.l	d0
	clr.l	d1
	move.l	#$400,d2
	move.l	d2,d3
	lea	$100000,a4
	clr.l	d4
	clr.l	d5
	clr.l	d7
	move.w	l0451,d7
	move.l	d7,d6
	lea	l0437,a2
	lea	l043b,a1
	lea	l043f,a5
	lea	l040b,a0
l018d	move.b	(a5),d0
	andi.w	#$f0,d0
	lsl.w	#3,d0
	cmp.w	d0,d3
	beq.b	l018e
	ext.l	d2
	lsl.l	#8,d2
	divu	d3,d2
	ext.l	d2
	subi.l	#$100,d2
	move.w	d3,d1
	move.w	d0,d3
	muls	d3,d4
	divs	d1,d4
	sub.w	d3,d1
	muls	d2,d1
	asr.l	#8,d1
	add.w	d1,d6
	sub.w	d1,d7
	move.w	d3,d1
	mulu	d3,d1
	movea.l	d1,a4
l018e	move.w	2(a5),d0
	move.b	(a5),d1
	addq.w	#4,a5
	lsr.b	#2,d1
	andi.b	#3,d1
	beq	l01a4
	cmp.b	#1,d1
	beq	l0199
	move.w	d5,d1
	add.w	d0,d1
	bcs.b	l018f
	cmp.w	(a2),d1
	bcc.b	l018f
	cmp.w	4(a1),d1
	bcs.b	l0197
l018f	subq.w	#1,d0
	move.w	d7,-(a7)
l0190	addq.w	#1,d5
	cmp.w	4(a1),d5
	bcc.b	l0191
	cmp.w	(a2),d5
	bcs.b	l0195
l0191	bsr	l01b0
	bcs.b	l0198
	sub.w	d3,d1
	add.w	d6,d1
l0192	cmp.w	(a2),d5
	bcs.b	l0193
	move.w	d1,2(a2)
	adda.w	#$c,a2
	bra.b	l0192
l0193	cmp.w	4(a1),d5
	bcs.b	l0194
	move.w	d1,6(a1)
	movea.l	12(a1),a6
	move.w	d1,(a6)
	adda.w	#$10,a1
	bra.b	l0193
l0194	cmpi.w	#$ffff,(a2)
	beq	l01ae
l0195	addq.w	#1,d4
	dbf	d0,l0190
	move.w	(a7)+,d7
l0196	bsr	l01b0
	move.w	d1,d2
	sub.w	d3,d1
	add.w	d1,d1
	add.w	d6,d1
	move.w	d1,d7
	bra	l018d
l0197	add.w	d0,d5
	add.w	d0,d4
	bra.b	l0196
l0198	move.w	(a7)+,d7
	move.w	#$ffff,4(a1)
	bra	l01af
l0199	move.w	d5,d1
	add.w	d0,d1
	bcs.b	l019a
	cmp.w	(a2),d1
	bcc.b	l019a
	cmp.w	4(a1),d1
	bcs.b	l01a2
l019a	subq.w	#1,d0
	move.w	d6,-(a7)
l019b	addq.w	#1,d5
	cmp.w	4(a1),d5
	bcc.b	l019c
	cmp.w	(a2),d5
	bcs.b	l01a0
l019c	bsr	l01b0
	bcs.b	l01a3
	neg.w	d1
	add.w	d3,d1
	add.w	d7,d1
l019d	cmp.w	(a2),d5
	bcs.b	l019e
	move.w	d1,2(a2)
	adda.w	#$c,a2
	bra.b	l019d
l019e	cmp.w	4(a1),d5
	bcs.b	l019f
	move.w	d1,6(a1)
	movea.l	12(a1),a6
	move.w	d1,(a6)
	adda.w	#$10,a1
	bra.b	l019e
l019f	cmpi.w	#$ffff,(a2)
	beq	l01ae
l01a0	subq.w	#1,d4
	dbf	d0,l019b
	move.w	(a7)+,d6
l01a1	bsr	l01b0
	move.w	d1,d2
	sub.w	d3,d1
	neg.w	d1
	add.w	d1,d1
	add.w	d7,d1
	move.w	d1,d6
	bra	l018d
l01a2	add.w	d0,d5
	sub.w	d0,d4
	bra.b	l01a1
l01a3	move.w	(a7)+,d6
	move.w	#$ffff,4(a1)
	bra	l01af
l01a4	bsr	l01b0
	move.w	d4,d2
	neg.w	d2
	ext.l	d2
	lsl.l	#8,d2
	tst.w	d1
	bne.b	l01a5
	addq.w	#1,d1
l01a5	divs	d1,d2
	ext.l	d2
	move.w	d6,d1
	add.w	d7,d1
	asr.w	#1,d1
	lsl.l	#8,d1
	movea.l	d1,a3
	move.w	d6,-(a7)
	move.w	d7,-(a7)
	move.w	(a2),d6
	sf	d7
	cmp.w	4(a1),d6
	bcs.b	l01a6
	move.w	4(a1),d6
	st	d7
l01a6	sub.w	d5,d6
	cmp.w	d0,d6
	bcc.b	l01ac
	add.w	d6,d5
	sub.w	d6,d0
	muls	d2,d6
	add.l	d6,d1
	ror.l	#8,d1
	tst.b	d7
	bne.b	l01a7
	move.w	d1,2(a2)
	move.w	(a2),d7
	adda.w	#$c,a2
	bra.b	l01a8
l01a7	move.w	d1,6(a1)
	movea.l	12(a1),a6
	move.w	d1,(a6)
	move.w	4(a1),d7
	adda.w	#$10,a1
l01a8	cmp.w	(a2),d7
	bne.b	l01a9
	move.w	d1,2(a2)
	adda.w	#$c,a2
	bra.b	l01a8
l01a9	cmp.w	4(a1),d7
	bne.b	l01aa
	move.w	d1,6(a1)
	movea.l	12(a1),a6
	move.w	d1,(a6)
	adda.w	#$10,a1
	bra.b	l01a8
l01aa	sf	d7
	move.w	(a2),d6
	cmp.w	4(a1),d6
	bcs.b	l01ab
	st	d7
	move.w	4(a1),d6
l01ab	rol.l	#8,d1
	cmp.w	#$ffff,d6
	bne.b	l01a6
	bra.b	l01ad
l01ac	add.w	d0,d5
	muls	d2,d0
	add.l	d0,d1
	move.w	(a7)+,d7
	move.w	(a7)+,d6
	sub.l	a3,d1
	lsr.l	#8,d1
	add.w	d1,d6
	add.w	d1,d7
	bsr.b	l01b0
	move.w	d1,d2
	bra	l018d
l01ad	addq.w	#2,a7
l01ae	addq.w	#2,a7
l01af	adda.w	#$c,a2
	move.l	a2,l0442
	rts

l01b0	move.w	d4,d1
	muls	d1,d1
	sub.l	a4,d1
	beq.b	l01b4
	bcc.b	l01b3
	neg.l	d1
	cmp.l	#$10000000,d1
	bcc.b	l01b3
	clr.l	d2
l01b1	movea.l	d1,a6
	andi.l	#$3000000,d1
	bne.b	l01b2
	move.l	a6,d1
	lsl.l	#2,d1
	addq.w	#1,d2
	bra.b	l01b1
l01b2	move.l	a6,d1
	swap	d1
	add.w	d1,d1
	move.w	0(a0,d1.w),d1
	addq.w	#2,d2
	lsr.w	d2,d1
	and.b	d1,d1
	rts

l01b3	moveq	#$ff,d1
	add.b	d1,d1
l01b4	rts

l01b5	lea	l0442,a6
	move.w	#$ff,d7
l01b6	move.w	d7,d1
	addi.w	#$64,d1
	move.l	#$c800,d0
	divu	d1,d0
	move.w	d0,-(a6)
	dbf	d7,l01b6
	rts

l01b7	subq.w	#4,l04c2
	lea	l0437,a6
	lea	l0441,a5
	clr.w	d7
	clr.w	d0
	moveq	#1,d5
	move.w	d7,(a6)
	adda.w	#$c,a6
	clr.w	l0433
	bsr	l0159
	move.w	#$a7,d4
	sub.w	d4,d6
	neg.w	d6
	move.w	d6,l0433
	move.w	d7,d3
l01b8	add.w	d5,d7
	cmp.w	#$7d0,d7
	bcc	l01c0
	bsr	l0159
	cmp.w	d4,d6
	bne.b	l01bb
	move.w	d4,d6
l01b9	move.w	d5,d2
	mulu	d5,d2
	lsr.w	#8,d2
	lsr.w	#4,d2
	addq.w	#1,d2
	add.w	d2,d5
l01ba	move.w	d7,d3
	move.w	d6,d4
	bra.b	l01b8
l01bb	clr.w	d0
	move.w	d4,d2
	sub.w	d6,d2
	cmp.w	#1,d2
	bne.b	l01bc
	move.w	d7,(a6)
	move.w	d6,2(a6)
	adda.w	#$c,a6
	cmpa.l	#l043a,a6
	bcc.b	l01c0
	bra.b	l01b9
l01bc	cmp.w	#1,d5
	bne.b	l01be
	subq.w	#1,d2
l01bd	move.w	d7,(a6)
	adda.w	#$c,a6
	cmpa.l	#l043a,a6
	bcc.b	l01c0
	dbf	d2,l01bd
	bra.b	l01ba
l01be	move.w	d4,d6
	move.w	d3,d7
	move.w	d5,d2
	mulu	d5,d2
	lsr.w	#8,d2
	lsr.w	#4,d2
	addq.w	#3,d2
	sub.w	d2,d5
	bmi	l01bf
	bne.b	l01b8
l01bf	moveq	#1,d5
	bra.b	l01b8
l01c0	move.w	#$ffff,(a6)
	addq.w	#4,l04c2
	rts

l01c1	move.w	l0466,-(a7)
	move.w	#$f,l0466
	lea	l043b,a0
l01c2	cmp.w	4(a0),d0
	bcs.b	l01c3
	beq.b	l01c3
	adda.w	#$10,a0
	bra.b	l01c2
l01c3	movea.l	l044f,a2
	cmpa.l	#l043d,a2
	bcs.b	l01c4
	lea	l043d,a2
l01c4	movea.l	a2,a3
	adda.w	#$10,a3
	move.l	a3,d2
	sub.l	a0,d2
	bcs.b	l01c6
	divu	#$10,d2
	subq.w	#1,d2
	bmi.b	l01c6
	move.l	a3,l044f
	move.w	#$ffff,4(a3)
l01c5	move.l	-(a2),-(a3)
	move.l	-(a2),-(a3)
	move.l	-(a2),-(a3)
	move.l	-(a2),-(a3)
	dbf	d2,l01c5
	move.b	d7,(a0)
	move.b	d5,1(a0)
	move.w	d6,2(a0)
	move.w	d0,4(a0)
	move.w	d4,8(a0)
	move.l	a6,12(a0)
l01c6	move.w	(a7)+,l0466
	rts

l01c7	mulu	#$12,d0
	lea	l03f9,a1
	adda.w	d0,a1
	move.w	10(a1),l0487
	divu	#$12,d0
	lea	l0410,a6
	clr.w	d1
l01c8	cmp.b	(a6)+,d0
	bcs.b	l01c9
	addq.w	#1,d1
	bra.b	l01c8
l01c9	move.w	d1,l0487
	move.w	12(a1),l04b3
	move.w	14(a1),l04b5
	move.w	16(a1),l04d9
	bsr	l02d1
	move.w	6(a6),8(a1)
	move.l	8(a6),4(a1)
	move.l	a1,l048c
	bra	l0321
	move.w	l04d5,d0
	mulu	#$6255,d0
	addi.w	#$3619,d0
	move.w	d0,l04d5
	rts

l01ca	mulu	#$38,d0
	addi.w	#$3200,d0
	movea.l	l04a7,a0
	adda.w	d0,a0
	lea	l03ed,a1
	moveq	#7,d0
l01cb	moveq	#5,d1
l01cc	move.w	(a1)+,d2
	eor.w	d2,(a0)+
	eor.w	d2,(a0)+
	eor.w	d2,(a0)+
	eor.w	d2,(a0)+
	dbf	d1,l01cc
	adda.w	#$70,a0
	dbf	d0,l01cb
	adda.w	#$1e30,a0
	moveq	#7,d0
l01cd	moveq	#5,d1
l01ce	move.w	-(a1),d2
	eor.w	d2,-(a0)
	eor.w	d2,-(a0)
	eor.w	d2,-(a0)
	eor.w	d2,-(a0)
	dbf	d1,l01ce
	adda.w	#$d0,a0
	dbf	d0,l01cd
	rts

l01cf	clr.w	l0416
l01d0	bsr	l001d
	cmp.b	#$ff,d0
	bne.b	l01d0
	bsr	l021d
	move.w	#$40,l04c2
	move.b	#5,l04cf
	bsr	l01b7
	bsr	l0181
	move.l	#l03f0,l0464
	clr.l	l0443
	move.l	#l0457,l0459
	moveq	#4,d0
	move.w	d0,l044d
	bsr	l01c7
	move.w	#1,l044d
	bsr	l0225
	clr.w	l04bd
	clr.w	l04be
	clr.b	l04cd
	clr.w	l04c7
	move.w	#1,l04b2
l01d1	bsr	music+$62
	bsr	music+($e*2)
	bsr	music+($e*5)
	clr.w	l04ba
	move.w	l044d,d0
	add.w	d0,d0
	lea	l040f,a0
	move.w	-2(a0,d0.w),d0
	beq	l01dd
	move.w	#$40,l04c2
	move.l	#l04a9,l046b
	adda.w	d0,a0
	move.l	a0,-(a7)
	bsr	l02dd
	bsr	l032d
	bsr	l02dd
	move.w	l04c2,d0
	mulu	#$a0,d0
	add.l	l04a9,d0
	movea.l	d0,a0
	move.w	#$a8,d0
	sub.w	l04c2,d0
	mulu	#$28,d0
	subq.l	#1,d0
l01d2	clr.l	(a0)+
	dbf	d0,l01d2
	bsr	l0330
	movea.l	(a7)+,a0
	move.l	a0,-(a7)
	move.w	(a0),d1
	move.l	#$2006c,d0
	bsr	l0211
	movea.l	(a7)+,a0
	move.l	a0,-(a7)
	move.w	4(a0),d1
	move.l	#$9006c,d0
	bsr	l0211
	movea.l	(a7)+,a0
	move.l	a0,-(a7)
	move.w	8(a0),d1
	move.l	#$10006c,d0
	bsr	l0211
	movea.l	(a7)+,a0
	move.l	a0,-(a7)
	lea	12(a0),a0
	bsr	l0266
	move.w	l0487,d0
	mulu	#$20,d0
	lea	l03fc,a1
	adda.w	d0,a1
	lea	l04aa,a0
	moveq	#7,d0
l01d3	move.l	(a1)+,(a0)+
	dbf	d0,l01d3
	move.w	l04c2,l049e
	lea	l03fb,a1
	lea	l035b,a0
	bsr	l0356
	bsr	l0238
	clr.w	l041f
	clr.w	l03e7
	move.w	l04c2,l049d
	move.w	#$c8,l049e
	lea	l03fb,a1
	lea	l0359,a0
	bsr	l0356
l01d4	tst.b	l0420
	bne.b	l01d4
	moveq	#1,d0
	move.w	d0,l04a6
	bsr	l01ca
l01d5	tst.w	l0416
	beq.b	l01d6
	subq.w	#1,l03e7
	beq	l01dc
	clr.w	d0
	bra.b	l01d7
l01d6	cmpi.w	#8,l0417
	beq.b	l01d8
	move.w	l041d,d0
	addq.w	#1,d0
l01d7	cmp.w	l04a6,d0
	beq	l01da
	move.w	d0,-(a7)
	bsr	l01ca
	move.w	l04a6,d0
	bsr	l01ca
	moveq	#$d,d0
	jsr	l03d7
	move.w	(a7)+,d0
	move.w	d0,l04a6
	movea.l	(a7),a0
	mulu	#4,d0
	adda.w	d0,a0
	move.w	(a0),d0
	bsr	l01c7
	move.l	l04a9,-(a7)
	move.l	l04a7,l04a9
	bsr	l02dd
	bsr	l032d
	move.l	(a7)+,l04a9
	move.w	l0487,d0
	mulu	#$20,d0
	lea	l03fc,a1
	adda.w	d0,a1
	lea	l035d,a0
	bsr	l0356
	bra.b	l01da
l01d8	move.w	l041b,d1
	sub.w	l03e0,d1
	addi.w	#$20,d1
	bpl.b	l01d9
	clr.w	d0
	bra	l01d7
l01d9	moveq	#1,d0
	cmp.w	#$40,d1
	bcs	l01d7
	moveq	#2,d0
	bra	l01d7
l01da	move.b	l0420,d0
	andi.b	#3,d0
	beq	l01d5
l01db	tst.b	l0420
	bne.b	l01db
l01dc	move.w	l04a6,d0
	movea.l	(a7)+,a0
	mulu	#4,d0
	adda.w	d0,a0
	move.w	(a0)+,l044d
	move.w	(a0)+,l04ba
l01dd	clr.w	l04dd
	clr.w	l0434
	clr.w	l0435
	bsr	l00f9
	bsr	l0240
	clr.w	l04b7
	clr.w	l04b8
	move.w	#$ffff,l0429
	move.w	#$ffff,l042b
	move.w	#4,l0448
	move.w	#$f0,l044a
	clr.w	l044c
	clr.w	l0444
	clr.w	l0446
	clr.w	l0447
	sf	l04d1
	clr.w	l0450
	move.w	#$ffff,l0460
	clr.l	l0451
	clr.w	l04da
	clr.w	l04c3
	tst.w	l04b4
	bne.b	l01de
	move.w	#$b00,l04b4
l01de	move.l	#$ffffffff,l04bb
	move.w	#$40,l04c2
	move.w	l044d,d0
	bsr	l01c7
	move.w	l044d,d0
	lsl.w	#2,d0
	lea	l03f8,a0
	adda.l	-4(a0,d0.w),a0
	move.l	a0,l044b
	move.w	#$a0,l041b
	move.w	#$a0,l03e0
	bsr	l012b
	bsr	l00fb
	bsr	l00b1
	bsr	l0186
	bsr	l018c
	bsr	l02dd
	bsr	l032d
	bsr	l0330
	bsr	l02e3
	bsr	l0303
	move.l	#l04a9,l046b
	bsr	l0214
	move.w	l04c2,l049e
	move.w	l0487,d0
	mulu	#$20,d0
	lea	l03fc,a1
	adda.w	d0,a1
	lea	l04aa,a0
	moveq	#7,d0
l01df	move.l	(a1)+,(a0)+
	dbf	d0,l01df
	lea	l03fb,a1
	lea	l035b,a0
	bsr	l0356
	bsr	l0238
	move.w	l04c2,l049d
	move.w	#$c8,l049e
	lea	l03fb,a1
	lea	l0359,a0
	bsr	l0356
	move.w	l0487,d0
	mulu	#$20,d0
	lea	l03fc,a1
	adda.w	d0,a1
	lea	l035d,a0
	bsr	l0356
	move.w	#$a0,l041b
	move.w	#$a0,l03e0
	clr.b	l04ce
	clr.l	l04bf
	clr.w	l04c3
	bsr	l00f4
	move.l	#l04a9,l046b
	bsr	l00f9
	move.w	l04b4,l04db
	tst.b	l04cb
	beq.b	l01e0
	moveq	#3,d0
	bsr	music
l01e0	bsr	music+$54
l01e1	bsr	l001d
	cmp.b	#$ff,d0
	bne.b	l01e1
l01e2	move.w	#0,l0466
	addi.w	#1,l0454
	tst.b	l03bd
	bne.b	l01e3
	tst.w	l04b7
	bne.b	l01e3
	tst.w	l04b8
	bne.b	l01e3
	tst.b	l04cb
	beq.b	l01e3
	moveq	#3,d0
	bsr	music
	bsr	music+$54
l01e3	sf	l04d0
	bsr	l001d
	tst.b	d0
	bmi	l01f2
	cmp.b	#$d,d0
	beq	l01f0
	move.b	d0,d1
	cmp.b	#$40,d0
	bcs.b	l01e4
	andi.b	#$1f,d0
	addi.b	#$40,d0
l01e4	cmp.b	#$1b,d1
	beq	l01cf
	cmp.b	#$4a,d0
	bne.b	l01e5
	bsr	l0067
	bra	l01f2
l01e5	cmp.b	#$4d,d0
	bne.b	l01e6
	bsr	l0066
	bra	l01f2
l01e6	cmp.b	#$20,d1
	bne.b	l01e7
	st	l04d0
	bra	l01f2
l01e7	tst.w	l0456
	beq	l01ee
	cmp.b	#$51,d0
	bne.b	l01e8
	bsr	l0220
	bra	l01f2
l01e8	cmp.b	#$58,d0
	bne.b	l01e9
	move.b	#$40,l04d7
	move.b	#1,l04d8
	bra	l01f2
l01e9	cmp.b	#$46,d0
	bne.b	l01ea
	move.w	#$3300,l04b3
	bra	l01f2
l01ea	cmp.b	#$53,d0
	bne.b	l01eb
	move.w	#1,l04b7
	bra	l01f2
l01eb	cmp.b	#$47,d0
	bne.b	l01ec
	clr.w	l04b3
	move.w	#1,l04b4
	move.b	#1,l04cf
	bra	l01f2
l01ec	subi.b	#$30,d0
	bcs.b	l01ed
	cmp.b	#5,d0
	bcc.b	l01ed
	ext.w	d0
	move.w	d0,l04be
	move.w	d0,l04bd
	move.w	#3,l04c4
	move.w	#$a00,l04c5
l01ed	bra.b	l01f2
l01ee	movea.l	l0464,a0
	cmp.b	(a0)+,d0
	beq.b	l01ef
	move.l	#l03f0,l0464
	bra.b	l01f2
l01ef	move.l	a0,l0464
	tst.b	(a0)
	bne.b	l01f2
	move.w	#1,l0456
	bra.b	l01f2
l01f0	bsr	music+$62
	bsr	music+($e*2)
	bsr	l0026
	tst.b	l04cb
	beq.b	l01f1
	bsr	music+($e*3)
l01f1	move.l	#l04a9,l046b
	bsr	music+$54
l01f2	move.w	l0416,d0
	subq.w	#1,d0
	bmi.b	l01f3
	move.w	d0,l0416
	bne.b	l01f3
	bsr	music+$62
	bra	l0017
l01f3	move.w	#1,l0466
	bsr	l012b
	move.w	#3,l0466
	bsr	l00fb
	move.w	#$10,l0466
	bsr	l00c4
	move.w	#6,l0466
	bsr	l0078
	bsr	l0072
	move.w	#4,l0466
	bsr	l0186
	move.w	#2,l0466
	bsr	l018c
	move.w	#$e,l0466
	bsr	l02d2
	move.w	#$c,l0466
l01f4	tst.w	l04ab
	bne.b	l01f4
	move.w	#8,l0466
	bsr	l02dd
	move.w	#7,l0466
	bsr	l032d
	move.w	#$a,l0466
	move.l	#l04a9,l046b
	bsr	l0330
	move.w	#9,l0466
	bsr	l02e3
	move.w	#$b,l0466
	bsr	l0245
	bsr	l0303
	bsr	l0247
	bsr	l0120
	move.w	#$a,l0466
	move.l	#l04a9,l046b
	bsr	l0214
	tst.b	l04ce
	beq.b	l01f5
	move.w	l0454,d0
	andi.w	#4,d0
	beq.b	l01f5
	subq.b	#1,l04ce
	lea	l0413,a0
	move.l	#l04a9,l046b
	bsr	l0266
l01f5	move.w	#0,l0466
	bsr	l0355
	cmpi.w	#$14,l04b7
	beq.b	l01f8
	cmpi.w	#$14,l04b8
	beq.b	l01f8
	tst.w	l044e
	beq.b	l01f6
	tst.w	l0446
	bne.b	l01f6
	bsr	music+$62
	bra	l016f
l01f6	move.w	l0446,d0
	cmp.w	#$a0,d0
	bcs.b	l01f7
	subi.w	#$64,d0
l01f7	lsl.w	#4,d0
	neg.w	d0
	addi.w	#$fa0,d0
	move.w	d0,l03b9
	bra	l01e2
l01f8	tst.w	l04ab
	bne.b	l01f8
	bsr	music+$62
	bsr	music+($e*2)
	bsr	music+($e*5)
	clr.w	l04b4
	move.l	#l04a9,l046b
	lea	l040e,a0
	bsr	l0366
	bsr	l0330
	bsr	l0215
	move.l	#l04a9,l046b
	move.l	#$90020,d0
	move.w	l044d,d1
	bsr	l0211
	move.l	#$b0040,d0
	clr.w	d1
	bsr	l031a
	move.l	#$d0040,d0
	clr.w	d1
	bsr	l031a
	move.l	#$e0040,d0
	clr.w	d1
	bsr	l031a
	move.l	#$f0040,d0
	clr.w	d1
	bsr	l031a
	lea	l03fb,a1
	lea	l04aa,a0
	moveq	#7,d0
l01f9	move.l	(a1)+,(a0)+
	dbf	d0,l01f9
	bsr	l0238
	clr.w	l04c3
	move.l	#l04a7,l046b
	clr.w	d1
	move.l	l04bf,d2
	lsr.l	#8,d2
	lsr.w	#4,d2
	move.w	d2,d0
	andi.w	#$f,d2
	lsr.w	#4,d0
	andi.w	#$f,d2
	mulu	#$a,d0
	add.w	d0,d2
	beq	l0200
l01fa	addq.w	#1,d1
	move.l	#$a0040,d0
	move.w	d1,-(a7)
	move.w	d2,-(a7)
	bsr	l0210
	addi.w	#$80,l04b4
	cmpi.w	#$1a00,l04b4
	bcs.b	l01fb
	st	l04c3
	move.w	#$1a00,l04b4
l01fb	bsr	l0330
	bsr	l0215
	moveq	#$d,d0
	jsr	l03d7
	bsr	l001d
	cmp.b	#$ff,d0
	beq.b	l01fc
	st	l04c3
l01fc	tst.b	l04c3
	bne.b	l01fe
	move.w	#$f,l04ab
l01fd	tst.w	l04ab
	bne.b	l01fd
l01fe	move.w	(a7)+,d2
	move.w	(a7)+,d1
	subq.w	#1,d2
	bne.b	l01fa
	st	l04c1
	clr.w	d1
	move.w	l04c0,d1
	lsr.w	#8,d1
	andi.w	#$f,d1
	move.l	#$d0040,d0
	bsr	l031a
	move.w	l04c0,d1
	lsr.w	#4,d1
	andi.w	#$f,d1
	move.l	#$e0040,d0
	bsr	l031a
	move.w	l04c0,d1
	andi.w	#$f,d1
	move.l	#$f0040,d0
	bsr	l031a
	sf	l04c1
	cmpi.w	#$32,l044d
	beq	l0209
	movea.l	l04a9,a1
	movea.l	l04a7,a0
	move.w	#$1f3f,d0
l01ff	move.l	(a0)+,(a1)+
	dbf	d0,l01ff
l0200	move.w	l04ba,d0
	beq.b	l0204
	swap	d0
	clr.w	d0
	move.l	d0,-(a7)
	clr.w	d2
	bsr	l00f7
	move.l	(a7)+,d2
	move.l	#$50068,d0
	move.l	#l04a9,l046b
	moveq	#7,d3
l0201	rol.l	#4,d2
	move.w	d2,d1
	andi.w	#$f,d1
	bne.b	l0203
	addi.l	#$10000,d0
	dbf	d3,l0201
	bra.b	l0204
l0202	rol.l	#4,d2
	move.b	d2,d1
	andi.b	#$f,d1
l0203	move.l	d0,-(a7)
	move.l	d2,-(a7)
	move.w	d3,-(a7)
	bsr	l031a
	move.w	(a7)+,d3
	move.l	(a7)+,d2
	move.l	(a7)+,d0
	addi.l	#$10000,d0
	dbf	d3,l0202
l0204	move.w	#8,l03e7
l0205	bsr	l0355
	bsr	l001d
	cmp.b	#$ff,d0
	beq.b	l0206
	st	l04c3
l0206	tst.b	l04c3
	bne.b	l0208
	move.w	#$14,l04ab
l0207	tst.w	l04ab
	bne.b	l0207
l0208	subq.w	#1,l03e7
	bne.b	l0205
	addq.w	#1,l044d
	cmpi.w	#$32,l044d
	bne	l01d1
	lea	l03f6,a0
	bsr	l016b
	bsr	l016b
	bsr	l016b
	move.b	#1,l04cf
	move.w	#$1a00,l04b4
	bra	l01d1
l0209	move.w	#$64,l04ab
l020a	tst.w	l04ab
	bne.b	l020a
	movea.l	l04a9,a0
	adda.w	#$d20,a0
	move.w	#$7a,d0
l020b	adda.w	#$20,a0
	andi.w	#$ff00,-8(a0)
	andi.w	#$ff00,-6(a0)
	andi.w	#$ff00,-4(a0)
	andi.w	#$ff00,-2(a0)
	moveq	#$17,d1
l020c	clr.l	(a0)+
	dbf	d1,l020c
	andi.w	#$ff,(a0)
	andi.w	#$ff,2(a0)
	andi.w	#$ff,4(a0)
	andi.w	#$ff,6(a0)
	adda.w	#$20,a0
	dbf	d0,l020b
	move.w	#$1f3f,d0
	movea.l	l04a9,a0
	movea.l	l04a7,a1
l020d	move.l	(a0)+,(a1)+
	dbf	d0,l020d
	lea	l03f7,a0
	move.l	#l04a7,l046b
	bsr	l0266
	move.w	#8,l03e7
l020e	bsr	l0355
	move.w	#$14,l04ab
l020f	tst.w	l04ab
	bne.b	l020f
	subq.w	#1,l03e7
	bne.b	l020e
	clr.w	d2
	move.l	#$1000000,d0
	bsr	l00f7
	move.l	l0443,d0
	lea	l03ef,a0
	bsr	l0217
	bra	l0175
l0210	st	l04c1
	bra.b	l0212
l0211	sf	l04c1
l0212	ext.l	d1
	cmp.w	#$a,d1
	bcs.b	l0213
	divu	#$a,d1
	move.l	d1,-(a7)
	move.l	d0,-(a7)
	bsr	l031a
	move.l	(a7)+,d0
	move.l	(a7)+,d1
	swap	d1
l0213	addi.l	#$10000,d0
	bra	l031a
l0214	move.l	#$120004,d0
	move.w	l044d,d1
	bsr.b	l0211
l0215	move.l	l0443,d0
	lea	l03ef,a0
	bsr	l0217
	move.w	l0469,-(a7)
	move.w	#$c,l0469
	move.b	l045a,d1
	cmp.b	#$30,d1
	beq.b	l0216
	addi.b	#$31,d1
	move.l	#$df00b1,d0
	bsr	l0277
l0216	move.b	l045b,d1
	addi.b	#$31,d1
	move.l	#$e500b1,d0
	bsr	l0277
	move.b	l045c,d1
	addi.b	#$31,d1
	move.l	#$eb00b1,d0
	bsr	l0277
	lea	l03ee,a0
	move.w	#$9f,l0469
	bsr	l0266
	move.l	#l04a7,l046b
	move.w	(a7)+,l0469
	rts

l0217	moveq	#6,d1
	rol.l	#4,d0
l0218	rol.l	#4,d0
	move.b	d0,d2
	andi.b	#$f,d2
	bne.b	l021a
	move.b	#$20,(a0)+
	dbf	d1,l0218
	rts

l0219	rol.l	#4,d0
	move.b	d0,d2
	andi.b	#$f,d2
l021a	addi.b	#$30,d2
	move.b	d2,(a0)+
	dbf	d1,l0219
	rts

l021b	lea	l040a,a0
	moveq	#$7f,d0
l021c	move.b	(a0),d1
	subi.b	#$80,d1
	lsl.b	#1,d1
	move.b	d1,(a0)+
	dbf	d0,l021c
	rts

l021d	lea	l0463,a0
	lea	l0411,a1
	moveq	#$6d,d7
l021e	lea	l021f,a2
	tst.w	(a1)
	bmi.b	l021f
	movea.l	4(a1),a2
l021f	move.b	4(a2),d0
	bclr	#7,d0
	ext.w	d0
	lsl.w	#2,d0
	addq.w	#1,d0
	move.w	d0,(a0)+
	addq.w	#8,a1
	dbf	d7,l021e
	rts

l0220	rts

	lea	l045f,a0
	clr.b	(a0)
	moveq	#7,d1
l0221	move.b	d0,d2
	andi.b	#$f,d2
	addi.b	#$30,d2
	cmp.b	#$3a,d2
	bcs.b	l0222
	addq.b	#7,d2
l0222	move.b	d2,-(a0)
	lsr.l	#4,d0
	dbeq	d1,l0221
	bra	l0266
	lea	l045e,a0
	movea.l	a0,a1
	bsr.b	l0223
	clr.b	1(a1)
	move.b	-1(a1),(a1)
	move.b	#$2e,-1(a1)
	bra	l0266
	lea	l045e,a0
	movea.l	a0,a1
	bsr.b	l0223
	clr.b	(a1)
	bra	l0266
l0223	clr.l	d2
	move.w	d0,d2
	divu	#$a,d2
	move.w	d2,d0
	swap	d2
	tst.w	d0
	beq.b	l0224
	move.w	d2,-(a7)
	bsr.b	l0223
	move.w	(a7)+,d2
l0224	addi.b	#$30,d2
	move.b	d2,(a1)+
	rts

l0225	clr.w	l0468
	moveq	#$13,d0
	lea	l0467,a0
l0226	clr.w	(a0)+
	dbf	d0,l0226
	rts

	tst.b	l046f
	beq.b	l0227
	sf	l046f
	bra	l0231
l0227	rts

	tst.b	l046f
	bne.b	l0229
	sf	l046f
	tst.l	l0470
	bne.b	l0228
	move.w	l041b,d0
	move.w	l041c,d1
	bsr	l022a
l0228	st	l046f
l0229	rts

l022a	lea	l0230,a0
	move.w	d1,d2
	lea	l0470,a2
	mulu	#$a0,d1
	add.l	l04a7,d1
	movea.l	d1,a1
	move.w	d0,d1
	andi.w	#$f,d1
	andi.w	#$fff0,d0
	lsr.w	#1,d0
	adda.w	d0,a1
	clr.w	d3
	cmp.w	#$98,d0
	seq	d3
	move.l	a1,(a2)+
	move.w	d3,(a2)+
	moveq	#$d,d0
	subi.w	#$c8,d2
	neg.w	d2
	cmp.w	d0,d2
	bcc.b	l022b
	subq.w	#1,d2
	bmi	l022f
	move.w	d2,d0
l022b	move.w	d0,(a2)+
l022c	clr.l	d4
	move.w	(a0)+,d4
	ror.l	d1,d4
	clr.l	d5
	move.w	(a0)+,d5
	ror.l	d1,d5
	clr.l	d6
	move.w	(a0)+,d6
	ror.l	d1,d6
	clr.l	d7
	move.w	(a0)+,d7
	ror.l	d1,d7
	move.l	d4,d2
	or.l	d5,d2
	or.l	d6,d2
	or.l	d7,d2
	not.l	d2
	move.l	(a1),(a2)+
	and.w	d2,(a1)
	or.w	d4,(a1)+
	and.w	d2,(a1)
	or.w	d5,(a1)+
	move.l	(a1),(a2)+
	and.w	d2,(a1)
	or.w	d6,(a1)+
	and.w	d2,(a1)
	or.w	d7,(a1)+
	tst.b	d3
	beq.b	l022d
	adda.w	#$98,a1
	bra.b	l022e
l022d	swap	d2
	swap	d4
	swap	d5
	swap	d6
	swap	d7
	move.l	(a1),(a2)+
	and.w	d2,(a1)
	or.w	d4,(a1)+
	and.w	d2,(a1)
	or.w	d5,(a1)+
	move.l	(a1),(a2)+
	and.w	d2,(a1)
	or.w	d6,(a1)+
	and.w	d2,(a1)
	or.w	d7,(a1)+
	adda.w	#$90,a1
l022e	dbf	d0,l022c
l022f	rts

l0230	dc.b	8,$80,8,$80,8,$80,8,$80
	dc.b	8,$80,$c,$c0,8,$80,8,$80
	dc.b	8,$80,$c,$c0,8,$80,8,$80
	dc.b	$7f,$f0,$7f,$f0,$7f,$f0,$7f,$f0
	dc.b	8,$80,'?',$f8,8,$80,8,$80
	dc.b	8,$80,$c,$c0,8,$80,8,$80
	dc.b	8,$80,$c,$c0,8,$80,8,$80
	dc.b	$7f,$f0,$7f,$f0,$7f,$f0,$7f,$f0
	dc.b	8,$80,'?',$f8,8,$80,8,$80
	dc.b	8,$80,$c,$c0,8,$80,8,$80
	dc.b	8,$80,$c,$c0,8,$80,8,$80
	dc.b	0,0,4,'@',0,0,0,0
	dcb.w	9
	dc.b	0,'"',0,0,0,0,0,0
	dc.b	0,'"',0,0,0,0
l0231	lea	l0470,a0
	movea.l	(a0),a1
	cmpa.l	#0,a1
	beq.b	l0235
	clr.l	(a0)+
	tst.w	(a0)+
	bne.b	l0233
	move.w	(a0)+,d0
l0232	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	adda.w	#$90,a1
	dbf	d0,l0232
	rts

l0233	move.w	(a0)+,d0
l0234	move.l	(a0)+,(a1)+
	move.l	(a0)+,(a1)+
	adda.w	#$98,a1
	dbf	d0,l0234
l0235	rts

l0236	lea	40(a0),a0
l0237	movem.l	(a1)+,a2-a5/d1-d6
	movem.l	a2-a5/d1-d6,-(a0)
	lea	80(a0),a0
	movem.l	(a1)+,a2-a5/d1-d6
	movem.l	a2-a5/d1-d6,-(a0)
	lea	80(a0),a0
	movem.l	(a1)+,a2-a5/d1-d6
	movem.l	a2-a5/d1-d6,-(a0)
	lea	80(a0),a0
	movem.l	(a1)+,a2-a5/d1-d6
	movem.l	a2-a5/d1-d6,-(a0)
	lea	80(a0),a0
	dbf	d0,l0237
	lea	-40(a0),a0
	rts

l0238	lea	l0359,a0
l0239	equ	*-4
	lea	l04aa,a1
	bsr	l0356
	moveq	#$32,d7
	move.w	d7,l04ab
l023a	subq.w	#1,d7
l023b	cmp.w	l04ab,d7
	bcs.b	l023b
	move.w	l04ab,d7
	beq.b	l023d
	move.w	#$100,d5
l023c	dbf	d5,l023c
	move.w	d7,d5
	lsl.w	#2,d5
	move.w	d5,l049d
	neg.w	d5
	addi.w	#$c4,d5
	mulu	#$a0,d5
	add.l	l04a9,d5
	movea.l	d5,a6
	movea.l	l04a7,a0
	movea.l	a0,a1
	adda.w	#$280,a1
	move.w	#$c3,d0
	bsr	l0236
	movea.l	a6,a1
	moveq	#3,d0
	bsr	l0236
	bra.b	l023a
l023d	movea.l	l04a9,a0
	movea.l	l04a7,a1
	move.w	#$1f3f,d0
l023e	move.l	(a0)+,(a1)+
	dbf	d0,l023e
	move.w	#$d2,l049d
	move.w	#$c8,l049e
	lea	l04aa,a1
	lea	l035d,a0
	bsr	l0356
	move.w	#1,l04ab
l023f	tst.w	l04ab
	bne.b	l023f
	lea	l04aa,a0
	bra	l0240
l0240	lea	l035d,a0
	moveq	#$f,d0
	moveq	#0,d1
	moveq	#$15,d2
l0241	move.w	2(a0),d7
	addq.w	#4,a0
	andi.w	#$777,d7
	move.b	d7,d6
	andi.b	#7,d6
	rol.w	#8,d7
	add.b	d7,d6
	rol.w	#4,d7
	andi.b	#7,d7
	add.b	d7,d6
	cmp.b	d6,d1
	bpl.b	l0242
	move.b	d6,d1
	move.w	d0,d4
l0242	cmp.b	d6,d2
	bmi.b	l0243
	move.w	d0,d5
	move.b	d6,d2
l0243	dbf	d0,l0241
	eori.b	#$f,d4
	eori.b	#$f,d5
	lsl.w	#8,d5
	move.b	d4,d5
	moveq	#$f,d5
	tst.b	l046c
	beq.b	l0244
	ror.w	#8,d5
l0244	move.w	d5,l0469
	rts

l0245	move.w	l04c9,d0
	bmi.b	l0246
	lsl.w	#2,d0
	lea	l03e2,a0
	movea.l	120(a0,d0.w),a6
	adda.l	a0,a6
	move.w	(a6)+,d4
	move.w	(a6)+,d5
	move.w	l04c2,d7
	addq.w	#4,d7
	sub.w	d5,d7
	move.w	#$a0,d6
	move.w	d4,d3
	lsl.w	#3,d3
	sub.w	d3,d6
	clr.w	d0
	bra	l024a
l0246	rts

l0247	move.w	l0429,d0
	bmi.b	l0249
	move.w	#$ffff,l0429
	lsl.w	#2,d0
	lea	l03e2,a0
	movea.l	0(a0,d0.w),a6
	adda.l	a0,a6
	move.w	(a6)+,d4
	move.w	(a6)+,d5
	move.w	l0428,d7
	bpl.b	l0248
	add.w	d7,d5
	neg.w	d7
	mulu	d4,d7
	mulu	#$a,d7
	adda.w	d7,a6
	clr.w	d7
l0248	move.w	l0427,d6
	clr.w	d0
	bra	l024a
l0249	rts

l024a	beq.b	l024b
	move.w	#$ff60,d0
	add.w	d5,d7
	subq.w	#1,d7
	bra.b	l024c
l024b	move.w	#$a0,d0
l024c	move.w	d0,l0256
	subq.w	#1,d5
	bmi	l0257
	suba.l	a3,a3
	suba.l	a1,a1
	bclr	#31,d2
	tst.w	d6
	bpl.b	l024e
	neg.w	d6
	move.w	d6,d0
	andi.b	#$f0,d0
	cmp.w	d0,d6
	beq.b	l024d
	addi.w	#$10,d0
l024d	lsr.w	#1,d0
	movea.w	d0,a1
	lsr.w	#2,d0
	adda.w	d0,a1
	lsr.w	#1,d0
	sub.w	d0,d4
	clr.w	d6
l024e	move.w	d4,d0
	lsl.w	#4,d0
	add.w	d6,d0
	subi.w	#$140,d0
	beq.b	l024f
	bcs.b	l024f
	andi.b	#$f0,d0
	lsr.w	#1,d0
	adda.w	d0,a3
	lsr.w	#2,d0
	adda.w	d0,a3
	lsr.w	#1,d0
	sub.w	d0,d4
	bset	#31,d2
l024f	mulu	#$a0,d7
	add.l	l04a9,d7
	move.w	d6,d2
	andi.w	#$f,d2
	andi.b	#$f0,d6
	lsr.w	#1,d6
	add.w	d6,d7
	movea.l	d7,a0
	subq.w	#1,d4
	bmi	l0257
	beq	l0258
l0250	movea.w	d4,a4
l0251	adda.w	a1,a6
	movea.w	d5,a5
	movea.l	a0,a2
	move.w	a4,d1
	clr.l	d3
	clr.l	d4
	clr.l	d5
	clr.l	d6
	moveq	#$ff,d7
l0252	move.w	(a6)+,d7
	ror.l	d2,d7
	cmp.w	#$ffff,d7
	bne.b	l0253
	addq.w	#8,a2
	move.w	(a6)+,d3
	move.w	(a6)+,d4
	move.w	(a6)+,d5
	move.w	(a6)+,d6
	bra.b	l0254
l0253	move.w	d3,d0
	swap	d0
	move.w	(a6)+,d0
	move.w	d0,d3
	ror.l	d2,d0
	and.w	d7,(a2)
	or.w	d0,(a2)+
	move.w	d4,d0
	swap	d0
	move.w	(a6)+,d0
	move.w	d0,d4
	ror.l	d2,d0
	and.w	d7,(a2)
	or.w	d0,(a2)+
	move.w	d5,d0
	swap	d0
	move.w	(a6)+,d0
	move.w	d0,d5
	ror.l	d2,d0
	and.w	d7,(a2)
	or.w	d0,(a2)+
	move.w	d6,d0
	swap	d0
	move.w	(a6)+,d0
	move.w	d0,d6
	ror.l	d2,d0
	and.w	d7,(a2)
	or.w	d0,(a2)+
l0254	rol.l	d2,d7
	swap	d7
	dbf	d1,l0252
	tst.w	d2
	beq.b	l0255
	btst	#31,d2
	bne.b	l0255
	move.w	#$ffff,d7
	ror.l	d2,d7
	cmp.w	#$ffff,d7
	beq.b	l0255
	ror.l	d2,d3
	swap	d3
	and.w	d7,(a2)
	or.w	d3,(a2)+
	ror.l	d2,d4
	swap	d4
	and.w	d7,(a2)
	or.w	d4,(a2)+
	ror.l	d2,d5
	swap	d5
	and.w	d7,(a2)
	or.w	d5,(a2)+
	ror.l	d2,d6
	swap	d6
	and.w	d7,(a2)
	or.w	d6,(a2)+
l0255	adda.w	#$a0,a0
l0256	equ	*-2
	adda.w	a3,a6
	move.w	a5,d5
	dbf	d5,l0251
l0257	rts

l0258	move.w	a3,d3
	move.w	a1,d7
	or.w	d7,d3
	bne	l0250
	move.w	#$ffff,d4
l0259	move.w	d4,d7
	swap	d7
	move.w	(a6)+,d7
	cmp.w	d4,d7
	bne.b	l025a
	adda.w	#$a0,a0
	addq.w	#8,a6
	bra.b	l025b
l025a	ror.l	d2,d7
	move.w	d7,d6
	swap	d7
	clr.l	d3
	move.w	(a6)+,d3
	ror.l	d2,d3
	and.w	d6,(a0)
	and.w	d7,8(a0)
	or.w	d3,(a0)+
	swap	d3
	or.w	d3,6(a0)
	clr.l	d3
	move.w	(a6)+,d3
	ror.l	d2,d3
	and.w	d6,(a0)
	and.w	d7,8(a0)
	or.w	d3,(a0)+
	swap	d3
	or.w	d3,6(a0)
	clr.l	d3
	move.w	(a6)+,d3
	ror.l	d2,d3
	and.w	d6,(a0)
	and.w	d7,8(a0)
	or.w	d3,(a0)+
	swap	d3
	or.w	d3,6(a0)
	clr.l	d3
	move.w	(a6)+,d3
	ror.l	d2,d3
	and.w	d6,(a0)
	and.w	d7,8(a0)
	or.w	d3,(a0)+
	swap	d3
	or.w	d3,6(a0)
	adda.w	#$98,a0
l025b	dbf	d5,l0259
	rts

l025c	subq.w	#1,d5
	bmi	l0257
	suba.l	a3,a3
	suba.l	a1,a1
	bclr	#31,d2
	tst.w	d6
	bpl.b	l025e
	neg.w	d6
	move.w	d6,d0
	andi.b	#$f0,d0
	cmp.w	d0,d6
	beq.b	l025d
	addi.w	#$10,d0
l025d	lsr.w	#1,d0
	movea.w	d0,a1
	lsr.w	#2,d0
	adda.w	d0,a1
	lsr.w	#1,d0
	sub.w	d0,d4
	clr.w	d6
l025e	move.w	d4,d0
	lsl.w	#4,d0
	add.w	d6,d0
	subi.w	#$140,d0
	beq.b	l025f
	bcs.b	l025f
	andi.b	#$f0,d0
	lsr.w	#1,d0
	adda.w	d0,a3
	lsr.w	#2,d0
	adda.w	d0,a3
	lsr.w	#1,d0
	sub.w	d0,d4
	bset	#31,d2
l025f	mulu	#$a0,d7
	add.l	l04a9,d7
	move.w	d6,d2
	andi.w	#$f,d2
	andi.b	#$f0,d6
	lsr.w	#1,d6
	add.w	d6,d7
	movea.l	d7,a0
	subq.w	#1,d4
	bmi	l0265
	movea.w	d4,a4
l0260	adda.w	a1,a6
	movea.w	d5,a5
	movea.l	a0,a2
	move.w	a4,d1
	moveq	#$ff,d7
l0261	move.w	(a6)+,d7
	addq.w	#8,a6
	ror.l	d2,d7
	cmp.w	#$ffff,d7
	bne.b	l0262
	addq.w	#8,a2
	bra.b	l0263
l0262	move.w	d7,d0
	not.w	d0
	and.w	d7,(a2)
	or.w	d0,(a2)+
	and.w	d7,(a2)
	or.w	d0,(a2)+
	and.w	d7,(a2)
	or.w	d0,(a2)+
	and.w	d7,(a2)
	or.w	d0,(a2)+
l0263	rol.l	d2,d7
	swap	d7
	dbf	d1,l0261
	tst.w	d2
	beq.b	l0264
	btst	#31,d2
	bne.b	l0264
	move.w	#$ffff,d7
	ror.l	d2,d7
	cmp.w	#$ffff,d7
	beq.b	l0264
	move.w	d7,d0
	not.w	d0
	and.w	d7,(a2)
	or.w	d0,(a2)+
	and.w	d7,(a2)
	or.w	d0,(a2)+
	and.w	d7,(a2)
	or.w	d0,(a2)+
	and.w	d7,(a2)
	or.w	d0,(a2)+
l0264	adda.w	#$a0,a0
	adda.w	a3,a6
	move.w	a5,d5
	dbf	d5,l0260
l0265	rts

l0266	clr.w	d1
	move.b	(a0)+,d1
	beq	l0276
	cmp.b	#$1b,d1
	beq.b	l0268
	move.l	l046d,d0
	tst.b	l0472
	beq.b	l0267
	bsr	l0277
	addq.w	#8,l046d
	bra.b	l0266
l0267	bsr	l027c
	addq.w	#8,l046d
	bra.b	l0266
l0268	move.b	(a0)+,d1
	cmp.b	#$34,d1
	bne.b	l0269
	sf	l0472
	bra.b	l0266
l0269	cmp.b	#$33,d1
	bne.b	l026a
	st	l0472
	bra.b	l0266
l026a	cmp.b	#$a,d1
	bne.b	l026b
	addi.w	#8,l046e
	bra.b	l0266
l026b	cmp.b	#$d,d1
	bne.b	l026c
	clr.w	l046d
	bra.b	l0266
l026c	cmp.b	#$48,d1
	bne.b	l026d
	clr.l	l046d
	bra.b	l0266
l026d	cmp.b	#$59,d1
	bne.b	l026f
	clr.l	d1
	move.b	(a0)+,d1
	subi.b	#$20,d1
	tst.w	l0471
	bne.b	l026e
	lsl.w	#3,d1
l026e	swap	d1
	move.b	(a0)+,d1
	subi.b	#$20,d1
	lsl.w	#3,d1
	swap	d1
	move.l	d1,l046d
	bra	l0266
l026f	cmp.b	#$62,d1
	bne.b	l0270
	move.b	(a0)+,l046a
	bra	l0266
l0270	cmp.b	#$63,d1
	bne.b	l0271
	move.b	(a0)+,l0469
	bra	l0266
l0271	cmp.b	#$68,d1
	bne.b	l0272
	st	l0471
	bra	l0266
l0272	cmp.b	#$6c,d1
	bne.b	l0273
	clr.w	l0471
	bra	l0266
l0273	cmp.b	#$70,d1
	bne.b	l0274
	tst.b	l046c
	bne	l0266
	st	l046c
	bra.b	l0275
l0274	cmp.b	#$71,d1
	bne.b	l0276
	tst.b	l046c
	beq	l0266
	sf	l046c
l0275	move.w	l0469,d1
	rol.w	#8,d1
	move.w	d1,l0469
	bra	l0266
l0276	rts

l0277	andi.w	#$ff,d1
	lsl.w	#4,d1
	lea	l027b,a1
	adda.w	d1,a1
	move.w	#$a0,d7
	mulu	d0,d7
	movea.l	l046b,a2
	movea.l	(a2),a2
	adda.w	d7,a2
	swap	d0
	move.w	d0,d7
	andi.b	#$f0,d7
	lsr.w	#1,d7
	adda.w	d7,a2
	andi.w	#$f,d0
	moveq	#7,d7
	addq.w	#6,a2
l0278	clr.l	d4
	move.w	(a1)+,d4
	ror.l	d0,d4
	move.l	d4,d5
	not.l	d5
	moveq	#3,d2
l0279	and.w	d5,(a2)
	swap	d5
	and.w	d5,8(a2)
	swap	d5
	btst	d2,l046a
	beq.b	l027a
	or.w	d4,(a2)
	swap	d4
	or.w	d4,8(a2)
	swap	d4
l027a	subq.w	#2,a2
	dbf	d2,l0279
	lea	168(a2),a2
	dbf	d7,l0278
	rts

l027b	dc.b	0,0,$18,0,$18,0,'<',0
	dc.b	'~',0,'~',0,'~',0,'<',0
	dcb.w	72
	dc.b	'<',0,'B',0,$99,0,$a1,0
	dc.b	$a1,0,$99,0,'B',0,'<',0
	dc.b	$ff,0,$80,0,$80,0,$80,0
	dc.b	$80,0,$80,0,$80,0,$80,0
	dc.b	$ff,0,0,0,0,0,0,0
	dcb.w	4
	dc.b	$ff,0,1,0,1,0,1,0
	dc.b	1,0,1,0,1,0,1,0
	dc.b	1,0,1,0,1,0,1,0
	dc.b	1,0,1,0,1,0,1,0
	dc.b	1,0,1,0,1,0,1,0
	dc.b	1,0,1,0,1,0,$ff,0
	dcb.w	7
	dc.b	$ff,0,$80,0,$80,0,$80,0
	dc.b	$80,0,$80,0,$80,0,$80,0
	dc.b	$ff,0,$80,0,$80,0,$80,0
	dc.b	$80,0,$80,0,$80,0,$80,0
	dc.b	$80,0,0,0,0,0,0,0
	dcb.w	110
	dc.b	$c,0,$c,0,$c,0,$c,0
	dc.b	0,0,$c,0,0,0,0,0
	dc.b	$12,0,$12,0,0,0,0,0
	dcb.w	5
	dc.b	'$',0,'~',0,'$',0,'~',0
	dc.b	'$',0,0,0,0,0,8,0
	dc.b	$1c,0,'(',0,$1c,0,$a,0
	dc.b	$1c,0,0,0,0,0,'4',0
	dc.b	'4',0,8,0,$10,0,',',0
	dc.b	',',0,0,0,0,0,$1c,0
	dc.b	'6',0,$1c,0,'8',0,'o',0
	dc.b	'f',0,';',0,0,0,8,0
	dc.b	8,0,0,0,0,0,0,0
	dcb.w	3
	dc.b	8,0,$10,0,$10,0,$10,0
	dc.b	$10,0,8,0,0,0,0,0
	dc.b	$10,0,8,0,8,0,8,0
	dc.b	8,0,$10,0,0,0,0,0
	dc.b	0,0,'$',0,$18,0,'~',0
	dc.b	$18,0,'$',0,0,0,0,0
	dc.b	0,0,$10,0,$10,0,'|',0
	dc.b	$10,0,$10,0,0,0,0,0
	dcb.w	4
	dc.b	$18,0,$18,0,$10,0,0,0
	dcb.w	3
	dc.b	'<',0,0,0,0,0,0,0
	dcb.w	5
	dc.b	$18,0,$18,0,0,0,0,0
	dc.b	0,0,4,0,8,0,$10,0
	dc.b	' ',0,'@',0,0,0,'8',0
	dc.b	'D',0,'D',0,0,0,'D',0
	dc.b	'D',0,'8',0,0,0,$10,0
	dc.b	$10,0,$10,0,0,0,$10,0
	dc.b	$10,0,$10,0,0,0,'8',0
	dc.b	4,0,4,0,'8',0,'@',0
	dc.b	'@',0,'8',0,0,0,'8',0
	dc.b	4,0,4,0,'8',0,4,0
	dc.b	4,0,'8',0,0,0,'D',0
	dc.b	'D',0,'D',0,'8',0,4,0
	dc.b	4,0,4,0,0,0,'x',0
	dc.b	'@',0,'@',0,'8',0,4,0
	dc.b	4,0,'8',0,0,0,'@',0
	dc.b	'@',0,'@',0,'8',0,'D',0
	dc.b	'D',0,'8',0,0,0,'x',0
	dc.b	4,0,4,0,0,0,4,0
	dc.b	4,0,4,0,0,0,'8',0
	dc.b	'D',0,'D',0,'8',0,'D',0
	dc.b	'D',0,'8',0,0,0,'8',0
	dc.b	'D',0,'D',0,'8',0,4,0
	dc.b	4,0,'8',0,0,0,0,0
	dc.b	0,0,$18,0,$18,0,0,0
	dc.b	$18,0,$18,0,0,0,0,0
	dc.b	0,0,'0',0,'0',0,0,0
	dc.b	'0',0,'0',0,' ',0,0,0
	dc.b	0,0,8,0,$10,0,' ',0
	dc.b	$10,0,8,0,0,0,0,0
	dcb.w	2
	dc.b	'<',0,0,0,'<',0,0,0
	dcb.w	3
	dc.b	' ',0,$10,0,8,0,$10,0
	dc.b	' ',0,0,0,0,0,'~',0
	dc.b	'F',0,$1e,0,$18,0,0,0
	dc.b	$18,0,0,0,0,0,8,0
	dc.b	8,0,0,0,0,0,0,0
	dcb.w	2
	dc.b	'0',0,'H',0,$84,0,$84,0
	dc.b	$fc,0,$84,0,$84,0,0,0
	dc.b	$f8,0,$84,0,$84,0,$f8,0
	dc.b	$84,0,$84,0,$f8,0,0,0
	dc.b	'x',0,$84,0,$80,0,$80,0
	dc.b	$80,0,$84,0,'x',0,0,0
	dc.b	$f0,0,$88,0,$84,0,$84,0
	dc.b	$84,0,$88,0,$f0,0,0,0
	dc.b	'x',0,'@',0,'@',0,'|',0
	dc.b	'@',0,'@',0,'~',0,0,0
	dc.b	$fc,0,$80,0,$80,0,$f8,0
	dc.b	$80,0,$80,0,$80,0,0,0
	dc.b	'|',0,$80,0,$80,0,$9c,0
	dc.b	$84,0,$84,0,'|',0,0,0
	dc.b	$84,0,$84,0,$84,0,$fc,0
	dc.b	$84,0,$84,0,$84,0,0,0
	dc.b	$f8,0,' ',0,' ',0,' ',0
	dc.b	' ',0,' ',0,$f8,0,0,0
	dc.b	4,0,4,0,4,0,4,0
	dc.b	4,0,$84,0,'x',0,0,0
	dc.b	'B',0,'D',0,'H',0,'p',0
	dc.b	'H',0,'D',0,'B',0,0,0
	dc.b	$80,0,$80,0,$80,0,$80,0
	dc.b	$80,0,$80,0,$fc,0,0,0
	dc.b	$82,0,$c6,0,$aa,0,$92,0
	dc.b	$82,0,$82,0,$82,0,0,0
	dc.b	'B',0,'b',0,'R',0,'J',0
	dc.b	'F',0,'B',0,'B',0,0,0
	dc.b	'<',0,'B',0,'B',0,'B',0
	dc.b	'B',0,'B',0,'<',0,0,0
	dc.b	'|',0,'B',0,'B',0,'|',0
	dc.b	'@',0,'@',0,'@',0,0,0
	dc.b	'<',0,'B',0,'B',0,'B',0
	dc.b	'R',0,'L',0,'6',0,0,0
	dc.b	'|',0,'B',0,'B',0,'|',0
	dc.b	'D',0,'B',0,'B',0,0,0
	dc.b	'<',0,'B',0,'@',0,'<',0
	dc.b	2,0,'B',0,'<',0,0,0
	dc.b	$fe,0,$10,0,$10,0,$10,0
	dc.b	$10,0,$10,0,$10,0,0,0
	dc.b	$84,0,$84,0,$84,0,$84,0
	dc.b	$84,0,$84,0,'x',0,0,0
	dc.b	$84,0,$84,0,$84,0,$84,0
	dc.b	$84,0,'H',0,'0',0,0,0
	dc.b	$82,0,$82,0,$82,0,$92,0
	dc.b	$aa,0,$c6,0,$82,0,0,0
	dc.b	$84,0,'H',0,'0',0,'0',0
	dc.b	'0',0,'H',0,$84,0,0,0
	dc.b	$82,0,$82,0,'D',0,'8',0
	dc.b	$10,0,$10,0,$10,0,0,0
	dc.b	$fc,0,4,0,8,0,$10,0
	dc.b	' ',0,'@',0,$fc,0,0,0
	dcb.w	8
	dc.b	'@',0,' ',0,$10,0,8,0
	dc.b	4,0,2,0,1,0,0,0
	dcb.w	32
	dc.b	'8',0,'D',0,'D',0,0,0
	dc.b	'D',0,'D',0,'D',0,'8',0
	dc.b	$10,0,$10,0,$10,0,0,0
	dc.b	$10,0,$10,0,$10,0,$10,0
	dc.b	'p',0,8,0,8,0,'p',0
	dc.b	$80,0,$80,0,$80,0,'p',0
	dc.b	'8',0,4,0,4,0,'8',0
	dc.b	4,0,4,0,4,0,'8',0
	dc.b	'D',0,'D',0,'D',0,'8',0
	dc.b	4,0,4,0,4,0,4,0
	dc.b	'8',0,'@',0,'@',0,'8',0
	dc.b	4,0,4,0,4,0,'8',0
	dc.b	'8',0,'@',0,'@',0,'8',0
	dc.b	'D',0,'D',0,'D',0,'8',0
	dc.b	'x',0,4,0,4,0,0,0
	dc.b	4,0,4,0,4,0,4,0
	dc.b	'8',0,'D',0,'D',0,'8',0
	dc.b	'D',0,'D',0,'D',0,'8',0
	dc.b	'8',0,'D',0,'D',0,'8',0
	dc.b	4,0,4,0,4,0,4,0
	dcb.w	168
l027c	lsl.w	#4,d1
	lea	l027b,a1
	adda.w	d1,a1
	move.w	#$a0,d7
	mulu	d0,d7
	movea.l	l046b,a2
	movea.l	(a2),a2
	adda.w	d7,a2
	swap	d0
	move.w	d0,d7
	andi.b	#$f0,d7
	lsr.w	#1,d7
	adda.w	d7,a2
	andi.w	#8,d0
	move.w	#$ff00,d6
	rol.w	d0,d6
	move.w	d6,d3
	not.w	d3
	moveq	#7,d7
	addq.w	#6,a2
l027d	move.w	(a1)+,d4
	rol.w	d0,d4
	and.w	d6,d4
	moveq	#3,d2
l027e	and.w	d3,(a2)
	btst	d2,l0469
	beq.b	l027f
	or.w	d6,(a2)
	eor.w	d4,(a2)
l027f	btst	d2,l046a
	beq.b	l0280
	or.w	d4,(a2)
l0280	subq.w	#2,a2
	dbf	d2,l027e
	adda.w	#$a8,a2
	dbf	d7,l027d
	rts

l0281	lea	l040d,a0
	bsr	l0366
	lea	l04aa,a0
	bsr	l0240
	move.l	l046b,-(a7)
	move.l	#l04a9,l046b
	lea	l03db,a0
	bsr	l0266
	move.w	#$f00,l0469
	move.l	(a7)+,l046b
	move.w	#$c8,l049e
	lea	l04aa,a1
	lea	l035b,a0
	bsr	l0356
	bsr	l0238
	lea	l04aa,a1
	lea	l0359,a0
	bsr	l0356
	lea	l04aa,a1
	lea	l035b,a0
	bsr	l0356
	rts

l0282	move.w	#$100,l0473
	clr.l	l04b1
	move.w	l04a0,d2
l0283	addq.l	#8,l04b1
l0284	move.w	l0473,d1
	mulu	l0474,d1
	lsr.w	#8,d1
	move.w	d1,l0473
	move.w	d1,d0
	mulu	l04a0,d0
	lsr.w	#8,d0
	beq.b	l0285
	cmp.w	d2,d0
	beq.b	l0284
	cmp.w	#1,d0
	bcs.b	l0285
	move.w	d0,d2
	bra.b	l0283
l0285	addq.l	#4,l04b1
	move.l	l04a3,d0
	move.l	d0,l0480
	move.l	d0,l0483
	add.l	l04b1,d0
	move.l	d0,l0481
	move.l	d0,l0482
	move.w	#$100,l0473
	bsr	l02ae
	bsr	l02b1
	bsr	l02a3
	bsr	l02bd
	bsr	l02b6
	tst.w	l0474
	bne.b	l0287
	bra.b	l0288
l0286	bsr	l02ae
	tst.w	l0479
	beq.b	l0288
	bsr	l0289
	bsr	l02a7
	bcs.b	l0288
	bsr	l02bd
	bsr	l02b9
l0287	move.w	l0473,d1
	mulu	l0474,d1
	lsr.w	#8,d1
	move.w	d1,l0473
	move.w	d1,d0
	mulu	l04a0,d0
	lsr.w	#8,d0
	beq.b	l0288
	cmp.w	l0477,d0
	beq.b	l0287
	cmp.w	#1,d0
	bcc.b	l0286
l0288	movea.l	l0480,a0
	move.l	#$ffffffff,(a0)+
	move.l	a0,l0480
	move.l	l0481,d0
	sub.l	l0483,d0
	move.l	d0,l0484
	rts

l0289	move.l	a7,l0485
	lea	l04a2,a0
	movea.l	a0,a7
	move.w	l0477,d3
	move.w	l0479,d2
	cmp.w	d2,d3
	bcc.b	l028a
	move.w	d2,d3
l028a	clr.l	d7
	clr.l	d5
l028b	add.l	l047e,d5
	ror.l	#8,d7
	move.w	d7,(a0)+
	rol.l	#8,d7
l028c	move.l	d5,d0
	move.l	d7,d1
	eor.l	d1,d0
	andi.l	#$ffff00,d0
	beq.b	l028d
	move.l	d7,d1
	clr.b	d1
	addi.l	#$100,d1
	move.l	d1,d0
	sub.l	d7,d0
	move.l	d1,d7
	lsr.w	#4,d0
	move.w	d0,(a0)+
	bra.b	l028c
l028d	move.l	d5,d0
	sub.l	d7,d0
	move.l	d5,d7
	lsr.w	#4,d0
	move.w	d0,(a0)+
	move.w	#$ffff,(a0)+
	dbf	d3,l028b
	clr.l	d1
	move.w	l047a,d7
	move.w	l0477,d3
	subq.w	#1,d3
	movea.l	a7,a5
	lea	l04a1,a6
l028e	move.w	l0479,d2
	subq.w	#1,d2
	movea.l	a7,a4
	movea.l	l04a9,a1
	move.w	(a5)+,d0
	mulu	d7,d0
	adda.w	d0,a1
	move.l	a5,d5
l028f	movea.l	d5,a5
	lea	l0480,a0
	clr.l	-(a0)
	clr.l	-(a0)
	clr.l	-(a0)
	clr.l	-(a0)
	clr.l	-(a0)
	clr.l	-(a0)
	clr.l	-(a0)
	clr.l	-(a0)
	movea.l	a1,a3
	adda.w	(a4)+,a3
	movea.l	a3,a2
	move.l	a4,d4
	move.w	(a5)+,d6
l0290	movea.l	d4,a4
	move.w	(a4)+,d0
l0291	move.b	(a3)+,d1
	mulu	d6,d0
	add.w	d0,0(a0,d1.w)
	move.w	(a4)+,d0
	bpl.b	l0291
	adda.w	d7,a2
	movea.l	a2,a3
	move.w	(a5)+,d6
	bpl.b	l0290
	move.w	(a0)+,d0
	clr.w	d1
	cmp.w	(a0)+,d0
	bcc.b	l0292
	moveq	#1,d1
	move.w	-2(a0),d0
l0292	cmp.w	(a0)+,d0
	bcc.b	l0293
	moveq	#2,d1
	move.w	-2(a0),d0
l0293	cmp.w	(a0)+,d0
	bcc.b	l0294
	moveq	#3,d1
	move.w	-2(a0),d0
l0294	cmp.w	(a0)+,d0
	bcc.b	l0295
	moveq	#4,d1
	move.w	-2(a0),d0
l0295	cmp.w	(a0)+,d0
	bcc.b	l0296
	moveq	#5,d1
	move.w	-2(a0),d0
l0296	cmp.w	(a0)+,d0
	bcc.b	l0297
	moveq	#6,d1
	move.w	-2(a0),d0
l0297	cmp.w	(a0)+,d0
	bcc.b	l0298
	moveq	#7,d1
	move.w	-2(a0),d0
l0298	cmp.w	(a0)+,d0
	bcc.b	l0299
	moveq	#8,d1
	move.w	-2(a0),d0
l0299	cmp.w	(a0)+,d0
	bcc.b	l029a
	moveq	#9,d1
	move.w	-2(a0),d0
l029a	cmp.w	(a0)+,d0
	bcc.b	l029b
	moveq	#$a,d1
	move.w	-2(a0),d0
l029b	cmp.w	(a0)+,d0
	bcc.b	l029c
	moveq	#$b,d1
	move.w	-2(a0),d0
l029c	cmp.w	(a0)+,d0
	bcc.b	l029d
	moveq	#$c,d1
	move.w	-2(a0),d0
l029d	cmp.w	(a0)+,d0
	bcc.b	l029e
	moveq	#$d,d1
	move.w	-2(a0),d0
l029e	cmp.w	(a0)+,d0
	bcc.b	l029f
	moveq	#$e,d1
	move.w	-2(a0),d0
l029f	cmp.w	(a0)+,d0
	bcc.b	l02a0
	moveq	#$f,d1
l02a0	move.b	d1,(a6)+
	dbf	d2,l028f
	move.w	l047b,d0
	subq.w	#1,d0
	bmi.b	l02a2
l02a1	clr.b	(a6)+
	dbf	d0,l02a1
l02a2	dbf	d3,l028e
	movea.l	l0485,a7
	rts

l02a3	movea.l	l04a9,a6
	move.w	l049f,d2
	lsl.w	#4,d2
	moveq	#$f,d1
l02a4	movea.l	a6,a5
	move.w	l04a0,d0
	subq.w	#1,d0
l02a5	adda.w	d2,a5
	tst.b	-16(a5,d1.w)
	bne.b	l02a6
	dbf	d0,l02a5
	dbf	d1,l02a4
l02a6	move.w	l049f,d0
	lsl.w	#4,d0
	subi.w	#$10,d0
	add.w	d1,d0
	lsr.w	#1,d0
	addq.w	#1,d0
	move.w	d0,l047c
	rts

l02a7	lea	l04a1,a6
	move.w	l0479,d2
	moveq	#$f,d1
l02a8	movea.l	a6,a5
	move.w	l0477,d0
	subq.w	#1,d0
l02a9	adda.w	d2,a5
	tst.b	-16(a5,d1.w)
	bne.b	l02ac
	dbf	d0,l02a9
	dbf	d1,l02a8
	lea	l04a1,a6
	movea.l	a6,a5
	move.w	l0477,d7
	subi.w	#$11,d2
	bmi.b	l02ad
	subi.w	#1,l0475
	subi.w	#$10,l0479
l02aa	move.w	d2,d0
l02ab	move.b	(a5)+,(a6)+
	dbf	d0,l02ab
	adda.w	#$10,a5
	dbf	d7,l02aa
	bra.b	l02a7
l02ac	move.w	l0479,d0
	subi.w	#$10,d0
	add.w	d1,d0
	lsr.w	#1,d0
	addq.w	#1,d0
	move.w	d0,l047c
l02ad	rts

l02ae	move.w	l04a0,d7
	mulu	l0473,d7
	lsr.l	#8,d7
	move.w	d7,l0477
	move.w	l049f,d6
	mulu	l0473,d6
	move.w	d6,d5
	andi.b	#$f0,d6
	beq.b	l02af
	addi.w	#$100,d6
l02af	lsr.l	#8,d6
	move.w	d6,l0475
	lsr.w	#4,d5
	move.w	d5,l0479
	andi.w	#$f,d5
	beq.b	l02b0
	subi.w	#$10,d5
	neg.w	d5
l02b0	move.w	d5,l047b
	move.w	l049f,d6
	mulu	#$10,d6
	move.w	d6,l047a
	move.l	#$100,d0
	divu	l0473,d0
	move.w	d0,d1
	lsl.w	#8,d1
	clr.w	d0
	swap	d0
	lsl.w	#8,d0
	divu	l0473,d0
	move.b	d0,d1
	move.w	d1,l047f
	rts

l02b1	lea	l04a1,a0
	movea.l	l04a9,a6
	movea.l	a6,a1
	move.w	#$1f3f,d0
l02b2	clr.l	(a1)+
	dbf	d0,l02b2
	moveq	#1,d7
	move.w	l04a0,l04dc
l02b3	clr.l	d6
	move.w	l049f,d6
	subq.w	#1,d6
l02b4	move.w	(a0)+,d0
	move.w	(a0)+,d1
	move.w	(a0)+,d2
	move.w	(a0)+,d3
	moveq	#$f,d4
l02b5	clr.b	d5
	roxl.w	d7,d0
	roxl.w	d7,d5
	roxl.w	d7,d1
	roxl.w	d7,d5
	roxl.w	d7,d2
	roxl.w	d7,d5
	roxl.w	d7,d3
	roxl.w	d7,d5
	add.b	d5,d5
	move.b	d5,(a6)+
	dbf	d4,l02b5
	dbf	d6,l02b4
	subq.w	#1,l04dc
	bne.b	l02b3
	rts

l02b6	movea.l	l0481,a3
	lea	l04a1,a6
	move.w	l049f,d0
	mulu	l04a0,d0
	subq.w	#1,d0
	bmi.b	l02b8
l02b7	move.w	(a6)+,d1
	move.w	(a6)+,d2
	move.w	(a6)+,d3
	move.w	(a6)+,d4
	move.w	d1,d5
	or.w	d2,d5
	or.w	d3,d5
	or.w	d4,d5
	not.w	d5
	move.w	d5,(a3)+
	move.w	d1,(a3)+
	move.w	d2,(a3)+
	move.w	d3,(a3)+
	move.w	d4,(a3)+
	dbf	d0,l02b7
l02b8	move.l	a3,l0481
	rts

l02b9	movea.l	l0481,a3
	lea	l04a1,a6
	move.w	l0477,d7
	subq.w	#1,d7
l02ba	move.w	l0475,d6
	subq.w	#1,d6
	movea.w	d7,a2
l02bb	moveq	#$f,d4
	moveq	#1,d7
l02bc	move.b	(a6)+,d5
	roxr.w	d7,d5
	roxl.w	d7,d3
	roxr.w	d7,d5
	roxl.w	d7,d2
	roxr.w	d7,d5
	roxl.w	d7,d1
	roxr.w	d7,d5
	roxl.w	d7,d0
	dbf	d4,l02bc
	move.w	d0,d7
	or.w	d1,d7
	or.w	d2,d7
	or.w	d3,d7
	not.w	d7
	move.w	d7,(a3)+
	move.w	d0,(a3)+
	move.w	d1,(a3)+
	move.w	d2,(a3)+
	move.w	d3,(a3)+
	dbf	d6,l02bb
	move.w	a2,d7
	dbf	d7,l02ba
	move.l	a3,l0481
	rts

l02bd	movea.l	l0480,a0
	movea.l	l0481,a1
	suba.l	l0482,a1
	adda.l	l04b1,a1
	move.l	a1,(a0)+
	move.b	l0476,(a0)
	subi.b	#1,(a0)+
	move.b	l0478,(a0)+
	move.b	l047d,(a0)+
	move.w	l0473,d0
	subq.w	#1,d0
	move.b	d0,(a0)+
	move.l	a0,l0480
	rts

l02be	bsr	l0240
	clr.w	d0
	movea.l	l04a3,a1
l02bf	movea.l	#l0414,a0
	adda.w	d0,a0
	move.w	#$1413,d1
l02c0	move.w	(a0),(a1)+
	addq.w	#8,a0
	dbf	d1,l02c0
	addq.w	#2,d0
	cmp.w	#8,d0
	bne.b	l02bf
	movea.l	l04a3,a0
	movea.l	#l0414,a1
	move.w	#$2827,d0
l02c1	move.l	(a0)+,(a1)+
	dbf	d0,l02c1
	lea	l0409,a6
l02c2	clr.w	d0
	move.b	(a6)+,d0
	bmi	l02c6
	clr.w	l0474
	cmp.b	#$3c,d0
	bcs.b	l02c3
	cmp.b	#$54,d0
	bcc.b	l02c3
	move.w	#$b4,l0474
l02c3	mulu	#8,d0
	lea	l0411,a1
	adda.w	d0,a1
	move.l	a6,-(a7)
	move.l	a1,-(a7)
	lea	l0406,a2
	adda.w	d0,a2
	lea	l04ad,a0
	move.l	(a2)+,(a0)+
	move.l	(a2)+,(a0)+
	move.b	#$20,(a0)
	lea	l04ad,a0
l02c4	cmpi.b	#$20,(a0)+
	bne.b	l02c4
	move.b	#$2e,-1(a0)
	move.b	#$46,(a0)+
	move.b	#$54,(a0)+
	move.b	#$42,(a0)+
	clr.b	(a0)
	bsr	l02cc
	tst.w	d0
	beq.b	l02c5
	bsr	l0282
	move.w	#$ffff,d0
l02c5	movea.l	(a7)+,a1
	not.w	d0
	move.w	d0,(a1)
	move.l	l04a3,4(a1)
	move.l	l0484,d0
	add.l	l04a3,d0
	move.l	d0,l04a3
	move.l	l04a4,d1
	sub.l	d0,d1
	bmi	l001c
	movea.l	(a7)+,a6
	bra	l02c2
l02c6	move.w	#9,d0
	bra	l02ca
	move.b	d0,l02c9
	move.w	#9,d0
	bsr	l02c7
	move.b	l02c9,d1
	cmp.b	d0,d1
	bne.b	l02ca
	moveq	#9,d0
	bsr	l02c7
	move.b	d0,l02c9
	move.w	#9,d0
	bsr	l02c7
	move.b	l02c9,d1
	cmp.b	d0,d1
	bne.b	l02ca
	clr.l	l02dd
	bra.b	l02ca
l02c7	move.w	#1,-(a7)
	move.w	#0,-(a7)
	move.w	#$4f,-(a7)
	move.w	d0,-(a7)
	move.w	#0,-(a7)
	clr.l	-(a7)
	move.l	l04a9,-(a7)
	move.w	#8,-(a7)
	trap	#$e
	adda.l	#$14,a7
	movea.l	l04a9,a0
	move.w	#$10,d1
	move.b	#0,d0
l02c8	move.b	(a0)+,d2
	eor.b	d2,d0
	dbf	d1,l02c8
	rts

l02c9	dc.b	0,0
l02ca	rts

l02cb	move.l	a0,-(a7)
	move.l	d0,-(a7)
	move.w	l04a6,-(a7)
	move.w	#$3f,-(a7)	; READ
	trap	#1	
	adda.w	#$c,a7
	rts

l02cc	lea	l04ad,a0
	clr.w	d0
	bsr	l02ce
	tst.w	d0
	bmi	l001c
	lea	l049f,a0
	move.l	#4,d0
	bsr.b	l02cb
	tst.l	d0
	bmi	l001c
	lea	l04a1,a0
	move.w	l049f,d0
	mulu	l04a0,d0
	mulu	#8,d0
	bsr.b	l02cb
	tst.w	d0
	bmi	l001c
	bsr	l02cd
	moveq	#1,d0
	rts

l02cd	move.w	l04a6,-(a7)
	move.w	#$3e,-(a7)	; CLOSE
	trap	#1
	addq.w	#4,a7
	rts

l02ce	move.l	a0,-(a7)
	movea.l	(a7),a0
	clr.w	-(a7)
	move.l	a0,-(a7)
	move.w	#$3d,-(a7)	; OPEN
	trap	#1
	addq.l	#8,a7
	tst.w	d0
	bmi.b	l02cf
	move.w	d0,l04a6
	movea.l	(a7)+,a0
	rts

l02cf	bra	l001c
	cmp.w	#$fff2,d0
	bne.b	l02d0
	move.w	#0,-(a7)
	move.w	#7,-(a7)	get BPB
	trap	#$d
	addq.w	#4,a7
	movea.l	(a7)+,a0
	bra.b	l02ce
l02d0	nop
	movea.l	(a7)+,a0
	bra.b	l02ce
l02d1	lea	l03fa,a6
	move.w	l0487,d0
	mulu	#$c,d0
	adda.w	d0,a6
	rts

l02d2	bsr.b	l02d1
	move.w	l0465,d0
	move.w	l0486,d1
	move.w	d0,l0486
	sub.w	d0,d1
    ; TODO: 11b8c code goes here
    ; TODO: NOT NEEDED BLOCK 1 START
	beq	l02dc
	bmi	l02d7
	movea.l	2(a6),a1
	adda.l	#l0414,a1
	cmp.w	#$11,d1
	bcs.b	l02d3
	moveq	#$10,d1
l02d3	moveq	#3,d5
l02d4	movea.l	a1,a2
	move.w	(a6),d0
l02d5	movea.l	a1,a0
	moveq	#9,d4
	clr.l	d2
l02d6	move.w	(a1),d2
	move.w	d2,d3
	swap	d3
	ror.l	d1,d2
	move.w	d2,(a1)+
	move.w	(a1),d3
	move.w	d3,d2
	swap	d2
	ror.l	d1,d3
	move.w	d3,(a1)+
	dbf	d4,l02d6
	clr.w	d2
	ror.l	d1,d2
	or.w	d2,(a0)
	dbf	d0,l02d5
	movea.l	a2,a1
	lea	10280(a1),a1
	dbf	d5,l02d4
	bra	l02dc
l02d7	neg.w	d1
	movea.l	2(a6),a1
	adda.l	#l0414,a1
	adda.w	#$28,a1
	cmp.w	#$11,d1
	bcs.b	l02d8
	move.w	#$10,d1
l02d8	moveq	#3,d5
l02d9	movea.l	a1,a2
	move.w	(a6),d0
l02da	movea.l	a1,a0
	moveq	#9,d4
	clr.l	d2
l02db	move.w	-(a1),d2
	move.w	d2,d3
	swap	d3
	rol.l	d1,d2
	move.w	d2,(a1)
	move.w	-(a1),d3
	move.w	d3,d2
	swap	d2
	rol.l	d1,d3
	move.w	d3,(a1)
	dbf	d4,l02db
	adda.w	#$50,a1
	clr.w	d2
	rol.l	d1,d2
	or.w	d2,-(a0)
	dbf	d0,l02da
	movea.l	a2,a1
	lea	10280(a1),a1
	dbf	d5,l02d9
    ; TODO: NOT NEEDED BLOCK 1 END
l02dc	rts

l02dd	bsr	l02d1
	move.w	l04c2,d2
	move.w	(a6),d0
	sub.w	d0,d2
	move.w	d2,l0488
	mulu	#$a0,d2
	add.l	l04a9,d2
	movea.l	d2,a0
	movea.l	2(a6),a1
	adda.l	#l0414,a1
	lea	10280(a1),a2
	lea	20560(a1),a3
	lea	30840(a1),a4
l02de	moveq	#4,d1
l02df	move.w	(a1)+,(a0)+
	move.w	(a2)+,(a0)+
	move.w	(a3)+,(a0)+
	move.w	(a4)+,(a0)+
	move.w	(a1)+,(a0)+
	move.w	(a2)+,(a0)+
	move.w	(a3)+,(a0)+
	move.w	(a4)+,(a0)+
	move.w	(a1)+,(a0)+
	move.w	(a2)+,(a0)+
	move.w	(a3)+,(a0)+
	move.w	(a4)+,(a0)+
	move.w	(a1)+,(a0)+
	move.w	(a2)+,(a0)+
	move.w	(a3)+,(a0)+
	move.w	(a4)+,(a0)+
	dbf	d1,l02df
	dbf	d0,l02de
	rts

l02e0	lea	l02e2,a4
	suba.w	d0,a4
	jmp	(a4)
l02e1	move.l	d3,(a1)+
	move.l	d4,(a1)+
	move.l	d3,(a1)+
	move.l	d4,(a1)+
	move.l	d3,(a1)+
	move.l	d4,(a1)+
	move.l	d3,(a1)+
	move.l	d4,(a1)+
	move.l	d3,(a1)+
	move.l	d4,(a1)+
	move.l	d3,(a1)+
	move.l	d4,(a1)+
	move.l	d3,(a1)+
	move.l	d4,(a1)+
	move.l	d3,(a1)+
	move.l	d4,(a1)+
	move.l	d3,(a1)+
	move.l	d4,(a1)+
	move.l	d3,(a1)+
	move.l	d4,(a1)+
	move.l	d3,(a1)+
	move.l	d4,(a1)+
	move.l	d3,(a1)+
	move.l	d4,(a1)+
	move.l	d3,(a1)+
	move.l	d4,(a1)+
	move.l	d3,(a1)+
	move.l	d4,(a1)+
	move.l	d3,(a1)+
	move.l	d4,(a1)+
	move.l	d3,(a1)+
	move.l	d4,(a1)+
	move.l	d3,(a1)+
	move.l	d4,(a1)+
	move.l	d3,(a1)+
	move.l	d4,(a1)+
	move.l	d3,(a1)+
	move.l	d4,(a1)+
	move.l	d3,(a1)+
	move.l	d4,(a1)+
l02e2	rts

l02e3	lea	l0439,a6
	movea.l	l04a9,a5
	adda.w	#$6860,a5
l02e4	move.w	(a6),d0
	cmp.w	#$ffff,d0
	beq	l02f2
	move.w	d0,d1
	add.b	l0445,d0
	clr.l	d2
	clr.l	d5
	btst	#7,d0
	beq.b	l02e5
	moveq	#8,d2
	not.l	d5
l02e5	andi.b	#$60,d0
	bne.b	l02e6
	bset	#31,d2
l02e6	cmp.w	l04bb,d1
	bcs.b	l02e7
	cmp.w	l04bc,d1
	bcs	l02f6
l02e7	lea	l0497,a2
	move.w	2(a6),d1
	move.w	4(a6),d0
	move.w	d0,d3
	lsr.w	#1,d3
	subq.w	#1,d3
	andi.w	#$f0,d3
	suba.w	d3,a2
	sub.w	6(a6),d1
	muls	d1,d0
	asr.l	#8,d0
	movea.l	a5,a1
	addi.w	#$a0,d0
	bmi	l02e9
	cmp.w	#$130,d0
	bcc	l02f5
	move.w	d0,d1
	andi.b	#$f0,d0
	lsr.w	#2,d0
	beq.b	l02e8
	lea	l0491,a4
	adda.w	d2,a4
	move.l	(a4)+,d3
	move.l	(a4),d4
	bsr	l02e0
l02e8	andi.w	#$f,d1
	move.l	(a2),d3
	move.l	2(a2),d4
	move.l	4(a2),d5
	move.l	6(a2),d6
	move.w	l048d,d3
	move.w	l048e,d4
	move.w	l048f,d5
	move.w	l0490,d6
	lsr.l	d1,d3
	lsr.l	d1,d4
	lsr.l	d1,d5
	lsr.l	d1,d6
	move.w	d3,8(a1)
	move.w	d4,10(a1)
	move.w	d5,12(a1)
	move.w	d6,14(a1)
	swap	d3
	swap	d4
	swap	d5
	swap	d6
	lea	l03fd,a4
	add.w	d1,d1
	move.w	0(a4,d1.w),d1
	lea	l0491,a4
	adda.w	d2,a4
	move.w	(a4)+,d0
	and.w	d1,d0
	or.w	d0,d3
	move.w	(a4)+,d0
	and.w	d1,d0
	or.w	d0,d4
	move.w	(a4)+,d0
	and.w	d1,d0
	or.w	d0,d5
	move.w	(a4),d0
	and.w	d1,d0
	or.w	d0,d6
	move.w	d3,(a1)+
	move.w	d4,(a1)+
	move.w	d5,(a1)+
	move.w	d6,(a1)+
	addq.w	#8,a1
l02e9	addq.w	#8,a2
	movea.l	a1,a0
	movea.l	a5,a1
	adda.w	#$a0,a1
	move.w	4(a6),d0
	move.w	2(a6),d1
	add.w	6(a6),d1
	muls	d1,d0
	asr.l	#8,d0
	addi.w	#$88,d0
	bmi	l02f5
	cmp.w	#$130,d0
	bcc	l02ed
	movea.l	a5,a1
	move.l	d0,d1
	andi.b	#$f0,d0
	lsr.w	#1,d0
	adda.w	d0,a1
	andi.w	#$f,d1
	eori.w	#$f,d1
	move.l	l048d,d3
	move.l	l048e,d4
	move.l	l048f,d5
	move.l	l0490,d6
	move.w	(a2)+,d3
	move.w	(a2)+,d4
	move.w	(a2)+,d5
	move.w	(a2),d6
	lsl.l	d1,d3
	lsl.l	d1,d4
	lsl.l	d1,d5
	lsl.l	d1,d6
	move.w	d0,-(a7)
	lea	l03fe,a4
	add.w	d1,d1
	move.w	0(a4,d1.w),d1
	lea	l0491,a4
	adda.w	d2,a4
	move.w	(a4)+,d0
	and.w	d1,d0
	or.w	d0,d3
	move.w	(a4)+,d0
	and.w	d1,d0
	or.w	d0,d4
	move.w	(a4)+,d0
	and.w	d1,d0
	or.w	d0,d5
	move.w	(a4),d0
	and.w	d1,d0
	or.w	d0,d6
	move.w	d3,8(a1)
	move.w	d4,10(a1)
	move.w	d5,12(a1)
	move.w	d6,14(a1)
	cmpa.l	a0,a1
	bcc.b	l02ea
	lea	16(a1),a1
	bra.b	l02eb
l02ea	swap	d3
	swap	d4
	swap	d5
	swap	d6
	move.w	d3,(a1)+
	move.w	d4,(a1)+
	move.w	d5,(a1)+
	move.w	d6,(a1)+
	addq.w	#8,a1
l02eb	move.w	(a7)+,d0
	subi.w	#$90,d0
	neg.w	d0
	asr.w	#1,d0
	ble.b	l02ec
	move.l	a1,-(a7)
	lea	l0491,a4
	adda.w	d2,a4
	move.l	(a4)+,d3
	move.l	(a4),d4
	bsr	l02e0
	movea.l	(a7)+,a1
l02ec	suba.w	#$10,a1
l02ed	move.l	a1,d0
	sub.l	a0,d0
	asr.w	#1,d0
	ble.b	l02ee
	movea.l	a0,a1
	move.l	l048d,d3
	move.l	l048f,d4
	bsr	l02e0
l02ee	btst	#31,d2
	beq	l02f1
	tst.w	8(a6)
	beq	l02f1
	move.w	#$d,l0466
	move.l	d2,-(a7)
	move.w	4(a6),d3
	lsr.w	#2,d3
	subq.w	#1,d3
	andi.w	#$78,d3
	lea	l0495,a2
	suba.w	d3,a2
	move.w	2(a6),d7
	clr.l	d2
	move.w	6(a6),d2
	subi.w	#8,d2
	sub.w	d2,d7
	add.w	d2,d2
	addq.w	#1,d7
	move.w	8(a6),d0
	divu	d0,d2
	subq.w	#2,d0
	bmi	l02f1
l02ef	add.w	d2,d7
	move.w	4(a6),d3
	movea.l	a5,a1
	muls	d7,d3
	asr.l	#8,d3
	addi.w	#$9c,d3
	bmi	l02f0
	cmp.w	#$130,d3
	bcc.b	l02f0
	move.w	d3,d1
	andi.b	#$f0,d3
	lsr.w	#1,d3
	adda.w	d3,a1
	andi.w	#$f,d1
	clr.l	d3
	clr.l	d4
	clr.l	d5
	clr.l	d6
	move.w	(a2),d3
	move.w	2(a2),d4
	move.w	4(a2),d5
	move.w	6(a2),d6
	ror.l	d1,d3
	ror.l	d1,d4
	ror.l	d1,d5
	ror.l	d1,d6
	move.l	d3,d1
	or.l	d4,d1
	or.l	d5,d1
	or.l	d6,d1
	not.l	d1
	and.w	d1,(a1)
	or.w	d3,(a1)+
	and.w	d1,(a1)
	or.w	d4,(a1)+
	and.w	d1,(a1)
	or.w	d5,(a1)+
	and.w	d1,(a1)
	or.w	d6,(a1)+
	swap	d1
	cmp.w	#$ffff,d1
	beq.b	l02f0
	swap	d3
	swap	d4
	swap	d5
	swap	d6
	and.w	d1,(a1)
	or.w	d3,(a1)+
	and.w	d1,(a1)
	or.w	d4,(a1)+
	and.w	d1,(a1)
	or.w	d5,(a1)+
	and.w	d1,(a1)
	or.w	d6,(a1)+
l02f0	dbf	d0,l02ef
	move.w	#9,l0466
	move.l	(a7)+,d2
l02f1	suba.w	#$a0,a5
	adda.w	#$c,a6
	bra	l02e4
l02f2	move.w	l04c2,d0
	mulu	#$a0,d0
	add.l	l04a9,d0
	movea.l	d0,a1
	adda.w	#$a0,a5
	sub.l	a5,d0
	bcc.b	l02f4
	neg.l	d0
	divu	#$a0,d0
	subq.w	#1,d0
l02f3	move.w	d0,-(a7)
	lea	l0491,a4
	move.l	(a4)+,d3
	move.l	(a4),d4
	bsr	l02e1
	move.w	(a7)+,d0
	dbf	d0,l02f3
l02f4	rts

l02f5	movea.l	a5,a1
	lea	l0491,a4
	adda.w	d2,a4
	move.l	(a4)+,d3
	move.l	(a4),d4
	bsr	l02e1
	bra.b	l02f1
l02f6	movea.l	a5,a1
	movea.l	a5,a0
	adda.w	#$a0,a0
	move.w	2(a6),d0
	sub.w	6(a6),d0
	move.w	4(a6),d1
	muls	d1,d0
	asr.l	#8,d0
	addi.w	#$a0,d0
	move.w	2(a6),d3
	add.w	6(a6),d3
	muls	d3,d1
	asr.l	#8,d1
	addi.w	#$a0,d1
	move.w	d1,d3
	sub.w	d0,d3
	subq.w	#6,d3
	lea	l0423,a2
	move.w	d3,d4
	lsl.w	#3,d4
	adda.w	d4,a2
	movea.l	(a2)+,a3
	tst.w	d0
	bpl	l02f9
	tst.w	d1
	bmi.b	l02f5
	cmp.w	#$140,d1
	bcs.b	l02f8
	move.w	d0,d1
	andi.w	#$f,d1
	neg.w	d0
	addi.w	#$f,d0
	andi.w	#$fff0,d0
	lsr.w	#3,d0
	adda.w	d0,a3
	moveq	#$13,d0
l02f7	move.l	-2(a3),d3
	addq.w	#2,a3
	lsr.l	d1,d3
	eor.w	d5,d3
	move.w	d3,(a1)+
	move.w	d3,(a1)+
	move.w	d3,(a1)+
	move.w	d3,(a1)+
	dbf	d0,l02f7
	bra	l02f1
l02f8	move.w	d0,d1
	andi.w	#$f,d1
	neg.w	d0
	addi.w	#$f,d0
	andi.w	#$fff0,d0
	lsr.w	#3,d0
	adda.w	d0,a3
	move.w	(a2)+,d4
	lsr.w	#1,d0
	sub.w	d0,d4
	ble	l02f5
	move.w	d4,d0
	bra	l02fe
l02f9	cmp.w	#$140,d0
	bcc	l02f5
	cmp.w	#$140,d1
	bcs	l02fc
	move.w	d0,d1
	andi.b	#$f0,d0
	lsr.w	#2,d0
	beq.b	l02fa
	lea	l0491,a4
	adda.w	d2,a4
	move.l	(a4)+,d3
	move.l	(a4),d4
	bsr	l02e0
l02fa	andi.w	#$f,d1
	moveq	#$ff,d4
	lsr.w	d1,d4
	not.w	d4
	move.w	(a3)+,d3
	eor.w	d5,d3
	lsr.w	d1,d3
	lea	l0491,a4
	adda.w	d2,a4
	move.w	(a4)+,(a1)
	and.w	d4,(a1)
	or.w	d3,(a1)+
	move.w	(a4)+,(a1)
	and.w	d4,(a1)
	or.w	d3,(a1)+
	move.w	(a4)+,(a1)
	and.w	d4,(a1)
	or.w	d3,(a1)+
	move.w	(a4)+,(a1)
	and.w	d4,(a1)
	or.w	d3,(a1)+
	move.l	a0,d0
	sub.l	a1,d0
	lsr.w	#3,d0
	subq.w	#1,d0
	bmi	l02f1
l02fb	move.l	-2(a3),d3
	addq.w	#2,a3
	lsr.l	d1,d3
	eor.w	d5,d3
	move.w	d3,(a1)+
	move.w	d3,(a1)+
	move.w	d3,(a1)+
	move.w	d3,(a1)+
	dbf	d0,l02fb
	bra	l02f1
l02fc	move.w	d0,d1
	andi.b	#$f0,d0
	lsr.w	#2,d0
	beq.b	l02fd
	lea	l0491,a4
	adda.w	d2,a4
	move.l	(a4)+,d3
	move.l	(a4),d4
	bsr	l02e0
l02fd	andi.w	#$f,d1
	move.w	(a2)+,d0
	subq.w	#1,d0
	beq	l0300
	moveq	#$ff,d4
	lsr.w	d1,d4
	not.w	d4
	move.w	(a3)+,d3
	eor.w	d5,d3
	lsr.w	d1,d3
	lea	l0491,a4
	adda.w	d2,a4
	move.w	(a4)+,(a1)
	and.w	d4,(a1)
	or.w	d3,(a1)+
	move.w	(a4)+,(a1)
	and.w	d4,(a1)
	or.w	d3,(a1)+
	move.w	(a4)+,(a1)
	and.w	d4,(a1)
	or.w	d3,(a1)+
	move.w	(a4)+,(a1)
	and.w	d4,(a1)
	or.w	d3,(a1)+
l02fe	move.l	-2(a3),d3
	subq.w	#1,d0
	beq.b	l02ff
	addq.w	#2,a3
	lsr.l	d1,d3
	eor.w	d5,d3
	move.w	d3,(a1)+
	move.w	d3,(a1)+
	move.w	d3,(a1)+
	move.w	d3,(a1)+
	bra.b	l02fe
l02ff	move.w	(a2),d4
	eor.l	d5,d3
	eor.w	d5,d3
	bra.b	l0301
l0300	clr.l	d3
	move.w	(a3),d3
l0301	move.w	(a2),d4
	not.w	d4
	and.w	d4,d5
	eor.w	d5,d3
	not.w	d4
	lsr.w	d1,d4
	ror.l	d1,d3
	lea	l0491,a4
	adda.w	d2,a4
	move.w	(a4)+,(a1)
	and.w	d4,(a1)
	or.w	d3,(a1)+
	move.w	(a4)+,(a1)
	and.w	d4,(a1)
	or.w	d3,(a1)+
	move.w	(a4)+,(a1)
	and.w	d4,(a1)
	or.w	d3,(a1)+
	move.w	(a4)+,(a1)
	and.w	d4,(a1)
	or.w	d3,(a1)+
	moveq	#$ff,d4
	move.w	(a2),d4
	ror.l	d1,d4
	swap	d4
	tst.w	d4
	bmi	l0302
	subq.w	#8,a4
	clr.l	d3
	move.w	(a3),d3
	eor.w	d5,d3
	ror.l	d1,d3
	swap	d3
	move.w	(a4)+,(a1)
	and.w	d4,(a1)
	or.w	d3,(a1)+
	move.w	(a4)+,(a1)
	and.w	d4,(a1)
	or.w	d3,(a1)+
	move.w	(a4)+,(a1)
	and.w	d4,(a1)
	or.w	d3,(a1)+
	move.w	(a4)+,(a1)
	and.w	d4,(a1)
	or.w	d3,(a1)+
l0302	move.l	a0,d0
	sub.l	a1,d0
	bmi	l02f1
	lsr.w	#1,d0
	lea	l0491,a4
	adda.w	d2,a4
	move.l	(a4)+,d3
	move.l	(a4),d4
	bsr	l02e0
	bra	l02f1
l0303	movea.l	l044f,a0
l0304	suba.w	#$10,a0
	cmpa.l	#l043b,a0
	bmi	l0318
	move.l	a0,-(a7)
	sf	l04d2
	move.b	(a0),d0
	cmp.b	#$50,d0
	beq.b	l0305
	cmp.b	#$4f,d0
	beq.b	l0305
	cmp.b	#$4e,d0
	beq.b	l0305
	cmp.b	#$3c,d0
	bcs.b	l0305
	cmp.b	#$54,d0
	bcc.b	l0305
	cmp.b	#$3d,d0
	beq.b	l0305
	cmp.b	#$3e,d0
	beq.b	l0305
	cmp.b	#$4b,d0
	beq.b	l0305
	move.w	4(a0),d0
	cmp.w	l04dd,d0
	bmi	l0317
	cmpi.w	#2,l04c7
	bne.b	l0305
	move.w	l04c8,d0
	cmp.w	#$a,d0
	bcs.b	l0305
	btst	#2,d0
	beq	l0317
	st	l04d2
l0305	clr.w	l0489
	bclr	#7,8(a0)
	beq.b	l0306
	move.b	#1,l048a
l0306	bclr	#6,8(a0)
	beq.b	l0307
	move.b	#1,l0489
l0307	move.w	10(a0),d7
	move.w	8(a0),d6
	move.b	1(a0),d4
	ext.w	d4
	muls	d6,d4
	asr.l	#8,d4
	asr.w	#2,d4
	sub.w	d4,d7
	bpl.b	l0308
	clr.w	d7
l0308	clr.w	d4
	move.b	(a0),d4
	cmp.b	#$6e,d4
	bcc	l0317
	lsl.w	#3,d4
	lea	l0411,a3
	adda.w	d4,a3
	tst.b	1(a3)
	bmi	l0317
	movea.l	4(a3),a3
	movea.l	a3,a5
	lsr.w	#1,d6
	subq.w	#1,d6
	clr.w	d1
l0309	tst.b	(a3)
	bpl.b	l030a
	tst.w	d1
	beq	l0317
	subq.l	#8,a3
	clr.l	d2
	move.w	d6,d2
	divu	d1,d2
	cmp.b	#$a,d2
	bcc	l030c
	bra	l0317
l030a	move.b	7(a3),d2
	sub.b	d6,d2
	beq.b	l030c
	bcc.b	l030b
	tst.w	d1
	beq.b	l030c
	cmp.b	d2,d1
	bcc.b	l030c
	subq.l	#8,a3
	bra.b	l030c
l030b	clr.l	d1
	move.b	d2,d1
	addq.l	#8,a3
	bra.b	l0309
l030c	move.w	8(a0),d6
	move.w	2(a0),d5
	cmp.w	#$280,d4
	beq.b	l030d
	move.w	6(a0),d4
	lsl.w	#3,d4
	add.w	d4,d5
l030d	muls	d5,d6
	asr.l	#8,d6
	asr.l	#3,d6
	addi.w	#$a0,d6
	clr.w	d5
	move.b	6(a3),d5
	sub.w	d5,d6
	clr.l	d5
	move.b	4(a3),d4
	andi.w	#$7f,d4
	addq.w	#1,d4
	move.b	5(a3),d5
	sub.w	d5,d7
	addq.w	#1,d7
	bpl.b	l030e
	clr.l	d7
l030e	move.w	d7,d3
	add.w	d5,d3
	subi.w	#$c7,d3
	bls.b	l030f
	sub.w	d3,d5
	bls	l0317
l030f	move.w	d7,l048b
	movea.l	(a3),a6
	adda.l	a5,a6
	move.b	l048a,d0
	move.b	4(a3),d2
	lsr.b	#7,d2
	eor.b	d0,d2
	beq	l0315
	eori.b	#$80,4(a3)
	clr.l	d3
	move.b	5(a3),d3
	subq.w	#1,d3
	movea.l	a6,a0
	move.w	d4,d0
	mulu	#$a,d0
	movea.w	d0,a1
	movea.w	a1,a2
	suba.w	#$a,a1
	lea	l04ac,a5
	clr.w	d0
	clr.w	d1
	lsr.w	#1,d4
	bcs	l0312
l0310	move.w	d4,d2
	subq.w	#1,d2
	movea.l	a0,a3
	movea.l	a3,a4
	adda.w	a1,a4
l0311	move.b	(a3),d0
	move.b	0(a5,d0.w),d0
	move.b	1(a4),d1
	move.b	0(a5,d1.w),d1
	move.b	d1,(a3)+
	move.b	d0,1(a4)
	move.b	(a3),d0
	move.b	0(a5,d0.w),d0
	move.b	(a4),d1
	move.b	0(a5,d1.w),d1
	move.b	d1,(a3)+
	move.b	d0,(a4)
	move.b	(a3),d0
	move.b	0(a5,d0.w),d0
	move.b	3(a4),d1
	move.b	0(a5,d1.w),d1
	move.b	d1,(a3)+
	move.b	d0,3(a4)
	move.b	(a3),d0
	move.b	0(a5,d0.w),d0
	move.b	2(a4),d1
	move.b	0(a5,d1.w),d1
	move.b	d1,(a3)+
	move.b	d0,2(a4)
	move.b	(a3),d0
	move.b	0(a5,d0.w),d0
	move.b	5(a4),d1
	move.b	0(a5,d1.w),d1
	move.b	d1,(a3)+
	move.b	d0,5(a4)
	move.b	(a3),d0
	move.b	0(a5,d0.w),d0
	move.b	4(a4),d1
	move.b	0(a5,d1.w),d1
	move.b	d1,(a3)+
	move.b	d0,4(a4)
	move.b	(a3),d0
	move.b	0(a5,d0.w),d0
	move.b	7(a4),d1
	move.b	0(a5,d1.w),d1
	move.b	d1,(a3)+
	move.b	d0,7(a4)
	move.b	(a3),d0
	move.b	0(a5,d0.w),d0
	move.b	6(a4),d1
	move.b	0(a5,d1.w),d1
	move.b	d1,(a3)+
	move.b	d0,6(a4)
	move.b	(a3),d0
	move.b	0(a5,d0.w),d0
	move.b	9(a4),d1
	move.b	0(a5,d1.w),d1
	move.b	d1,(a3)+
	move.b	d0,9(a4)
	move.b	(a3),d0
	move.b	0(a5,d0.w),d0
	move.b	8(a4),d1
	move.b	0(a5,d1.w),d1
	move.b	d1,(a3)+
	move.b	d0,8(a4)
	suba.w	#$a,a4
	dbf	d2,l0311
	adda.w	a2,a0
	dbf	d3,l0310
	add.w	d4,d4
	bra	l0315
l0312	move.w	d4,d2
	movea.l	a0,a3
	movea.l	a3,a4
	adda.w	a1,a4
	subq.w	#1,d2
	bcs	l0314
l0313	move.b	(a3),d0
	move.b	0(a5,d0.w),d0
	move.b	1(a4),d1
	move.b	0(a5,d1.w),d1
	move.b	d1,(a3)+
	move.b	d0,1(a4)
	move.b	(a3),d0
	move.b	0(a5,d0.w),d0
	move.b	(a4),d1
	move.b	0(a5,d1.w),d1
	move.b	d1,(a3)+
	move.b	d0,(a4)
	move.b	(a3),d0
	move.b	0(a5,d0.w),d0
	move.b	3(a4),d1
	move.b	0(a5,d1.w),d1
	move.b	d1,(a3)+
	move.b	d0,3(a4)
	move.b	(a3),d0
	move.b	0(a5,d0.w),d0
	move.b	2(a4),d1
	move.b	0(a5,d1.w),d1
	move.b	d1,(a3)+
	move.b	d0,2(a4)
	move.b	(a3),d0
	move.b	0(a5,d0.w),d0
	move.b	5(a4),d1
	move.b	0(a5,d1.w),d1
	move.b	d1,(a3)+
	move.b	d0,5(a4)
	move.b	(a3),d0
	move.b	0(a5,d0.w),d0
	move.b	4(a4),d1
	move.b	0(a5,d1.w),d1
	move.b	d1,(a3)+
	move.b	d0,4(a4)
	move.b	(a3),d0
	move.b	0(a5,d0.w),d0
	move.b	7(a4),d1
	move.b	0(a5,d1.w),d1
	move.b	d1,(a3)+
	move.b	d0,7(a4)
	move.b	(a3),d0
	move.b	0(a5,d0.w),d0
	move.b	6(a4),d1
	move.b	0(a5,d1.w),d1
	move.b	d1,(a3)+
	move.b	d0,6(a4)
	move.b	(a3),d0
	move.b	0(a5,d0.w),d0
	move.b	9(a4),d1
	move.b	0(a5,d1.w),d1
	move.b	d1,(a3)+
	move.b	d0,9(a4)
	move.b	(a3),d0
	move.b	0(a5,d0.w),d0
	move.b	8(a4),d1
	move.b	0(a5,d1.w),d1
	move.b	d1,(a3)+
	move.b	d0,8(a4)
	suba.w	#$a,a4
	dbf	d2,l0313
l0314	move.b	(a3),d0
	move.b	1(a3),d1
	move.b	0(a5,d0.w),d0
	move.b	0(a5,d1.w),d1
	move.b	d1,(a3)+
	move.b	d0,(a3)+
	move.b	(a3),d0
	move.b	1(a3),d1
	move.b	0(a5,d0.w),d0
	move.b	0(a5,d1.w),d1
	move.b	d1,(a3)+
	move.b	d0,(a3)+
	move.b	(a3),d0
	move.b	1(a3),d1
	move.b	0(a5,d0.w),d0
	move.b	0(a5,d1.w),d1
	move.b	d1,(a3)+
	move.b	d0,(a3)+
	move.b	(a3),d0
	move.b	1(a3),d1
	move.b	0(a5,d0.w),d0
	move.b	0(a5,d1.w),d1
	move.b	d1,(a3)+
	move.b	d0,(a3)+
	move.b	(a3),d0
	move.b	1(a3),d1
	move.b	0(a5,d0.w),d0
	move.b	0(a5,d1.w),d1
	move.b	d1,(a3)+
	move.b	d0,(a3)+
	adda.w	a2,a0
	dbf	d3,l0312
	add.w	d4,d4
	addq.w	#1,d4
l0315	tst.b	l0489
	tst.b	l04d2
	beq.b	l0316
	bsr	l025c
	bra.b	l0317
l0316	bsr	l024a
l0317	movea.l	(a7)+,a0
	bra	l0304
l0318	rts

l0319	dcb.w	4
	dc.b	$f,$f0,$f,$f0,$f,$f0,$10,8
	dc.b	'?',$fc,'?',$fc,'?',$fc,0,0
	dc.b	'0',$1c,'0',$1c,'0',$1c,'H',2
	dc.b	'`6`6`6',$10,8
	dc.b	'`f`f`f',0,$10
	dc.b	'`',$c6,'`',$c6,'`',$c6,0,' '
	dc.b	'a',$86,'a',$86,'a',$86,0,'@'
	dc.b	'c',6,'c',6,'c',6,0,$80
	dc.b	'f',6,'f',6,'f',6,1,0
	dc.b	'l',6,'l',6,'l',6,2,0
	dc.b	'x',6,'x',6,'x',6,4,8
	dc.b	'0',$c,'0',$c,'0',$c,'H',$12
	dc.b	'?',$fc,'?',$fc,'?',$fc,0,0
	dc.b	$f,$f0,$f,$f0,$f,$f0,$10,8
	dcb.w	8
	dc.b	1,$80,1,$80,1,$80,2,0
	dc.b	3,$80,3,$80,3,$80,4,0
	dc.b	7,$80,7,$80,7,$80,8,0
	dc.b	1,$80,1,$80,1,$80,0,0
	dc.b	1,$80,1,$80,1,$80,0,0
	dc.b	1,$80,1,$80,1,$80,0,0
	dc.b	1,$80,1,$80,1,$80,0,0
	dc.b	1,$80,1,$80,1,$80,0,0
	dc.b	1,$80,1,$80,1,$80,0,0
	dc.b	1,$80,1,$80,1,$80,0,0
	dc.b	1,$80,1,$80,1,$80,0,0
	dc.b	1,$80,1,$80,1,$80,0,0
	dc.b	1,$80,1,$80,1,$80,2,'@'
	dc.b	3,$c0,3,$c0,3,$c0,4,' '
	dcb.w	8
	dc.b	3,$f0,3,$f0,3,$f0,4,8
	dc.b	$f,$f8,$f,$f8,$f,$f8,0,4
	dc.b	$c,$18,$c,$18,$c,$18,$12,4
	dc.b	$18,'0',$18,'0',$18,'0',4,8
	dc.b	0,'`',0,'`',0,'`',0,$10
	dc.b	0,$c0,0,$c0,0,$c0,0,' '
	dc.b	1,$80,1,$80,1,$80,0,'@'
	dc.b	3,0,3,0,3,0,0,$80
	dc.b	6,0,6,0,6,0,1,0
	dc.b	$c,0,$c,0,$c,0,2,2
	dc.b	$18,2,$18,2,$18,2,4,4
	dc.b	'0',6,'0',6,'0',6,8,0
	dc.b	'?',$fe,'?',$fe,'?',$fe,0,0
	dc.b	'?',$fe,'?',$fe,'?',$fe,0,0
	dcb.w	8
	dc.b	3,$f8,3,$f8,3,$f8,4,4
	dc.b	$f,$fc,$f,$fc,$f,$fc,0,2
	dc.b	$c,6,$c,6,$c,6,$10,8
	dc.b	0,6,0,6,0,6,0,0
	dc.b	0,6,0,6,0,6,0,0
	dc.b	0,4,0,4,0,4,0,2
	dc.b	1,$f8,1,$f8,1,$f8,0,4
	dc.b	1,$f8,1,$f8,1,$f8,0,4
	dc.b	0,4,0,4,0,4,0,$a
	dc.b	0,6,0,6,0,6,0,0
	dc.b	0,6,0,6,0,6,0,0
	dc.b	$c,6,$c,6,$c,6,$10,8
	dc.b	$f,$fc,$f,$fc,$f,$fc,0,2
	dc.b	3,$f8,3,$f8,3,$f8,4,4
	dcb.w	8
	dc.b	0,$18,0,$18,0,$18,0,' '
	dc.b	0,'8',0,'8',0,'8',0,'@'
	dc.b	0,'x',0,'x',0,'x',0,$80
	dc.b	0,$d8,0,$d8,0,$d8,1,' '
	dc.b	1,$98,1,$98,1,$98,2,'@'
	dc.b	3,$18,3,$18,3,$18,4,$80
	dc.b	6,$18,6,$18,6,$18,9,0
	dc.b	$c,$18,$c,$18,$c,$18,$12,0
	dc.b	$18,$18,$18,$18,$18,$18,'$',0
	dc.b	'0',$18,'0',$18,'0',$18,'H',0
	dc.b	$7f,$fe,$7f,$fe,$7f,$fe,0,0
	dc.b	$7f,$fe,$7f,$fe,$7f,$fe,0,0
	dc.b	0,$18,0,$18,0,$18,0,'$'
	dc.b	0,'<',0,'<',0,'<',0,'B'
	dcb.w	8
	dc.b	'?',$fe,'?',$fe,'?',$fe,'@',0
	dc.b	$7f,$fe,$7f,$fe,$7f,$fe,0,0
	dc.b	'`',2,'`',2,'`',2,$10,4
	dc.b	'`',0,'`',0,'`',0,0,2
	dc.b	'`',0,'`',0,'`',0,0,0
	dc.b	'`',0,'`',0,'`',0,$10,0
	dc.b	$7f,$f8,$7f,$f8,$7f,$f8,0,0
	dc.b	'?',$fc,'?',$fc,'?',$fc,'@',0
	dc.b	0,$e,0,$e,0,$e,0,0
	dc.b	0,6,0,6,0,6,0,0
	dc.b	0,6,0,6,0,6,'@',8
	dc.b	'@',$c,'@',$c,'@',$c,' ',$12
	dc.b	$7f,$fc,$7f,$fc,$7f,$fc,0,0
	dc.b	$7f,$f0,$7f,$f0,$7f,$f0,0,8
	dcb.w	8
	dc.b	'?',$fe,'?',$fe,'?',$fe,'@',0
	dc.b	$7f,$fe,$7f,$fe,$7f,$fe,0,0
	dc.b	'`',2,'`',2,'`',2,$10,4
	dc.b	'`',0,'`',0,'`',0,0,2
	dc.b	'`',0,'`',0,'`',0,0,0
	dc.b	'`',0,'`',0,'`',0,$10,0
	dc.b	$7f,$f0,$7f,$f0,$7f,$f0,0,8
	dc.b	$7f,$fc,$7f,$fc,$7f,$fc,0,0
	dc.b	'`',$c,'`',$c,'`',$c,$10,2
	dc.b	'`',6,'`',6,'`',6,0,0
	dc.b	'`',6,'`',6,'`',6,0,8
	dc.b	'`',$c,'`',$c,'`',$c,$10,$12
	dc.b	$7f,$fc,$7f,$fc,$7f,$fc,0,0
	dc.b	$7f,$f0,$7f,$f0,$7f,$f0,0,8
	dcb.w	8
	dc.b	$7f,$fe,$7f,$fe,$7f,$fe,0,0
	dc.b	$7f,$fe,$7f,$fe,$7f,$fe,0,0
	dc.b	'@',$c,'@',$c,'@',$c,' ',$12
	dc.b	0,$18,0,$18,0,$18,'@$'
	dc.b	0,'0',0,'0',0,'0',0,'H'
	dc.b	0,'`',0,'`',0,'`',0,$90
	dc.b	0,$c0,0,$c0,0,$c0,1,' '
	dc.b	1,$80,1,$80,1,$80,2,'@'
	dc.b	3,0,3,0,3,0,4,$80
	dc.b	6,0,6,0,6,0,9,0
	dc.b	$c,0,$c,0,$c,0,$12,0
	dc.b	$18,0,$18,0,$18,0,'$',0
	dc.b	'0',0,'0',0,'0',0,'H',0
	dc.b	'`',0,'`',0,'`',0,$10,0
	dcb.w	8
	dc.b	$1f,$f8,$1f,$f8,$1f,$f8,' ',4
	dc.b	'?',$fc,'?',$fc,'?',$fc,'@',2
	dc.b	'`',6,'`',6,'`',6,$10,8
	dc.b	'`',6,'`',6,'`',6,0,0
	dc.b	'`',6,'`',6,'`',6,0,0
	dc.b	' ',4,' ',4,' ',4,'@',2
	dc.b	$1f,$f8,$1f,$f8,$1f,$f8,' ',4
	dc.b	$1f,$f8,$1f,$f8,$1f,$f8,' ',4
	dc.b	' ',4,' ',4,' ',4,'P',$a
	dc.b	'`',6,'`',6,'`',6,0,0
	dc.b	'`',6,'`',6,'`',6,0,0
	dc.b	'`',6,'`',6,'`',6,$10,8
	dc.b	'?',$fc,'?',$fc,'?',$fc,'@',2
	dc.b	$1f,$f8,$1f,$f8,$1f,$f8,' ',4
	dcb.w	8
	dc.b	$f,$fe,$f,$fe,$f,$fe,$10,0
	dc.b	'?',$fe,'?',$fe,'?',$fe,0,0
	dc.b	'0',6,'0',6,'0',6,'H',8
	dc.b	'`',6,'`',6,'`',6,$10,0
	dc.b	'`',6,'`',6,'`',6,0,0
	dc.b	'0',6,'0',6,'0',6,'@',8
	dc.b	'?',$fe,'?',$fe,'?',$fe,0,0
	dc.b	$f,$fe,$f,$fe,$f,$fe,$10,0
	dc.b	0,6,0,6,0,6,0,8
	dc.b	0,6,0,6,0,6,0,0
	dc.b	0,6,0,6,0,6,0,0
	dc.b	0,6,0,6,0,6,0,0
	dc.b	0,6,0,6,0,6,0,0
	dc.b	0,6,0,6,0,6,0,0
	dcb.w	4
l031a	lea	l0319,a3
	move.w	#$a0,d7
	mulu	d0,d7
	swap	d0
	lsl.w	#3,d0
	add.w	d0,d7
	movea.l	l046b,a2
	movea.l	(a2),a2
	adda.w	d7,a2
	andi.w	#$f,d1
	mulu	#$10,d1
	moveq	#$f,d7
	lsl.w	#3,d1
	adda.w	d1,a3
	tst.b	l04c1
	bne.b	l031c
l031b	move.l	(a3)+,d0
	move.l	(a3)+,d1
	move.l	d0,d2
	or.l	d1,d2
	move.w	d2,d4
	swap	d2
	or.w	d4,d2
	not.w	d2
	move.w	d2,d4
	swap	d4
	move.w	d2,d4
	and.l	d4,(a2)
	or.l	d0,(a2)+
	and.l	d4,(a2)
	or.l	d1,(a2)
	lea	156(a2),a2
	dbf	d7,l031b
	rts

l031c	move.l	(a3)+,(a2)+
	move.l	(a3)+,(a2)
	lea	156(a2),a2
	dbf	d7,l031c
	rts

l031d	lea	l04ac,a0
	move.l	#$ff,d0
	clr.b	d1
l031e	move.b	d1,d2
	moveq	#7,d3
l031f	lsl.b	#1,d4
	lsr.b	#1,d2
	bcc.b	l0320
	addq.b	#1,d4
l0320	dbf	d3,l031f
	move.b	d4,(a0)+
	addq.w	#1,d1
	dbf	d0,l031e
	rts

l0321	lea	l0494,a0
	lea	l0496,a1
	lea	l04ac,a4
	movea.l	l048c,a3
	moveq	#$f,d1
	move.w	#$ffff,d4
	move.w	#$ff00,d0
l0322	clr.l	d3
	clr.l	d2
	move.w	d4,d6
	move.w	2(a3),d7
	bsr	l0327
	move.w	d4,d6
	not.w	d6
	move.w	(a3),d7
	bsr	l0327
	move.l	d2,(a1)+
	move.l	d3,(a1)+
	clr.w	d7
	move.b	d2,d7
	move.b	0(a4,d7.w),d2
	rol.w	#8,d2
	move.b	d2,d7
	move.b	0(a4,d7.w),d2
	swap	d2
	move.b	d2,d7
	move.b	0(a4,d7.w),d2
	rol.w	#8,d2
	move.b	d2,d7
	move.b	0(a4,d7.w),d2
	swap	d2
	move.b	d3,d7
	move.b	0(a4,d7.w),d3
	rol.w	#8,d3
	move.b	d3,d7
	move.b	0(a4,d7.w),d3
	swap	d3
	move.b	d3,d7
	move.b	0(a4,d7.w),d3
	rol.w	#8,d3
	move.b	d3,d7
	move.b	0(a4,d7.w),d3
	swap	d3
	move.l	d2,(a1)+
	move.l	d3,(a1)+
	clr.l	d3
	clr.l	d2
	move.w	d0,d6
	move.w	2(a3),d7
	bsr	l0327
	move.l	d2,(a0)+
	move.l	d3,(a0)+
	lsl.w	#1,d4
	bclr	#15,d4
	btst	#0,d1
	beq.b	l0323
	lsl.w	#1,d0
l0323	dbf	d1,l0322
	lea	l048d,a4
	moveq	#4,d0
l0324	moveq	#3,d1
	move.w	(a3)+,d2
l0325	clr.w	(a4)
	lsr.w	#1,d2
	bcc.b	l0326
	move.w	#$ffff,(a4)
l0326	addq.w	#2,a4
	dbf	d1,l0325
	dbf	d0,l0324
	rts

l0327	lsr.b	#1,d7
	bcc.b	l0328
	swap	d2
	or.w	d6,d2
	swap	d2
l0328	lsr.b	#1,d7
	bcc.b	l0329
	or.w	d6,d2
l0329	lsr.b	#1,d7
	bcc.b	l032a
	swap	d3
	or.w	d6,d3
	swap	d3
l032a	lsr.b	#1,d7
	bcc.b	l032b
	or.w	d6,d3
l032b	rts

	moveq	#$7c,d0
	movea.l	l04a9,a0
	adda.l	#$7d00,a0
	clr.l	d1
	clr.l	d2
	clr.l	d3
	clr.l	d4
	clr.l	d5
	clr.l	d6
	clr.l	d7
	movea.l	d7,a1
l032c	movem.l	a1/d1-d7,-(a0)
	movem.l	a1/d1-d7,-(a0)
	movem.l	a1/d1-d7,-(a0)
	movem.l	a1/d1-d7,-(a0)
	movem.l	a1/d1-d7,-(a0)
	movem.l	a1/d1-d7,-(a0)
	movem.l	a1/d1-d7,-(a0)
	movem.l	a1/d1-d7,-(a0)
	dbf	d0,l032c
	rts

l032d	move.w	l0488,d0
	move.w	d0,d1
	subq.w	#1,d0
	cmp.w	#$a7,d0
	bcc.b	l032f
	movea.l	l04a9,a0
	mulu	#$a0,d1
	adda.w	d1,a0
	move.l	l0492,d1
	move.l	l0493,d2
	move.l	d1,d3
	move.l	d2,d4
	move.l	d1,d5
	move.l	d2,d6
	move.l	d1,d7
	movea.l	d2,a1
l032e	movem.l	a1/d1-d7,-(a0)
	movem.l	a1/d1-d7,-(a0)
	movem.l	a1/d1-d7,-(a0)
	movem.l	a1/d1-d7,-(a0)
	movem.l	a1/d1-d7,-(a0)
	dbf	d0,l032e
l032f	rts

l0330	movea.l	l046b,a0
	movea.l	(a0),a0
	adda.w	#$6900,a0
	movea.l	a0,a6
	lea	l034b,a1
	moveq	#$1f,d0
	bsr	l0236
	tst.w	l04b3
	bne.b	l0335
	movea.l	a6,a0
	adda.w	#$718,a0
	lea	l0347,a1
	moveq	#4,d0
l0331	moveq	#6,d1
l0332	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	dbf	d1,l0332
	adda.w	#$68,a0
	dbf	d0,l0331
	btst	#2,l0455
	beq.b	l0335
	movea.l	a6,a0
	lea	l0349,a1
	adda.w	#$2b0,a0
	moveq	#9,d0
l0333	moveq	#1,d1
l0334	move.l	(a1)+,d2
	eor.l	d2,(a0)+
	move.l	(a1)+,d2
	eor.l	d2,(a0)+
	dbf	d1,l0334
	adda.w	#$90,a0
	dbf	d0,l0333
	clr.w	d0
	jsr	l03d7
l0335	move.w	l04bd,d0
	beq	l033a
	lea	l0339,a1
	mulu	#$f0,d0
	adda.w	d0,a1
	movea.l	a6,a0
	adda.w	#$df8,a0
	moveq	#4,d0
l0336	moveq	#5,d1
l0337	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	dbf	d1,l0337
	adda.w	#$70,a0
	dbf	d0,l0336
	move.w	l04be,d0
	beq.b	l033a
	cmp.w	#1,d0
	bne.b	l0338
	move.w	l04c5,d0
	lsr.w	#8,d0
	beq.b	l033a
	movea.l	a6,a0
	adda.w	#$df8,a0
	bsr	l034c
	bra.b	l033a
l0338	move.w	l04c4,d2
	move.l	#$7000bd,d0
l0339	addi.w	#$30,d2
	move.w	d2,d1
	bsr	l0277
l033a	tst.b	l04cc
	beq.b	l033e
	move.w	l0454,d0
	btst	#2,d0
	beq.b	l033e
	andi.w	#3,d0
	bne.b	l033b
	move.l	a6,-(a7)
	moveq	#$a,d0
	jsr	l03d7
	movea.l	(a7)+,a6
l033b	movea.l	a6,a0
	adda.w	#$3e0,a0
	lea	l0348,a1
	moveq	#9,d0
l033c	moveq	#1,d1
l033d	move.l	(a1)+,(a0)+
	move.l	(a1)+,(a0)+
	dbf	d1,l033d
	adda.w	#$90,a0
	dbf	d0,l033c
l033e	move.w	l04b3,d0
	lsr.w	#8,d0
	beq.b	l033f
	movea.l	a6,a0
	adda.w	#$2d0,a0
	bsr	l034c
l033f	move.w	l04b4,d0
	lsr.w	#8,d0
	beq.b	l0340
	movea.l	a6,a0
	adda.w	#$2c0,a0
	bsr	l034c
l0340	move.w	#$30,d1
	swap	d1
	move.w	l04b2,d1
	addi.w	#$30,d1
	clr.w	d7
	cmp.w	#$3a,d1
	bne.b	l0341
	st	d7
	move.w	l0469,d0
	ror.w	#8,d0
	move.w	d0,l0469
	move.l	#$310030,d1
l0341	move.l	#$1000b8,d0
	move.l	d1,-(a7)
	move.w	d7,-(a7)
	tst.b	d7
	beq.b	l0342
	bsr	l027c
	bra.b	l0343
l0342	bsr	l0277
l0343	move.w	(a7)+,d7
	move.l	#$800b8,d0
	move.l	(a7),d1
	swap	d1
	tst.b	d7
	beq.b	l0344
	bsr	l027c
	bra.b	l0345
l0344	bsr	l0277
l0345	move.l	(a7)+,d1
	cmp.w	#$30,d1
	bne.b	l0346
	move.w	l0469,d0
	ror.w	#8,d0
	move.w	d0,l0469
l0346	rts

	dc.b	$ff,$ff,0,0,0,0,$ff,$ff
	dc.b	$ff,$dd,0,'"',0,0,$ff,$dd
	dc.b	$fc,$1f,3,$e0,0,0,$fc,$1f
	dc.b	$ff,$86,0,'y',0,0,$ff,$86
	dc.b	'7]',$c8,$a2,0,0,'7]'
	dc.b	$8d,$df,'r ',0,1,$8d,$de
	dc.b	$ff,$ff,0,0,0,0,$ff,$ff
	dc.b	$ff,$dd,0,'"',0,0,$ff,$dd
	dc.b	$ff,$bf,0,'@',0,0,$ff,$bf
	dc.b	$ff,'}',0,$82,0,0,$ff,'}'
	dc.b	$d3,'M,',$b2,0,0,$d3,'M'
	dc.b	't',$df,$8b,' ',0,1,'t',$de
	dc.b	$ff,$ff,0,0,0,0,$ff,$ff
	dc.b	$ff,$dd,0,'"',0,0,$ff,$dd
	dc.b	$ff,$7f,0,$80,0,0,$ff,$7f
	dc.b	$ff,'|',0,$83,0,0,$ff,'|'
	dc.b	$15,'U',$ea,$aa,0,0,$15,'U'
	dc.b	'u_',$8a,$a0,0,1,'u^'
	dc.b	$ff,$ff,0,0,0,0,$ff,$ff
	dc.b	$ff,$dd,0,'"',0,0,$ff,$dd
	dc.b	$ce,$fc,'1',3,0,0,$ce,$fc
	dc.b	$ff,'}',0,$82,0,0,$ff,'}'
	dc.b	$d6,'Y)',$a6,0,0,$d6,'Y'
	dc.b	'u',$9f,$8a,'`',0,1,'u',$9e
	dc.b	$ff,$ff,0,0,0,0,$ff,$ff
	dc.b	$ff,$e1,0,$1e,0,0,$ff,$e1
	dc.b	$cc,$1c,'3',$e3,0,0,$cc,$1c
	dc.b	$ff,$85,0,'z',0,0,$ff,$85
	dc.b	$d7,'](',$a2,0,0,$d7,']'
	dc.b	$8d,$df,'r ',0,1,$8d,$de
	dc.b	$ff,$e1,0,$1e,0,0,$ff,$e1
	dc.b	$d,$d8,$f2,$27,0,0,$d,$d8
	dc.b	$e1,7,$1e,$f8,0,0,$e1,7
	dc.b	$f7,'c',8,$9c,0,0,$f7,'c'
	dc.b	$86,$18,'y',$e7,0,0,$86,$18
	dc.b	$ef,$f,$10,$f0,0,1,$ef,$e
	dc.b	$ff,$df,0,' ',0,0,$ff,$df
	dc.b	'u',$dd,$8a,'"',0,0,'u',$dd
	dc.b	$df,$7f,' ',$80,0,0,$df,$7f
	dc.b	$f2,'w',$d,$88,0,0,$f2,'w'
	dc.b	'}',$fd,$82,2,0,0,'}',$fd
	dc.b	$ef,$7f,$10,$80,0,1,$ef,'~'
	dc.b	$ff,$df,0,' ',0,0,$ff,$df
	dc.b	$d,$dd,$f2,'"',0,0,$d,$dd
	dc.b	$e3,$f,$1c,$f0,0,0,$e3,$f
	dc.b	$f5,'w',$a,$88,0,0,$f5,'w'
	dc.b	'Ž=q',$c2,0,0,'Ž='
	dc.b	$ef,$1f,$10,$e0,0,1,$ef,$1e
	dc.b	$ff,$df,0,' ',0,0,$ff,$df
	dc.b	']',$dd,$a2,'"',0,0,']',$dd
	dc.b	$fd,$7f,2,$80,0,0,$fd,$7f
	dc.b	$f7,'w',8,$88,0,0,$f7,'w'
	dc.b	$f7,$dd,8,'"',0,0,$f7,$dd
	dc.b	$ef,$7f,$10,$80,0,1,$ef,'~'
	dc.b	$ff,$e1,0,$1e,0,0,$ff,$e1
	dc.b	'f',$18,$99,$e7,0,0,'f',$18
	dc.b	$c3,7,'<',$f8,0,0,$c3,7
	dc.b	$f7,'c',8,$9c,0,0,$f7,'c'
	dc.b	$c,'8',$f3,$c7,0,0,$c,'8'
	dc.b	$e1,$f,$1e,$f0,0,1,$e1,$e
	dc.b	$ff,$c1,0,'>',0,0,$ff,$c1
	dc.b	$bc,$18,'C',$e7,0,0,$bc,$18
	dc.b	'A',$e,$be,$f1,0,0,'A',$e
	dc.b	'?',$e1,$c0,$1e,0,0,'?',$e1
	dc.b	'v0',$89,$cf,0,0,'v0'
	dc.b	'o',$f,$90,$f0,0,1,'o',$e
	dc.b	$ff,$df,0,' ',0,0,$ff,$df
	dc.b	$bd,$f7,'B',8,0,0,$bd,$f7
	dc.b	$f7,'u',8,$8a,0,0,$f7,'u'
	dc.b	$df,$df,'  ',0,0,$df,$df
	dc.b	'ww',$88,$88,0,0,'ww'
	dc.b	$ef,'w',$10,$88,0,1,$ef,'v'
	dc.b	$ff,$c3,0,'<',0,0,$ff,$c3
	dc.b	$bc,'7C',$c8,0,0,$bc,'7'
	dc.b	$f7,$d,8,$f2,0,0,$f7,$d
	dc.b	$df,$e3,' ',$1c,0,0,$df,$e3
	dc.b	7,'p',$f8,$8f,0,0,7,'p'
	dc.b	$ef,'w',$10,$88,0,1,$ef,'v'
	dc.b	$ff,$df,0,' ',0,0,$ff,$df
	dc.b	$bd,$f7,'B',8,0,0,$bd,$f7
	dc.b	$f7,']',8,$a2,0,0,$f7,']'
	dc.b	$df,$fd,' ',2,0,0,$df,$fd
	dc.b	'ww',$88,$88,0,0,'ww'
	dc.b	$ef,'w',$10,$88,0,1,$ef,'v'
	dc.b	$ff,$c1,0,'>',0,0,$ff,$c1
	dc.b	$84,$18,'{',$e7,0,0,$84,$18
	dc.b	'wf',$88,$99,0,0,'wf'
	dc.b	'?',$c3,$c0,'<',0,0,'?',$c3
	dc.b	'v0',$89,$cf,0,0,'v0'
	dc.b	'a',$f,$9e,$f0,0,1,'a',$e
	dc.b	$ff,$dd,0,'"',0,0,$ff,$dd
	dc.b	$8c,$10,'s',$ef,0,0,$8c,$10
	dc.b	$e3,$e3,$1c,$1c,0,0,$e3,$e3
	dc.b	'w',$d0,$88,'/',0,0,'w',$d0
	dc.b	'a',6,$9e,$f9,0,0,'a',6
	dc.b	'8',$dd,$c7,'"',0,1,'8',$dc
	dc.b	$ff,$cd,0,'2',0,0,$ff,$cd
	dc.b	$df,'w ',$88,0,0,$df,'w'
	dc.b	']',$f7,$a2,8,0,0,']',$f7
	dc.b	'7',$d7,$c8,'(',0,0,'7',$d7
	dc.b	$df,$df,'  ',0,0,$df,$df
	dc.b	'wM',$88,$b2,0,1,'wL'
	dc.b	$ff,$d5,0,'*',0,0,$ff,$d5
	dc.b	$df,'p ',$8f,0,0,$df,'p'
	dc.b	$dd,$f7,'"',8,0,0,$dd,$f7
	dc.b	'W',$d0,$a8,'/',0,0,'W',$d0
	dc.b	$df,$df,'  ',0,0,$df,$df
	dc.b	'wU',$88,$aa,0,1,'wT'
	dc.b	$ff,$d9,0,'&',0,0,$ff,$d9
	dc.b	$df,'u ',$8a,0,0,$df,'u'
	dc.b	$dd,$f7,'"',8,0,0,$dd,$f7
	dc.b	'e',$d7,'š(',0,0,'e',$d7
	dc.b	$df,$df,'  ',0,0,$df,$df
	dc.b	'wY',$88,$a6,0,1,'wX'
	dc.b	$ff,$dd,0,'"',0,0,$ff,$dd
	dc.b	$8f,'vp',$89,0,0,$8f,'v'
	dc.b	'c',$e3,$9c,$1c,0,0,'c',$e3
	dc.b	'v0',$89,$cf,0,0,'v0'
	dc.b	'a',$de,$9e,'!',0,0,'a',$de
	dc.b	'8',$dd,$c7,'"',0,1,'8',$dc
l0347	dc.b	$ff,$f8,'Q',1,'Q',$f,$ff,$f0
	dc.b	0,0,$dd,$dd,$ff,$ff,0,0
	dc.b	0,0,$d5,$c0,$ff,$ff,0,0
	dc.b	$8b,$ef,0,0,'t',$10,$8b,$ef
	dc.b	$a2,$f,0,0,']',$f0,$a2,$f
	dc.b	$be,$89,0,0,'Av',$be,$89
	dc.b	'"k',2,' ',$df,$f4,'"+'
	dc.b	$bf,$f8,$dd,$c1,$9d,$cf,$ff,$f0
	dc.b	0,0,'Q',$11,$ff,$ff,0,0
	dc.b	0,0,'U',0,$ff,$ff,0,0
	dc.b	$da,'"',0,0,'%',$dd,$da,'"'
	dc.b	'2',2,0,0,$cd,$fd,'2',2
	dc.b	'"',$c9,0,0,$dd,'6"',$c9
	dc.b	'Bk',0,' ',$bf,$f4,'@+'
	dc.b	$ff,$f8,0,1,0,$f,$ff,$f0
	dc.b	0,0,$9d,$dd,$ff,$ff,0,0
	dc.b	0,0,$95,$c0,$ff,$ff,0,0
	dc.b	$ab,$e2,0,0,'T',$1d,$ab,$e2
	dc.b	'*',2,0,0,$d5,$fd,'*',2
	dc.b	'>',$a9,0,0,$c1,'V>',$a9
	dc.b	$82,'k',0,' ',$7f,$f4,$80,'+'
	dc.b	$ff,$e8,0,9,0,$1f,$ff,$e8
	dc.b	0,0,'PQ',$ff,$ff,0,0
	dc.b	0,0,']',0,$ff,$ff,0,0
	dc.b	$8a,'"',0,0,'u',$dd,$8a,'"'
	dc.b	'&',2,0,0,$d9,$fd,'&',2
	dc.b	'"',$99,0,0,$dd,'f"™'
	dc.b	'Bk',0,' ',$bf,$f4,'@+'
	dc.b	$ff,$f8,$f0,$19,$ff,$ff,$f0,$18
	dc.b	0,0,']',$dd,$ff,$ff,0,0
	dc.b	0,0,'I',$c0,$ff,$ff,0,0
	dc.b	$8a,'/',0,0,'u',$d0,$8a,'/'
	dc.b	$a2,2,0,0,']',$fd,$a2,2
	dc.b	'"',$89,0,0,$dd,'v"',$89
	dc.b	'"k',0,' ',$df,$f4,' +'
l0348	dc.b	$ef,$ef,0,1,$f0,3,$f,$ed
	dc.b	$be,0,1,$ff,$c8,0,'6',0
	dc.b	$ef,$ff,1,$82,'7',$ff,$c9,$82
	dc.b	'|',0,3,$ff,$90,0,'l',0
	dc.b	$e8,$e,0,4,'7',$ff,$c8,4
	dc.b	$f8,0,7,$ff,' ',0,$d8,0
	dc.b	$ef,$fd,$80,8,$b0,$1e,'O',$e9
	dc.b	$f0,0,'O',$ff,'@',0,$f0,0
	dc.b	$ef,$fb,1,$90,'7',$fc,$c9,$93
	dc.b	$e0,0,$9f,$ff,$80,0,$e0,0
	dc.b	$e8,'u',0,'!7',$f9,$c8,'%'
	dc.b	$c0,0,'?',$ff,0,0,$c0,0
	dc.b	$ef,$ef,$80,'@',$b0,$f2,'OM'
	dc.b	$80,0,$7f,$ff,0,0,$80,0
	dc.b	$ef,$df,0,$80,'1',$e4,$ce,$9b
	dc.b	0,0,$ff,$ff,0,0,0,0
	dc.b	$ef,$be,1,1,$f3,$c8,$d,'6'
	dc.b	0,0,$ff,$ff,0,0,0,0
	dc.b	$ef,$bc,3,3,'7',$d0,$cb,','
	dc.b	0,0,$ff,$ff,0,0,0,0
	dc.b	$ef,$b8,3,7,'7',$d0,$cb,'('
	dc.b	0,0,$ff,$ff,0,0,0,0
	dc.b	$ef,$b8,3,7,'7',$d0,$cb,'('
	dc.b	0,0,$ff,$ff,0,0,0,0
l0349	dc.b	0,$ff,0,$ff,0,0,0,$ff
	dc.b	$ff,$e0,$ff,$e0,0,0,$ff,$e0
	dc.b	0,$85,0,$85,0,0,0,$85
	dc.b	$a2,$e0,$a2,$e0,0,0,$a2,$e0
	dc.b	0,$bd,0,$bd,0,0,0,$bd
	dc.b	$ae,$e0,$ae,$e0,0,0,$ae,$e0
	dc.b	0,$bd,0,$bd,0,0,0,$bd
	dc.b	$ae,$e0,$ae,$e0,0,0,$ae,$e0
	dc.b	0,$8d,0,$8d,0,0,0,$8d
	dc.b	$a2,$e0,$a2,$e0,0,0,$a2,$e0
	dc.b	0,$bd,0,$bd,0,0,0,$bd
	dc.b	$ae,$e0,$ae,$e0,0,0,$ae,$e0
	dc.b	0,$bd,0,$bd,0,0,0,$bd
	dc.b	$ae,$e0,$ae,$e0,0,0,$ae,$e0
	dc.b	0,$bd,0,$bd,0,0,0,$bd
	dc.b	$ae,$e0,$ae,$e0,0,0,$ae,$e0
	dc.b	0,$be,0,$be,0,0,0,$be
	dc.b	'b b ',0,0,'b '
	dc.b	0,$ff,0,$ff,0,0,0,$ff
	dc.b	$ff,$e0,$ff,$e0,0,0,$ff,$e0
l034a	dcb.w	3
	dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	dcb.w	2
	dc.b	$ff,$ff,$ff,$ff,0,0,0,0
	dc.b	$ff,$ff,$ff,$ff,0,0,0,0
	dc.b	$ff,$ff,$ff,$ff,0,0
l034b	dc.b	$7f,$ff,0,0,$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,$ff,$ff,0,0
	dc.b	$ff,$fe,0,0,$ff,$ff,0,0
	dc.b	$7f,$ff,'?',$ff,$ff,$ff,'?',$ff
	dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	dc.b	$ff,$fe,$ff,$fc,$ff,$ff,$ff,$fc
	dcb.w	2
	dc.b	$ff,$ff,0,0,0,0,0,0
	dc.b	$ff,$ff,0,0,0,0,0,0
	dc.b	$ff,$ff,0,0,0,0,0,0
	dc.b	$ff,$ff,0,0,0,0,0,0
	dc.b	$ff,$ff,0,0,'8',0,$10,0
	dc.b	$ff,$ff,$10,0,$e,0,4,0
	dc.b	$ff,$ff,4,0,0,$1c,0,8
	dc.b	$ff,$ff,0,8,0,0,0,0
	dc.b	$ff,$ff,0,0,0,0,0,0
	dc.b	$ff,$ff,0,0,0,0,0,0
	dc.b	$ff,$ff,0,0,0,0,0,0
	dc.b	$ff,$ff,0,0,0,0,0,0
	dc.b	$ff,$ff,0,0,7,0,2,0
	dc.b	$ff,$ff,2,0,0,0,0,0
	dc.b	$ff,$ff,0,0,1,$c0,0,$80
	dc.b	$ff,$ff,0,$80,0,0,0,0
	dc.b	$ff,$ff,0,0,0,0,0,0
	dc.b	$ff,$ff,0,0,0,0,0,0
	dc.b	$ff,$ff,0,0,0,0,0,0
	dc.b	$ff,$ff,0,0,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$f0,0,0
	dc.b	0,0,$ff,$f0,'p',0,' ',0
	dc.b	'x',0,' ',0,4,$ff,0,0
	dc.b	$1f,0,0,$ff,$ff,$e9,0,0
	dc.b	0,$1e,$ff,$e1,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$e1,0,0
	dc.b	0,'>',$ff,$c1,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$f2,'?',0,$1f
	dc.b	$f,$ff,$f0,$1f,$ff,$ff,$ff,$ff
	dc.b	$ff,$ff,$ff,$ff,$fd,$df,$f8,$80
	dc.b	$fb,$e0,$fc,$9f,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,1,$80
	dc.b	7,$ff,$f9,$80,$e3,$ff,'@',0
	dc.b	$f3,$ff,'@',0,$e5,$ff,$c0,0
	dc.b	$de,0,$e1,$ff,$ff,$f9,0,0
	dc.b	0,$e,$ff,$f1,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$e1,0,0
	dc.b	0,'>',$ff,$c1,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$f2,$7f,0,' '
	dc.b	$1f,$ff,$e0,' ',$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,$fd,$df,0,$80
	dc.b	$fb,$e0,4,$9f,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,'?',$ff
	dc.b	$bf,$ff,$7f,$ff,$ff,$ff,$ff,$ff
	dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	dc.b	$ff,$ff,$ff,$ff,$f8,1,$f0,0
	dc.b	$f7,$ff,$f8,0,$c7,$ff,$80,0
	dc.b	$e4,0,$83,$ff,$e5,$ff,'@z'
	dc.b	'^z',$e1,$ff,$ff,$f9,']',0
	dc.b	']',$e,$ff,$f1,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$e1,0,0
	dc.b	0,'>',$ff,$c1,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$f2,'o',0,' '
	dc.b	$1f,$f0,$e0,'/',$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$f5,$df,0,$8f
	dc.b	$b,$ef,$f4,$9f,$ff,$ff,$ff,$ff
	dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$fc
	dc.b	$ff,$fd,$ff,$fe,$ff,$ff,' ',0
	dc.b	$bf,$ff,'`',0,$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,$ef,$ff,0,1
	dc.b	$f0,3,$f,$fd,$bf,$ff,0,0
	dc.b	$c8,0,'7',$ff,$e5,$ff,0,'B'
	dc.b	'^B',$a1,$ff,$ff,$f9,'Q',0
	dc.b	'Q',$e,$ff,$f1,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$e1,0,0
	dc.b	0,'>',$ff,$c1,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$f2,'h',0,' '
	dc.b	$1f,$f7,$e0,'(',0,0,0,0
	dc.b	$ff,$ff,0,0,'5',$df,0,$88
	dc.b	$eb,$ef,$14,$98,$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,$ff,$fb,0,0
	dc.b	$ff,$fd,0,2,$7f,$ff,' ',0
	dc.b	$b0,0,'o',$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ef,$ff,1,$82
	dc.b	'7',$ff,$c9,$82,$7f,$ff,0,0
	dc.b	$90,0,'o',$ff,$e5,$ff,0,'B'
	dc.b	'^B',$a1,$ff,$ff,$f9,'Q',0
	dc.b	'Q',$e,$ff,$f1,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$e1,0,0
	dc.b	0,'>',$ff,$c1,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$f2,'k',0,' '
	dc.b	$1f,$f4,$e0,'+',$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$f5,$df,0,$88
	dc.b	'+',$ec,$d4,$9b,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$fa,0,0
	dc.b	0,$d,$ff,$f2,$ff,$ff,'&y'
	dc.b	'6y',$e9,$86,$ff,$ff,$b1,$fb
	dc.b	$b1,$fb,'N',4,$ff,$ff,$df,'0'
	dc.b	$df,'0 ',$cf,$ff,$ff,$f7,$ff
	dc.b	$f7,$ff,8,0,$e8,$e,0,4
	dc.b	'7',$ff,$c8,4,$ff,$ff,0,0
	dc.b	' ',0,$df,$ff,$e5,$ff,0,'r'
	dc.b	'^r',$a1,$ff,$ff,$f9,']',0
	dc.b	']',$e,$ff,$f1,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$e1,0,0
	dc.b	0,'>',$ff,$c1,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$f2,'k',0,' '
	dc.b	$1f,$f4,$e0,'+',$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$f5,$df,0,$88
	dc.b	'+',$ec,$d4,$9b,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,$1d,$de
	dc.b	$1d,$de,$ff,$ff,$ff,$ff,$ee,0
	dc.b	$ee,0,$ff,$ff,$ff,$fb,0,0
	dc.b	0,$c,$ff,$f3,$ff,$ff,$27,$f9
	dc.b	'7',$f9,$e8,6,$ff,$ff,$b0,'a'
	dc.b	$b0,'aO',$9e,$ff,$ff,$99,$b0
	dc.b	$99,$b0,'fO',$ff,$ff,'f',$19
	dc.b	'f',$19,$99,$e6,$ef,$fd,$80,8
	dc.b	$b0,$1e,'O',$e9,$ff,$ff,'@',0
	dc.b	'@',0,$ff,$ff,$e5,$ff,0,'B'
	dc.b	'^B',$a1,$ff,$ff,$f9,'Q',0
	dc.b	'Q',$f,$ff,$f0,$ff,$ff,0,$1e
	dc.b	$ff,$ff,0,$1e,$ff,$e1,0,0
	dc.b	$ff,$ff,0,0,$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,$ff,$ff,3,$f0
	dc.b	$ff,$ff,3,$f0,$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,$f2,'k',2,' '
	dc.b	$ff,$f4,2,'+',$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$f5,$df,0,$88
	dc.b	'+',$ec,$d4,$9b,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$f3,$11,$12
	dc.b	$11,$12,$ff,$f3,$bf,$ff,$a8,0
	dc.b	$a8,0,$bf,$ff,$ff,$fb,0,0
	dc.b	0,$c,$ff,$f3,$ff,$ff,$27,$f9
	dc.b	$b7,$f9,'h',6,$ff,$ff,$b0,'a'
	dc.b	$b0,'aO',$9e,$ff,$ff,$9f,'0'
	dc.b	$9f,'0`',$cf,$ff,$ff,'g',$df
	dc.b	'g',$df,$98,' ',$ef,$fb,1,$90
	dc.b	'7',$fc,$c9,$93,$ff,$ff,$80,0
	dc.b	$80,0,$ff,$ff,$e5,$ff,0,'B'
	dc.b	'^B',$a1,$ff,$ff,$f8,'Q',0
	dc.b	'Q',$f,$ff,$f0,0,0,0,0
	dc.b	$ff,$ff,0,0,0,0,0,0
	dc.b	$ff,$ff,0,0,0,0,0,0
	dc.b	$ff,$ff,0,0,0,0,0,0
	dc.b	$ff,$ff,0,0,0,0,0,0
	dc.b	$ff,$ff,0,0,2,'k',2,' '
	dc.b	$ff,$f4,2,'+',$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$f5,$df,0,$88
	dc.b	'+',$ec,$d4,$9b,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$f3,$1d,$12
	dc.b	$1d,$12,$ff,$f3,$ff,$ff,$ce,0
	dc.b	$ce,0,$ff,$ff,$ff,$fb,0,0
	dc.b	0,$d,$ff,$f2,$ff,$ff,'&y'
	dc.b	$b6,'yi',$86,$ff,$ff,$b0,'a'
	dc.b	$b0,'aO',$9e,$ff,$ff,$98,'0'
	dc.b	$98,'0g',$cf,$ff,$ff,'f',$1e
	dc.b	'f',$1e,$99,$e1,$e8,'w',0,'!'
	dc.b	'7',$f9,$c8,$27,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$e5,$ff,0,'B'
	dc.b	'^B',$a1,$ff,$ff,$f9,'Q',0
	dc.b	'Q',$e,$ff,$f1,$dd,$dd,0,0
	dc.b	'""',$dd,$dd,$d5,$c0,0,0
	dc.b	'*?',$d5,$c0,0,0,$8b,$ef
	dc.b	$ff,$ff,0,0,0,0,$a2,$f
	dc.b	$ff,$ff,0,0,0,0,$be,$89
	dc.b	$ff,$ff,0,0,2,'k" '
	dc.b	$ff,$f4,2,'+',$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$f5,$df,0,$88
	dc.b	'+',$ec,$d4,$9b,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$f3,5,$12
	dc.b	5,$12,$ff,$f3,$ff,$ff,$a8,0
	dc.b	$a8,0,$ff,$ff,$ff,$fb,0,0
	dc.b	0,$d,$ff,$f2,'~o&o'
	dc.b	$b6,'oh',0,$be,'c',$be,'c'
	dc.b	$be,'c',0,0,$d8,'>',$d8,'>'
	dc.b	$d8,'>',0,0,$ff,$ff,$f7,$fb
	dc.b	$f7,$fb,8,4,$ef,$ef,$80,'@'
	dc.b	$b0,$f2,'OM',$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$e5,$fd,0,'C'
	dc.b	'^A',$a1,$ff,$bf,$f9,$dd,$c0
	dc.b	$9d,$ce,$ff,$f1,'Q',$11,0,0
	dc.b	$ae,$ee,'Q',$11,'U',0,0,0
	dc.b	$aa,$ff,'U',0,0,0,$da,'"'
	dc.b	$ff,$ff,0,0,0,0,'2',2
	dc.b	$ff,$ff,0,0,0,0,'"',$c9
	dc.b	$ff,$ff,0,0,2,'kB '
	dc.b	$ff,$f4,2,'+',$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$f5,$df,0,$88
	dc.b	'+',$ec,$d4,$9b,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,$1d,$de
	dc.b	$1d,$de,$ff,$ff,$ff,$ff,$ae,0
	dc.b	$ae,0,$ff,$ff,$ff,$fa,0,0
	dc.b	0,$d,$ff,$f2,$f8,0,' ',0
	dc.b	'0',0,$e8,0,0,0,0,0
	dcb.w	2
	dc.b	0,$f,0,0,0,0,0,$f
	dc.b	$ff,$ff,0,0,0,0,$ff,$ff
	dc.b	$ef,$df,0,$80,'1',$e4,$ce,$9b
	dc.b	$ff,$ff,0,0,0,0,$ff,$ff
	dc.b	$e5,$ff,0,0,'^',0,$a1,$ff
	dc.b	$ff,$f9,0,0,0,$e,$ff,$f1
	dc.b	$9d,$dd,0,0,'b"',$9d,$dd
	dc.b	$95,$c0,0,0,'j?',$95,$c0
	dc.b	0,0,$ab,$e2,$ff,$ff,0,0
	dc.b	0,0,'*',2,$ff,$ff,0,0
	dc.b	0,0,'>',$a9,$ff,$ff,0,0
	dc.b	2,'k',$80,' ',$ff,$f4,0,'+'
	dc.b	$ff,$ff,0,0,0,0,$ff,$ff
	dc.b	$f5,$df,0,$88,'+',$ec,$d4,$9b
	dc.b	$ff,$ff,0,0,0,0,$ff,$ff
	dc.b	$ff,$ff,0,0,0,0,$ff,$ff
	dc.b	$ff,$ff,0,0,0,0,$ff,$ff
	dc.b	$ff,$fb,0,0,0,$c,$ff,$f3
	dc.b	$ff,$ff,' ',0,'?',$ff,$e0,0
	dc.b	$ff,$ff,0,0,$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,$ff,$ff,0,0
	dc.b	$ef,$bf,1,0,$f3,$c8,$d,'7'
	dc.b	$ff,$ff,0,0,0,0,$ff,$ff
	dc.b	$e4,$ff,0,0,'_',0,$a0,$ff
	dc.b	$ff,$e9,0,8,0,$1e,$ff,$e9
	dc.b	'PQ',0,0,$af,$ae,'PQ'
	dc.b	']',0,0,0,$a2,$ff,']',0
	dc.b	0,0,$8a,'"',$ff,$ff,0,0
	dc.b	0,0,'&',2,$ff,$ff,0,0
	dc.b	0,0,'"',$99,$ff,$ff,0,0
	dc.b	2,'k@ ',$ff,$f4,0,'+'
	dc.b	$ff,$ff,0,0,0,0,$ff,$ff
	dc.b	$f5,$dc,0,$88,'+',$ef,$d4,$98
	dcb.w	2
	dc.b	$ff,$ff,0,0,7,$ff,1,$ff
	dc.b	$ff,$ff,1,$ff,$f8,0,$e0,0
	dc.b	$ff,$ff,$e0,0,0,$b,0,0
	dc.b	$ff,$fc,0,3,$ff,$ff,' ',0
	dc.b	$b0,0,'o',$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ef,$bf,3,0
	dc.b	'7',$d0,$cb,'/',$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$e5,$ff,0,0
	dc.b	'_',$ff,$a0,0,$ff,$f9,$f0,$18
	dc.b	$ff,$fe,$f0,$19,']',$dd,0,0
	dc.b	$a2,'"]',$dd,'I',$c0,0,0
	dc.b	$b6,'?I',$c0,0,0,$8a,'/'
	dc.b	$ff,$ff,0,0,0,0,$a2,2
	dc.b	$ff,$ff,0,0,0,0,'"',$89
	dc.b	$ff,$ff,0,0,2,'k  '
	dc.b	$ff,$f4,0,'+',$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$f5,$df,0,$88
	dc.b	'+',$ec,$d4,$9b,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$fb,0,0
	dc.b	0,$d,$ff,$f2,$ff,$ff,' ',0
	dc.b	$b0,0,'o',$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	$e7,'9',$18,$c6,$ff,$ff,0,0
	dc.b	$e7,$c0,$18,'?',$ef,$bf,3,0
	dc.b	'7',$d0,$cb,'/',$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$e4,0,0,0
	dc.b	'_',$ff,$a0,0,0,0,0,0
	dc.b	$ff,$ff,0,0,0,0,0,0
	dc.b	$ff,$ff,0,0,0,0,0,0
	dc.b	$ff,$ff,0,0,0,0,0,0
	dc.b	$ff,$ff,0,0,0,0,0,0
	dc.b	$ff,$ff,0,0,0,0,0,0
	dc.b	$ff,$ff,0,0,2,'k',0,' '
	dc.b	$ff,$f4,0,'+',$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$f5,$df,0,$88
	dc.b	'+',$ec,$d4,$9b,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$fb,0,0
	dc.b	0,$d,$ff,$f2,$7f,$ff,' ',0
	dc.b	$b0,0,'o',$ff,$ff,$ff,0,0
	dc.b	0,$89,$ff,'v',$ff,$ff,0,0
	dc.b	8,'E',$f7,$ba,$ff,$ff,0,0
	dc.b	$14,0,$eb,$ff,$ef,$bf,3,0
	dc.b	'7',$d0,$cb,'/',$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$e7,$ff,0,$ff
	dc.b	'_',$ff,$a0,$ff,$ff,$ff,$ff,$ff
	dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	dc.b	$ff,$ff,$ff,$ff,$fe,'o',$fc,' '
	dc.b	$ff,$f4,$fc,'+',$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$f5,$df,0,$88
	dc.b	'+',$ec,$d4,$9b,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$fa,0,0
	dc.b	0,$d,$ff,$f2,$ff,$ff,' ',0
	dc.b	'0',0,$ef,$ff,$ff,$ff,0,0
	dc.b	0,'Q',$ff,$ae,$ff,$ff,0,0
	dc.b	8,'E',$f7,$ba,$ff,$ff,0,0
	dc.b	$14,0,$eb,$ff,$ef,$bf,3,0
	dc.b	'7',$d0,$cb,'/',$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$e3,$ff,0,0
	dc.b	'_',$ff,$a0,0,$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,$fe,'o',0,'$'
	dc.b	$ff,$f4,0,'/',$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$f5,$df,' ',$88
	dc.b	'+',$ec,$f4,$9b,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$fb,0,0
	dc.b	0,$c,$ff,$f3,$ff,$ff,' ',0
	dc.b	'0',0,$ef,$ff,$ff,$ff,0,0
	dc.b	0,' ',$ff,$df,$ff,$ff,0,0
	dc.b	$c8,'E7',$ba,$ff,$ff,0,0
	dc.b	$e7,$80,$18,$7f,$ef,$b0,3,0
	dc.b	'7',$df,$cb,' ',$f,$c0,3,0
	dc.b	$ff,$ff,3,0,'a',$80,0,0
	dc.b	$df,$ff,' ',0,0,0,0,0
	dc.b	$ff,$ff,0,0,0,0,0,0
	dc.b	$ff,$ff,0,0,0,0,0,0
	dc.b	$ff,$ff,0,0,0,0,0,0
	dc.b	$ff,$ff,0,0,0,0,0,0
	dc.b	$ff,$ff,0,0,0,0,0,0
	dc.b	$ff,$ff,0,0,6,'o',0,$27
	dc.b	$ff,$f7,0,'/',$ff,$ff,$ff,$ff
	dc.b	$ff,$ff,$ff,$ff,$f5,$df,$e0,$88
	dc.b	$eb,$ec,$f4,$9b,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$fb,0,0
	dc.b	0,$c,$ff,$f3,$ff,$ff,' ',0
	dc.b	$b0,0,'o',$ff,$ff,$ff,0,0
	dc.b	0,'P',$ff,$af,$ff,$ff,0,0
	dc.b	'(E',$d7,$ba,$ff,$ff,0,0
	dc.b	$14,0,$eb,$ff,$ef,$b7,3,0
	dc.b	'7',$d8,$cb,$27,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,'`',$ff,0,0
	dc.b	$df,$ff,' ',0,$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,$fc,'o',0,' '
	dc.b	$ff,$f7,0,'(',$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,$f5,$df,0,$88
	dc.b	$eb,$ec,$14,$9b,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$fb,0,0
	dc.b	0,$d,$ff,$f2,$ff,$ff,' ',0
	dc.b	$b0,0,'o',$ff,$ff,$ff,0,0
	dc.b	0,$88,$ff,'w',$ff,$ff,0,0
	dc.b	'(E',$d7,$ba,$ff,$ff,0,0
	dc.b	$14,0,$eb,$ff,$ef,$b7,3,3
	dc.b	'7',$db,$cb,$27,$ff,$ff,$ea,'^'
	dc.b	$ea,'^',$ff,$ff,'`',7,0,0
	dc.b	$df,$f8,' ',7,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	0,1,$ff,$fe,0,'h',0,' '
	dc.b	$ff,$f7,0,'(',0,0,0,0
	dc.b	$ff,$ff,0,0,$15,$df,0,$88
	dc.b	$eb,$ec,$14,$9b,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$fb,0,0
	dc.b	0,$d,$ff,$f2,$7f,$ff,' ',0
	dc.b	$b0,0,'o',$ff,$ff,$ff,0,0
	dc.b	0,1,$ff,$fe,$ff,$ff,0,0
	dc.b	$c7,'98',$c6,$ff,$ff,0,0
	dc.b	$17,$c0,$e8,'?',$ef,$b7,3,2
	dc.b	'7',$da,$cb,$27,$ff,$ff,$ab,'P'
	dc.b	$ab,'P',$ff,$ff,'`',7,0,0
	dc.b	$df,$f8,' ',7,$ff,$ff,0,$1e
	dc.b	0,$1e,$ff,$e1,$ff,$ff,'s',$e7
	dc.b	's',$e7,$8c,$18,$ff,$ff,$a2,2
	dc.b	$a2,2,']',$fd,$ff,$ff,'/',$9c
	dc.b	'/',$9c,$d0,'c',$ff,$ff,$f1,$c8
	dc.b	$f1,$c8,$e,'7',$ff,$ff,$80,0
	dc.b	$80,1,$7f,$fe,0,'o',0,' '
	dc.b	$ff,$f0,0,'/',$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$f5,$df,0,$88
	dc.b	$b,$ec,$f4,$9b,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$fa,0,0
	dc.b	0,$d,$ff,$f2,$ff,$ff,' ',0
	dc.b	'0',0,$ef,$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ef,$b7,3,2
	dc.b	'7',$da,$cb,$27,$ff,$ff,$aa,$de
	dc.b	$aa,$de,$ff,$ff,'`',7,0,0
	dc.b	$df,$f8,' ',7,$ff,$ff,0,' '
	dc.b	0,' ',$ff,$df,$ff,$ff,$88,$88
	dc.b	$88,$88,'ww',$ff,$ff,'"',2
	dc.b	'"',2,$dd,$fd,$ff,$ff,'("'
	dc.b	'("',$d7,$dd,$ff,$ff,$8a,','
	dc.b	$8a,',u',$d3,$ff,$ff,$80,0
	dc.b	$80,1,$7f,$fe,0,'o',0,$27
	dc.b	$ff,$f7,0,'/',$ff,$ff,$bd,$dd
	dc.b	$bd,$dd,$ff,$ff,$d5,$df,$e0,$88
	dc.b	$cb,$ec,$f4,$9b,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$fb,0,0
	dc.b	0,$c,$ff,$f3,$ff,$ff,' ',0
	dc.b	'?',$ff,$e0,0,$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,$ef,$b7,3,2
	dc.b	$f7,$da,$b,$27,$ff,$ff,'*P'
	dc.b	'*P',$ff,$ff,'`',7,0,0
	dc.b	$df,$f8,' ',7,$ff,$ff,0,' '
	dc.b	0,' ',$ff,$df,$ff,$ff,$f8,$88
	dc.b	$f8,$88,7,'w',$ff,$ff,'>',2
	dc.b	'>',2,$c1,$fd,$ff,$ff,$af,'>'
	dc.b	$af,'>P',$c1,$ff,$ff,$f2,'*'
	dc.b	$f2,'*',$d,$d5,$ff,$ff,$80,0
	dc.b	$80,1,$7f,$fe,0,'o',0,'$'
	dc.b	$ff,$f4,0,'/',$ff,$ff,'%',$11
	dc.b	'%',$11,$ff,$ff,$f5,$df,' ',$88
	dc.b	'+',$ef,$f4,$98,$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,$ff,$fb,0,0
	dc.b	$ff,$fc,0,3,$e0,0,' ',0
	dc.b	$bf,$ff,'`',0,0,1,0,0
	dc.b	$ff,$ff,0,0,$e0,0,$c0,0
	dc.b	$ff,$ff,$c0,0,0,0,0,0
	dc.b	$ff,$ff,0,0,$f,$b7,3,2
	dc.b	$f7,$da,$b,$27,$ff,$ff,'*^'
	dc.b	'*^',$ff,$ff,'`',7,0,0
	dc.b	$df,$f8,' ',7,$ff,$ff,0,' '
	dc.b	0,' ',$ff,$df,$ff,$ff,$88,$88
	dc.b	$88,$88,'ww',$ff,$ff,'"',3
	dc.b	'"',3,$dd,$fc,$ff,$ff,'h"'
	dc.b	'h"',$97,$dd,$ff,$ff,$82,')'
	dc.b	$82,')}',$d6,$ff,$ff,$80,0
	dc.b	$80,1,$7f,$fe,0,'o',0,$27
	dc.b	$ff,$f7,0,'/',$ff,$ff,$bd,$dd
	dc.b	$bd,$dd,$ff,$ff,$f5,$d8,' ',$88
	dc.b	'+',$ef,$f4,$98,0,0,0,0
	dc.b	$ff,$ff,0,0,0,$f,0,7
	dc.b	$ff,$ff,0,7,$80,0,0,0
	dc.b	$ff,$ff,0,0,0,3,0,0
	dc.b	$ff,$fd,0,2,$7f,$7f,0,0
	dc.b	$80,0,$7f,$7f,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$b7,3,0
	dc.b	7,$d8,$fb,$27,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,'`',7,'@',0
	dc.b	$df,$f8,'`',7,$ff,$ff,0,$1e
	dc.b	0,$1e,$ff,$e1,$ff,$ff,$88,$87
	dc.b	$88,$87,'wx',$ff,$ff,$a2,2
	dc.b	$a2,2,']',$fd,$ff,$ff,'/',$a2
	dc.b	'/',$a2,$d0,']',$ff,$ff,$81,$c8
	dc.b	$81,$c8,'~7',$ff,$ff,$80,0
	dc.b	$80,1,$7f,$fe,0,'o',0,' '
	dc.b	$ff,$f0,0,'/',$ff,$ff,$a1,$11
	dc.b	$a1,$11,$ff,$ff,$fd,$df,' ',$80
	dc.b	'+',$e0,$f4,$9f,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$fe,0,0
	dc.b	0,1,$ff,$fe,$df,$ff,0,0
	dc.b	'?',$ff,$c0,0,$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,$ff,$b0,3,0
	dc.b	$ff,$df,3,' ',0,3,0,0
	dc.b	$ff,$ff,0,0,$e0,7,$c0,0
	dc.b	$df,$f8,$e0,7,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$ff,$ff,0,0
	dc.b	0,1,$ff,$fe,0,'o',0,$27
	dc.b	$ff,$f7,0,'/',$ff,$ff,$a1,$dd
	dc.b	$a1,$dd,$ff,$ff,$dd,$ff,$e0,$80
	dc.b	$cb,$ff,$f4,$80,$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,$ff,$fb,0,0
	dc.b	$ff,$fc,0,3,$bf,$ff,$1f,$ff
	dc.b	$7f,$ff,$9f,$ff,$ff,$ff,$ff,$ff
	dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	dc.b	$ff,$ff,$ff,$ff,$ff,$bf,$fe,0
	dc.b	$ff,$c0,$fe,'?',$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$e0,7,0,7
	dc.b	$1f,$ff,$e0,7,$ff,$ff,$ff,$ff
	dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	dc.b	$ff,$ff,$ff,$ff,0,'o',0,' '
	dc.b	$ff,$f0,0,'/',$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$fc,$ff,8,$7f
	dc.b	$b,$ff,$fc,$7f,$ff,$ff,$ff,$ff
	dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	dc.b	$ff,$ff,$ff,$ff,$ff,$ff,$ff,$ff
	dc.b	$ff,$ff,$ff,$ff,$ff,$fd,$ff,$f8
	dc.b	$ff,$fe,$ff,$f9,$7f,$ff,0,0
	dc.b	$ff,$ff,0,0,$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,$ff,$80,0,0
	dc.b	$ff,$ff,0,0,'?',$80,$e,0
	dc.b	$ff,$ff,$e,0,' ',7,0,0
	dc.b	$df,$ff,' ',0,$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,0,'`',0,' '
	dc.b	$ff,$ff,0,' ',0,0,0,0
	dc.b	$ff,$ff,0,0,'|',$7f,$18,0
	dc.b	$fb,$ff,$1c,0,$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,$ff,$ff,0,0
	dc.b	$ff,$ff,0,0,$ff,$fe,0,0
	dc.b	$ff,$ff,0,0,0,0,0,0
	dc.b	$ff,$ff,0,0,0,0,0,0
	dc.b	$ff,$ff,0,0,0,0,0,0
	dc.b	$ff,$ff,0,0,0,0,0,0
	dc.b	$ff,$ff,0,0,0,$7f,0,0
	dc.b	$ff,$80,0,$7f,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$e0,0,0,0
	dc.b	$1f,$ff,$e0,0,0,0,0,0
	dc.b	$ff,$ff,0,0,0,0,0,0
	dc.b	$ff,$ff,0,0,0,0,0,0
	dc.b	$ff,$ff,0,0,0,0,0,0
	dc.b	$ff,$ff,0,0,0,0,0,0
	dc.b	$ff,$ff,0,0,0,0,0,0
	dc.b	$ff,$ff,0,0,0,$7f,0,0
	dc.b	$ff,$80,0,$7f,$ff,$ff,0,0
	dc.b	0,0,$ff,$ff,$fc,0,0,0
	dc.b	3,$ff,$fc,0,0,0,0,0
	dc.b	$ff,$ff,0,0,0,0,0,0
	dc.b	$ff,$ff,0,0,0,0,0,0
	dc.b	$ff,$ff,0,0,0,0,0,0
	dc.b	$ff,$ff,0,0,0,0,0,0
	dc.b	$ff,$ff,0,0,0,0,0,0
	dc.b	$ff,$ff,0,0,0,0,0,0
	dc.b	$ff,$ff,0,0,0,0,0,0
	dc.b	$ff,$ff,0,0,0,0,0,0
	dc.b	$ff,$ff,0,0,0,0,0,0
	dc.b	$ff,$ff,0,0,0,0,0,0
	dc.b	$ff,$ff,0,0,0,0,0,0
	dc.b	$ff,$ff,0,0,0,0,0,0
	dc.b	$ff,$ff,0,0,0,0,0,0
	dc.b	$ff,$ff,0,0,0,0,0,0
	dc.b	$ff,$ff,0,0,0,0,0,0
	dc.b	$ff,$ff,0,0,0,0,0,0
	dc.b	$ff,$ff,0,0,0,0,0,0
	dc.b	$ff,$ff,0,0,0,0,0,0
	dc.b	$ff,$ff,0,0,0,0,0,0
	dc.b	$ff,$ff,0,0,0,0,0,0
	dc.b	$ff,$ff,0,0,0,0,0,0
	dc.b	$ff,$ff,0,0,0,0,0,0
	dc.b	$ff,$ff,0,0,0,0,0,0
	dc.b	$ff,$ff,0,0
l034c	lea	l034a,a1
	cmp.w	#$10,d0
	bcs.b	l034e
	subi.w	#$10,d0
	moveq	#4,d1
l034d	move.l	(a1)+,(a0)
	move.l	(a1)+,4(a0)
	lea	160(a0),a0
	dbf	d1,l034d
	suba.w	#$318,a0
	bra.b	l034c
l034e	tst.w	d0
	beq.b	l0350
	moveq	#$ff,d2
	lsr.w	d0,d2
	not.w	d2
	move.w	d2,d0
	swap	d2
	move.w	d0,d2
	move.l	d2,d7
	not.l	d7
	moveq	#4,d1
l034f	move.l	(a1)+,d3
	and.l	d2,d3
	and.l	d7,(a0)
	or.l	d3,(a0)
	move.l	(a1)+,d3
	and.l	d2,d3
	and.l	d7,4(a0)
	or.l	d3,4(a0)
	lea	160(a0),a0
	dbf	d1,l034f
l0350	rts

l0351	move.w	#4,-(a7)
	trap	#$e
	addq.l	#2,a7
	move.w	d0,l049a
	andi.w	#2,d0
	bsr	l0363
	bclr	#0,$484.l	; click off

	move.w	#2,-(a7)
	trap	#$e
	addq.l	#2,a7
	move.l	d0,l04a7
	move.l	d0,l049c

	move.l	l04b6,d0
	addi.l	#$ff,d0
	clr.b	d0
	move.l	d0,l04a9
	addi.l	#$7d00,d0
	move.l	d0,l04a3
	bsr	l0362
	lea	$ff8240.l,a1
	lea	l049b,a0
	moveq	#7,d1
l0352	move.l	(a1)+,(a0)+	; cols
	dbf	d1,l0352

	movea.l	$456.l,a0	; vbl queue

l0353	move.l	a0,l0499
	tst.l	(a0)+
	bne.b	l0353
	move.l	#main_rout,-4(a0)
	move.l	$14.l,l0498
	pea	timer_a
	move.w	#5,-(a7)
	move.w	#0,-(a7)
	clr.w	-(a7)
	move.w	#$1f,-(a7)
	trap	#$e
	adda.w	#$c,a7
	rts


l0354	movea.l	l0499,a0
	clr.l	(a0)
	clr.b	$fffa19.l
	move.l	l0498,$14.l
	move.w	l049a,d0
	bsr	l0363
	move.l	l049c,l04a7
	move.l	l049c,l04a9
	bsr	l0362
	bsr	l0364
	bsr	music+($e*2)
	bsr	music+($e*5)
	bsr	music+$e
l0355	movea.l	l04a7,a0
	move.l	l04a9,l04a7
	move.l	a0,l04a9
	move.w	#2,l04ab
	rts

l0356	moveq	#7,d0
l0357	move.l	(a1)+,2(a0)
	lea	10(a0),a0
	dbf	d0,l0357
	rts

timer_a	move.l	d0,-(a7)
	move.w	l049e,d0
	clr.b	$fffa19.l
	mulu	#$19,d0
	lsr.w	#5,d0
	move.b	d0,$fffa1f.l	; TA data 
	move.b	#7,$fffa19.l	; TA control
	move.l	#timer_a_1,$134.l
	move.l	(a7)+,d0
l0359	move.l	#0,$ff8240.l
	move.l	#0,$ff8244.l
	move.l	#0,$ff8248.l
	move.l	#0,$ff824c.l
	move.l	#0,$ff8250.l
	move.l	#0,$ff8254.l
	move.l	#0,$ff8258.l
	move.l	#0,$ff825c.l
	bclr	#5,$fffa0f.l
	rte

timer_a_1	clr.b	$fffa19.l	; black is black
l035b	move.l	#0,$ff8240.l
	move.l	#0,$ff8244.l
	move.l	#0,$ff8248.l
	move.l	#0,$ff824c.l
	move.l	#0,$ff8250.l
	move.l	#0,$ff8254.l
	move.l	#0,$ff8258.l
	move.l	#0,$ff825c.l
	bclr	#5,$fffa0f.l
	rte

main_rout	clr.b	$fffa19.l
	move.l	#timer_a,$134.l	
	move.w	l049d,d0
	mulu	#$1a,d0
	lsr.w	#5,d0
	addi.w	#$2f,d0
	move.b	d0,$fffa1f.l
	move.b	#7,$fffa19.l
l035d	move.l	#0,$ff8240.l
	move.l	#0,$ff8244.l
	move.l	#0,$ff8248.l
	move.l	#0,$ff824c.l
	move.l	#0,$ff8250.l
	move.l	#0,$ff8254.l
	move.l	#0,$ff8258.l
	move.l	#0,$ff825c.l
	tst.b	l04de
	beq.b	l035f
	move.w	l0468,d0
	andi.w	#4,d0
	beq.b	l035e
	addq.b	#2,l04df
l035e	move.b	l04df,d0
	andi.w	#$e,d0
	lea	l0412,a0
	move.w	0(a0,d0.w),$ff8248.l
l035f	bsr	l0050
	tst.w	l04ab
	beq.b	l0360
	lea	l04a8,a0
	move.b	(a0)+,$ff8201.l
	move.b	(a0)+,$ff8203.l
	subq.w	#1,l04ab
l0360	tst.b	l046f
	beq.b	l0361
	move.l	l041b,d1
	cmp.l	l04a5,d1
	beq.b	l0361
	move.l	d1,l04a5
	bsr	l0231
	move.w	l041b,d0
	move.w	l041c,d1
	bsr	l022a
l0361	bsr	music+$e
	move.w	l0466,d0
	add.w	d0,d0
	lea	l0467,a0
	addq.w	#1,0(a0,d0.w)
	addq.w	#1,l0468
	rts

	rte

l0362	move.w	#$ffff,-(a7)
	move.l	l04a7,-(a7)
	move.l	l04a7,-(a7)
	move.w	#5,-(a7)	; Set scr
	trap	#$e
	adda.w	#$c,a7
	rts

l0363	move.w	d0,-(a7)
	pea	$ffffffff.l
	pea	$ffffffff.l
	move.w	#5,-(a7)	; Change res?
	trap	#$e
	adda.w	#$c,a7
	rts

l0364	lea	l049b,a0
	lea	$ff8240.l,a1
	moveq	#7,d0
l0365	move.l	(a0)+,(a1)+
	dbf	d0,l0365
	rts

	or.w	d1,8(a1)
	swap	d1
	or.w	d1,(a1)
	swap	d1
l0366	move.l	a0,l04b9
	movea.l	l04a9,a0
	move.w	#$1f3f,d0
l0367	clr.l	(a0)+
	dbf	d0,l0367
	movea.l	l04b9,a0
	addq.w	#4,a0
	movea.l	(a0),a0
	adda.l	l04b9,a0
	lea	l04aa,a1
	moveq	#7,d0
l0368	move.l	(a0)+,d1
	move.l	d1,(a1)+
	dbf	d0,l0368
	movea.l	l04a9,a5
	move.w	2(a0),d0
	mulu	#$a0,d0
	adda.w	d0,a5
	move.w	(a0),d0
	move.w	d0,d6
	andi.b	#$f0,d0
	lsr.w	#1,d0
	adda.w	d0,a5
	andi.w	#$f,d6
	move.w	6(a0),l04a0
	move.w	4(a0),d0
	addi.w	#$f,d0
	lsr.w	#4,d0
	move.w	d0,l049f
	lea	10(a0),a0
	moveq	#3,d7
	movea.l	a5,a2
	move.w	l049f,d5
	movea.l	a2,a3
	move.w	l04a0,d4
	movea.l	a3,a1
l0369	move.w	(a0)+,d0
	bmi	l036c
	clr.l	d1
	move.w	(a0)+,d1
	ror.l	d6,d1
	swap	d1
	subq.w	#1,d0
	lea	l036b,a6
l036a	or.w	d1,8(a1)
	swap	d1
	or.w	d1,(a1)
	swap	d1
	lea	160(a1),a1
	subq.w	#1,d4
	beq	l036f
l036b	dbf	d0,l036a
	bra.b	l0369
l036c	andi.w	#$7fff,d0
	subq.w	#1,d0
	lea	l036e,a6
l036d	clr.l	d1
	move.w	(a0)+,d1
	ror.l	d6,d1
	or.w	d1,(a1)
	swap	d1
	or.w	d1,8(a1)
	lea	160(a1),a1
	subq.w	#1,d4
	beq	l036f
l036e	dbf	d0,l036d
	bra.b	l0369
l036f	move.w	l04a0,d4
	addq.w	#8,a3
	movea.l	a3,a1
	subq.w	#1,d5
	beq	l0370
	jmp	(a6)
l0370	move.w	l049f,d5
	addq.w	#2,a2
	movea.l	a2,a3
	movea.l	a3,a1
	subq.w	#1,d7
	bmi	l0371
	jmp	(a6)
l0371	rts

	include	music.s

	data
	dc.b	2,0,0,0,1,0,0,0
	dc.b	0,'0',0,0,0,' ',0,0

l03da	incbin	l03da
l03db	incbin	l03db
l03dc	incbin	l03dc
l03dd	incbin	l03dd
l03de	incbin	l03de
l03df	incbin	l03df
l03e0	incbin	l03e0
l03e1	incbin	l03e1
l03e2	incbin	l03e2	; Supply Ship
l03e3	incbin	l03e3
l03e4	incbin	l03e4
l03e5	incbin	l03e5
l03e6	incbin	l03e6
l03e7	incbin	l03e7
l03e8	incbin	l03e8
l03e9	incbin	l03e9
l03ea	incbin	l03ea
l03eb	incbin	l03eb
l03ec	incbin	l03ec
l03ed	incbin	l03ed
l03ee	incbin	l03ee
l03ef	incbin	l03ef
l03f0	incbin	l03f0
l03f1	incbin	l03f1
l03f2	incbin	l03f2
l03f3	incbin	l03f3
l03f4	incbin	l03f4
l03f5	incbin	l03f5
l03f6	incbin	l03f6
l03f7	incbin	l03f7
l03f8	incbin	l03f8
l03f9	incbin	l03f9
l03fa	incbin	l03fa
l03fb	incbin	l03fb
l03fc	incbin	l03fc
l03fd	incbin	l03fd
l03fe	incbin	l03fe
l03ff	incbin	l03ff
l0400	incbin	l0400
l0401	incbin	l0401
l0402	incbin	l0402
l0403	incbin	l0403
l0404	incbin	l0404
l0405	incbin	l0405
l0406	incbin	l0406
l0407	incbin	l0407
l0408	incbin	l0408
l0409	incbin	l0409
l040a	incbin	l040a
l040b	incbin	l040b
l040c	incbin	l040c
l040d	incbin	l040d
l040e	incbin	l040e
l040f	incbin	l040f
l0410	incbin	l0410
l0411	incbin	l0411
l0412	incbin	l0412
l0413	incbin	l0413
l0414	incbin	l0414	; Horizon GFX


	bss
	ds.b	10
l0415	ds.l	1
l0416	ds.l	1
l0417	ds.w	1
l0418	ds.l	1
l0419	ds.l	1
l041a	ds.l	1
l041b	ds.w	1
l041c	ds.w	1
l041d	ds.w	1
l041e	ds.w	1
l041f	ds.b	1
l0420	ds.b	1
l0421	ds.w	1
l0422	ds.w	1
l0423	ds.b	5120
l0424	ds.w	1
l0425	ds.b	660
l0426	ds.w	1
l0427	ds.w	1
l0428	ds.w	1
l0429	ds.w	1
l042a	ds.w	1
l042b	ds.w	1
l042c	ds.w	1
l042d	ds.w	1
l042e	ds.w	1
l042f	ds.b	102
l0430	ds.b	20
l0431	ds.b	38
l0432	ds.b	100
l0433	ds.w	1
l0434	ds.b	10
l0435	ds.b	10
l0436	ds.b	20
l0437	ds.b	6
l0438	ds.b	42
l0439	ds.b	2342
l043a	ds.b	10
l043b	ds.b	960
l043c	ds.b	128
l043d	ds.b	16
l043e	ds.b	16
l043f	ds.b	196
l0440	ds.l	1
l0441	ds.b	512
l0442	ds.l	1
l0443	ds.l	1
l0444	ds.w	1
l0445	ds.w	1
l0446	ds.w	1
l0447	ds.l	1
l0448	ds.b	1
l0449	ds.b	1
l044a	ds.w	1
l044b	ds.l	1
l044c	ds.l	1
l044d	ds.w	1
l044e	ds.b	6
l044f	ds.l	1
l0450	ds.w	1
l0451	ds.l	1
l0452	ds.w	1
l0453	ds.w	1
l0454	ds.b	1
l0455	ds.b	1
l0456	ds.w	1
l0457	ds.b	16
l0458	ds.b	48
l0459	ds.l	1
l045a	ds.b	1
l045b	ds.b	1
l045c	ds.b	1
l045d	ds.b	5
l045e	ds.b	8
l045f	ds.b	24
l0460	ds.b	78
l0461	ds.l	1
l0462	ds.l	1
l0463	ds.b	220
l0464	ds.l	1
l0465	ds.w	1
l0466	ds.w	1
l0467	ds.b	40
l0468	ds.w	1
l0469	ds.b	1
l046a	ds.b	3
l046b	ds.l	1
l046c	ds.w	1
l046d	ds.w	1
l046e	ds.w	1
l046f	ds.w	1
l0470	ds.b	264
l0471	ds.w	1
l0472	ds.w	1
l0473	ds.w	1
l0474	ds.w	1
l0475	ds.b	1
l0476	ds.b	1
l0477	ds.b	1
l0478	ds.b	1
l0479	ds.w	1
l047a	ds.w	1
l047b	ds.w	1
l047c	ds.b	1
l047d	ds.b	1
l047e	ds.w	1
l047f	ds.b	34
l0480	ds.l	1
l0481	ds.l	1
l0482	ds.l	1
l0483	ds.l	1
l0484	ds.l	1
l0485	ds.l	1
l0486	ds.w	1
l0487	ds.w	1
l0488	ds.w	1
l0489	ds.b	1
l048a	ds.b	1
l048b	ds.w	1
l048c	ds.l	1
l048d	ds.w	1
l048e	ds.w	1
l048f	ds.w	1
l0490	ds.b	10
l0491	ds.b	16
l0492	ds.l	1
l0493	ds.l	1
l0494	ds.b	120
l0495	ds.b	8
l0496	ds.b	240
l0497	ds.b	16
l0498	ds.l	1
l0499	ds.l	1
l049a	ds.w	1
l049b	ds.b	32
l049c	ds.l	1
l049d	ds.w	1
l049e	ds.l	1
l049f	ds.w	1
l04a0	ds.w	1
l04a1	ds.b	28000
l04a2	ds.b	4000
l04a3	ds.l	1
l04a4	ds.l	1
l04a5	ds.l	1
l04a6	ds.w	1
l04a7	ds.b	1
l04a8	ds.b	3
l04a9	ds.b	6
l04aa	ds.b	32
l04ab	ds.w	1
l04ac	ds.b	256
l04ad	ds.b	16
l04ae	ds.b	32
l04af	ds.b	32
l04b0	ds.b	32
l04b1	ds.b	8
l04b2	ds.w	1
l04b3	ds.w	1
l04b4	ds.w	1
l04b5	ds.w	1
l04b6	ds.l	1
l04b7	ds.w	1
l04b8	ds.w	1
l04b9	ds.l	1
l04ba	ds.w	1
l04bb	ds.w	1
l04bc	ds.w	1
l04bd	ds.w	1
l04be	ds.w	1
l04bf	ds.w	1
l04c0	ds.w	1
l04c1	ds.w	1
l04c2	ds.w	1
l04c3	ds.w	1
l04c4	ds.w	1
l04c5	ds.w	1
l04c6	ds.w	1
l04c7	ds.w	1
l04c8	ds.w	1
l04c9	ds.w	1
l04ca	ds.b	1
l04cb	ds.b	1
l04cc	ds.b	1
l04cd	ds.b	1
l04ce	ds.b	1
l04cf	ds.b	1
l04d0	ds.w	1
l04d1	ds.b	1
l04d2	ds.b	1
l04d3	ds.w	1
l04d4	ds.w	1
l04d5	ds.w	1
l04d6	ds.w	1
l04d7	ds.b	1
l04d8	ds.b	1
l04d9	ds.w	1
l04da	ds.w	1
l04db	ds.w	1
l04dc	ds.w	1
l04dd	ds.w	1
l04de	ds.b	1
l04df	ds.b	1

; >>>>>> MUSIC DRIVER START

music	movem.l	a0-a6/d0-d7,-(a7)
	bsr	l037a
	movem.l	(a7)+,a0-a6/d0-d7
	rts

	movem.l	a0-a6/d0-d7,-(a7)
	bsr	l0385
	movem.l	(a7)+,a0-a6/d0-d7
	rts

l0374	movem.l	a0-a6/d0-d7,-(a7)
	bsr	l0393
	movem.l	(a7)+,a0-a6/d0-d7
	rts

l0375	movem.l	a0-a6/d0-d7,-(a7)
	bsr	l0395
	movem.l	(a7)+,a0-a6/d0-d7
	rts

l0376	movem.l	a0-a6/d0-d7,-(a7)
	bsr	l03c8
	movem.l	(a7)+,a0-a6/d0-d7
	rts

l0377	movem.l	a0-a6/d0-d7,-(a7)
	bsr	l03d5
	movem.l	(a7)+,a0-a6/d0-d7
	rts

l0378	movem.l	a3,-(a7)
	bsr	l03c5
	movem.l	(a7)+,a3
	rts

l0379	movem.l	a3,-(a7)
	bsr	l03c6
	movem.l	(a7)+,a3
	rts
 
l037a	lea	music(pc),a3
	bsr	l0374
	clr.b	2143(a3)
	ext.w	d0
	mulu	#8,d0
	lea	l03c2(pc),a0
	move.b	1(a0,d0.w),383(a3)
	move.b	l037f(pc),382(a3)
	lea	l037c(pc),a1
	moveq	#2,d7
l037b	move.b	#1,27(a1)
	clr.b	0(a1)
	clr.b	44(a1)
	sf	45(a1)
	sf	46(a1)
	lea	l03bc(pc),a0
	move.l	a0,16(a1)
	move.l	a0,20(a1)
	lea	l03c2(pc),a0
	movea.w	2(a0,d0.w),a0
	move.w	a0,6(a1)
	move.w	#2,10(a1)
	movea.w	0(a3,a0.w),a0
	adda.l	a3,a0
	move.l	a0,2(a1)
	adda.w	#$30,a1
	addq.w	#2,d0
	dbf	d7,l037b
	st	384(a3)
	st	2142(a3)
	st	2140(a3)
	rts

l037c	dcb.w	23
	dc.b	0,9
l037d	dcb.w	23
	dc.b	0,$12
l037e	dcb.w	23
	dc.b	0,'$',0
l037f	dc.b	0,0
l0380	dc.b	0
l0381	dc.b	0
l0382	dc.b	$ff
l0383	dcb.w	2
l0384	rts

l0385	lea	music(pc),a3
	bset	#0,390(a3)
	bne.b	l0387
	move.b	#0,388(a3)
	btst	#7,$fffa01.l
	bne.b	l0386
	move.b	#$48,388(a3)
	bra.b	l0387
l0386	btst	#1,$ff820a.l
	bne.b	l0387
	move.b	#$2b,388(a3)
l0387	move.b	l0383(pc),d0
	add.b	d0,389(a3)
	bcs.b	l0384
	bsr	l03cc
	tst.b	2140(a3)
	beq	l038c
	move.b	l0380(pc),386(a3)
	move.b	l037f(pc),d0
	add.b	d0,384(a3)
	bcc.b	l0388
	lea	l037c(pc),a0
	bsr	l0399
	lea	l037d(pc),a0
	bsr	l0399
	lea	l037e(pc),a0
	bsr	l0399
l0388	lea	l037c(pc),a0
	bsr	l03a6
	move.w	d0,2144(a3)
	move.b	d0,1846(a3)
	move.b	l03c0(pc),1847(a3)
	sub.b	l03c1(pc),d1
	bcc.b	l0389
	moveq	#0,d1
l0389	move.b	d1,1854(a3)
	lea	l037d(pc),a0
	bsr	l03a6
	move.w	d0,2144(a3)
	move.b	d0,1848(a3)
	move.b	l03c0(pc),1849(a3)
	sub.b	l03c1(pc),d1
	bcc.b	l038a
	moveq	#0,d1
l038a	move.b	d1,1855(a3)
	lea	l037e(pc),a0
	bsr	l03a6
	move.w	d0,2144(a3)
	move.b	d0,1850(a3)
	move.b	l03c0(pc),1851(a3)
	sub.b	l03c1(pc),d1
	bcc.b	l038b
	moveq	#0,d1
l038b	move.b	d1,1856(a3)
	move.b	l0381(pc),1852(a3)
l038c	tst.b	2140(a3)
	bne.b	l038d
	clr.w	1854(a3)
	clr.b	1856(a3)
	move.b	#$3f,1853(a3)
l038d	tst.b	3880(a3)
	beq.b	l038f
	ori.b	#$12,1853(a3)
	andi.b	#$fd,1853(a3)
	move.b	l03c7(pc),1855(a3)
	move.w	l03b9(pc),d0
	moveq	#0,d1
	move.b	l03d4(pc),d1
	andi.b	#$3f,d1
	sub.w	d1,d0
	not.b	3881(a3)
	bne.b	l038e
	lsr.w	#1,d0
l038e	move.w	d0,3878(a3)
	move.b	3878(a3),1849(a3)
	move.b	3879(a3),1848(a3)
l038f	tst.b	2141(a3)
	beq.b	l0390
	move.b	1861(a3),1846(a3)
	move.b	1860(a3),1847(a3)
	move.b	1865(a3),1850(a3)
	move.b	1864(a3),1851(a3)
	move.b	1866(a3),1852(a3)
	ori.b	#$2d,1853(a3)
	move.b	1867(a3),d0
	and.b	d0,1853(a3)
	move.b	1868(a3),1854(a3)
	move.b	1870(a3),1856(a3)
	move.b	1872(a3),1858(a3)
l0390	andi.b	#$3f,1853(a3)
	move	sr,d1
	move	#$2700,sr
	move.b	#7,$ff8800.l
	move.b	$ff8800.l,d0
	andi.b	#$c0,d0
	or.b	d0,1853(a3)
	lea	l03b8(pc),a0
	moveq	#$c,d0
l0391	move.b	d0,$ff8800.l
	move.b	-(a0),$ff8802.l
	dbf	d0,l0391
	move	d1,sr
	tst.b	3847(a3)
	beq.b	l0392
	sf	3847(a3)
	move	sr,d1
	move	#$2700,sr
	move.b	#$d,$ff8800.l
	move.b	3844(a3),$ff8802.l
	move	d1,sr
l0392	bra	l0384
l0393	lea	music(pc),a3
	sf	2140(a3)
	sf	3880(a3)
	bra	l0377
l0394	move	sr,d2
	move	#$2700,sr
	move.b	#7,$ff8800.l
	move.b	$ff8800.l,d1
	ori.b	#$3f,d1
	move.b	d1,$ff8802.l
	move.b	#8,$ff8800.l
	move.b	#0,$ff8802.l
	move.b	#9,$ff8800.l
	move.b	#0,$ff8802.l
	move.b	#$a,$ff8800.l
	move.b	#0,$ff8802.l
	move	d2,sr
	rts

l0395	lea	music(pc),a3
	tst.b	2142(a3)
	beq.b	l0396
	st	2140(a3)
l0396	rts

l0397	dc.b	4,$ee,4,$e0,4,$d8,4,$e6
	dc.b	4,$9e,4,$c4,4,$be,4,' '
	dc.b	4,$cc,4,$b2,4,'f',4,'F'
	dc.b	4,$86,4,$e6,4,$16,4,$f2
	dc.b	4,$f4,4,$fa,4,$b8,4,4
	dc.b	3,$fc
	move.b	(a1)+,383(a3)
	bra	l039a
	move.b	(a1)+,6(a0)
	move.b	(a1)+,7(a0)
	move.w	#0,10(a0)
	bra	l039a
	addq.l	#4,a7
	sf	2142(a3)
	bra	l0374
	move.w	10(a0),d0
	movea.w	6(a0),a2
	adda.w	d0,a2
	addq.w	#2,d0
	tst.w	0(a3,a2.w)
	bne.b	l0398
	movea.w	6(a0),a2
	moveq	#2,d0
l0398	movea.w	0(a3,a2.w),a1
	adda.l	a3,a1
	move.w	d0,10(a0)
	bra	l039a
	move.b	47(a0),d0
	move.b	d0,d1
	andi.b	#7,d0
	move.b	l0382(pc),d2
	eor.b	d2,d0
	and.b	d1,d0
	eor.b	d2,d0
	move.b	d0,387(a3)
	st	1(a0)
	bra	l039a
	move.b	47(a0),d0
	move.b	d0,d1
	andi.b	#$38,d0
	move.b	l0382(pc),d2
	eor.b	d2,d0
	and.b	d1,d0
	eor.b	d2,d0
	move.b	d0,387(a3)
	sf	1(a0)
	bra	l039a
	move.b	47(a0),d0
	eori.b	#$ff,d0
	move.b	l0382(pc),d2
	and.b	d2,d0
	and.b	d0,387(a3)
	st	1(a0)
	bra.b	l039a
	clr.w	14(a0)
	bset	#2,0(a0)
	move.b	(a1)+,24(a0)
	move.b	(a1)+,25(a0)
	bra.b	l039a
	move.b	(a1)+,2143(a3)
	bra.b	l039a
	move.b	(a1)+,46(a0)
	bra.b	l039a
	bset	#7,0(a0)
	bset	#3,0(a0)
	bra.b	l039a
	move.b	(a1)+,42(a0)
	move.b	(a1),41(a0)
	move.b	(a1)+,43(a0)
	move.b	#$40,44(a0)
	bra.b	l039a
	clr.b	44(a0)
	bra.b	l039a
	bset	#1,0(a0)
	bra.b	l039a
	clr.b	30(a0)
	bra.b	l039c
	st	45(a0)
	bra.b	l039a
	sf	45(a0)
	bra.b	l039a
l0399	subq.b	#1,27(a0)
	bne	l039e
	clr.b	0(a0)
	movea.l	2(a0),a1
l039a	moveq	#0,d0
	move.b	(a1)+,d0
	bmi	l03a1
	move.b	d0,29(a0)
	tst.b	1(a0)
	beq.b	l039b
	move.b	d0,385(a3)
l039b	movea.l	36(a0),a2
	move.l	a2,32(a0)
	move.b	(a2),40(a0)
	move.b	(a2),30(a0)
	move.b	26(a0),31(a0)
	bset	#5,0(a0)
l039c	move.b	28(a0),27(a0)
	move.l	a1,2(a0)
	tst.b	45(a0)
	beq.b	l039d
	tst.b	2141(a3)
	bne.b	l039d
	st	45(a0)
l039d	rts

l039e	btst	#3,0(a0)
	bne.b	l039f
	rts

l039f	btst	#7,0(a0)
	beq.b	l03a0
	addq.b	#1,29(a0)
	rts

l03a0	subq.b	#1,29(a0)
	rts

l03a1	cmp.b	#$b8,d0
	bcs.b	l03a5
	addi.b	#$20,d0
	bcs.b	l03a3
	addi.b	#$10,d0
	bcs.b	l03a4
	addi.b	#$10,d0
	bcc.b	l03a2
	add.w	d0,d0
	lea	l03bb(pc),a2
	movea.w	0(a2,d0.w),a2
	adda.l	a3,a2
	move.l	a2,20(a0)
	move.l	a2,16(a0)
	bra	l039a
l03a2	addi.b	#9,d0
	move.b	d0,383(a3)
	bra	l039a
l03a3	addq.b	#1,d0
	move.b	d0,28(a0)
	bra	l039a
l03a4	add.w	d0,d0
	lea	l03d6(pc),a2
	movea.w	0(a2,d0.w),a2
	adda.l	a3,a2
	move.l	a2,36(a0)
	move.b	-(a2),26(a0)
	bra	l039a
l03a5	andi.w	#$7f,d0
	add.w	d0,d0
	lea	l0397(pc),a2
	movea.w	0(a2,d0.w),a2
	jmp	0(a3,a2.w)
l03a6	moveq	#0,d7
	move.b	0(a0),d7
	btst	#5,d7
	beq.b	l03a8
	subq.b	#1,31(a0)
	bcc.b	l03a7
	move.b	26(a0),31(a0)
	movea.l	32(a0),a2
	move.b	1(a2),d0
	bmi.b	l03a7
	addq.l	#1,32(a0)
	move.b	d0,40(a0)
l03a7	move.b	40(a0),30(a0)
l03a8	move.b	29(a0),d0
	add.b	l03bf(pc),d0
	add.b	46(a0),d0
	movea.l	20(a0),a1
	move.b	(a1)+,d1
	bclr	#7,d1
	beq.b	l03a9
	movea.l	16(a0),a1
l03a9	move.l	a1,20(a0)
	add.b	d1,d0
	lea	l03ba(pc),a1
	add.b	d0,d0
	moveq	#0,d1
	move.b	d0,d1
	adda.w	d1,a1
	move.w	(a1),d0
	move.b	44(a0),d6
	btst	#6,d6
	beq.b	l03b1
	move.b	d1,d5
	move.b	41(a0),d4
	lsl.b	#1,d4
	move.b	43(a0),d1
	btst	#7,d6
	beq.b	l03aa
	btst	#0,d7
	bne.b	l03ad
l03aa	btst	#5,d6
	bne.b	l03ab
	sub.b	42(a0),d1
	bcc.b	l03ac
	bset	#5,44(a0)
	moveq	#0,d1
	bra.b	l03ac
l03ab	add.b	42(a0),d1
	cmp.b	d4,d1
	bcs.b	l03ac
	bclr	#5,44(a0)
	move.b	d4,d1
l03ac	move.b	d1,43(a0)
l03ad	lsr.b	#1,d4
	sub.b	d4,d1
	bcc.b	l03ae
	subi.w	#$100,d1
l03ae	addi.b	#$a0,d5
	bcs.b	l03b0
l03af	lsl.w	#1,d1
	addi.b	#$18,d5
	bcc.b	l03af
l03b0	add.w	d1,d0
l03b1	eori.b	#1,d7
	move.b	d7,0(a0)
	btst	#2,d7
	beq.b	l03b4
	move.b	25(a0),d4
	subq.b	#1,d4
	bne.b	l03b3
	clr.w	d6
	move.b	24(a0),d6
	bpl.b	l03b2
	addi.w	#$ff00,d6
l03b2	add.w	14(a0),d6
	move.w	d6,14(a0)
	add.w	d6,d0
	bra.b	l03b4
l03b3	move.b	d4,25(a0)
l03b4	eori.b	#$ff,d7
	move.b	l0382(pc),d3
	andi.b	#3,d7
	bne.b	l03b5
	move.b	l0380(pc),d3
	eori.b	#8,d3
	move.b	d3,386(a3)
	move.b	#7,d3
l03b5	move.b	l03b7(pc),d2
	eor.b	d2,d3
	and.b	47(a0),d3
	eor.b	d2,d3
	move.b	45(a0),d1
	bpl.b	l03b6
	andi.b	#$7f,45(a0)
	move.b	47(a0),d1
	andi.b	#$38,d1
	not.b	d1
	and.b	d1,d3
	move.b	#1,386(a3)
l03b6	move.b	d3,1853(a3)
	move.b	30(a0),d1
	rts

	dcb.w	3
	dc.b	0
l03b7	dc.b	'?',0,0,0,0,0
l03b8	dc.b	0,0,0
l03b9	dcb.w	2
	dc.b	0,'?',$10,0,$10,0,$ff,0
l03ba	dc.b	$e,$ee,$e,$17,$d,'M',$c,$8e
	dc.b	$b,$d9,$b,'/',$a,$8e,9,$f7
	dc.b	9,'g',8,$e0,8,'a',7,$e8
	dc.b	7,'w',7,$b,6,$a6,6,'G'
	dc.b	5,$ec,5,$97,5,'G',4,$fb
	dc.b	4,$b3,4,'p',4,'0',3,$f4
	dc.b	3,$bb,3,$85,3,'S',3,'#'
	dc.b	2,$f6,2,$cb,2,$a3,2,'}'
	dc.b	2,'Y',2,'8',2,$18,1,$fa
	dc.b	1,$dd,1,$c2,1,$a9,1,$91
	dc.b	1,'{',1,'e',1,'Q',1,'>'
	dc.b	1,',',1,$1c,1,$c,0,$fd
	dc.b	0,$ee,0,$e1,0,$d4,0,$c8
	dc.b	0,$bd,0,$b2,0,$a8,0,$9f
	dc.b	0,$96,0,$8e,0,$86,0,'~'
	dc.b	0,'w',0,'p',0,'j',0,'d'
	dc.b	0,'^',0,'Y',0,'T',0,'O'
	dc.b	0,'K',0,'G',0,'C',0,'?'
	dc.b	0,';',0,'8',0,'5',0,'2'
	dc.b	0,'/',0,',',0,'*',0,$27
	dc.b	0,'%',0,'#',0,'!',0,$1f
	dc.b	0,$1d,0,$1c,0,$1a,0,$19
	dc.b	0,$17,0,$16,0,$15,0,$13
	dc.b	0,$12,0,$11,0,$10,0,$f
l03bb	dc.b	8,'0',8,'1',8,'4',8,'7'
	dc.b	8,'9',8,'=',8,'@',8,'C'
	dc.b	8,'F',8,'I',8,'K',8,'M'
	dc.b	8,'O',8,'Q',8,'S'
l03bc	dc.b	$80,0,3,$87,0,4,$87,0
	dc.b	$89,0,4,7,$8c,7,$c,$8f
	dc.b	7,$c,$90,3,7,$8c,4,7
	dc.b	$8c,0,$8c,0,$83,0,$84,0
	dc.b	$85,0,$87,$c,0,0,0,0
	dc.b	0,0,0,$80
l03bd	dc.b	0
l03be	dc.b	0,0
l03bf	dc.b	0
l03c0	dc.b	0,0
l03c1	dc.b	0,0
l03c2	dc.b	0,$1c,8,$90,8,$8c,8,$94
	dc.b	0,$9c,9,'$',9,$1a,9,'('
	dc.b	0,'$',$a,$c,$a,6,$a,$12
	dc.b	0,$1e,$b,'h',$b,'L',$b,$84
	dc.b	0,'L',$d,'4',$d,'0',$d,'8'
	dc.b	8,$98,0,0,8,$b1,0,0
	dc.b	8,$e3,0,0,$89,1,$8a,$90
	dc.b	$88,2,2,$d4,$c0,$e0,5,5
	dc.b	9,$c,5,$e1,$11,$f,$c,$f
	dc.b	$e0,$f,$f,$11,$87,$e0,$c0,$d0
	dc.b	$8a,$84,1,1,$8d,$c,$8b,1
	dc.b	7,1,$8a,$84,1,1,$8d,$c
	dc.b	$8b,1,7,1,$8d,$1f,$8b,1
	dc.b	7,$8a,$84,1,1,$8d,$c,$8d
	dc.b	$1f,$8b,1,$8a,$84,1,1,$8d
	dc.b	$c,$84,1,1,$8d,$c,$87,$8a
	dc.b	$c9,$88,2,2,$db,$ea,$15,$e4
	dc.b	$80,$e7,$15,' %',$e3,$80,$e0
	dc.b	$d4,$c4,'%%%',$80,$db,$c9
	dc.b	$e7,$11,'!%',$e3,$80,$e0,$d4
	dc.b	$c4,'%%%',$80,$db,$c9,$ef
	dc.b	' ',$1a,$e7,'%',$e3,$80,$e0,$d4
	dc.b	$c4,'%%%',$80,$87,9,'2'
	dc.b	9,'2',9,'2',9,'_',0,0
	dc.b	$d,'`',0,0,9,$92,9,$92
	dc.b	9,$92,9,$cd,0,0,$8a,$d1
	dc.b	$88,2,2,$90,$eb,$84,'P',1
	dc.b	$c,$84,'P',1,$10,$84,'P',1
	dc.b	$c,$84,'P',1,$13,$84,'P',1
	dc.b	$c,$84,'P',1,$10,$84,'P',1
	dc.b	$c,$e5,$84,'P',1,$13,$84,'P'
	dc.b	1,$e,$87,$eb,$84,'P',1,$c
	dc.b	$84,'P',1,$10,$84,'P',1,$c
	dc.b	$84,'P',1,$13,$84,'P',1,$c
	dc.b	$84,'P',1,$10,$e3,$84,'P',1
	dc.b	$13,$84,'P',1,$10,$84,'P',1
	dc.b	$c,$84,'P',1,$13,$84,'P',1
	dc.b	$10,$84,'P',1,$c,$87,$8b,$e2
	dc.b	$d0,$8d,$1f,$d9,1,1,1,$d2
	dc.b	$8d,7,$d9,1,1,1,$d0,$8d
	dc.b	$1f,$d9,1,1,1,$d2,$8d,9
	dc.b	$d9,1,1,1,$d0,$8d,$1f,$d9
	dc.b	1,1,1,$d2,$8d,7,$d9,1
	dc.b	1,1,$d0,$8d,$1f,$d9,1,1
	dc.b	1,$d2,$8d,7,$d9,1,7,7
	dc.b	$87,$d0,$8d,$1f,$d9,1,1,1
	dc.b	$d2,$8d,7,$d9,1,1,1,$d0
	dc.b	$8d,$1f,$d9,1,1,1,$d2,$8d
	dc.b	9,$d9,1,1,1,$d0,$8d,$1f
	dc.b	$d9,1,1,1,$d2,$8d,7,$d9
	dc.b	1,1,1,$e3,$d0,$8d,7,$8d
	dc.b	6,$8d,5,$8d,7,$8d,6,$8d
	dc.b	5,$87,$a,$18,$a,'.',0,0
	dc.b	$a,$d1,$a,$e1,0,0,$b,$f
	dc.b	$b,$1c,0,0,$89,1,$90,$8a
	dc.b	$88,2,2,$d2,$e0,2,4,5
	dc.b	7,9,$b,$94,'4',$e1,$93,$a
	dc.b	8,$87,$c,$18,$8d,$c,$18,$c
	dc.b	$18,$8b,$8d,$1f,$8a,$c,$c,$18
	dc.b	$8d,$c,$18,$c,$18,$8b,$8d,7
	dc.b	$8a,$c,$c,$18,$8d,$c,$18,$c
	dc.b	$18,$8b,$8d,$1f,$8a,$c,$c,$18
	dc.b	$8d,$c,$18,$c,$18,$8b,$8d,3
	dc.b	$8a,$c,$8d,$13,$13,$13,$8d,$11
	dc.b	$11,$11,$8d,$13,$13,$13,$8d,$11
	dc.b	$11,$11,$8d,$11,$11,$13,$17,$c
	dc.b	$18,$8d,$c,$18,$c,$18,$8b,$8d
	dc.b	$1f,$8a,$c,$c,$13,$8d,$13,$11
	dc.b	$11,$10,$8b,$8d,$1f,$8a,$e,$c
	dc.b	$c,$8d,$c,$c,$c,$c,$8b,$8d
	dc.b	7,$8a,$c,$c,$c,$8d,$c,$c
	dc.b	$c,$c,$8b,$8d,7,$8a,$c,$c
	dc.b	$18,$8d,$c,$18,$c,$18,$8b,$8d
	dc.b	3,$8a,$c,$c,$18,$8d,$c,$18
	dc.b	$c,$18,$8b,$8d,3,$8a,$c,$8d
	dc.b	$13,$13,$13,$8d,$11,$11,$11,$8d
	dc.b	$13,$13,$13,$8d,$11,$11,$11,$8d
	dc.b	$11,$11,$13,$17,$87,$8a,$88,2
	dc.b	2,$d1,$e0,$e,$10,$11,$13,$15
	dc.b	$17,$93,$a,$e,$87,$d6,$88,2
	dc.b	4,$f7,'$',$e3,')(',$f7,'$'
	dc.b	$e3,')(',$e5,'+)+)'
	dc.b	$e3,')(',$f7,'$',$e3,')('
	dc.b	$f7,'$',$e3,')(',$f7,'$',$e3
	dc.b	')(',$e5,'+)+)',$e3
	dc.b	')(',$87,$8b,$d0,$e0,1,1
	dc.b	1,1,1,1,$93,$a,$14,$87
	dc.b	$8a,$d6,$88,2,4,$f7,'(',$e3
	dc.b	'-+',$f7,'(',$e3,'-+',$e5
	dc.b	'/-/-',$e3,'-+',$f7
	dc.b	'(',$e3,'-+',$f7,'(',$e3,'-'
	dc.b	'+',$f7,'(',$e3,'-+',$e5,'/'
	dc.b	'-/-',$e3,'-+',$87,0
	dc.b	$b,$a6,$b,$a6,$b,$a6,$b,$a6
	dc.b	$b,$a6,$b,$a6,$b,$bf,$b,$e7
	dc.b	$b,$e7,$c,'8',$c,'8',$c,'Q'
	dc.b	$c,'Q',0,0,$c,'j',$c,'j'
	dc.b	$c,'|',$c,'|',$c,'j',$c,'j'
	dc.b	$c,'|',$c,'|',$c,$8a,$c,$9f
	dc.b	$c,$9f,$c,$b4,$c,$b4,0,0
	dc.b	$c,$c5,$c,$c5,$c,$d8,$c,$d8
	dc.b	$c,$c5,$c,$c5,$c,$d8,$c,$d8
	dc.b	$c,$e5,$c,$e5,$c,$f8,$c,$f8
	dc.b	$d,8,$d,8,$d,$1e,$d,$1e
	dc.b	0,0,$89,$ff,$81,$91,$8b,$e0
	dc.b	$d0,$8d,$1f,$d9,1,$d0,$8d,$1f
	dc.b	$d9,1,$e1,$d0,$8d,$1f,$e0,$8d
	dc.b	$1f,7,$87,$8b,$e0,$d9,7,7
	dc.b	$d0,$8d,$1f,$d9,7,$e1,$d0,$8d
	dc.b	7,$e0,$8d,7,$d9,1,7,7
	dc.b	$d0,$8d,$1f,$d9,7,$d2,$8d,7
	dc.b	$8a,$88,2,2,$d2,$90,7,$8d
	dc.b	9,$b,$87,$c,$c,$8d,$c,$c
	dc.b	$c,$c,$8d,$c,$c,$c,$c,$8d
	dc.b	$c,$c,$c,7,$8d,9,$b,$c
	dc.b	$c,$8d,$c,$c,$c,$c,$8d,$c
	dc.b	$c,$c,$c,$8d,$c,$c,$c,7
	dc.b	$8d,9,$b,$a,$a,$8d,$a,$a
	dc.b	$a,$a,$8d,$a,$a,$a,$a,$8d
	dc.b	$a,$a,$a,5,$8d,7,9,$a
	dc.b	$a,$8d,$a,$a,$a,$a,$8d,$a
	dc.b	$a,$a,$a,$8d,$a,$a,$a,5
	dc.b	$8d,7,9,$87,$8d,$11,$11,$8d
	dc.b	$11,$11,$8d,$13,$13,$13,$13,$8d
	dc.b	$15,$15,$8d,$15,$15,$8d,$16,$16
	dc.b	$8d,$16,$8d,$18,$87,$8d,$f,$f
	dc.b	$8d,$f,$f,$8d,$11,$11,$11,$11
	dc.b	$8d,$13,$13,$8d,$13,$13,$8d,$15
	dc.b	$15,$8d,$15,$8d,$16,$87,$8a,$88
	dc.b	2,4,$e0,$80,$d6,$e1,'$',$e0
	dc.b	$80,$e6,'$',$e3,'$',$e0,$80,$87
	dc.b	$e0,$80,$d6,$e1,'"',$e0,$80,$e6
	dc.b	'"',$e3,'"',$e0,$80,$87,$88,2
	dc.b	4,$d8,$ed,'-',$e1,'+',$e5,'0'
	dc.b	$e1,'-',$e3,'2',$e2,'0',$ff,'.'
	dc.b	$e0,$8f,$87,$e0,$80,$88,3,6
	dc.b	$d6,$e1,'$',$e0,$80,$e3,'$',$e1
	dc.b	'$',$e0,$80,$e3,'$',$e0,$80,$87
	dc.b	$e0,$80,$e1,'"',$e0,$80,$e3,'"'
	dc.b	$e1,'"',$e0,$80,$e3,'"',$e0,$80
	dc.b	$87,$8a,$c0,$88,2,4,$e0,$80
	dc.b	$d6,$e1,'-',$e0,$80,$e6,'-',$e3
	dc.b	'+',$e0,$80,$87,$e0,$80,$e1,'+'
	dc.b	$e0,$80,$e6,'+',$e3,')',$e0,$80
	dc.b	$87,$e0,$80,$88,1,2,$d6,$c3
	dc.b	$e1,'$',$e0,$80,$e6,'$',$cd,$e3
	dc.b	'$',$e0,$80,$87,$e0,$80,$c3,$e1
	dc.b	'"',$e0,$80,$e6,'"',$cd,$e3,'"'
	dc.b	$e0,$80,$87,$87,$e0,$80,$c0,$88
	dc.b	2,4,$d4,$e1,'-',$e0,$80,$e3
	dc.b	'-',$e1,'-',$e0,$80,$e3,'-',$e0
	dc.b	$80,$87,$e0,$80,$e1,'+',$e0,$80
	dc.b	$e3,'+',$e1,'+',$e0,$80,$e3,'+'
	dc.b	$e0,$80,$87,0,$d,'<',0,0
	dc.b	$d,'H',0,0,$d,'T',0,0
	dc.b	$89,1,$8a,$d2,$88,1,1,$e2
	dc.b	':',$ed,'0',$8e,$e0,$80,$8a,$d2
	dc.b	$88,1,1,$e2,'7',$ec,'<',$8e
	dc.b	$e1,$80,$8a,$d2,$88,1,1,$e1
	dc.b	'4',$eb,'H',$8e,$fe,$80,$87,0
l03c3	dc.b	$d,$8c,$d,$9e,$d,$b0,$d,$c2
	dc.b	$d,$d4,$d,$e6,$d,$f8,$e,$a
	dc.b	$e,$1c,$e,'.',$e,'@',$e,'R'
	dc.b	$e,'d',$e,'v',$e,$88,$e,$9a
	dc.b	$e,$ac,$e,$be,$e,$d0,$e,$e2
	dc.b	$a,5,1,$e0,1,$e8,$14,$fa
	dc.b	0,2,0,2,1,$ff,'c',0
	dc.b	0,0,'<c',0,0,0,1
	dc.b	'2',$d7,0,1,0,1,$ff,$ff
	dc.b	9,1,0,0,3,3,0,'`'
	dc.b	0,'\',1,$fa,0,1,0,1
	dc.b	0,0,'c',0,$e,0,4,3
	dc.b	0,$15,0,$1d,'<',$d2,0,1
	dc.b	0,1,1,1,'c',0,0,0
	dc.b	$1e,'c',0,0,1,$c0,$1e,$f3
	dc.b	0,1,0,1,$ff,1,'c',0
	dc.b	0,0,$ff,0,$e,2,$e,'B'
	dc.b	$ff,$fa,0,4,0,4,1,1
	dc.b	$ff,0,0,0,'(',2,0,'q'
	dc.b	0,'7(',$fa,0,1,0,0
	dc.b	1,1,'c',0,0,0,$c,5
	dc.b	0,$92,0,$89,'(',$fa,0,2
	dc.b	0,2,$ff,$ff,'c',0,0,0
	dc.b	$a,6,8,2,8,'"',$a,$f2
	dc.b	1,'2',1,'1',$ff,$ff,6,0
	dc.b	0,0,$a,3,0,$82,0,'y'
	dc.b	'(',$fa,0,2,0,2,1,1
	dc.b	$ff,0,0,0,$f,'c',1,$82
	dc.b	1,'B',$14,$fa,0,$a,0,$a
	dc.b	1,1,$ff,0,0,0,$ff,2
	dc.b	$f,$ff,0,$1f,$ff,$de,8,4
	dc.b	0,1,1,1,$ff,0,0,0
	dc.b	$ff,2,$f,$ff,$f,$ee,1,$fa
	dc.b	0,'D',0,'D',1,1,$ff,0
	dc.b	$d,0,'d',2,8,'@',4,'!'
	dc.b	'2',$fa,0,$10,0,$10,1,1
	dc.b	$ff,0,0,0,'2',5,0,1
	dc.b	0,0,'(',$d7,0,4,0,6
	dc.b	$ff,$ff,'c',0,0,0,$14,'c'
	dc.b	0,$d,0,$d,'#',$d7,0,1
	dc.b	0,1,$ff,$ff,$ff,0,0,0
	dc.b	$8c,9,8,$10,$e,$10,'x',$f2
	dc.b	0,$c0,0,$e1,1,1,$b5,0
	dc.b	0,0,'<',$f,0,$10,0,$10
	dc.b	'<',$d7,0,1,0,1,$ff,$ff
	dcb.w	2
	dc.b	'2',3,0,$1c,0,0,'(',$f7
	dc.b	0,1,0,0,$ff,0,0,0
	dc.b	0,0,'(c',1,2,1,$d
	dc.b	'(',$d2,0,'D',0,'N',$ff,$ff
	dc.b	'c',0,0,0
l03c4	dcb.w	10
l03c5	lea	music(pc),a3
	st	3880(a3)
	move.w	#$f00,1862(a3)
	rts

l03c6	lea	music(pc),a3
	sf	3880(a3)
	sf	1855(a3)
	rts

	dcb.w	2
l03c7	dc.b	$d,0
l03c8	lea	music(pc),a3
	sf	2141(a3)
	ext.w	d0
	add.w	d0,d0
	lea	l03c3(pc),a0
	movea.w	0(a0,d0.w),a0
	adda.l	a3,a0
	move.w	#$12,d0
	lea	l03c4(pc),a1
l03c9	move.b	(a0)+,(a1)+
	dbf	d0,l03c9
	move.b	3829(a3),3846(a3)
	move.w	3830(a3),1860(a3)
	move.w	3832(a3),1864(a3)
	move.b	3831(a3),1866(a3)
	move.b	3835(a3),1867(a3)
	move.b	3834(a3),1872(a3)
	move.b	#$10,1868(a3)
	move.b	#$10,1870(a3)
	st	3847(a3)
	st	2141(a3)
	rts

l03ca	sf	2141(a3)
	rts

l03cb	rts

l03cc	lea	music(pc),a3
	bsr	l03d3
	tst.b	3828(a3)
	beq.b	l03ca
	subq.b	#1,3828(a3)
	tst.b	3846(a3)
	bne.b	l03ce
	tst.b	3842(a3)
	beq.b	l03cb
	subq.b	#1,3842(a3)
	move.b	3829(a3),3846(a3)
	move.b	3843(a3),d0
	beq.b	l03cd
	move.b	4158(a3),d0
l03cd	move.b	3831(a3),d1
	add.b	d0,d1
	move.b	d1,1861(a3)
	move.b	3830(a3),d1
	addx.b	d0,d1
	andi.b	#$f,d1
	move.b	d1,1860(a3)
	move.w	3832(a3),1864(a3)
l03ce	subq.b	#1,3846(a3)
	tst.b	3840(a3)
	beq.b	l03d0
	bpl.b	l03cf
	move.w	3836(a3),d0
	add.w	d0,1860(a3)
	bra.b	l03d0
l03cf	move.w	3836(a3),d0
	sub.w	d0,1860(a3)
l03d0	tst.b	3841(a3)
	beq.b	l03d2
	bpl.b	l03d1
	move.w	3838(a3),d0
	add.w	d0,1864(a3)
	bra.b	l03d2
l03d1	move.w	3838(a3),d0
	sub.w	d0,1864(a3)
l03d2	move.b	1861(a3),1866(a3)
	rts

l03d3	move.b	l03d4(pc),d0
	andi.b	#$48,d0
	addi.b	#$38,d0
	lsl.b	#2,d0
	roxl	4160(a3)
	roxl	4158(a3)
	move.b	l03d4(pc),d0
	rts

l03d4	dc.b	'o',$80,$1b,'4'
l03d5	lea	music(pc),a3
	sf	2141(a3)
	bra	l0394
l03d6	dc.b	$10,'g',$10,'p',$10,'w',$10,$89
	dc.b	$10,$b3,$10,$bc,$10,$e6,$10,$ee
	dc.b	$11,$1e,$11,'%',$11,'+',$11,'9'
	dc.b	1,$e,$d,$c,$b,$a,8,6
	dc.b	$87,2,$f,$e,$d,$c,$b,$87
	dc.b	1,$f,$f,$e,$c,$d,$c,$a
	dc.b	9,$b,$a,8,7,9,8,6
	dc.b	5,$87,1,$f,$e,$c,$b,$a
	dc.b	$d,$c,$b,$a,9,$b,$a,9
	dc.b	8,7,9,8,7,6,5,7
	dc.b	6,5,4,3,5,4,3,2
	dc.b	1,4,3,2,1,3,2,1
	dc.b	2,1,0,$87,1,$f,$f,$e
	dc.b	$d,$c,$b,$a,$87,2,$f,$e
	dc.b	$d,$c,$b,$d,$c,$b,$a,9
	dc.b	$b,$a,9,8,7,9,8,7
	dc.b	6,5,7,6,5,4,3,5
	dc.b	4,3,2,1,4,3,2,1
	dc.b	3,2,1,2,1,0,$87,1
	dc.b	$d,$e,$e,$d,$c,$b,$87,2
	dc.b	$a,$b,$c,$d,$e,$f,$f,$e
	dc.b	$e,$e,$e,$d,$d,$c,$c,$c
	dc.b	$c,$b,$b,$b,$b,$a,$a,$a
	dc.b	$a,9,9,9,9,8,8,8
	dc.b	8,7,7,7,7,6,6,6
	dc.b	6,5,4,3,2,1,$87,1
	dc.b	$f,$f,$e,$d,$c,$87,1,$f
	dc.b	$e,9,1,$87,1,$e,$d,$c
	dc.b	$b,9,8,7,6,5,4,2
	dc.b	1,$87,2,$a,$b,$c,$d,$e
	dc.b	$f,$f,$e,$e,$e,$e,$d,$d
	dc.b	$c,$87,$11,'V',$11,'f',$11,'~'
	dc.b	$11,$80,$11,$ac,$11,$d0,$11,$df
	dc.b	$f,$e,$d,$c,$b,$a,9,8
	dc.b	7,6,5,4,3,2,1,$ff
	dc.b	6,8,$a,$b,$c,$d,$e,$e
	dc.b	$e,$d,$d,$c,$c,$b,$b,9
	dc.b	8,7,6,5,4,3,1,$ff
	dc.b	$e,$80,7,8,9,9,8,7
	dc.b	8,9,$a,9,8,8,7,8
	dc.b	9,8,9,8,9,8,7,7
	dc.b	8,8,8,9,8,7,6,7
	dc.b	8,7,6,7,8,8,7,7
	dc.b	8,9,9,9,8,$80,$d,$c
	dc.b	$b,$a,9,$b,$a,9,8,7
	dc.b	9,8,7,6,5,7,6,5
	dc.b	4,3,5,4,3,2,1,4
	dc.b	3,2,1,3,2,1,2,1
	dc.b	0,$ff,$a,$c,$e,$f,$e,$d
	dc.b	$c,$b,$a,9,8,7,6,5
	dc.b	$ff,$b
	or.b	d0,d0
	nop
l03d7	move.l	a0,-(a7)
	move.w	d7,-(a7)
	lea	l03ff,a0
	tst.b	l03be
	beq.b	l03d8
	move.w	d0,d7
	lsl.w	#2,d7
	move.b	1(a0,d7.w),d7
	cmp.b	l04ca,d7
	bcs.b	l03d9
l03d8	move.w	d0,d7
	lsl.w	#2,d7
	move.b	1(a0,d7.w),l04ca
	bsr	l0376
l03d9	move.w	(a7)+,d7
	movea.l	(a7)+,a0
	rts

; >>>>>> MUSIC DRIVER END

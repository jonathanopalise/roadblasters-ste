    ORG $11b8c

    include generated/symbols_0x80000.inc

    move.w background_shift,d0
    add.w d1,d0

    cmp.w #319,d0
    ble.s no_overflow

    sub.w #320,d0

no_overflow:

    cmp.w #0,d0
    bge.s no_underflow

    add.w #320,d0

no_underflow:

    move.w d0,background_shift
    rts

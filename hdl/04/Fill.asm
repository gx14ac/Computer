    @R0
    M=0 // RO=0

    @8192 // screen_size 32*256
    D=A
    @number_of_pixel
    M=D // number_of_pixel=8192
(LOOK_KBD)
    @KBD // M = KBD
    D=M // D=KBD
    @KEY_PRESSED
    D;JNE
(KEY_NOT_PRESSED)
    @R1
    M=0 // R1 = 0
    @CHECK_STATE_CHANGE
    0;JMP
(KEY_PRESSED)
    @R1
    M=1 // R1 = 1
(CHECK_STATE_CHANGE) // if R0 != R1 then update screen
    @R0
    D=M
    @R1
    D=D-M
    @LOOP_KBD
    D;JEQ
    
    @R1
    D=M
    @R0
    M=D

    @SET_WHITE
    D;JEQ
(SET_BLACK)
    @color
    M=-1
    @PREPARE_FILL
    0;JMP
(SET_WHITE)
    @color
    M=0
(PREPARE_FILL)
    @SCREEN
    D=A
    @position
    M=D
    @count
    M=0
(LOOP_FILL)
    @count
    D=M
    @number_of_pixel
    D=M-D
    @FILL_END
    D;JEQ

    @color
    D=M
    @position
    A=M
    M=D

    @position
    M=M+1
    @count
    M=M+1
    @LOOP_FILL
    0;JMP
(FILL_END)
    @R1
    M=0
    @LOOK_KBD
    0;JMP
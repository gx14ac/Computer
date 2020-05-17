// Multiplication Program
    @R2
    M=0     // R2 = 0
    @i
    M=1     // i = 1
(LOOP)
    @i
    D=M     // D = i
    @R1     
    D=D-M   // D = i - R1
    @END
    D;JGT   // if D > 0 then goto END
    @R0
    D=M     // D = R0
    @R2
    M=D+M   // R2 += R0
    @i
    M=M+1   // i++
    @LOOP
    0;JMP   // Goto LOOP
(END)
    @END
    0;JMP   // Goto END (infinite loop)
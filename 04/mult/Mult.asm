// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Put your code here.              

    @R0
    D = M               
    @x
    M = D               // x = RAM[0]
    @R1
    D = M      
    @R2
    M = 0         
    @n
    M = D               // n = RAM[1]
    @i                  
    M = 1               // i = 0 
    @sum
    M = 0               // sum = 0

(LOOP)                  // add n times x to sum
    @i                  // if i - n >= 0, go to end
    D = M               // D = i
    @n
    D = D - M           // i - n >= 0
    @STOP
    D; JGT
    @x                  
    D = M
    @sum
    M = M + D           // sum += x
    @i
    M = M + 1           //increment i
    @LOOP
    0; JMP

(STOP)
    @sum
    D = M
    @R2
    M = D               //R2 = sum

(END)
    @END
    0; JMP
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

    @R0                 // take the value at address 0
    D = M               // put it in register D
    @x                  // create a variable x
    M = D               // assign the value at address 0 to x. x = RAM[0]
    @R1                 // take the value at address 1
    D = M               // put it in register D
    @n                  // create variable n 
    M = D               // n = RAM[1]
    @R2                 // go to address 2, where we will put the product of R1 and R0
    M = 0               // Initialise it to 0
    @i                  // create a variable i that acts as a counter
    M = 0               // i = 1 
    @sum                // we will store the result in a variable sum
    M = 0               // sum = 0

(LOOP)                  // add n times x to sum
    @i                  // if i - n >= 0, go to end
    D = M               // D = i
    @n
    D = D - M           // i - n >= 0
    @STOP
    D; JGE
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
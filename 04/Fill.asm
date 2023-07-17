// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.

(LOOP)                      //the infinite loop of our program
    @SCREEN                 // use the label
    D = A                   // set D = base adress of screen
    @address                // variable to store the address of screen
    M = D                   // pointer = 16384 (base address)
    @i                      // set i as the loop counter
    M = 0                   // initialise i
    @8192
    D = A
    @n                      // set n as the bound of the loop
    M = D                   // n = 8192 (the number of pixels on screen)

    @KBD                    // Go the the address of the keyboard mem
    D = M                   // save the value of the keyboard status in D
    @NOINPUT
    D; JEQ                  // If the keyboard has no input, set screen to white
                            // else we turn all the pixels on
                            // make a loop that turns 32 consecutive 16bits words to 1

    (LOOP2)
    //conditional jump if i>=n
    @i
    D = M                   //load i into the register D
    @n
    D = D - M               // D = i - n
    @END                   
    D;JGE                   // if i >= n, exit the loop and go to end
    
     //RAM[arr+i] = -1
    @address
    D = M
    @i
    A = M + D
    M = -1 

    //i++
    @i
    M = M + 1

    @LOOP2
    0;JMP

(NOINPUT)
    (LOOP3)
    //conditional jump if i>=n
    @i
    D = M                   //load i into the register D
    @n
    D = D - M               // D = i - n
    @END                   
    D;JGE                   // if i >= n, exit the loop and go to end
    
     //RAM[arr+i] = -1
    @address
    D = M
    @i
    A = M + D
    M = 0 

    //i++
    @i
    M = M + 1

    @LOOP3
    0;JMP

(END)
    @LOOP
    0;JMP

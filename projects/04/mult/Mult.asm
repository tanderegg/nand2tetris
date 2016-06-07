// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)

// Set D to be equal to the value at RAM[1]
@1
D=M

// Set i to be equal to D
@i
M=D

// Set mult to be equal to 0
@mult
M=0

(LOOP)

// Set D to be equal to Mult
@mult
D=M

// Add the value at RAM[0] to D
@0
D=M+D

// Store D in mult
@mult
M=D

// Set D to be equal to i
@i
D=M

// Subtract 1 from i, and store it back into M
D=D-1
M=D

// Jump if i <= 0
@ENDLOOP
D;JLE

// Otherwise restart the loop
@LOOP
0;JMP

(ENDLOOP)
// Store the value of mult in RAM[2]
@mult
D=M
@2
M=D

(END)

// Infinite loop = halt
@END
0;JMP

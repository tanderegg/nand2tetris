// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, the
// program clears the screen, i.e. writes "white" in every pixel.

(LOOP)

// Get the current key
@24576
D=M

// Jump to WHITE if no key is pressed
@WHITE
D;JEQ

// Otherwise, set the screen to black

// Set D to the screen memory map address
@SCREEN
D=A

// Set pos to that value
@pos
M=D

(BLACKLOOP)

// Set D to 1
@1
D=A

// Set the value at pos to D
@pos
A=M
M=D

// Increment pos
@pos
M=M+1
D=M

// Keep looping until we've hit the end, 24576
@24576
D=D-A

@BLACKLOOP
D;JLT


@LOOP
0;JMP

(WHITE)

// Set D to the screen memory map address
@SCREEN
D=A

// Set pos to that value
@pos
M=D

(WHITELOOP)

// Set D to 0
@0
D=A

// Set the pixel at pos to 0 for white
@pos
A=M
M=D

// Increment pos
@pos
D=M
D=D+1
M=D

// Keep looping until we've hit the end, 8192
@24576
D=D-A

@WHITELOOP
D;JLT

@LOOP
0;JMP

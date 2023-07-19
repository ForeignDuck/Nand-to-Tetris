// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.


@SCREEN
D=A
@addr
M=D // addr = 16384  ya es un valor dado en la memoria misma. Screen base address


@8191
D=A
@n
M=D // n= 8191 the total value of pixels on the screen



(BEGIN)

@i
M=0 // i= 0
@j
M=0 // j= 0
	
	@KBD
	D=M
	@ERASE
	D;JEQ
	
	(LOOP)      // black loop
		@i
		D=M
		@n
		D=D-M
		@END
		D;JGT  // if i > n goto END
		
		@addr
		A=M
		M=-1    // RAM[addr] = 1111111111111111
		
		@i
		M=M+1   //update i counter
		
		@1
		D=A
		@addr
		M=D+M    // addr = addr + 32
	
		@LOOP
		0;JMP   // goto LOOP




//@KBD
//D=M
//@BEGIN
//D;JEQ  // if j = 0 goto BEGIN

(ERASE)	
	(LOOPP)      // white loop
		@j
		D=M
		@n
		D=D-M
		@END
		D;JGT  // if j > m goto END
		
		@addr
		A=M
		M=0    // RAM[addr] = 0000000000000000
		
		@j
		M=M+1   //update i counter
		
		@1
		D=A
		@addr
		M=D+M    // addr = addr + 1
	
		@LOOPP
		0;JMP   // goto LOOP2




(END)

@SCREEN
D=A
@addr
M=D
	@BEGIN
	0;JMP
	
	@END  
	0;JMP
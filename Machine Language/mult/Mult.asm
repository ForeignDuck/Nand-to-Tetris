// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.


@R1		//me paro en el adress R1
D=M 	// data register toma el value de lo q este dentro de R1
@n
M=D  // n= R1 this is the amount of times that I will go around the loop adding R0 to himself

@i
M=1  // i= 1    le asigno el valor 1 a i para iterar mas tarde

@sum
M=0  // sum = 0. Una forma de inicializar la variable fuera del loop que usare como sumatoria

(LOOP)   // if i > n goto STOP
	     //  R0 + n*R0  where n=R1

	@i
	D=M
	@n
	D=D-M	
	@STOP
	D;JGT     // I take the cicle i and subtract n (or R1) from it, when the result D is more than 0, jump. if i > n goto STOP

	@sum
	D=M
	@R0
	D=D+M
	@sum
	M=D
	
	@i
	M=M+1 	// i= i+1
	@LOOP
	0;JMP



(STOP)
	@sum
	D=M
	@R2
	M=D // RAM[2]= sum

(END)
	@END
	0;JMP

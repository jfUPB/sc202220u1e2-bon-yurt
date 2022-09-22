(START)			// while (true)
	@KBD
	D=M
	@FILLORCLEAR	// if (kbd != 0), lee el teclado para saber si algo esta presionado
	D;JNE
	@START  //vuelve y empieza si no hay nada presionado

	0;JMP

(FILLORCLEAR)
// if key = MEMORY[0] --> draw else if key = MEMORY[1] --> clear
	@0
    D = M
    @KBD
    D=D-M
	@FILL
	D;JEQ

	@1
	D = M
	@KBD
	D = D - M
	@CLEAR
	D;JEQ
	@START
	0;JMP
//si la tecla es 0 llena la pantalla
(FILL)
	@value
	M = -1 //el valor de la posicion 16 se pone en -1
	@DRAW
	0;JMP
//si la tecla es 1 vacia la pantalla
(CLEAR)
	@value
	M = 0 //el valor de la posicion 16 se pone en 0
	@DRAW
	0;JMP

(DRAW)
	@SCREEN
	D = A
	@i
	M = D
//llena la pantalla según el valor que hay en la posicion 16 (lo llena porcion por porcion)
(LOOP)
	@value
	D = M
	@i
	A = M
	M = D
	@i
	M = M + 1
	@24576
	D = A
	@i
	D = M - D
	@LOOP
	D;JNE
	@START//loop infinito
	0;JMP

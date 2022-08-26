# EVALUACION EQUIPO BON YURT

- Juan Simon Hurtado ID: 422011
- Juana Valentina Rico ID: 436633
- David Marin Yepes ID: 422695

//Traducción del codigo ensamblador

	(START)			//inicio del loop (While(True)
	
		@KBD //este es un if que detecta si alguna tecla fue presionada
		D=M
		@FILLORCLEAR	// si una tecla es presionada, lee el teclado para saber si la presionada es la misma que ejecuta algun comando
		D;JNE
		@START  //vuelve y empieza si no hay nada presionado
		0;JMP

	(FILLORCLEAR) // en esta etiqueta esta el if que mira si la tecla presionada hace que se llene o se limpie la pantalla
	  
	 // if ((MEMORY[0] - MEMORY[KEYBOARD]) = 0) significa que son la misma tecla. por lo tanto la acción a realizar es llenar
		@0
	        D = M
	        @KBD
	        D=D-M
		@FILL
		D;JEQ
	// if ((MEMORY[1] - MEMORY[KEYBOARD]) = 0) aqui la acción es limpiar
		@1
		D = M
		@KBD
		D = D - M
		@CLEAR
		D;JEQ
		@START //si la tecla presionada no coincide con ninguna de las dos entonces vuelve al inicio a esperar a que se presione una tecla
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

	(DRAW)//aquí simplemente se pone en un lugar alcanzable para M el número asignado a la pantalla
		@SCREEN
		D = A
		@i
		M = D
	
	(LOOP)//llena la pantalla según el valor que hay en la posicion 16 (lo llena porcion por porcion)
	//Esta parte del código es la que llena la pantalla ya sea de 0 o de 1
	//desde aquí sería el mismo código que MEMORY[MEMORY[16]] = 0x0000; MEMORY[16] = MEMORY[16] + 1; ó MEMORY[16] = MEMORY[16] - 1; 			    MEMORY[MEMORY[16]] = 0xFFFF;, todo depende del valor de @value
	
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
		@START//este sería el final de las llaves. en donde se cierra el loop. pero como la condición es "true"
		0;JMP//vuelve y empieza en un loop infinito
		___________________________________________________________
		
		
	
//Traducción  en C/C++


	while (true)
	{
	    if (MEMORY[KEYBOARD] =! 0)
		{
			if ((MEMORY[0] - MEMORY[KEYBOARD]) = 0)
			{
			    MEMORY[16] = MEMORY[16] - 1;
			    MEMORY[MEMORY[16]] = 0xFFFF;
			}
			
			else if ((MEMORY[1] - MEMORY[KEYBOARD]) = 0)
			{
			   MEMORY[MEMORY[16]] = 0x0000;
			   MEMORY[16] = MEMORY[16] + 1;
			}
		}
	}

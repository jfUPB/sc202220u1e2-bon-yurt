# EVALUACION EQUIPO BON YURT

- Juan Simon Hurtado ID: 422011
- Juana Valentina Rico ID: 436633
- David Marin Yepes ID: 422695

MEMORY[16] = 16384;

MEMORY[0] = 78;

MEMORY[1] = 66;

while (true)

{

    if (MEMORY[KEYBOARD] == 0)
    
        {
    
        if ((MEMORY[16] - 16384) > 0)
        
        {
        
            MEMORY[16] = MEMORY[16] - 1;
            
            MEMORY[MEMORY[16]] = 0xFFFF;
        }
    }
    else
    {
        if (MEMORY[KEYBOARD] == MEMORY[0])
          {
            if ((MEMORY[16] - 24576) < 0)
              {
                MEMORY[MEMORY[16]] = 0x0000;
                MEMORY[16] = MEMORY[16] + 1;
              }
          }
        if (MEMORY[KEYBOARD] == MEMORY[1])
          {
            if ((MEMORY[16] - 24576) < 0)
              {
               MEMORY[MEMORY[16]] = 0xFFFF;
               MEMORY[16] = MEMORY[16] + 1;
              }
          } 
     }
}
--
(START)			// while (true)
	@KBD
	D=M
	@FILLORCLEAR	// if (kbd != 0), lee el teclado para saber si algo esta presionado
	D;JNE
	@START  //vuelve y empieza si no hay nada presionado

	0;JMP

(FILLORCLEAR)
// if key = MEMORY[0] --> draw else if key = MEMORY[1] --> clear
	@0            // if key = memory[0]
    D = M
    @KBD
    D=D-M
	@FILL
	D;JEQ        // si operacion == 0 entonces PC = A

	@1           // if key = memory[1]
	D = M
	@KBD
	D = D - M
	@CLEAR
	D;JEQ
	@START
	0;JMP         // No hay condicion PC = A

(FILL)
	@value
	M = -1
	@DRAW
	0;JMP

(CLEAR)
	@value
	M = 0
	@DRAW
	0;JMP

(DRAW)
	@SCREEN
	D = A
	@i
	M = D

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
	@START
	0;JMP

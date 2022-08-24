# EVALUACION EQUIPO BON YURT

- Juan Simon Hurtado ID: 422011
- Juana Valentina Rico ID: 436633
- David Marin Yepes ID: 422695


//Código en C/C++

	MEMORY[0] = 78;
	MEMORY[1] = 66;
	//simulador de lo que pusimos manualmente en las posición 0 y 1 de la RAM

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

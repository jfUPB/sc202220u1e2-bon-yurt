# EVALUACION EQUIPO BON YURT

- Juan Simon Hurtado ID: 422011
- Juana Valentina Rico ID: 436633
- David Marin Yepes ID: 422695


	
//Traducción  en C/C++


	while (true)
	{
	    if (MEMORY[KEYBOARD] =! 0)
		{
			if (MEMORY[0] == MEMORY[KEYBOARD])
			{
			    MEMORY[16] = -1;
			}
			
			else if (MEMORY[1] == MEMORY[KEYBOARD])
			{
			   MEMORY[16] = 0;
			}
			else
			{
			  continue;
			}
			
		MEMORY[17]=16384;//(screen)	
		
		while(MEMORY[17]<24576)
		{
			MEMORY[MEMORY[17]]=MEMORY[16];
			MEMORY[17]++;
		}
		
		}
	}

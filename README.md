# EVALUACION EQUIPO BON YURT

- j
-
- j

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

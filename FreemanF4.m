function [F4Re] = FreemanF4(Freeman)

    TamFre = size(Freeman);
    Re = double(TamFre(1,1));
    Co = double(TamFre(1,2));
    tic
    
    F4 = [];
    
    MatTrasF4 = [0  6  7   8   4      4   4    9;
                 5   10   1    121   12     4   4     3;
                 4   10   1    121   12  1232   4     4;
                 4    0   5     21    2   232  23     4;
                 4    4   4     21    2   232  23  2303;
                30    4   4      1    5    32   3   303;
                30 2010   4      4    4    32   3   303;
                 0  6  7      4    4     2   5    9];
     % * -> 5
     % empty - > 5
     % 010 -> 6
     % 01  -> 7
     % 0121 -> 8
     % 03 -> 9
    
    con = 1;
    for i=1:Co
      if((i+1)<=Co)
          x=Freeman(1,i);
          y=Freeman(1,i+1);
          if((MatTrasF4(x+1,y+1) ~= 4) && (MatTrasF4(x+1,y+1) ~= 5))
              F4(con) = MatTrasF4(x+1,y+1);
              con=con+1;
          end
      else
          x=Freeman(1,i);
          y=Freeman(1,1);

          F4(con) = MatTrasF4(x+1,y+1);
          con=con+1;
      end
    end
    toc
    llegofinF4 = 1;
    
    %Pasa la cadena F4 a un archivo 
    TamF4 = size(F4);
    Re = double(TamF4(1,1));
    Co = double(TamF4(1,2));
     % 010 -> 6
     % 01  -> 7
     % 0121 -> 8
     % 03 -> 9

    F4Copia = [];
    aux = 1;
    for i=1:Co
        if(F4(1,i) == 6)
            F4Copia(1,aux) = 0;
            aux = aux + 1;
            F4Copia(1,aux) = 1;
            aux = aux + 1;
            F4Copia(1,aux) = 0;
            aux = aux + 1;         
        elseif(F4(1,i) == 7)
            F4Copia(1,aux) = 0;
            aux = aux + 1;
            F4Copia(1,aux) = 1;   
            aux = aux + 1;
        elseif(F4(1,i) == 8)
            F4Copia(1,aux) = 0;   
            aux = aux + 1;
            F4Copia(1,aux) = 1;   
            aux = aux + 1;
            F4Copia(1,aux) = 2;   
            aux = aux + 1;
            F4Copia(1,aux) = 1;   
            aux = aux + 1; 
        elseif F4(1,i) == 9
            F4Copia(1,aux) = 0;   
            aux = aux + 1;
            F4Copia(1,aux) = 3;   
            aux = aux + 1;
        elseif F4(1,i) == 30 %30
            F4Copia(1,aux) = 3;   
            aux = aux + 1;
            F4Copia(1,aux) = 0;   
            aux = aux + 1;
        elseif F4(1,i) == 10 %10
            F4Copia(1,aux) = 1;   
            aux = aux + 1;
            F4Copia(1,aux) = 0;
            aux = aux + 1;
        elseif F4(1,i) == 2010 %2010
            F4Copia(1,aux) = 2;   
            aux = aux + 1;
            F4Copia(1,aux) = 0;
            aux = aux + 1;
            F4Copia(1,aux) = 1;   
            aux = aux + 1;
            F4Copia(1,aux) = 0;
            aux = aux + 1;
        elseif F4(1,i) == 121 %121
            F4Copia(1,aux) = 1;   
            aux = aux + 1;
            F4Copia(1,aux) = 2;   
            aux = aux + 1;
            F4Copia(1,aux) = 1;   
            aux = aux + 1;
        elseif F4(1,i) == 21 % 21
            F4Copia(1,aux) = 2;   
            aux = aux + 1;
            F4Copia(1,aux) = 1;   
            aux = aux + 1;
        elseif F4(1,i) == 12 %12
            F4Copia(1,aux) = 1;   
            aux = aux + 1;
            F4Copia(1,aux) = 2;   
            aux = aux + 1;
        elseif F4(1,i) == 1232 %1232
            F4Copia(1,aux) = 1;   
            aux = aux + 1;
            F4Copia(1,aux) = 2;   
            aux = aux + 1;
            F4Copia(1,aux) = 3;   
            aux = aux + 1;
            F4Copia(1,aux) = 2;   
            aux = aux + 1;
        elseif F4(1,i) == 232 %232
            F4Copia(1,aux) = 2;   
            aux = aux + 1;
            F4Copia(1,aux) = 3;   
            aux = aux + 1;
            F4Copia(1,aux) = 2;
            aux = aux + 1;
        elseif F4(1,i) == 32 %32
            F4Copia(1,aux) = 3;   
            aux = aux + 1;
            F4Copia(1,aux) = 2;
            aux = aux + 1;
        elseif F4(1,i) == 23 % 23
            F4Copia(1,aux) = 2;
            aux = aux + 1;
            F4Copia(1,aux) = 3;   
            aux = aux + 1;
        elseif F4(1,i) == 2303 %2303
            F4Copia(1,aux) = 2;
            aux = aux + 1;
            F4Copia(1,aux) = 3;   
            aux = aux + 1;
            F4Copia(1,aux) = 0;
            aux = aux + 1;
            F4Copia(1,aux) = 3;   
            aux = aux + 1;
        elseif F4(1,i) == 303 %303
            F4Copia(1,aux) = 3;   
            aux = aux + 1;
            F4Copia(1,aux) = 0;
            aux = aux + 1;
            F4Copia(1,aux) = 3;   
            aux = aux + 1;
        else
            F4Copia(1,aux) = F4(1,i);
            aux = aux + 1;
        end
    end
    
    F4Re = F4Copia;
end
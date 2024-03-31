function [Mprocessed] = Complement(Mres)
    T = size(Mres);
    R = double(T(1,1));
    C = double(T(1,2));
    
    Mprocessed = Mres;
    Mprocessed(1,1) = 2;

%Arriba-abajo    
        for i=1:R
            for j=1:C
                if(Mprocessed(i,j) == 0)   
                   if((i-1)>=1 && (j-1)>=1 && Mprocessed(i-1,j-1) > 1)
                       Mprocessed(i,j) = 2;
                   elseif((i-1)>=1 && Mprocessed(i-1,j) > 1)
                       Mprocessed(i,j) = 2;
                   elseif((i-1)>=1 && (j+1)<=C && Mprocessed(i-1,j+1) > 1)
                       Mprocessed(i,j) = 2;
                   elseif((j-1)>=1 && Mprocessed(i,j-1) > 1)
                       Mprocessed(i,j) = 2;
                   elseif((j+1)<=C && Mprocessed(i,j+1) > 1)
                       Mprocessed(i,j) = 2;
                   elseif((i+1)<=R && (j-1)>1 && Mprocessed(i+1,j-1) > 1)
                       Mprocessed(i,j) = 2;
                   elseif((i+1)<=R && Mprocessed(i+1,j) > 1)
                       Mprocessed(i,j) = 2;
                   elseif((i+1)<=R && (j+1)<=C && Mprocessed(i+1,j+1) > 1)
                       Mprocessed(i,j) = 2;
                   end 
                end  
            end
        end
     %abajo-arriba
    for i=R:-1:1
        for j=C:-1:1
            if(Mprocessed(i,j) == 0)   
                if((i-1)>=1 && (j-1)>=1 && Mprocessed(i-1,j-1) > 1)
                    Mprocessed(i,j) = 2;
                elseif((i-1)>=1 && Mprocessed(i-1,j) > 1)
                    Mprocessed(i,j) = 2;
                elseif((i-1)>=1 && (j+1)<=C && Mprocessed(i-1,j+1) > 1)
                    Mprocessed(i,j) = 2;
                elseif((j-1)>=1 && Mprocessed(i,j-1) > 1)
                    Mprocessed(i,j) = 2;
                elseif((j+1)<=C && Mprocessed(i,j+1) > 1)
                    Mprocessed(i,j) = 2;
                elseif((i+1)<=R && (j-1)>1 && Mprocessed(i+1,j-1) > 1)
                    Mprocessed(i,j) = 2;
                elseif((i+1)<=R && Mprocessed(i+1,j) > 1)
                    Mprocessed(i,j) = 2;
                elseif((i+1)<=R && (j+1)<=C && Mprocessed(i+1,j+1) > 1)
                    Mprocessed(i,j) = 2;
                end 
            end  
        end
    end
 
%Derecha - izquierda
    for i=1:C
        for j=1:R
             if(Mprocessed(j,i) == 0)   
                if((i-1)>=1 && (j-1)>=1 && Mprocessed(j-1,i-1) > 1)
                    Mprocessed(j,i) = 2;
                end
                if((i-1)>=1 && Mprocessed(j,i-1) > 1)
                    Mprocessed(j,i) = 2;
                elseif((i-1)>=1 && (j+1)<=R && Mprocessed(j+1,i-1) > 1)
                    Mprocessed(j,i) = 2;
                elseif((j-1)>=1 && Mprocessed(j-1,i) > 1)
                    Mprocessed(j,i) = 2;
                elseif((j+1)<=R && Mprocessed(j+1,i) > 1)
                    Mprocessed(j,i) = 2;
                elseif((i+1)<=C && (j-1)>1 && Mprocessed(j-1,i+1) > 1)
                    Mprocessed(j,i) = 2;
                elseif((i+1)<=C && Mprocessed(j,i+1) > 1)
                    Mprocessed(j,i) = 2;
                elseif((i+1)<=C && (j+1)<=R && Mprocessed(j+1,i+1) > 1)
                    Mprocessed(i,j) = 2;
                end 
            end 
        end 
    end
    
    % %Izquierda - Derecha
    for i=C:-1:1
        for j=R:-1:1
             if(Mprocessed(j,i) == 0)   
                if((i-1)>=1 && (j-1)>=1 && Mprocessed(j-1,i-1) > 1)
                    Mprocessed(j,i) = 2;
                elseif((i-1)>=1 && Mprocessed(j,i-1) > 1)
                    Mprocessed(j,i) = 2;
                elseif((i-1)>=1 && (j+1)<=R && Mprocessed(j+1,i-1) > 1)
                    Mprocessed(j,i) = 2;
                elseif((j-1)>=1 && Mprocessed(j-1,i) > 1)
                    Mprocessed(j,i) = 2;
                elseif((j+1)<=R && Mprocessed(j+1,i) > 1)
                    Mprocessed(j,i) = 2;
                elseif((i+1)<=C && (j-1)>1 && Mprocessed(j-1,i+1) > 1)
                    Mprocessed(j,i) = 2;
                elseif((i+1)<=C && Mprocessed(j,i+1) > 1)
                    Mprocessed(j,i) = 2;
                elseif((i+1)<=C && (j+1)<=R && Mprocessed(j+1,i+1) > 1)
                    Mprocessed(i,j) = 2;
                end 
            end 
        end 
    end
    
%Hace 0 todo el fondo
    for i=1:R
        for j=1:C
            if(Mprocessed(i,j) == 2)
                Mprocessed(i,j) = 1;           
            end
        end
    end
    
%Binariza la imagen
    for i=1:R
        for j=1:C
            if(Mprocessed(i,j) == 1)
                Mprocessed(i,j) = 0;
            elseif(Mprocessed(i,j) == 0)
                Mprocessed(i,j) = 1;
            end
        end
    end
end

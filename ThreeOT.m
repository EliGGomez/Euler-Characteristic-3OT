function [OTB] = ThreeOT(F4Copia)

    TamF4Copia = size(F4Copia);
    CoF4C = double(TamF4Copia(1,2));
    
    F4Re = F4Copia;
    OT = []; %3OT
    MatTras3OT = [1 4 2 4;
                  4 1 4 2;
                  2 4 1 4;
                  4 2 4 1];
    valor = 0;
    for i=1: CoF4C
        if (i+1) <= CoF4C
            x=F4Re(1,i);
            y=F4Re(1,i+1);

            if x == y %Condición para saber si se tratan de 2 números iguales
                OT(i) = 0;
            elseif MatTras3OT(x+1,y+1) == 4 %Esto es para saber qué entré al asterisco
                if i-1 > 0 
                    ref = F4Re(1,i-1);
                    if(ref ~= x)  
                        OT(i) = MatTras3OT(ref+1,y+1);
                        valor = MatTras3OT(ref+1,y+1);
                    else
                        pos = i-1;
                        if pos > 0
                            while(ref == x && pos >= 1)
                                ref = F4Re(1,pos);%Modifique pos + 1
                                pos = pos - 1;
                            end
                            if pos >= 1 && ref ~= x
                              OT(i) = MatTras3OT(ref+1,y+1);
                                %--------------------------------
                                valor = MatTras3OT(ref+1,y+1);
                            else
                                ref = F4Re(1,CoF4C);
                                pos = CoF4C;

                                while(ref == x && pos >= 1)
                                    ref = F4Re(1,pos);%Modifique pos + 1
                                    pos = pos - 1;
                                end
                                if pos >= 1 && ref ~= x
                                    OT(i) = MatTras3OT(ref+1,y+1);
                                %--------------------------------
                                    valor = MatTras3OT(ref+1,y+1);
                                end 
                            end
                        else
                             ref = F4Re(1,CoF4C);
                             pos = CoF4C;

                             while(ref == x && pos >= 1)
                                 ref = F4Re(1,pos);%Modifique pos + 1
                                 pos = pos - 1;
                             end

                             if pos >= 1 && ref ~= x
                                 OT(i) = MatTras3OT(ref+1,y+1);
                                 valor = MatTras3OT(ref+1,y+1);
                             end
                        end

                    end 
                else
                    ref = F4Re(1,CoF4C);
                    pos = CoF4C;

                    while(ref == x && pos >= 1)
                        ref = F4Re(1,pos);%Modifique pos + 1
                        pos = pos - 1;
                    end                         
                    if pos >= 1 && ref ~= x
                        OT(i) = MatTras3OT(ref+1,y+1);
                        valor = MatTras3OT(ref+1,y+1);
                    end

                end
            else
               OT(i) = MatTras3OT(x+1,y+1);
                        %-----------------------------
               valor = MatTras3OT(ref+1,y+1);
            end
        else
            x = F4Re(1,i);
            y = F4Re(1,1);

            if x == y
                OT(i) = 0;
            elseif MatTras3OT(x+1,y+1) == 4
                ref = F4Re(1,1);
                if(ref ~= x)
                    OT(i) = MatTras3OT(ref+1,y+1);
                    valor = MatTras3OT(ref+1,y+1);
                else
                    pos = 1;
                    while(ref == x && pos <= CoF4C)
                        ref = F4Re(1,pos);
                        pos = pos + 1;
                    end

                    if pos <= CoF4C && ref ~= x
                        OT(i) = MatTras3OT(ref+1,y+1);
                        valor = MatTras3OT(ref+1,y+1);
                    end  
                end
            end
        end
    end 

    LlegoFin3OT = 1;

    %--------------------------------------------------------------------------
    A =[];
    B = [];
    coordenada = 0;
    for i=CoF4C:-1:1
        if OT(1,i) == 2
            coordenada = i;
            break
        end
    end

    for i=1:coordenada-1
        A(1,i) = OT(1,i);
    end
    con = 1;
    for i=coordenada:CoF4C
        B(1,con) = OT(1,i);
        con = con + 1;
    end

    OTB = [B A]; %Concatena las dos cadenas para reordenar el vector 
end

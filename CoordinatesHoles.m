function [X,Y,etiquetada] = CoordinatesHoles(Mcomplement)
    T = size(Mcomplement);
    R = double(T(1,1));
    C = double(T(1,2));

    Tag = 2;
    etiquetada = Mcomplement;
    a = 1;
    %Etiqueta cada hoyo para identificar 
    flag = 1;
    change = 1;
    while(change~=0)
        for i=1:R
            for j=1:C
                if(etiquetada(i,j) == 1) 
                    if((i-1)>=1 && (j-1)>=1 && etiquetada(i-1,j-1) > 1 )
                        etiquetada(i,j) = etiquetada(i-1,j-1);
                        %flag = 1;
                    elseif((i-1)>=1 && etiquetada(i-1,j) > 1)
                        etiquetada(i,j) = etiquetada(i-1,j);
                        %flag = 1;
                    elseif((i-1)>=1 && (j+1)<=C && etiquetada(i-1,j+1) > 1)
                        etiquetada(i,j) = etiquetada(i-1,j+1);
                        %flag = 1;
                    elseif((j-1)>=1 && etiquetada(i,j-1) > 1)
                        etiquetada(i,j) = etiquetada(i,j-1);
                        %flag = 1;
                    elseif((j+1)<=C && etiquetada(i,j+1) > 1)
                        etiquetada(i,j) = etiquetada(i,j+1);
                        %flag = 1;
                    elseif((i+1)<=R && (j-1)>1 && etiquetada(i+1,j-1) > 1)
                        etiquetada(i,j) = etiquetada(i+1,j-1);
                        %flag = 1;
                    elseif((i+1)<=R && etiquetada(i+1,j) > 1)
                        etiquetada(i,j) = etiquetada(i+1,j);
                        %flag = 1;
                    elseif((i+1)<=R && (j+1)<=C && etiquetada(i+1,j+1) > 1)
                        etiquetada(i,j) = etiquetada(i+1,j+1);
                        %flag = 1;
                    else
                        etiquetada(i,j) = Tag; 
                        Tags(a) = Tag;
                        a = a + 1;
                        Tag = Tag + 1;
                    end
                elseif(etiquetada(i,j) > 1) 
                    if((i-1)>=1 && (j-1)>=1 && etiquetada(i-1,j-1) > 1 && (etiquetada(i-1,j-1) < etiquetada(i,j)))
                        etiquetada(i,j) = etiquetada(i-1,j-1);
                        flag = 1;
                    elseif((i-1)>=1 && etiquetada(i-1,j) > 1 && (etiquetada(i-1,j) < etiquetada(i,j)))
                        etiquetada(i,j) = etiquetada(i-1,j);
                        flag = 1;
                    elseif((i-1)>=1 && (j+1)<=C && etiquetada(i-1,j+1) > 1 && (etiquetada(i-1,j+1) < etiquetada(i,j)))
                        etiquetada(i,j) = etiquetada(i-1,j+1);
                        flag = 1;
                    elseif((j-1)>=1 && etiquetada(i,j-1) > 1 && (etiquetada(i,j-1) < etiquetada(i,j)))
                        etiquetada(i,j) = etiquetada(i,j-1);
                        flag = 1;
                    elseif((j+1)<=C && etiquetada(i,j+1) > 1 && (etiquetada(i,j+1) < etiquetada(i,j)))
                        etiquetada(i,j) = etiquetada(i,j+1);
                        flag = 1;
                    elseif((i+1)<=R && (j-1)>1 && etiquetada(i+1,j-1) > 1 && (etiquetada(i+1,j-1) < etiquetada(i,j)))
                        etiquetada(i,j) = etiquetada(i+1,j-1);
                        flag = 1;
                    elseif((i+1)<=R && etiquetada(i+1,j) > 1 && (etiquetada(i+1,j) < etiquetada(i,j)))
                        etiquetada(i,j) = etiquetada(i+1,j);
                        flag = 1;
                    elseif((i+1)<=R && (j+1)<=C && etiquetada(i+1,j+1) > 1 && (etiquetada(i+1,j+1) < etiquetada(i,j)))
                        etiquetada(i,j) = etiquetada(i+1,j+1);
                        flag = 1;
                    else
                        flag = 0;
                    end
                end
            end  
        end
     %abajo   
        for i=R:-1:1
            for j=C:-1:1
                if(etiquetada(i,j) > 1) 
                    if((i-1)>=1 && (j-1)>=1 && etiquetada(i-1,j-1) > 1 && (etiquetada(i-1,j-1) < etiquetada(i,j)))
                        etiquetada(i,j) = etiquetada(i-1,j-1);
                        flag = 1;
                    elseif((i-1)>=1 && etiquetada(i-1,j) > 1 && (etiquetada(i-1,j) < etiquetada(i,j)))
                        etiquetada(i,j) = etiquetada(i-1,j);
                        flag = 1;
                    elseif((i-1)>=1 && (j+1)<=C && etiquetada(i-1,j+1) > 1 && (etiquetada(i-1,j+1) < etiquetada(i,j)))
                        etiquetada(i,j) = etiquetada(i-1,j+1);
                        flag = 1;
                    elseif((j-1)>=1 && etiquetada(i,j-1) > 1 && (etiquetada(i,j-1) < etiquetada(i,j)))
                        etiquetada(i,j) = etiquetada(i,j-1);
                        flag = 1;
                    elseif((j+1)<=C && etiquetada(i,j+1) > 1 && (etiquetada(i,j+1) < etiquetada(i,j)))
                        etiquetada(i,j) = etiquetada(i,j+1);
                        flag = 1;
                    elseif((i+1)<=R && (j-1)>1 && etiquetada(i+1,j-1) > 1 && (etiquetada(i+1,j-1) < etiquetada(i,j)))
                        etiquetada(i,j) = etiquetada(i+1,j-1);
                        flag = 1;
                    elseif((i+1)<=R && etiquetada(i+1,j) > 1 && (etiquetada(i+1,j) < etiquetada(i,j)))
                        etiquetada(i,j) = etiquetada(i+1,j);
                        flag = 1;
                    elseif((i+1)<=R && (j+1)<=C && etiquetada(i+1,j+1) > 1 && (etiquetada(i+1,j+1) < etiquetada(i,j)))
                        etiquetada(i,j) = etiquetada(i+1,j+1);
                        flag = 1;
                    else
                        flag = 0;
                    end
                end  
            end
        end
        %Derecha - izquierda
        for i=1:C
            for j=1:R
                 if(etiquetada(j,i) > 1)   
                    if((i-1)>=1 && (j-1)>=1 && etiquetada(j-1,i-1) > 1  && (etiquetada(j-1,i-1) < etiquetada(j,i)))
                        etiquetada(j,i) = etiquetada(j-1,i-1);
                        flag = 1;
                    end
                    if((i-1)>=1 && etiquetada(j,i-1) > 1 && (etiquetada(j,i-1) < etiquetada(j,i)))
                        etiquetada(j,i) = etiquetada(j,i-1);
                        flag = 1;
                    elseif((i-1)>=1 && (j+1)<=R && etiquetada(j+1,i-1) > 1 && (etiquetada(j+1,i-1) < etiquetada(j,i)))
                        etiquetada(j,i) = etiquetada(j+1,i-1);
                        flag = 1;
                    elseif((j-1)>=1 && etiquetada(j-1,i) > 1 && (etiquetada(j-1,i) < etiquetada(j,i)))
                        etiquetada(j,i) = etiquetada(j-1,i);
                        flag = 1;
                    elseif((j+1)<=R && etiquetada(j+1,i) > 1 && (etiquetada(j+1,i) < etiquetada(j,i)))
                        etiquetada(j,i) = etiquetada(j+1,i);
                        flag = 1;
                    elseif((i+1)<=C && (j-1)>1 && etiquetada(j-1,i+1) > 1 && (etiquetada(j-1,i+1) < etiquetada(j,i)))
                        etiquetada(j,i) = etiquetada(j-1,i+1);
                        flag = 1;
                    elseif((i+1)<=C && etiquetada(j,i+1) > 1 && (etiquetada(j,i+1) < etiquetada(j,i)))
                        etiquetada(j,i) = etiquetada(j,i+1);
                        flag = 1;
                    elseif((i+1)<=C && (j+1)<=R && etiquetada(j+1,i+1) > 1 && (etiquetada(j+1,i+1) < etiquetada(j,i)))
                        etiquetada(j,i) = etiquetada(j+1,i+1);
                        flag = 1;
                    else
                        flag = 0;
                    end 
                end 
            end 
        end

        % %Izquierda - Derecha
        for i=C:-1:1
            for j=R:-1:1
                 if(etiquetada(j,i) > 1)   
                    if((i-1)>=1 && (j-1)>=1 && etiquetada(j-1,i-1) > 1 && (etiquetada(j-1,i-1) < etiquetada(j,i)))
                        etiquetada(j,i) = etiquetada(j-1,i-1);
                        flag = 1;
                    elseif((i-1)>=1 && etiquetada(j,i-1) > 1 && (etiquetada(j,i-1) < etiquetada(j,i)))
                        etiquetada(j,i) = etiquetada(j,i-1);
                        flag = 1;
                    elseif((i-1)>=1 && (j+1)<=R && etiquetada(j+1,i-1) > 1 && (etiquetada(j+1,i-1) < etiquetada(j,i)))
                        etiquetada(j,i) = etiquetada(j+1,i-1);
                        flag = 1;
                    elseif((j-1)>=1 && etiquetada(j-1,i) > 1 && (etiquetada(j-1,i) < etiquetada(j,i)))
                        etiquetada(j,i) = etiquetada(j-1,i);
                        flag = 1;
                    elseif((j+1)<=R && etiquetada(j+1,i) > 1 && (etiquetada(j+1,i) < etiquetada(j,i)))
                        etiquetada(j,i) = etiquetada(j+1,i);
                        flag = 1;
                    elseif((i+1)<=C && (j-1)>1 && etiquetada(j-1,i+1) > 1 && (etiquetada(j-1,i+1) < etiquetada(j,i)))
                        etiquetada(j,i) = etiquetada(j-1,i+1);
                    elseif((i+1)<=C && etiquetada(j,i+1) > 1 && (etiquetada(j,i+1) < etiquetada(j,i)))
                        etiquetada(j,i) = etiquetada(j,i+1);
                        flag = 1;
                    elseif((i+1)<=C && (j+1)<=R && etiquetada(j+1,i+1) > 1 && (etiquetada(j+1,i+1) < etiquetada(j,i)))
                        etiquetada(j,i) = etiquetada(j+1,i+1);
                        flag = 1;
                    end 
                end 
            end 
        end   
        change = flag;
    end

    %Coordenadas de cada hoyo
    Tam = size(Tags);
    Re = double(Tam(1,1));
    Co = double(Tam(1,2));

    b =1;
    for a=1:Co
        for i=1:R
            for j=1:C
                if(etiquetada(i,j) == Tags(a))
                     X(b) = i;
                     Y(b) = j;
                     tags_used(b) = Tags(a);
                     bandera = 1;
                end
            end
        end
        if bandera ==1
            b = b + 1;
            bandera = 0;
        end          
    end

end
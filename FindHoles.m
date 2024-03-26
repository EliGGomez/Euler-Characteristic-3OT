function [Col] = FindHoles(Mres)
    imshow(Mres);
    [x,y] = getpts;
    X = round(x);
    CoorY = X.'; % or y = transpose(X)
    Y = round(y);
    CoorX = Y.'; % or x = transpose(Y)
    
    T = size(Mres);
    R = double(T(1,1));
    C = double(T(1,2));
    
    %Elemento estructurante
    E = [0 1 0;
        1 1 1;
        0 1 0];
    %Complemento de la imagen
    Complemento = [];
    for i=1:R 
         for j=1:C
              if(Mres(i,j)==0)
                Complemento(i,j)=1;
              else
                  Complemento(i,j)=0;
              end
         end
    end
    
    Tam = size(CoorX);
    Ren = double(Tam(1,1));
    Col = double(Tam(1,2));
    
    union = Mres;
    
    for a=1:Col
        xh = CoorX(a);
        yh = CoorY(a);

        x = zeros(size(Mres)); %Donde se va a guardar el Hoyo
        x(xh,yh) = 1; %Se guarda un pixel del hoyo 

        hole = zeros(size(Mres)); %Matriz final de hoyo.
          
        bandera = 0;
        cambio = 0;
        while(bandera ~= 1)
            %Revisa la vecindad del pixel con el elemento estructurante
            for i=1: R
                for j =1: C
                    if x(i,j) == 1
                       if Complemento(i,j+1) == 1
                           x(i,j+1) = 1;
                           cambio = 1;
                       end
                       if Complemento(i-1,j)== 1
                           x(i-1,j) = 1;
                           cambio = 1;
                       end
                       if Complemento(i,j-1)== 1
                           x(i,j-1) = 1;
                           cambio = 1;
                       end
                       if Complemento(i+1,j) == 1
                           x(i+1,j) = 1;
                           cambio = 1;
                       end
                       %%%%%%%%%%%%%%%%%%%%%%%%%%
%                        if Complemento(i-1,j+1) == 1
%                            x(i-1,j+1) = 1;
%                            cambio = 1;
%                        end
%                        if Complemento(i-1,j-1) == 1
%                            x(i-1,j-1) = 1;
%                            cambio = 1;
%                        end
%                        if Complemento(i+1,j-1) == 1
%                            x(i+1,j-1) = 1;
%                            cambio = 1;
%                        end
%                        if Complemento(i-1,j+1) == 1
%                            x(i+1,j+1) = 1;
%                            cambio = 1;
%                        end
                    end   
                end
            end  

            if(hole == x)
                bandera = 1;
            else
                cambio = 0;
            end 
             hole = x;
             
        end
        
        for i=1:R 
             for j=1:C
                  if(hole(i,j)==0)
                    holeCopia(i,j)=255;
                    else
                       if(hole(i,j)==1)
                           holeCopia(i,j)=0;
                       end 
                  end
             end
        end
         
        %imwrite(hole,'hole.bmp')
        imwrite(holeCopia,sprintf('Hole%d.png',a))
       
        %union = Mres + hole; %Rellena el hoyo de la imagen 
        
        %Rellena cada hoyo en la imagen 
             
        for i=1:R
            for j=1:C
                if hole(i,j) == 1 && union(i,j) == 0
                    union(i,j) = 1;                     
                end
            end
        end
        
        %Mres = Mres + hole; %Rellena el hoyo de la imagen     
    end 
end
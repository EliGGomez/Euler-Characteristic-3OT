nom = input('Image name .png: ','s');
arch = [nom,'.png'];
Img = imread(arch,'png');
T = size(Img);
R = double(T(1,1));
C = double(T(1,2));

%The image is converted to a binary file Black = 0, White :1;
%White/Black images
%Comment if needed
for i=1:R 
     for j=1:C
          if(Img(i,j)>=128)
              Mres(i,j)=0;
          else
              Mres(i,j)=1;               
          end
     end
end

% Black/white images, 
% Uncomment if needed
% for i=1:R
%     for j=1:C
%         if(Img(i,j)>=128)
% %         if(Img(i,j)==255)
%             Mres(i,j)=1;
%         else
%             Mres(i,j)=0;
%         end
%     end
% end

%Print images without holes
for i=1:R 
     for j=1:C
          if(Mres(i,j)==0)
            ImagenBMP(i,j)=255;
            else
               if(Mres(i,j)==1)
                   ImagenBMP(i,j)=0;
               end 
          end
     end
end
imwrite(ImagenBMP,'Bat.bmp'); 
imwrite(ImagenBMP,'Bat.png');

%Hoyos 
% for i=1:R
%     for j=1:C
%         if(Img(i,j)==255)
%             Mres(i,j)=0;
%         else
%             Mres(i,j)=1;
%         end
%     end
% end

%--------------------------Freeman chain code------------------------------
%%% Find first pixel
    for i=1:R
        for j=1:C
            if(Mres(i,j)==1)
            CooRen=i;
            CooCol=j;
            break
            end
        end 
    end
            CooRen
            CooCol
cooCA=0;
cooRA=0;
i=CooRen;
j=CooCol;
%--------------------------------------------------------------------------

Freeman=[];% Freeman chain code
n=1;
tic
while ((CooRen~=cooRA)||(CooCol~=cooCA))
    Mres(i,j)=2;
    cooRA=i;
    cooCA=j;
      
      if (Mres(i-1,j+1)==0) %Find in V8
          if (Mres(i,j+1)==1)
            Mres(i,j+1)=2;
            j=j+1;
            Freeman(n)=0;            
          elseif(Mres(i+1,j+1)==1)
              Mres(i+1,j+1)=2;
              i=i+1;
              j=j+1;
              Freeman(n)=1;
          elseif (Mres(i+1,j)==1)
              Mres(i+1,j)=2;
              i=i+1;
              Freeman(n)=2;
          elseif (Mres(i+1,j-1)==1)
              Mres(i+1,j-1)=2;              
              i=i+1;
              j=j-1;
              Freeman(n)=3;
          elseif (Mres(i,j-1)==1)
            Mres(i,j-1)=2;
            j=j-1;
            Freeman(n)=4;   
          elseif (Mres(i-1,j-1)==1)
              Mres(i-1,j-1)=2;              
              i=i-1;
              j=j-1;
              Freeman(n)=5;   
          elseif (Mres(i-1,j)==1)
              Mres(i-1,j)=2;
              i=i-1;
              Freeman(n)=6;   
          end%if elseif
      else
          if (Mres(i-1,j)==0)
            Mres(i-1,j+1)=2;
            i=i-1;
             j=j+1;
            Freeman(n)=7;   
          elseif (Mres(i-1,j-1)==0)
              Mres(i-1,j)=2;
              i=i-1;
              Freeman(n)=6;   
          elseif (Mres(i,j-1)==0)
              Mres(i-1,j-1)=2;              
              i=i-1;
              j=j-1;
              Freeman(n)=5;   
          elseif (Mres(i+1,j-1)==0)
              Mres(i,j-1)=2;
              j=j-1;
              Freeman(n)=4;   
          elseif (Mres(i+1,j)==0)
            Mres(i+1,j-1)=2;           
            i=i+1;
            j=j-1;
            Freeman(n)=3;   
          elseif (Mres(i+1,j+1)==0)
              Mres(i+1,j)=2;
              i=i+1;
              Freeman(n)=2;   
          elseif (Mres(i,j+1)==0)
              Mres(i+1,j+1)=2;
              j=j+1;
              i=i+1;
              Freeman(n)=1;   
          end%if elseif
      end%if find in V8
      cooRA=i;
      cooCA=j;
      n=n+1;
end%while 
toc
llegoFinF8=1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
TamFre = size(Freeman);
Re = double(TamFre(1,1));
Co = double(TamFre(1,2));

Archivo = fopen('D:\INFORMACIÓN\DOCUMENTOS\DOCTORADO\2° Semestre\ARTÍCULO - REVISIÓN IJPAIR\CÓDIGO\F8Cad.txt','w+');
for i=1:Co
    fprintf(Archivo,'%d',Freeman(1,i));
end
fclose(Archivo);
guardo = 1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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
 %-----------------------------------------
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
llegofinF4 = 1
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

TamF4Copia = size(F4Copia);
ReF4C = double(TamF4Copia(1,1));
CoF4C = double(TamF4Copia(1,2));

Archivo = fopen('D:\INFORMACIÓN\DOCUMENTOS\DOCTORADO\2° Semestre\ARTÍCULO - REVISIÓN IJPAIR\CÓDIGO\F4Cad.txt','w+');

for i=1:CoF4C
    fprintf(Archivo,'%d',F4Copia(1,i)); 
end
fclose(Archivo);
guardo = 1;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Encuentra el primer par de 0's para reordenar el vector de la cadena F4
% F4Re = [];
% coordenada = 0;
% for i=1:CoF4C
%     if F4Copia(1,i) == 0
%         if F4Copia(1,i+1) == 0
%             coordenada = i;
%             break
%         end
%     end
% end
% % Reordena el vector de la cadena F4 
% for i=1:coordenada-1
%     A(1,i) = F4Copia(1,i);
% end
% 
% con = 1;
% for i=coordenada:CoF4C
%     B(1,con) = F4Copia(1,i);
%     con = con + 1;
% end
% F4Re = [B A]; %Concatena las dos cadenas para reordenar el vector 
% 

F4Re = F4Copia;
OT = []; %3OT

MatTras3OT = [1 4 2 4;
              4 1 4 2;
              2 4 1 4;
              4 2 4 1];
%Cambia las coordenadas de F4, lo que es 3 ahora es 1 y viceversa
%Cambia el sentido del giro antes era horario ahora es antihorario
for i=1:CoF4C
    if F4Re(1,i)== 1
       F4Re(1,i)= 3;
    elseif F4Re(1,i)== 3
       F4Re(1,i)= 1;
    else
       F4Re(1,i)= F4Re(1,i);
    end        
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Para pasar de F4 a VCC
tic
MatTrasVCC = [0 1 4 2;
              2 0 1 4;
              4 2 0 1;
              1 4 2 0];
for i=1:CoF4C
    if (i+1) <= CoF4C
        x = F4Re(1,i);
        y = F4Re(1,i+1);
%         if x == y
%             VCC(i) = 0;
%         else
            VCC(i) = MatTrasVCC(x+1,y+1);
%         end
    else
        x = F4Re(1,i);
        y = F4Re(1,1);
        
%         if x == y
%             VCC(i) = 0;
%         else
            VCC(i) = MatTrasVCC(x+1,y+1);
%         end
    end
end
toc
LlegoFinVcc = 1
tic
TamVCC = size(VCC);
Revcc = double(TamVCC(1,1));
Covcc = double(TamVCC(1,2));
NVcc1 = 0;
NVcc2 = 0;

for i=1:Covcc
    if VCC(i) == 1
        NVcc1 = NVcc1 + 1;
    end
    if VCC(i) == 2
        NVcc2 = NVcc2 + 1;
    end
end

EulerVCC = (NVcc2 - NVcc1)/4;
toc

LlegoFinVCCEuler = 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tic
con = 1;
N2cx = 0; %Convexidades
N2cc = 0; %Concavidades
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
                    %Revisa las concavidades y convexidades
%                     if valor == 2
%                         [N2cx,N2cc] = Convex(x,y,N2cx,N2cc);
%                     end 
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
                            %Revisa las concavidades y convexidades
%                             if valor == 2
%                                 [N2cx,N2cc] = Convex(x,y,N2cx,N2cc);
%                             end 
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
                                %Revisa las concavidades y convexidades
%                                 if valor == 2
%                                     [N2cx,N2cc] = Convex(x,y,N2cx,N2cc);
%                                 end
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
                             %Revisa las concavidades y convexidades
%                              if valor == 2
%                                  [N2cx,N2cc] = Convex(x,y,N2cx,N2cc);
%                              end
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
                    %Revisa las concavidades y convexidades
%                     if valor == 2
%                         [N2cx,N2cc] = Convex(x,y,N2cx,N2cc);
%                     end
                end
                
            end
        else
           OT(i) = MatTras3OT(x+1,y+1);
                    %-----------------------------
           valor = MatTras3OT(ref+1,y+1);
           %Revisa las concavidades y convexidades
%            if valor == 2
%                [N2cx,N2cc] = Convex(x,y,N2cx,N2cc);
%            end 
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
                %Revisa las concavidades y convexidades
%                 if valor == 2
%                     [N2cx,N2cc] = Convex(x,y,N2cx,N2cc);
%                 end
            else
                pos = 1;
                while(ref == x && pos <= CoF4C)
                    ref = F4Re(1,pos);
                    pos = pos + 1;
                end
                
                if pos <= CoF4C && ref ~= x
                    OT(i) = MatTras3OT(ref+1,y+1);
                    valor = MatTras3OT(ref+1,y+1);
                    %Revisa las concavidades y convexidades
%                     if valor == 2
%                         [N2cx,N2cc] = Convex(x,y,N2cx,N2cc);
%                     end       
                end  
            end
        end
    end
end 
toc

LlegoFin3OT = 1
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

%--------------------------------------------------------------------------
%Convexidades y concavidades en terminos de los teoremas 5.1 y 5.2
%El primer 2 en una cadena 3OT siempre representa una convexidad 
convexities = 0;
flagCC = 0;
concavities = 0;
flagCX = 0;
w = 0;
Firstone = 0;

tic
for i=1:CoF4C
    if OTB(i) == 1
        w = w + 1;
    elseif OTB(i) == 2
        if Firstone == 0            
            Firstone = 1;
            convexities = convexities + 1;
            flagCX = 1;
        else
            if(mod(w,2) == 0)
                if flagCX == 1
                    convexities = convexities + 1;
                    flagCC = 0;
                    w = 0;
                elseif flagCC == 1
                    concavities = concavities + 1;
                    flagCX = 0;
                    w = 0;
                end
            else
                if flagCX == 1
                    concavities = concavities + 1;
                    flagCX = 0;   
                    flagCC = 1;
                    w = 0;
                elseif flagCC == 1
                    convexities = convexities + 1;
                    flagCC = 0;
                    flagCX = 1; 
                    w = 0;
                end            
            end   
        end
    end
end

Euler1 = convexities - concavities;
Euler3OT = Euler1/4;
toc

LlegoFinTeorema = 1
%--------------------------------------------------------------------------
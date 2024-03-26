function [VCC] = VertexChain(F4Copia)

    TamF4Copia = size(F4Copia);
    CoF4C = double(TamF4Copia(1,2));

    F4Re = F4Copia;

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
                VCC(i) = MatTrasVCC(x+1,y+1);
        else
            x = F4Re(1,i);
            y = F4Re(1,1);
                VCC(i) = MatTrasVCC(x+1,y+1);
        end
    end
    toc
    LlegoFinVcc = 1;

%     TamVCC = size(VCC);
%     Revcc = double(TamVCC(1,1));
%     Covcc = double(TamVCC(1,2));
% 
%     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%     Archivo = fopen('D:\INFORMACIÓN\DOCUMENTOS\DOCTORADO\2° Semestre\ARTÍCULO - REVISIÓN IJPAIR\CÓDIGO\VertexChain.txt','w+');
% 
%     for i=1:Covcc
%         fprintf(Archivo,'%d',VCC(1,i)); 
%     end
%     fclose(Archivo);
%     guardoVCC = 1;
end
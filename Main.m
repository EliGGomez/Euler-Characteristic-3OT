global Archivo
global Mres
%Read image
nom = input('Image name .png: ','s');
arch = [nom,'.png'];
Img = imread(arch,'png');

T = size(Img);
R = double(T(1,1));
C = double(T(1,2));

Mres = Binarization(Img);

%Identifica si se tiene agujeros en la imagen 
Mcomplement = Complement(Mres);
%imshow(Mcomplement);
anyhole = 0;

for i=1:R
    for j=1:C
        if(Mcomplement(i,j) == 1)
            anyhole = 1;
        end
    end
end

%Start
switch anyhole
    case 0
        %--------------------Figure contour chains-------------------------
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
            
        ChainF8 = FreemanF8(Mres, CooRen, CooCol);  
        TamChainF8 = size(ChainF8);
        CoF8C = double(TamChainF8(1,2));

        Archivo = fopen(sprintf('ChainCodes.txt'),'w+');
        fprintf(Archivo,'Chain code F8 of the contour: \n');
        for i=1:CoF8C
            fprintf(Archivo,'%d',ChainF8(1,i)); 
        end
        guardoContornoF8 = 1;
        %--------------------------------------------------------------
        ChainF4 = FreemanF4(ChainF8);
        TamChainF4 = size(ChainF4);
        CoF4C = double(TamChainF4(1,2));
        
        fprintf(Archivo,'\n');
        fprintf(Archivo,'Chain code F4 of the contour: \n');
        for i=1:CoF4C
            fprintf(Archivo,'%d',ChainF4(1,i)); 
        end
        guardoContornoF4 = 1;
        %--------------------------------------------------------------
        ChainVCC = VertexChain(ChainF4);
        TamChainVCC = size(ChainVCC);
        CoVCC_C = double(TamChainVCC(1,2));
        
        fprintf(Archivo,'\n');
        fprintf(Archivo,'Chain code VCC of the contour: \n');
        for i=1:CoVCC_C
            fprintf(Archivo,'%d',ChainVCC(1,i)); 
        end
        guardoContornoVCC = 1;
        
        [NVcc1,NVcc2] = ConcaConvexVCC(ChainVCC);
        %--------------------------------------------------------------
        Chain3OT = ThreeOT(ChainF4);
        TamChain3OT = size(Chain3OT);
        Co3OT = double(TamChain3OT(1,2));
        
        fprintf(Archivo,'\n');
        fprintf(Archivo,'Chain code 3OT of the contour: \n');
        for i=1:Co3OT
            fprintf(Archivo,'%d',Chain3OT(1,i)); 
        end
        guardoContorno3OT = 1;
        fclose(Archivo); %Close File
        
        [N2convexities, N2concavities] = ParityTheorem(Chain3OT);              
        Holes = (-(N2convexities - N2concavities)/4) + 1;
        
        disp('------3OT-----');
        fprintf('N2Convex: %d \n',N2convexities);
        fprintf('N2Concave: %d \n', N2concavities);
        Euler3OT = Euler3OTChain(N2convexities,N2concavities);
        fprintf('Euler 3OT: %d \n', Euler3OT);
        fprintf('Holes: %d \n', Holes);
        %------------------------------------------------------------------
        disp('------VCC-----');
        fprintf('NVcc1: %d \n', NVcc1);
        fprintf('NVcc2: %d \n', NVcc2);
        EulerVCC = EulerVertexChain(NVcc2,NVcc1);
        fprintf('Euler VCC: %d \n', EulerVCC);
        fprintf('\n');
        fprintf('Chains saved in the ChainCodes.txt file!\n');
        %------------------------------------------------------------------                 
    case 1
  %--------------------Figure contour chains-------------------------------
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
            
        ChainF8 = FreemanF8(Mres, CooRen, CooCol);
        TamChainF8 = size(ChainF8);
        CoF8C = double(TamChainF8(1,2));

        Archivo = fopen(sprintf('ChainCodes.txt'),'w+');
        fprintf(Archivo,'Chain code F8 of the contour: \n');
        for i=1:CoF8C
            fprintf(Archivo,'%d',ChainF8(1,i)); 
        end
        guardoContornoF8 = 1;
        %--------------------------------------------------------------
        ChainF4 = FreemanF4(ChainF8);
        TamChainF4 = size(ChainF4);
        CoF4C = double(TamChainF4(1,2));
        
        fprintf(Archivo,'\n');
        fprintf(Archivo,'Chain code F4 of the contour: \n');
        for i=1:CoF4C
            fprintf(Archivo,'%d',ChainF4(1,i)); 
        end
        guardoContornoF4 = 1;
        %--------------------------------------------------------------
        ChainVCC = VertexChain(ChainF4);
        TamChainVCC = size(ChainVCC);
        CoVCC_C = double(TamChainVCC(1,2));
        
        fprintf(Archivo,'\n');
        fprintf(Archivo,'Chain code VCC of the contour: \n');
        for i=1:CoVCC_C
            fprintf(Archivo,'%d',ChainVCC(1,i)); 
        end
        guardoContornoVCC = 1;
        
        [NVcc1_Contour,NVcc2_Contour] = ConcaConvexVCC(ChainVCC);
        %--------------------------------------------------------------
        Chain3OT = ThreeOT(ChainF4);
        TamChain3OT = size(Chain3OT);
        Co3OT = double(TamChain3OT(1,2));
        
        fprintf(Archivo,'\n');
        fprintf(Archivo,'Chain code 3OT of the contour: \n');
        for i=1:Co3OT
            fprintf(Archivo,'%d',Chain3OT(1,i)); 
        end
        guardoContorno3OT = 1;
        
        [N2convexities_Contour, N2concavities_Contour] = ParityTheorem(Chain3OT);              
        %-------------------Holes contour chains---------------------------
       
        %Convexities and concavities 3OT
        sumN2convexities = 0;
        sumN2concavities = 0;
        %Convexities and concavities VCC
        SumNVcc1 = 0;
        SumNVcc2 = 0;
        
        [X, Y, etiquetada] = CoordinatesHoles(Mcomplement);
        TamX = size(X);
        CoX = double(TamX(1,2));  
           
        for i=1:CoX
            CooRHol=X(i);
            CooCHol=Y(i);
            
            Mhole = zeros(R,C);
            
            tag = etiquetada(CooRHol,CooCHol);
            
            for e=1:R
                for f=1:C
                    if(etiquetada(e,f) == tag)
                        Mhole(e,f) = Mcomplement(e,f);
                    end
                end
            end
            
             %%% Find first pixel
            for w=1:R
                for z=1:C
                    if(Mhole(w,z)==1)
                    CooRen=w;
                    CooCol=z;
                    break
                    end
                end
            end
            
            %Freeman F8
            ChainF8 = FreemanF8(Mhole,CooRen,CooCol);
            TamChainF8 = size(ChainF8);
            CoF8C = double(TamChainF8(1,2));
            
            fprintf(Archivo,'\n');
            fprintf(Archivo,'Chain code F8 of the Hole %d: \n',i);
            for a=1:CoF8C
                fprintf(Archivo,'%d',ChainF8(1,a)); 
            end
            guardoHoleF8 = 1;
            %--------------------------------------------------------------
            %Freeman F4
            ChainF4 = FreemanF4(ChainF8);
            TamChainF4 = size(ChainF4);
            CoF4C = double(TamChainF4(1,2));

            fprintf(Archivo,'\n');
            fprintf(Archivo,'Chain code F4 of the Hole %d: \n',i);
            for a=1:CoF4C
                fprintf(Archivo,'%d',ChainF4(1,a)); 
            end
            guardoHoleF4 = 1;
            %--------------------------------------------------------------
            %VCC
            ChainVCC = VertexChain(ChainF4);
            TamChainVCC = size(ChainVCC);
            CoVCC_C = double(TamChainVCC(1,2));

            fprintf(Archivo,'\n');
            fprintf(Archivo,'Chain code VCC of the Hole %d: \n',i);
            for a=1:CoVCC_C
                fprintf(Archivo,'%d',ChainVCC(1,a)); 
            end
            guardoHoleVCC = 1;
            
            %--------------------------------------------------------------
            [NVcc1_Hole,NVcc2_Hole] = ConcaConvexVCC(ChainVCC);
            SumNVcc1 = SumNVcc1 + NVcc1_Hole;
            SumNVcc2 = SumNVcc2 + NVcc2_Hole;
            %--------------------------------------------------------------
            %3OT
            Chain3OT = ThreeOT(ChainF4);
            TamChain3OT = size(Chain3OT);
            Co3OT = double(TamChain3OT(1,2));

            fprintf(Archivo,'\n');
            fprintf(Archivo,'Chain code 3OT of the Hole %d: \n',i);
            for a=1:Co3OT
                fprintf(Archivo,'%d',Chain3OT(1,a)); 
            end
            guardoHole3OT = 1;
            %--------------------------------------------------------------
            [N2convexities_Holes, N2concavities_Holes] = ParityTheorem(Chain3OT);
            %Se invierten las concavidades para los agujerros
            sumN2convexities = sumN2convexities + N2convexities_Holes;
            sumN2concavities = sumN2concavities + N2concavities_Holes;
            %--------------------------------------------------------------
            %Limpia las variables 
            %clear Mres;
            clear ChainF8;
            clear ChainF4;
            clear ChainVCC;
            clear EulerVCC;
            clear Chain3OT;
            clear N2convexities;
            clear N2concavities;
            clear NVcc1_Hole;
            clear NVcc2_Hole;
            clear Euler3OT;
            clear CooRen;
            clear CooCol;
            %clear Archivo;
        end
        fclose(Archivo); %Close File
        
        %Se invierte los valores de las concavidades y las convexidades en
        %los hoyos tanto en 3OT como en VCC
            Total_N2convexities = N2convexities_Contour + sumN2concavities;
            Total_N2concavities = N2concavities_Contour + sumN2convexities;
            disp('------3OT-----');
            fprintf('N2Convex: %d \n', Total_N2convexities);
            fprintf('N2Conca: %d \n', Total_N2concavities);
            Euler3OT = Euler3OTChain(Total_N2convexities,Total_N2concavities);
            fprintf('Euler 3OT: %d \n', Euler3OT);
            Holes = (-(Total_N2convexities - Total_N2concavities)/4) + 1;
            fprintf('Holes: %d \n', Holes);
        %------------------------------------------------------------------
            Total_NVcc1 = NVcc1_Contour + SumNVcc2;
            Total_NVcc2 = NVcc2_Contour + SumNVcc1;
            disp('------VCC-----');
            fprintf('NVcc1: %d \n', Total_NVcc1);
            fprintf('NVcc2: %d \n', Total_NVcc2);
            EulerVCC = EulerVertexChain(Total_NVcc2,Total_NVcc1);
            fprintf('Euler VCC: %d \n', EulerVCC);
            fprintf('\n');
        %------------------------------------------------------------------       
end

 
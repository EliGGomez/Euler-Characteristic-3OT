function [convexities, concavities] = ParityTheorem(OTB)
%Convexidades y concavidades en terminos de los teoremas 5.1 y 5.2
%El primer 2 en una cadena 3OT siempre representa una convexidad 

    convexities = 0;
    flagCC = 0;
    concavities = 0;
    flagCX = 0;
    w = 0;
    Firstone = 0;
    
    SizeOTB= size(OTB);
    CoOTB = double(SizeOTB(1,2));
    
    tic
    for i=1:CoOTB
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
end
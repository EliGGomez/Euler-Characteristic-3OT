function[NVcc1,NVcc2] = ConcaConvexVCC(VCC)

    TamVCC = size(VCC);
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
end
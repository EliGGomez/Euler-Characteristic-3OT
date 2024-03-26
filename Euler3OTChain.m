function [Euler3OT] = Euler3OTChain(N2convexities,N2concavities)
    Euler3OT = (N2convexities - N2concavities)/4;
end
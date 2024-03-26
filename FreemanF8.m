function [Freeman] = FreemanF8(Mres)
%Size of image
    T = size(Mres);
    R = double(T(1,1));
    C = double(T(1,2)); 
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
            CooRen;
            CooCol;
    cooCA=0;
    cooRA=0;
    i=CooRen;
    j=CooCol;
%--------------------------------------------------------------------------
%Star
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
    llegoFinF8=1;
end
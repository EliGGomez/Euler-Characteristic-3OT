function [Mres] = Binarization(Img)
    T = size(Img);
    R = double(T(1,1));
    C = double(T(1,2));

    %Binary image
    for i=1:R 
         for j=1:C
              if(Img(1,1) == 0)
                  Mres(i,j) = 0;
                  if(Img(i,j) <= 128)
                      Mres(i,j) = 0;
                  elseif(Img(i,j) >= 128)
                      Mres(i,j) = 1;
                  end
              elseif(Img(1,1) == 255)
                  Mres(i,j) = 0;
                  if(Img(i,j) >= 128)
                      Mres(i,j) = 0;
                  elseif(Img(i,j) <= 128)
                      Mres(i,j) = 1;
                  end
              end
         end
    end
end

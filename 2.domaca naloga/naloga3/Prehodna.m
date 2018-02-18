function [G,A] = Prehodna(m)
%funkcija A generira incidencno matriko verjetnosti prehodov. V G(i,j) je
%tako spravljena vrednost prehoda iz A(i,:) v A(j,:), kjer je A matrika
%generirana s funkcijo matrika
A = matrika(m);
G = sparse(0.5*m*(m+1),0.5*m*(m+1));
for i= 1:length(A)
    stevilo = 0;
    for j = 1:length(A)
        el1 = A(i,1);
        el2 = A(i,2);
        el3 = A(j,1);
        el4 = A(j,2);
        premiklevo = 0;
        premikdesno = 0;
        if abs(el1-el3) + abs(el2-el4) ~= 1
            continue;
        else
            if el1-el3 == 1
                verjetnost = (el1+el2)/m;%gremo v i-1,j
                if el2>0
                    verjetnost = verjetnost/2;
                end
            elseif el1 -el3 == -1
                verjetnost = 1-(el1+el2)/m;%gremo v i+1,j
                if el2<m-1
                    verjetnost = verjetnost/2;
                end
            elseif el2-el4 ==1
                verjetnost = (el1+el2)/m;%gremo v i,j-1
                if el1>0
                    verjetnost = verjetnost/2;
                end
            else
                verjetnost = 1-(el1+el2)/m;%gremo v i,j+1
                if el1<m-1
                    verjetnost = verjetnost/2;
                end
            end
            stevilo = stevilo +1;
            G(i,j) = verjetnost;
            if stevilo > 3
                break
            end
        end
    end
end
end


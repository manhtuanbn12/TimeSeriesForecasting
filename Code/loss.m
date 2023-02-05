    function l = loss(alp, data)
        %syms alp;
        n = length(data);
        l = 0;
        %F = zeros(1, n);
        %sym F;
        F0 = data(1);
        for i = 2:n
            F1 = alp * data(i-1) + (1 - alp) * F0;
            l = l + abs(F1 - data(i));
            F0 = F1;
        end
        l = 1./n * l;
%        plot(data)
    end

     
function x = opt_min(lower, upper, data)
    h = @(t) loss(t, data);
    x1 = linspace(lower, upper, 10000);
    h1 = zeros(1, length(x1));
    for j = 1:length(x1)
        h1(j) = h(x1(j));
    end
    figure;
    plot(x1, h1)
    xlabel('alpha')
    ylabel('MAE loss')
    x = fminbnd(h, lower, upper); 
end
     
function l = loss_linear(alpha, beta, data)
    l = 0;
    n = length(data);
    forecast = zeros(1, n);
    x0 = data(1);
    T1 = 0;
    F1 = x0 + T1;
    L2 = alpha * (data(1) - x0) + (1 - alpha) * (F1 - x0);
    T2 = beta * L2 + (1 - beta) * T1;
%    forecast(1) = F1;
    for i = 2:n
       F2 = alpha * data(i-1) + (1 - alpha) * F1 + T2;
       L2 = alpha * (data(i) - data(i-1)) + (1 - alpha) * (F2 - F1);
       T2 = beta * L2 + (1 - beta) * T2;
       F1 = F2;
       l = l + abs(F2 - data(i));
%       forecast(i) = F2;
    end
    l = 1./n * l;
    figure;
    plot(data, 'b');
    hold on;
%    plot(forecast, 'r');
end
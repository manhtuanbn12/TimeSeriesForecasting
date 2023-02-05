function [sol, fval] = opt_min_linear(data)
%    syms a;
%    syms b;
%    g = loss_linear(a, b, data);
%    g
%    h = matlabFunction(g);
    function f = objfunx(x, y)
        f = loss_linear(x, y, data);
    end
%    function result = f(x, y)
%        result = simplify(subs(g, a, x), b, y);
%    f = @(x, y) subs(subs(g, a, x), b, y);
%    end
    % T?o bi?n t?i ?u:
    x = optimvar('x');
    y = optimvar('y');
    % T?o objective function
    obj = objfunx(x,y);
    % T?o bài toán t?i ?u
    prob = optimproblem('Objective', obj);
    first_constr = x > 0;
    second_constr = x < 1;
    third_constr = y > 0;
    forth_constr = y < 1;
    prob.Constraints.constr = [first_constr; second_constr; third_constr; forth_constr];
    x0.x = 0.5;
    x0.y = 0.5;
    [sol, fval] = solve(prob, x0);
end
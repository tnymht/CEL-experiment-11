clc
clear
close all

L = 0.75;
dx = 0.025;
dy = 0.025;
dt = 0.00015;
k = 1;

N = L/dx + 1;

x = linspace(0, L, N);
y = linspace(0, L, N);

T = zeros(N, N);
T_new = T;

T(1, :) = 100;
T(:, 1) = 0;
T(N, :) = 0;
T(:, N) = 0;

alpha = k * dt / dx^2;

epsilon = 1e-4;
error = 1;

while error > epsilon
    
    T_old = T;
    
    for i = 2:N-1
        for j = 2:N-1
            T(i,j) = T_old(i,j) + alpha * ...
                (T_old(i+1,j) + T_old(i-1,j) + ...
                 T_old(i,j+1) + T_old(i,j-1) - 4*T_old(i,j));
        end
    end
    
    T(1, :) = 100;
    T(:, 1) = 0;
    T(N, :) = 0;
    T(:, N) = 0;
    
    error = max(max(abs(T - T_old)));
    
end

contourf(x, y, T, 20)
colorbar
xlabel('x (m)')
ylabel('y (m)')
title('2D Temperature Distribution')

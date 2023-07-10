% RK4 for 2nd ODE example from Youtube
clear;
clc;
close all;

% Input parameters
dt = 0.01;
k = 1;
m = 1;
x0 = 3;
v0 = 0;
t = 0:dt:10;

% Exact solution
x_exact = x0*cos(sqrt(k/m)*t);
v_exact = -sqrt(k/m)*x0*sin(sqrt(k/m)*t);

% RK4
f1 = @(t,x,v) v;
f2 = @(t,x,v) -k/m*x;
h = dt;

x = zeros(length(t), 1);
v = zeros(length(t), 1);

x(1) = x0;
v(1) = v0;

for i = 1:length(t)-1

    K1x = f1(t(i),x(i),v(i));
    K1v = f2(t(i),x(i),v(i));
    K2x = f1(t(i) + h/2, x(i) + h*K1x/2, v(i) + h*K1v/2);
    K2v = f2(t(i) + h/2, x(i) + h*K1x/2, v(i) + h*K1v/2);
    K3x = f1(t(i) + h/2, x(i) + h*K2x/2, v(i) + h*K2v/2);
    K3v = f2(t(i) + h/2, x(i) + h*K2x/2, v(i) + h*K2v/2);
    K4x = f1(t(i) + h, x(i) + h*K3x, v(i) + h*K3v);
    K4v = f2(t(i) + h, x(i) + h*K3x, v(i) + h*K3v);
    
    x(i+1) = x(i) + h/6*(K1x + 2*K2x + 2*K3x + K4x);
    v(i+1) = v(i) + h/6*(K1v + 2*K2v + 2*K3v + K4v);

end

%plots
subplot(121);
plot(t,x_exact,'b',t,x,'r');
legend('EXACT','RK4');
xlabel('Time(s)');
ylabel('Displacement (m)');
title('Displacement');

subplot(122);
plot(t,v_exact,'b',t,v,'r');
legend('Exact','RK4');
xlabel('Time (s)');
ylabel('Velocity (m/s)');
title('Velcoiy');

n = 3;
T = toeplitz([-2 1 zeros(1,n)]);
T(1,1) = 1; 
h = 1/(n+1);
u = cos(pi*(0:n+1)'*h/2);
c = (pi/2)^2;
f = c*u;
U = h*h*T\f;
e = 1 - U(1);

xt = linspace(0,1,11);
x = linspace(0,1,n+2);
ut = cos(pi*xt/2);

hold on
plot(xt,ut)
plot(x,U)
A = [-6.02172e-09 -8.0297e-09 -9.9995e-09 -1.1921e-08 -1.37954e-08 -1.56225e-08];
grad = A/(60/299);
plot(grad)
E = 2.0e+11;
I = 0.1167884288;
L = 60.0;
a = 26.6667/60;
x = linspace(0,60,200);
wx = a*x.^5/(120*E*I)-a*L^2*x.^3/(12*E*I)+a*L^3*x.^2/(6*E*I);
grid on
hold on
plot(x,-wx)
plot(x,-stpw)
legend('Qiu code (Numerical solution)','Theoretical solution')
xlabel('Lenght of Beam / m')
ylabel('Deflection / m')
wx(100)

n = 7;
h = 1/(n+1);
u = cos(pi*(1:n)'*h/2);
c = (pi/2)^2;
f = c*u;

Tb = toeplitz([2 -1 zeros(1,n-2)]);
Tb(1,1) = 1;
% for i = 1:n
%     for j = 1:n
%         if i - j == -1
%            Tb(j,i) = 1;
%         end
%     end
% end  

T = inv(Tb);

U = h*h*T*f;
U = [U; 0];
hold on
x = linspace(0,1,n+1);
x1 = linspace(0,1,n+2);
% legend('numerical','theoretical')

U;

e = 1 - U(1);
e_counter = [0.0384 0.0763 0.1510 0.2955];
h_counter = [1/(31+1) 1/(15+1) 1/(7+1) 1/(3+1)];
% plot(h_counter,e_counter)

g = [c/2;f];
Tn = toeplitz([2 -1 zeros(1,n-1)]);
Tn(1,1) = 1;
Tn1 = inv(Tn);
V = h*h*Tn1*g;
V = [V; 0];
E = 1 - V(1);
hold on 
plot(x, U)
plot(x, cos(pi*x/2))
plot(x1, V)

legend('numerical-1st order','numerical-2nd order','theoretical')

y0 = [0; 0; 0; 0; 3.14/2; 0];
tspan = 0:0.01:180;%defining the timespan
[t1,y1] = ode45(@non_linear_observer,tspan,y0);
figure
plot(t1,y1(:,1))
title('Non linear response of x')
xlabel('t in seconds')
ylabel('x in m')
figure
plot(t1,y1(:,2))
title('Non linear response of x_dot')
xlabel('t in seconds')
ylabel('x_dot in m/sec')
figure
plot(t1,y1(:,3))
title('Non linear response of theta1')
xlabel('t in seconds')
ylabel('theta2 in radians')
figure
plot(t1,y1(:,4))
title('Non linear response of theta1_dot')
xlabel('t in seconds')
ylabel('theta1_dot in radians/sec')
figure
plot(t1,y1(:,5))
title('Non linear response of theta2')
xlabel('t in seconds')
ylabel('theta2 in radians')
figure
plot(t1,y1(:,6))
title('Non linear response of theta2_dot')
xlabel('t in seconds')
ylabel('theta2_dot in radians/sec')

function dydt = non_linear_observer(t,y)
A = [0 1 0 0 0 0; 
     0 0 -1 0 -1 0; 
     0 0 0 1 0 0; 
     0 0 -11/20 0 -1/20 0; 
     0 0 0 0 0 1; 
     0 0 -1/10 0 -11/10 0];
 
B = [0; 1/1000; 0; 1/20000; 0; 1/10000];
C = [1 0 0 0 0 0];

Q = [1000 0 0 0 0 0;
     0 10 0 0 0 0;
     0 0 10000 0 0 0;
     0 0 0 100000 0 0;
     0 0 0 0 10000 0;
     0 0 0 0 0 100000];
R = 0.01*ones(1,1);
[K,P,e] = lqr(A,B,Q,R);
y1 = [y(1)];
F = -K*y;
p = [-1 -2 -3 -4 -5 -6]; % Poles matrix
L = place(A', C', p)';
correction_term = L*(y1-C*y);
dydt=zeros(6,1);
dydt(1) = y(2)+correction_term(1); %x_dot
dydt(2)=(F-1000*sin(y(3))*cos(y(3))-1000*sin(y(5))*cos(y(5))-(2000*(y(4)^2)*sin(y(3)))-(1000*(y(6)^2)*sin(y(5))))/(1000+100*((sind(y(3)))^2)+100*((sind(y(5)))^2))+correction_term(2);%x_ddot
dydt(3)= y(4)+correction_term(3); %theta 1D
dydt(4)= (dydt(2)*cos(y(3))-10*(sin(y(3))))/20 +correction_term(4); %theta 1 ddot;
dydt(5)= y(6)+correction_term(5); %theta 2D
dydt(6)= (dydt(2)*cos(y(5))-10*(sin(y(5))))/10+correction_term(6); %theta 2 ddot;
end
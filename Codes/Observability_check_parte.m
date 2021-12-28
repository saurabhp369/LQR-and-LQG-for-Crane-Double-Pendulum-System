A = [0 1 0 0 0 0; 
     0 0 -1 0 -1 0; 
     0 0 0 1 0 0; 
     0 0 -11/20 0 -1/20 0; 
     0 0 0 0 0 1; 
     0 0 -1/10 0 -11/10 0];
 
B = [0; 1/1000; 0; 1/20000; 0; 1/10000];
C1 = [1 0 0 0 0 0]; %for x as output
C2 = [0 0 1 0 0 0; 0 0 0 0 1 0];
C3 = [1 0 0 0 0 0; 0 0 0 0 1 0]; %for x and theta2 as output
C4 = [1 0 0 0 0 0 ;0 0 1 0 0 0; 0 0 0 0 1 0]; % for x, theta1 and theta2 as output

%Checking observability for output vector x(t)
O1 = [C1' A'*C1' A'*A'*C1' A'*A'*A'*C1' A'*A'*A'*A'*C1' A'*A'*A'*A'*A'*C1'];
if rank(O1)==6
    disp('System is observable for output vector x(t)')
else
    disp('System is not observable for output vector x(t)')
end
%Checking observability for output vector theta1 and theta2
O2 = [C2' A'*C2' A'*A'*C2' A'*A'*A'*C2' A'*A'*A'*A'*C2' A'*A'*A'*A'*A'*C2'];
if rank(O2)==6
    disp('System is observable for output vector theta1 and theta2')
else
    disp('System is not observable for output vector theta1 and theta2')
end
%Checking observability for output vector x and theta2
O3 = [C3' A'*C3' A'*A'*C3' A'*A'*A'*C3' A'*A'*A'*A'*C3' A'*A'*A'*A'*A'*C3'];
if rank(O3)==6
    disp('System is observable for output vector x and theta2')
else
    disp('System is not observable for output vector x and theta2')
end
%Checking observability for output vector x, theta1 and theta2
O4 = [C4' A'*C4' A'*A'*C4' A'*A'*A'*C4' A'*A'*A'*A'*C4' A'*A'*A'*A'*A'*C4'];
if rank(O4)==6
    disp('System is observable for output vector x, theta1 theta2')
else
    disp('System is not observable for output vector x, theta1 and theta2')
end
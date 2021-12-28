A = [0 1 0 0 0 0; 
     0 0 -1 0 -1 0; 
     0 0 0 1 0 0; 
     0 0 -11/20 0 -1/20 0; 
     0 0 0 0 0 1; 
     0 0 -1/10 0 -11/10 0];
 
B = [0; 1/1000; 0; 1/20000; 0; 1/10000];

%Checking controllability of the system
contrallibility_matrix = [B A*B A*A*B A*A*A*B A*A*A*A*B A*A*A*A*A*B];
if rank(contrallibility_matrix)==6
    disp('System is controllable')
else
    disp('System is not controllable')
end
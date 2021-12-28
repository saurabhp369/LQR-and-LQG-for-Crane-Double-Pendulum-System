A = [0 1 0 0 0 0; 
     0 0 -1 0 -1 0; 
     0 0 0 1 0 0; 
     0 0 -11/20 0 -1/20 0; 
     0 0 0 0 0 1; 
     0 0 -1/10 0 -11/10 0];
disp("Eigenvalues of Linearized System without LQR Feedback:")
disp(eig(A)); 
B = [0; 1/1000; 0; 1/20000; 0; 1/10000];

C = [1 0 0 0 0 0;0 0 0 0 0 0; 0 0 1 0 0 0;0 0 0 0 0 0; 0 0 0 0 1 0;0 0 0 0 0 0];
D = zeros(6,1);

Q = [1000 0 0 0 0 0;
     0 10 0 0 0 0;
     0 0 10000 0 0 0;
     0 0 0 100000 0 0;
     0 0 0 0 10000 0;
     0 0 0 0 0 100000];
R = 0.01*ones(1,1);
[K,P,e] = lqr(A,B,Q,R);
X0 = [0; 0; 0; 0; 3.142/2; 0];
sys = ss((A-B*K), zeros(6,1), C,D);
disp("Eigenvalues after LQR Feedback:")
disp(eig(A-B*K));
initial(sys, X0);




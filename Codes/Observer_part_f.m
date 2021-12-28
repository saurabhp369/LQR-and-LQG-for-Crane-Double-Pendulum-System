A = [0 1 0 0 0 0; 
     0 0 -1 0 -1 0; 
     0 0 0 1 0 0; 
     0 0 -11/20 0 -1/20 0; 
     0 0 0 0 0 1; 
     0 0 -1/10 0 -11/10 0];
 
B = [0; 1/1000; 0; 1/20000; 0; 1/10000];
C1 = [1 0 0 0 0 0]; %for x as output
C2 = [1 0 0 0 0 0; 0 0 0 0 1 0]; %for x and theta2 as output
C3 = [1 0 0 0 0 0 ;0 0 1 0 0 0; 0 0 0 0 1 0]; % for x, theta1 and theta2 as output
D = zeros(1,1);

Q = [1000 0 0 0 0 0;
     0 10 0 0 0 0;
     0 0 10000 0 0 0;
     0 0 0 100000 0 0;
     0 0 0 0 10000 0;
     0 0 0 0 0 100000];
R = 0.01*ones(1,1);


[K,P,e] = lqr(A,B,Q,R);
X0 = [0; 0; 0; 0; 3.142/2; 0; 0; 0; 0; 0; 0; 0];
p = [-1 -2 -3 -4 -5 -6]; % Poles matrix
L1 = place(A', C1', p)'
L2 = place(A', C2', p)';
L3 = place(A', C3', p)';

Ac1 = [(A-B*K) B*K; zeros(size(A)) (A-L1*C1)];
Bc1 = [B;B]; % Taking Bd = Bk = B
Cc1 = [C1 zeros(size(C1))];

Ac2 = [(A-B*K) B*K; zeros(size(A)) (A-L2*C2)];
Bc2 = [B;B];
Cc2 = [C2 zeros(size(C2))];

Ac3 = [(A-B*K) B*K; zeros(size(A)) (A-L3*C3)];
Bc3 = [B;B]; 
Cc3 = [C3 zeros(size(C3))];
sys1 = ss(Ac1, Bc1, Cc1, D);
figure
initial(sys1,X0)
figure
step(sys1)

sys2 = ss(Ac2, Bc2, Cc2, D);
figure
initial(sys2,X0)
figure
step(sys2)

sys3 = ss(Ac3, Bc3, Cc3, D);
figure
initial(sys3,X0)
figure
step(sys3)




A = [0 1 0 0 0 0; 
     0 0 -1 0 -1 0; 
     0 0 0 1 0 0; 
     0 0 -11/20 0 -1/20 0; 
     0 0 0 0 0 1; 
     0 0 -1/10 0 -11/10 0];
 
B = [0; 1/1000; 0; 1/20000; 0; 1/10000];

C = [1 0 0 0 0 0]; %for output vector x
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
vd=0.1*eye(6); %process noise
vn=1; %measurement noise

L=lqr(A',C',vd,vn)' 
sys = ss([(A-B*K) B*K; zeros(size(A)) (A-L*C)], [B;B],[C zeros(size(C))], D);
figure
initial(sys,X0)
figure
step(sys)

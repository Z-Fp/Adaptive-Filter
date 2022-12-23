close all;
clear all;
clc;
X = cast(imread('3.jpg'), 'double');
[M N]=size(X);
Ns=5; % 5*5 support region
u=5*10^(-4); % step size
Y=zeros(M,N); % predicted image
Y(1:Ns,1:Ns)=X(1:Ns,1:Ns);
D=zeros(M,N);
D(2:M,2:N)=X(1:M-1,1:N-1); % D is a shiftier version of X
e=zeros(M,N); % error matrix
W=zeros(Ns,Ns); % weight matrix
for m=1+floor(Ns/2):M-floor(Ns/2)
    for n=1+floor(Ns/2):N-floor(Ns/2)
        for l=1:Ns
            for k=1:Ns
                Y(m,n)=Y(m,n)+W(l,k)*X(m-floor(Ns/2)+l-1,n-floor(Ns/2)+k-1);
                e(m,n)=D(m,n)-Y(m,n);
                W(l,k)=W(l,k)+u*e(m,n);
            end
        end
    end
end
imshow(Y)
%initial expected loss rate

%lam(0)=0.03*exp(-0.5*j*1/12)  monthly
%theta(0)=0.1*lam
%loss given default L=0.6;

L=0.6;

lam=zeros(1,n*12);
Q0=zeros(1,n*12);

lam(1)=0.03;
Q0(1)=1/(1+lam(1)*1/12);
for j=2:n*12
    lam(j)=0.03*exp(-0.5*(j-1)*1/12);
    Q0(j)=Q0(j-1)/(1+lam(j)*1/12);
end
Q0=Q0(1,(12/i1:12/i1:n*12));
theta=0.1*lam;

down=1;
for k=0:12/i1-1
    down=down*(1+k/12*theta(k+1));
end
D=zeros(1,n*i1);
D(1)=1-Q0(1)/down;
for j=2:n*i1
    down=1;
    for k=0:12/i1-1
        down=down*(1+k/12*theta((j-1)*12/i1+k+1));
    end
    D(j)=(Q0(j-1)-Q0(j)/down)/Q0(j);
end
D=1-L*D;
H=1/dT1*(1./D-1);
H=H';
struc.H=H;

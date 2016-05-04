%initial OIS curve

%dT=0.25 f_j(0)=0.04+0.000375j, for all j, up to 30 years

f=zeros(1,n*4);
P0=zeros(1,n*4);
f(1)=0.04;
P0(1)=1/(1+0.25*f(1));
for j=2:n*4
    f(j)=0.04+0.000375*(j-1);
    P0(j)=P0(j-1)/(1+0.25*f(j));
end
f=f';
struc.f=f;
struc.P=P0;

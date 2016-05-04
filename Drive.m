clear
%floating leg tenor
i1=4;   %most liquid, dual curve for this tenor only.
dT1=1/i1;

%fixed leg tenor of swaption 
i2=1;   %typical in Euro market
dT2=1/i2;

struc.i1=i1;
struc.i2=i2;

%swaption specification
m=1; n=6;
K=[0.02,0.03,0.04,0.05,0.06,0.07,0.08];

struc.m=m;
struc.n=n;
struc.K=K;

%initial OIS curve
initial_OIS;

%initial expected loss rate
initial_lossRate;

price_MC=swptn_MC(struc);

%initial forward swap rate
F=f(m*i1+1:n*i1,1);
h=H(m*i1+1:n*i1,1);
f_risky=f+(1+1/i1*f).*H;
f_risky2=F+(1+1/i1*F).*h;
df=P0(1,m*i1+1:n*i1);
floating=df*f_risky2*1/i1;
fixedAnnty=sum(df(i1:i1:(n-m)*i1))*1/i2;
s=floating/fixedAnnty;
struc.s=s;
struc.fixedAnnty=fixedAnnty;
struc.f_risky=f_risky;

price_FFT=swptn_FFT(struc);
for j=1:size(K,2)
    impliedVol_FFT(j)=impVol(s,K(j),m,price_FFT(j)/fixedAnnty);
end
plot(K,impliedVol_FFT,'x');
axis([K(1),K(end),0.1,0.5])
hold on

for j=1:size(K,2)
    impliedVol_MC(j)=impVol(s,K(j),m,price_MC(j)/fixedAnnty);
end
plot(K,impliedVol_MC,'o');








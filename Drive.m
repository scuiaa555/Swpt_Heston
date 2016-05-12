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

%fixed annuity seen at time 0
A0=sum(P0(1,((m+1)*i1:i1:n*i1)))/i2; struc.A0=A0;

%forward swap rate at time 0
fwd_swap;
struc.s=s;

price_FFT=swptn_FFT(struc);

price_MC=swptn_MC(struc);

 for j=1:size(K,2)
     impliedVol_FFT(j)=impVol(s,K(j),m,price_FFT(j)/A0);
 end
 plot(K,impliedVol_FFT,'x');
 axis([K(1),K(end),0.1,0.5])
 hold on
 
 for j=1:size(K,2)
     impliedVol_MC(j)=impVol(s,K(j),m,price_MC(j)/A0);
 end
 plot(K,impliedVol_MC,'o');
 legend({'FFT','MC'},'FontSize',20);
 xlabel({'Strike'},'FontSize',14)
 ylabel({'Imp Vol.'},'FontSize',13)





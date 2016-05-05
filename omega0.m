function [omg_f,omg_H,alp]=omega0(struc)
    m=struc.m;n=struc.n;i1=struc.i1;P=struc.P;f=struc.f;H=struc.H;A0=struc.A0;s=struc.s;
    for k=m*i1:n*i1-1
        I(k)=intg(k,0,k/i1);
        alp(k)=1/i1*P(k+1)/A0;
        bet(k)=alp(k)*(1+1/i1*f(k+1))*H(k+1)*exp(1/i1*H(k+1)/(1+1/i1*H(k+1))*I(k));
    end
    for j=m*i1:n*i1-1
        omg_f(j)=0;sum1=0;sum2=0;
        for k=m*i1:j
            sum1=sum1+alp(k)*(f(k+1)+(1+1/i1*f(k+1))*H(k+1)*exp(1/i1*H(k+1)/(1+1/i1*H(k+1))*I(k)));
        end
        for l=m:n-1
            if ((l+1)*i1-1)<j
                sum2=sum2+alp((l+1)*i1-1)*i1;
            end
        end
        omg_f(j)=1/i1/(1+1/i1*f(j+1))*(sum1-sum2*s)+alp(j)+alp(j)/i1*H(j+1)*exp(1/i1*H(j+1)/(1+1/i1*H(j+1))*I(j));
        omg_f(j)=omg_f(j)*f(j+1)/s;
        omg_H(j)=alp(j)*(1+1/i1*f(j+1))*H(j+1)*exp(1/i1*H(j+1)/(1+1/i1*H(j+1))*I(j))*I(j)*1/i1/(1+1/i1*H(j+1))^2+alp(j)*(1+1/i1*f(j+1))*exp(1/i1*H(j+1)/(1+1/i1*H(j+1))*I(j));
        omg_H(j)=omg_H(j)*H(j+1)/s;
    end
end
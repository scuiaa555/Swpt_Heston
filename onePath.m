function disPayoff=onePath(m,n,i1,i2,f,H,K)
    dt=1/12;  % one time-step for MC
    T=[(0:1/i1:m) m*ones(1,(n-m)*i1-1)];
    
    V(1)=1;eps=1.5;kap=1;theta=1;
    rho=0;  %Heston parameters
    %rho=-0.5;
    
    %Bownian motion
    dim=3;
    BM=[zeros(dim,1) normrnd(0,sqrt(dt),dim,m/dt-1)];
    
    %stochastic multiplier
    dZ=BM(dim,:);
    for j=2:m/dt
        %V(j)=abs((sqrt(V(j-1))+eps/2*dZ(j-1))^2+(kap*(theta-V(j-1))-eps^2/4)*dt);
        V(j)=V(j-1)+kap*(theta-V(j-1))*dt+eps*sqrt(V(j-1))*dZ(j-1);
        V(j)=abs(V(j));
    end
    
    %OIS curve and expected loss rate
    dW=BM((1:2),:);
    for j=2:n*i1
        for p=2:T(j)/dt+1
            sig_rf=zeros(dim-1,1);
            for k=2:j
                sig_rf=sig_rf-1/i1*f(k,p-1)/(1+1/i1*f(k,p-1))*gam_f(k-1,(p-1)/12);
            end
            sig_D=1/i1*H(j,p-1)/(1+1/i1*H(j,p-1))*gam_H(j-1,(p-1)/12);
            f(j,p)=f(j,p-1)*exp(-V(p-1)*(gam_f(j-1,(p-1)/12)'*sig_rf+0.5*norm(gam_f(j-1,(p-1)/12))^2)*dt+sqrt(V(p-1))*(sqrt(1-rho^2)*gam_f(j-1,(p-1)/12)'*dW(:,p-1)+rho*norm(gam_f(j-1,(p-1)/12))*dZ(p-1)));
            H(j,p)=H(j,p-1)*exp(-V(p-1)*(gam_H(j-1,(p-1)/12)'*sig_rf+gam_H(j-1,(p-1)/12)'*sig_D+0.5*norm(gam_H(j-1,(p-1)/12))^2)*dt+sqrt(V(p-1))*(sqrt(1-rho^2)*gam_H(j-1,(p-1)/12)'*dW(:,p-1)+rho*norm(gam_H(j-1,(p-1)/12))*dZ(p-1)));
        end
    end
    
    F=f(m*i1+1:n*i1,m/dt+1);
    df(1)=1/(1+1/i1*F(1));
    for j=2:(n-m)*i1
        df(j)=df(j-1)/(1+1/i1*F(j));
    end
    h=H(m*i1+1:n*i1,m/dt+1);
    for j=1:size(F,1);
        f_risky(j)=F(j)+(1+1/i1*F(j))*h(j)*exp(1/i1*h(j)/(1+1/i1*h(j))*intg(m*i1+j-1,m,m+(j-1)/i1));
    end
 %   f_risky=F+(1+1/i1*F).*h;
    
     floating=df*(f_risky)'*1/i1;
     fixedAnnty=sum(df(i1:i1:(n-m)*i1))*1/i2;
     s=floating/fixedAnnty;
     payoff=fixedAnnty*max((s-K),0);

    %numeraire
    B=1;
    for j=1:m*i1
        B=B*(1+1/i1*f(j,T(j)/dt+1));
    end
    disPayoff=payoff/B;
end
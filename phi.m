function val=phi(z,struc)
    m=struc.m;
    dt=1/12;
    A(1)=0;B(1)=0;
    kap=1;eps=1.5;V0=1;theta=1;
    rho=-0.5;
    %rho=0;
    
    for step=1:m/dt
        a=kap*xiS_bar(m-step*dt,eps,kap,rho,struc)-rho*eps*norm(gamma_mn(m-step*dt,struc))*z;
        d=sqrt(a^2-norm(gamma_mn(m-step*dt,struc))^2*eps*eps*(z^2-z));
        g=(a+d-eps*eps*B(step))/(a-d-eps*eps*B(step));
        A(step+1)=A(step)+kap*theta/eps/eps*((a+d)*dt-2*log((1-g*exp(d*dt))/(1-g)));
        B(step+1)=B(step)+((a+d-eps*eps*B(step))*(1-exp(d*dt)))/(eps*eps*(1-g*exp(d*dt)));
    end
    val=exp(A(m/dt+1)+B(m/dt+1)*V0);
end
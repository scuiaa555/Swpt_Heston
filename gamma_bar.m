function val=gamma_bar(j,t,struc)
    H=struc.H;
    f=struc.f;
    f_risky=struc.f_risky;
    val=(1-H(j+1)/f_risky(j+1))*gam_rf(j,t)+(1-f(j+1)/f_risky(j+1))*gam_H(j,t);
end
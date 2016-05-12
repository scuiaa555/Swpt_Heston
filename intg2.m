function val=intg2(j,t,T)
    val=0;
    num=(T-t)*12;
    for ni=1:round(num)
        val=val+gam_f(j,t+(ni-1)/12)'*gam_H(j,t+(ni-1)/12);
    end
    val=val-0.5*gam_f(j,t)'*gam_H(j,t)+0.5*gam_f(j,T)'*gam_H(j,T);
    val=val/12;
end
function val=intg(j,t,T)
    val=0;
    num=(T-t)*12;
    for ni=1:round(num)
        val=val+norm(gam_H(j,t+(ni-1)/12))^2;
    end
    val=val/12;
end
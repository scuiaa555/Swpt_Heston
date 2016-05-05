function val=gamma_mn(t,struc)
    omg_f=struc.omg_f;
    omg_H=struc.omg_H;
    m=struc.m;n=struc.n;i1=struc.i1;
    val=0;
    for j=m*i1:n*i1-1
        val=val+omg_f(j)*gam_f(j,t)+omg_H(j)*gam_H(j,t);
    end
end
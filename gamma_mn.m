function val=gamma_mn(t,struc)
    m=struc.m;
    n=struc.n;
    i1=struc.i1;
    val=0;
    for j=m*i1:n*i1-1
        val=val+ome0(j,struc)*gam_rf(j,t)+beta0(j,struc)*gamma_bar(j,t,struc);
    end
end
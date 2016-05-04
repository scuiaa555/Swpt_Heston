function val=xiS(t,rho,struc)
    i1=struc.i1;
    f=struc.f;
    m=struc.m;
    n=struc.n;
    val=0;
    for j=m:n-1
        sum1=0;
        for k=1:(j+1)*i1-1
            sum1=sum1+1/i1*f(k+1)*norm(gam_rf(k,t))*rho/(1+1/i1*f(k+1));
        end
        val=val+i1*alpha0((j+1)*i1-1,struc)*sum1;
    end
end
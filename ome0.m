function val=ome0(j,struc)
    m=struc.m;
    n=struc.n;
    f_risky=struc.f_risky;
    f=struc.f;
    s=struc.s;
    i1=struc.i1;
    sum1=0;
    for k=m*i1:j
        sum1=sum1+alpha0(k,struc)*f_risky(k+1);
    end
    sum2=0;
    for l=m:n-1
        if ((l+1)*i1-1<j) 
            sum2=sum2+alpha0((l+1)*i1-1,struc)*i1;
        end
    end
    val=1/i1/(1+1/i1*f(j+1))*(sum1-sum2*s)*f(j+1)/s;
end
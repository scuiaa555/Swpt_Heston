function price=swptn_MC(struc)
    Npath=1000;
    disPayoff=0;
    for npath=1:Npath
        npath
        m=struc.m;n=struc.n;i1=struc.i1;i2=struc.i2;f=struc.f;H=struc.H;K=struc.K;
        disPayoff=disPayoff+onePath(m,n,i1,i2,f,H,K);
    end
    price=disPayoff/Npath;
end
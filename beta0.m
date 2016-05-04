function val=beta0(k,struc)
    i1=struc.i1;
    P=struc.P;
    Annty=struc.fixedAnnty;
    s=struc.s;
    f_risky=struc.f_risky;
    val=1/i1*P(k+1)*f_risky(k+1)/Annty/s;
end
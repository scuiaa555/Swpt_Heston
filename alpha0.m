function val=alpha0(k,struc)
    i1=struc.i1;
    P=struc.P;
    Annty=struc.fixedAnnty;
    val=1/i1*P(k+1)/Annty;
end
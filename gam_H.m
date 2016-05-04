function val=gam_H(j,t)
    a1=0.08/2;b1=0.1/2;c1=0.05*3;a2=0.1/2;b2=-0.25/2;c2=0.1;
    %a1=0.2;b1=0;c1=0;a2=0;b2=0;c2=0;
    val=[a1+b1*exp(-c1*(j/4-t)); a2+b2*exp(-c2*(j/4-t))];
end
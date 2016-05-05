function val=gam_H(j,t)
    a1=0.08;b1=0.1;c1=0.05;a2=0.1;b2=-0.25;c2=0.1;
    %a1=0.2;b1=0;c1=0;a2=0;b2=0;c2=0;
    val=[a1+b1*exp(-(j/4-t)/0.5*c1); a2+b2*exp(-(j/4-t)/0.5*c2)];
    %val=[a2+b2*exp(-(j/4-t)/0.5*c2);a1+b1*exp(-(j/4-t)/0.5*c1)];
end
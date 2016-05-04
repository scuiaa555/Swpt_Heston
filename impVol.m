function impV=impVol(s,K,T,price)
    f=@(imp)s*normcdf((log(s/K)+0.5*imp*imp*T)/imp/sqrt(T))-K*normcdf((log(s/K)-0.5*imp*imp*T)/imp/sqrt(T))-price;
    impV=fzero(f,0.1);
end
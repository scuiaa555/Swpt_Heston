% forward swap rate

sum=0;
for j=m*i1:n*i1-1
    sum=sum+1/i1*P0(j+1)*(f(j+1)+(1+1/i1*f(j+1))*H(j+1)*exp(1/i1*H(j+1)/(1+1/i1*H(j+1))*intg(j,0,j/i1)));
end
s=sum/A0;
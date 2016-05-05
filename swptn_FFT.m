function price=swptn_FFT(struc)
    A=100;N=100;b=pi*N/A;du=A/N;u=(0:1:N-1)*du;a=1;dk=2*pi/N/du;
    [omg_f,omg_H,alp]=omega0(struc);
    struc.omg_f=omg_f;
    struc.omg_H=omg_H;
    struc.alp=alp;
    for j=1:N
        F(j)=exp(1i*b*u(j))*psiT(u(j),a,struc);
    end
    fftF=fft(F);
    for j=1:N
        Hf(j)=1/pi*(fftF(j)-psiT(0,a,struc)/2+exp(1i*b*du*N)*psiT(du*N,a,struc)/2)*du;
    end
    Hf=real(Hf);
    C=Hf.*exp(-a*(-pi:dk:-pi+dk*(N-1)));
    s=struc.s;K=struc.K;
    C=C.*s;
    kk=log(K/s);
    C=C*struc.A0;
    price=interp1((-pi:dk:-pi+dk*(N-1)),C,kk,'pchip');
end
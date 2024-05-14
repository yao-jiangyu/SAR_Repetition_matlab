clc
close all
clear all

%% 矩形函数及其傅里叶变换
dt1 = 0.01;
t1 = -100:dt1:100-dt1;

% 矩形函数
At = zeros(1,20000);
for i = 9950:1:10050
    At(i) = 1;
end

N1 = 2^14;
df1 = 1/dt1;
f1 = -df1/2:df1/N1:(df1/2-df1/N1);
Af = fft(fftshift(At),N1);
Af = fftshift(real(Af)/max(real(Af)));

%% Sinc函数及其傅里叶变换
dt2 = 0.01;
t2 = -100:dt2:100-dt2;

Bt = sin(pi*t2)./(pi*t2);

N2 = 2^20;
df2 = 1/dt2;
f = -df2/2:df2/N2:(df2/2-df2/N2);
Bf = fft(Bt,N2);
Bf = fftshift(abs(Bf)/max(abs(Bf)));

%% 绘图
figure
subplot(221),plot(t1,At,'r')
title('矩形函数'),xlabel('t','Interpreter','latex'),ylabel('At','Interpreter','latex')
axis([-4 4, -0.2 1.4])
grid on

subplot(222),plot(f1,Af,'r')
title('矩形函数傅里叶变换结果'),xlabel('f','Interpreter','latex'),ylabel('Af','Interpreter','latex')
axis([-4 4, -0.4 1.4])
grid on

subplot(223),plot(t2,Bt,'b')
title('Sinc函数'),xlabel('t','Interpreter','latex'),ylabel('Bt','Interpreter','latex')
axis([-4 4, -0.4 1.4])
grid on

subplot(224),plot(f,Bf,'b')
title('Sinc函数傅里叶变换结果'),xlabel('f','Interpreter','latex'),ylabel('Bf','Interpreter','latex')
axis([-4 4, -0.2 1.4])
grid on

sgtitle('图2.3 矩形和sinc函数的傅里叶变换','Fontsize',12)
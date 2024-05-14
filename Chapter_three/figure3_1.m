%% 线性调频与脉冲压缩
clear,clc,close all
set(0,'defaultfigurecolor','w')%设置图形窗口的默认背景颜色为白色

%% Chirp信号参数设置
f0 = 0;      %中心频率
Tr = 7.24e-6;%时宽
Br = 5.8e6;%带宽
alpha = 5;%过采样率
Fs = alpha*Br;%采样率
Kr = Br/Tr;%线性调频率
N =  round( Tr / (1/Fs) );%采样点数
dt=Tr/N;%采样间隔
t = linspace( -Tr/2 , Tr/2 , N);%在[-Tr/2,Tr/2]选取采样点
  
% % 设置自变量的几种方式
% t1 = linspace(-Tr/2,Tr/2,N);
% t2 = -Tr/2:dt:Tr/2;
% t3 = (-N/2:N/2)/N*Tr;

st = exp( 1j * ( 2 * pi * f0 * t + pi * Kr * t.^2 )); % Chirp信号生成
f_chirp= f0 + Kr * t; %信号频率
phase_chirp = 2 * pi * f0 * t + pi * Kr * t.^2;%信号相位

%% 时域绘图
figure;
subplot(2, 2, 1),plot( t*1e6, real(st) ),xlabel('相对于t_{0}时间(\mus)'),ylabel('幅度'),title('Chirp信号实部');
subplot(2, 2, 3),plot( t*1e6, imag(st) ),xlabel('相对于t_{0}时间(\mus)'),ylabel('幅度'),title('Chirp信号虚部');
subplot(2, 2, 4),plot( t*1e6, f_chirp/1e6 ),xlabel('相对于t_{0}时间(\mus)'),ylabel('频率 /MHz'),title('Chirp信号频率');
subplot(2, 2, 2),plot( t*1e6, phase_chirp ),xlabel('相对于t_{0}时间(\mus)'),ylabel('相位 /rad'),title('Chirp信号相位');
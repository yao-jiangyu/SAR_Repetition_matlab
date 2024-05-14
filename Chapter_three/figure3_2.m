%% 线性调频与脉冲压缩
clear,clc,close all
set(0,'defaultfigurecolor','w')%设置图形窗口的默认背景颜色为白色

%% 参数设置
TBP = 720;%时间带宽积
Tr = 10e-6;%脉冲持续时间
Br = TBP/Tr;%信号带宽
Kr= Br/Tr;%线性调频频率
alpha = 1.25;%过采样率
Fs = alpha*Br;%采样率
N = 2*ceil(Fs*Tr/2);%采样点数,向正无穷舍入，保证N是偶数
dt = Tr/N;%采样时间间隔
df = Fs/N;%采样频率间隔
t = -Tr/2:dt:Tr/2-dt;%时间变量
f = -Fs/2:df:Fs/2-df;%频率变量
st = exp(1j*pi*Kr*t.^2);%chirp信号复数表达式
Sf1 = exp(-1j*pi*f.^2/Kr);%chirp信号频谱表达式
Sf2 = fftshift(fft(fftshift(st)));%chirp信号快速傅里叶变换

%% 绘图
%Sf1
figure
subplot(221),plot(f*1e-6,real(Sf1)),xlabel('频率/MHZ'),ylabel('幅度'),title('频谱实部');
axis([-10 10,-1.2 1.2])
subplot(222),plot(f*1e-6,abs(Sf1)),xlabel('频率/MHZ'),ylabel('弧度'),title('频谱幅度');
axis([-10 10,-1.2 1.2])
subplot(223),plot(f*1e-6,imag(Sf1)),xlabel('频率/MHZ'),ylabel('幅度'),title('频谱虚部');
axis([-10 10,-1.2 1.2])
subplot(224),plot(f*1e-6,unwrap(angle(Sf1))),xlabel('频率/MHZ'),ylabel('相位(弧度)'),title('频谱相位');
axis([-28 28,0 400])
 
%Sf2
figure
subplot(221),plot(f*1e-6,real(Sf2)),xlabel('频率/MHZ'),ylabel('幅度'),title('频谱实部');
axis([-10 10,-40 40])
subplot(222),plot(f*1e-6,abs(Sf2)),xlabel('频率/MHZ'),ylabel('弧度'),title('频谱幅度');
axis([-50 50,-0 40])
subplot(223),plot(f*1e-6,imag(Sf2)),xlabel('频率/MHZ'),ylabel('幅度'),title('频谱虚部');
axis([-10 10,-40 40])
subplot(224),plot(f*1e-6,unwrap(angle(Sf2))),xlabel('频率/MHZ'),ylabel('相位(弧度)'),title('频谱相位');
axis([-50 50,0 900])
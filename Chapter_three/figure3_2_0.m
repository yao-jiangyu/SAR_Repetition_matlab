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
f = f./(2*max(abs(f)));
st = exp(1j*pi*Kr*t.^2);%chirp信号复数表达式
Sf2 = fftshift(fft(fftshift(st)));%chirp信号快速傅里叶变换

%% 备注
%  https://blog.csdn.net/u014357799/article/details/75808288
% 为使得输出结果与理论分析相同，需要乘以系数 FFT: fftshift(fft(fftshift(x))) * dt

%% 绘图 
%Sf2，真实fft
figure
subplot(221),plot(f,real(Sf2)),xlabel('频率(归一化后)'),ylabel('幅度'),title('频谱实部');
axis([-0.1 0.1,-40 40])
subplot(222),plot(f,abs(Sf2)),xlabel('频率(归一化后)'),ylabel('弧度'),title('频谱幅度');
axis([-0.5 0.5,-0 40])
subplot(223),plot(f,imag(Sf2)),xlabel('频率(归一化后)'),ylabel('幅度'),title('频谱虚部');
axis([-0.1 0.1,-40 40])
subplot(224),plot(f,unwrap(angle(Sf2))),xlabel('频率(归一化后)'),ylabel('相位(弧度)'),title('频谱相位');
axis([-0.5 0.5,0 900])
suptitle('图3.2 线性调频脉冲的复频谱')
%% 线性调频与脉冲压缩
clear,clc,close all
set(0,'defaultfigurecolor','w')%设置图形窗口的默认背景颜色为白色

%% 参数设置
TBP = [25,50,100,200,400];          %时间带宽积
Tr = 1e-6;                           %脉冲持续时间 
H = figure;
for i = 1:5
    % 参数计算
    Br = TBP(i)/Tr;          % 信号带宽
    Kr = Br/Tr;               % 线性调频频率
    alpha = 1.25;           % 过采样率
    Fs = alpha*Br;          % 采样频率
    N = 2*ceil(Fs*Tr/2);     % 采样点数
    dt = Tr/N;              % 采样时间间隔
    df = Fs/N;              % 采样频率间隔
    % 变量设置
    t = -Tr/2:dt:Tr/2-dt;    % 时间变量
    f = -Fs/2:df:Fs/2-df;    % 频率变量
    % 信号表达
    st = exp(1j*pi*Kr*t.^2);               % Chirp信号复数表达式
    Sf = fftshift(fft(fftshift(st)));     % Chirp信号频谱表达式
    Sf1 = exp(-1j*pi*f.^2/Kr);%chirp信号频谱表达式
    % 绘图
    figure(H);
    % 频谱幅度
    subplot(5,2,2*i-1)
    plot(f*1e-6,abs(Sf)),hold on
    plot(f*1e-6,abs(Sf1),'k--');
    %频谱相位
    subplot(5,2,2*i)
    plot(f*1e-6,unwrap(angle(Sf))-max(unwrap(angle(Sf)))),hold on
    plot(f*1e-6,(-pi*f.^2/Kr)-max(-pi*f.^2/Kr),'k--');
    set(gca,'YDir','reverse')    % 设置坐标轴翻转
    text(0,-TBP(i)/2,['TBP= ',num2str(TBP(i))],'HorizontalAlignment','center')
end
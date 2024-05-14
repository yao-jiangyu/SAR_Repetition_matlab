%% ���Ե�Ƶ������ѹ��
clear,clc,close all
set(0,'defaultfigurecolor','w')%����ͼ�δ��ڵ�Ĭ�ϱ�����ɫΪ��ɫ

%% ��������
TBP = 720;%ʱ������
Tr = 10e-6;%�������ʱ��
Br = TBP/Tr;%�źŴ���
Kr= Br/Tr;%���Ե�ƵƵ��
alpha = 1.25;%��������
Fs = alpha*Br;%������
N = 2*ceil(Fs*Tr/2);%��������,�����������룬��֤N��ż��
dt = Tr/N;%����ʱ����
df = Fs/N;%����Ƶ�ʼ��
t = -Tr/2:dt:Tr/2-dt;%ʱ�����
f = -Fs/2:df:Fs/2-df;%Ƶ�ʱ���
f = f./(2*max(abs(f)));
st = exp(1j*pi*Kr*t.^2);%chirp�źŸ������ʽ
Sf2 = fftshift(fft(fftshift(st)));%chirp�źſ��ٸ���Ҷ�任

%% ��ע
%  https://blog.csdn.net/u014357799/article/details/75808288
% Ϊʹ�������������۷�����ͬ����Ҫ����ϵ�� FFT: fftshift(fft(fftshift(x))) * dt

%% ��ͼ 
%Sf2����ʵfft
figure
subplot(221),plot(f,real(Sf2)),xlabel('Ƶ��(��һ����)'),ylabel('����'),title('Ƶ��ʵ��');
axis([-0.1 0.1,-40 40])
subplot(222),plot(f,abs(Sf2)),xlabel('Ƶ��(��һ����)'),ylabel('����'),title('Ƶ�׷���');
axis([-0.5 0.5,-0 40])
subplot(223),plot(f,imag(Sf2)),xlabel('Ƶ��(��һ����)'),ylabel('����'),title('Ƶ���鲿');
axis([-0.1 0.1,-40 40])
subplot(224),plot(f,unwrap(angle(Sf2))),xlabel('Ƶ��(��һ����)'),ylabel('��λ(����)'),title('Ƶ����λ');
axis([-0.5 0.5,0 900])
suptitle('ͼ3.2 ���Ե�Ƶ����ĸ�Ƶ��')
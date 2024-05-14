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
f1 = f./(2*max(abs(f)));
st = exp(1j*pi*Kr*t.^2);%chirp�źŸ������ʽ
Sf1 = exp(-1j*pi*f.^2/Kr);%chirp�ź�Ƶ�ױ��ʽ��פ����λ����
Sf1 = Sf1/sqrt(abs(Kr));
Sf1 = Sf1*exp(1j*pi/4);
Sf2 = fftshift(fft(fftshift(st)))*dt;%chirp�źſ��ٸ���Ҷ�任
phase_chirp = -pi*f.^2/Kr+pi/4;%�ź���λ

%% ��ע
%  https://blog.csdn.net/u014357799/article/details/75808288
% Ϊʹ�������������۷�����ͬ����Ҫ����ϵ�� FFT: fftshift(fft(fftshift(x))) * dt

%% ��ͼ
%Sf1
figure;

subplot(221); 
plot(f1,real(Sf1)); hold on; 
plot(f1,real(Sf2));
legend('פ����λ','��ʵfft');
xlabel('Ƶ��(��һ����)'),ylabel('����'),title('Ƶ��ʵ��');
xlim([-0.1 0.1]);

subplot(222);
plot(f1,abs(Sf1)); hold on;
plot(f1,abs(Sf2));
legend('פ����λ','��ʵfft');
xlabel('Ƶ��(��һ����)'),ylabel('����'),title('Ƶ�׷���');

subplot(223);
plot(f1,imag(Sf1)); hold on;
plot(f1,imag(Sf2));
legend('פ����λ','��ʵfft');
xlabel('Ƶ��(��һ����)'),ylabel('����'),title('Ƶ���鲿');
xlim([-0.1 0.1]);

subplot(224);
plot(f1,phase_chirp); hold on;
plot(f1,unwrap(angle(Sf2))-max(unwrap(angle(Sf2))));
legend('פ����λ','��ʵfft');
xlabel('Ƶ��(��һ����)'),ylabel('��λ(����)'),title('Ƶ����λ');
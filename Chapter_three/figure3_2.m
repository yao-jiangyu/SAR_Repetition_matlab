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
st = exp(1j*pi*Kr*t.^2);%chirp�źŸ������ʽ
Sf1 = exp(-1j*pi*f.^2/Kr);%chirp�ź�Ƶ�ױ��ʽ
Sf2 = fftshift(fft(fftshift(st)));%chirp�źſ��ٸ���Ҷ�任

%% ��ͼ
%Sf1
figure
subplot(221),plot(f*1e-6,real(Sf1)),xlabel('Ƶ��/MHZ'),ylabel('����'),title('Ƶ��ʵ��');
axis([-10 10,-1.2 1.2])
subplot(222),plot(f*1e-6,abs(Sf1)),xlabel('Ƶ��/MHZ'),ylabel('����'),title('Ƶ�׷���');
axis([-10 10,-1.2 1.2])
subplot(223),plot(f*1e-6,imag(Sf1)),xlabel('Ƶ��/MHZ'),ylabel('����'),title('Ƶ���鲿');
axis([-10 10,-1.2 1.2])
subplot(224),plot(f*1e-6,unwrap(angle(Sf1))),xlabel('Ƶ��/MHZ'),ylabel('��λ(����)'),title('Ƶ����λ');
axis([-28 28,0 400])
 
%Sf2
figure
subplot(221),plot(f*1e-6,real(Sf2)),xlabel('Ƶ��/MHZ'),ylabel('����'),title('Ƶ��ʵ��');
axis([-10 10,-40 40])
subplot(222),plot(f*1e-6,abs(Sf2)),xlabel('Ƶ��/MHZ'),ylabel('����'),title('Ƶ�׷���');
axis([-50 50,-0 40])
subplot(223),plot(f*1e-6,imag(Sf2)),xlabel('Ƶ��/MHZ'),ylabel('����'),title('Ƶ���鲿');
axis([-10 10,-40 40])
subplot(224),plot(f*1e-6,unwrap(angle(Sf2))),xlabel('Ƶ��/MHZ'),ylabel('��λ(����)'),title('Ƶ����λ');
axis([-50 50,0 900])
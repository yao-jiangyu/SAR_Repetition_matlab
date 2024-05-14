%% ���Ե�Ƶ������ѹ��
clear,clc,close all
set(0,'defaultfigurecolor','w')%����ͼ�δ��ڵ�Ĭ�ϱ�����ɫΪ��ɫ

%% Chirp�źŲ�������
f0 = 0;      %����Ƶ��
Tr = 7.24e-6;%ʱ��
Br = 5.8e6;%����
alpha = 5;%��������
Fs = alpha*Br;%������
Kr = Br/Tr;%���Ե�Ƶ��
N =  round( Tr / (1/Fs) );%��������
dt=Tr/N;%�������
t = linspace( -Tr/2 , Tr/2 , N);%��[-Tr/2,Tr/2]ѡȡ������
  
% % �����Ա����ļ��ַ�ʽ
% t1 = linspace(-Tr/2,Tr/2,N);
% t2 = -Tr/2:dt:Tr/2;
% t3 = (-N/2:N/2)/N*Tr;

st = exp( 1j * ( 2 * pi * f0 * t + pi * Kr * t.^2 )); % Chirp�ź�����
f_chirp= f0 + Kr * t; %�ź�Ƶ��
phase_chirp = 2 * pi * f0 * t + pi * Kr * t.^2;%�ź���λ

%% ʱ���ͼ
figure;
subplot(2, 2, 1),plot( t*1e6, real(st) ),xlabel('�����t_{0}ʱ��(\mus)'),ylabel('����'),title('Chirp�ź�ʵ��');
subplot(2, 2, 3),plot( t*1e6, imag(st) ),xlabel('�����t_{0}ʱ��(\mus)'),ylabel('����'),title('Chirp�ź��鲿');
subplot(2, 2, 4),plot( t*1e6, f_chirp/1e6 ),xlabel('�����t_{0}ʱ��(\mus)'),ylabel('Ƶ�� /MHz'),title('Chirp�ź�Ƶ��');
subplot(2, 2, 2),plot( t*1e6, phase_chirp ),xlabel('�����t_{0}ʱ��(\mus)'),ylabel('��λ /rad'),title('Chirp�ź���λ');
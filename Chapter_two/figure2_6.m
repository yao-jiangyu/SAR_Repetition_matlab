clear all
close all
clc

%% ����
T = 1;
dt = 1/400;
t = 0:dt:1;
fs = 1/dt;
f0 = 15;
ft = 100;
BW = 75;%����75Hz
k = BW/T;%б��Ϊ����ʱ���
N  = length(t);
 
%% ��������
p0 = t+3;
p_max = max(p0);
p = p0./p_max;
 
%% ����ԭ�ź�
s1 = cos(2*pi*(f0.*t+0.5*k*t.^2)).*p;
s2 = exp(1i*2*pi*((f0-52.5).*t+0.5*k*t.^2)).*p;
s3 = cos(2*pi*(ft.*t+0.5*k*t.^2)).*p;
s4 = exp(1i*2*pi*(ft.*t+0.5*k*t.^2)).*p;

%% ԭ�źŻ�ͼ
figure
subplot(2,2,1),plot(s1);
subplot(2,2,2),plot(s2);
% subplot(2,2,2),plot(real(s2));
subplot(2,2,3),plot(s3);
subplot(2,2,4),plot(s4);
% subplot(2,2,4),plot(real(s4));

%% ����Ҷ�任
%F1_1 = fftshift(fft(fftshift(s1),N));
F1_1 = fftshift(fft(s1,N));
F1 = F1_1./max(abs(F1_1));
F2_2 = fftshift(fft(s2,N));
F2 = F2_2./max(abs(F2_2));
F3_3 = fftshift(fft(s3,N));
F3 = F3_3./max(abs(F3_3));
F4_4 = fftshift(fft(s4,N));
F4 = F4_4./max(abs(F4_4));
 
%% ��ͼ
f = -fs/2:fs/N:fs/2-fs/N;
figure
subplot(2,2,1); plot( f,abs(F1));
ylabel('����'); title('(a)ʵ&����');grid on
subplot(2,2,2); plot( f,abs(F2));
ylabel('����'); title('(b)��&����');grid on
subplot(2,2,3); plot( f,abs(F3));
ylabel('����'); title('(c)ʵ&�ǻ���'); grid on
subplot(2,2,4); plot( f,abs(F4));
ylabel('����'); title('(d)��&�ǻ���'); grid on

sgtitle('ͼ2.6 ʵ�źź͸��źţ������źźͷǻ����ź�֮���Ƶ�ײ���','Fontsize',12)
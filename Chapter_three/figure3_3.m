%% ���Ե�Ƶ������ѹ��
clear,clc,close all
set(0,'defaultfigurecolor','w')%����ͼ�δ��ڵ�Ĭ�ϱ�����ɫΪ��ɫ

%% ��������
TBP = [25,50,100,200,400];          %ʱ������
Tr = 1e-6;                           %�������ʱ�� 
H = figure;
for i = 1:5
    % ��������
    Br = TBP(i)/Tr;          % �źŴ���
    Kr = Br/Tr;               % ���Ե�ƵƵ��
    alpha = 1.25;           % ��������
    Fs = alpha*Br;          % ����Ƶ��
    N = 2*ceil(Fs*Tr/2);     % ��������
    dt = Tr/N;              % ����ʱ����
    df = Fs/N;              % ����Ƶ�ʼ��
    % ��������
    t = -Tr/2:dt:Tr/2-dt;    % ʱ�����
    f = -Fs/2:df:Fs/2-df;    % Ƶ�ʱ���
    % �źű��
    st = exp(1j*pi*Kr*t.^2);               % Chirp�źŸ������ʽ
    Sf = fftshift(fft(fftshift(st)));     % Chirp�ź�Ƶ�ױ��ʽ
    Sf1 = exp(-1j*pi*f.^2/Kr);%chirp�ź�Ƶ�ױ��ʽ
    % ��ͼ
    figure(H);
    % Ƶ�׷���
    subplot(5,2,2*i-1)
    plot(f*1e-6,abs(Sf)),hold on
    plot(f*1e-6,abs(Sf1),'k--');
    %Ƶ����λ
    subplot(5,2,2*i)
    plot(f*1e-6,unwrap(angle(Sf))-max(unwrap(angle(Sf)))),hold on
    plot(f*1e-6,(-pi*f.^2/Kr)-max(-pi*f.^2/Kr),'k--');
    set(gca,'YDir','reverse')    % ���������ᷭת
    text(0,-TBP(i)/2,['TBP= ',num2str(TBP(i))],'HorizontalAlignment','center')
end
clc
close all
clear all

%% ���������ξ���
M = 256;    % ����߶�
N2 = 256;   % ������
S0 = zeros(M,N2);
S0(M/8+1:M*7/8,N2/8+1:N2*7/8) = 1; % 33-224
%ԭʼ�ź�Ƶ���ʾ
S0_ff = fftshift(fft2(fftshift(S0)));
S0_ff = abs(S0_ff); % ������
S0_ff = S0_ff./max(max(S0_ff));
S0_ff = 20*log10(S0_ff+1e-4); % ��Ϊ�����д���0ֵ��log0=-inf 

%% Ť���ź�
S1 = zeros(M,N2);
theta = -pi/12;
for ii = 1:M
    for jj = 1:N2
        x = jj-N2/2;
        y = ii-M/2;
        At = [1 0; sin(-theta) 1]*[x y].';
        %At = [1 sin(-theta); 0 1]*[x y].';
        xx = round(At(1,1)+N2/2);
        yy = round(At(2,1)+M/2);
        if(xx>=1 && xx<= N2 && yy>=1 && yy<=M)
            S1(ii,jj) = S0(yy,xx);
        end
    end
end
%Ť���ź�Ƶ���ʾ
S1_ff = fftshift(fft2(fftshift(S1))); 
S1_ff = abs(S1_ff); % ������
S1_ff = S1_ff./max(max(S1_ff));
S1_ff = 20*log10(S1_ff+1e-4);

%% ��ת�ź�
S2 = zeros(M,N2);
for ii = 1:M
    for jj = 1:N2
        x = jj-N2/2;
        y = ii-M/2;
        At = [cos(-theta) -sin(-theta); sin(-theta) cos(-theta)]*[x y].';
        xx = round(At(1,1)+N2/2);
        yy = round(At(2,1)+M/2);
        if(xx>=1 && xx<= N2 && yy>=1 && yy<=M)
            S2(ii,jj) = S0(yy,xx);
        end
    end
end
%��ת�ź�Ƶ���ʾ
S2_ff = fftshift(fft2(fftshift(S2)));
S2_ff = abs(S2_ff); % ������
S2_ff = S2_ff./max(max(S2_ff));
S2_ff = 20*log10(S2_ff+1e-4);

%% ��ͼ
figure;colormap gray % �úڰ׻���ɫ����
subplot(3,2,1),imagesc(S0);axis off image
title('(a)ʱ��ԭʼ�ź�')
subplot(3,2,2),imagesc(S0_ff);axis off image
title('(b)ԭʼ�ź�Ƶ��')
subplot(3,2,3),imagesc(S1);axis off image
title('(c)ʱ��Ť���ź�')
subplot(3,2,4),imagesc(S1_ff);axis off image
title('(d)Ť���ź�Ƶ��')
subplot(3,2,5),imagesc(S2);axis off image
title('(e)ʱ����ת�ź�')
subplot(3,2,6),imagesc(S2_ff);axis off image
title('(f)��ת�ź�Ƶ��')
sgtitle('ͼ2.2 ��������Ť������ת�ĸ���Ҷ�任��','Fontsize',10)
function [cycle_data]=reprocessed_power_spectrum(fileName)
cycle_data=[];
load(fileName);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%��ͨ�˲�
[b,a]=ellip(4,0.1,40,[10000]*2/100000);%���IIR-LPF  
sf=filter(b,a,signal_seq); %�ź�ͨ�����˲���
% figure(8);
% backColor=[0.24 0.24 0.24];
% set(gcf,'color',backColor);
% set(gcf, 'InvertHardCopy', 'off');
% t2=1:107500;
% plot(t2,sf,'b'); %�����ź�ͨ����BPF�Ĳ���
% xlabel('t','Color','w'); ylabel('����','Color','w');title('ͨ��BPF��Ĳ���','Color','w'); 
% axis([0 107500 -20 20]);grid on;
%%%%%%%%%%%%%%%%%%%%%%%%%%%�źŲ���
sf_power_spectrum=fft(sf);
signal_1=abs(sf_power_spectrum);
sf_2power_spectrum=fft(signal_1);
signal=abs(sf_2power_spectrum);

cycle_data=mapminmax(signal);

% figure(9);
% % backColor=[0.24 0.24 0.24];
% % set(gcf,'color',backColor);
% % set(gcf, 'InvertHardCopy', 'off');
% plot(t2,cycle_data,'b');
% title('PN Cycle','FontSize',13');
% xlabel('chips','FontSize',13);ylabel('Amplitude','FontSize',13);
% axis([-inf inf -1 -0.9]);
% grid on;
clear
clc
load 'Syangben2.txt'
load 'Syangben.txt'
N=Syangben2;
P=Syangben;
M(1:200,1:64)=N(1:200,1:64);

% M(31:90,1:18)=N(61:120,1:18);

X1(1:200,1:32)= M(1:200,17:48);
X1(1:200,33)= M(1:200,55);
Y1 = M(1:200,7);
XX(1:20,1:32)=P(201:220,17:48);
for i=1:20

    Y_P7_1=KELMdnapl_P7_L11(XX(i,:));

    a1(i,1:32)=XX(i,:);
    a1(i,33)=Y_P7_1;

end

for i=1:20

    Y_P7_2=KELMdnapl_P7_L12(XX(i,:));

    a2(i,1:32)=XX(i,:);
    a2(i,33)=Y_P7_2;

end
for i=1:20

    Y_P7_3=KELMdnapl_P7_L13(XX(i,:));

    a3(i,1:32)=XX(i,:);
    a3(i,33)=Y_P7_3;

end
for i=1:20

    Y_P7_4=KELMdnapl_P7_L14(XX(i,:));

    a4(i,1:32)=XX(i,:);
    a4(i,33)=Y_P7_4;

end

b1 = P(201:220,7);
e1=[Y1,X1];
fid = fopen('sinc_train1','w');
fprintf(fid,'%12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f\n',e1');
e1=e1';
f1 =[b1,a1];
fid = fopen('sinc_test1','w');
fprintf(fid,'%12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f\n',f1');
f1=f1';
fclose(fid);

f2 =[b1,a2];
fid = fopen('sinc_test2','w');
fprintf(fid,'%12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f\n',f2');
f2=f2';
fclose(fid);

f3 =[b1,a3];
fid = fopen('sinc_test3','w');
fprintf(fid,'%12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f\n',f3');
f3=f3';
fclose(fid);

f4 =[b1,a4];
fid = fopen('sinc_test4','w');
fprintf(fid,'%12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f\n',f4');
f4=f4';
fclose(fid);
% X2(1:30,1:8) = M(1:30,1:8);
% X2(31:60,1:8)= M(61:90,1:8);
% Y2(1:30,1)= M(1:30,18);
% Y2(31:60,1)= M(61:90,18);
% a2 = M(31:60,1:8);
% b2 = M(31:60,18);
% e2=[Y2,X2];
% fid = fopen('sinc_train2','w');
% fprintf(fid,'%12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f\n',e2');
% e2=e2';
% f2 =[b2,a2];
% fid = fopen('sinc_test2','w');
% fprintf(fid,'%12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f\n',f2');
% f2=f2';
% 
% X3 = M(31:90,1:8);
% Y3 = M(31:90,18);
% a3 = M(1:30,1:8);
% b3 = M(1:30,18);
% e3=[Y3,X3];
% fid = fopen('sinc_train3','w');
% fprintf(fid,'%12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f\n',e3');
% e3=e3';
% f3 =[b3,a3];
% fid = fopen('sinc_test3','w');
% fprintf(fid,'%12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f\n',f3');
% f3=f3';

%�����Ŵ��㷨����
NIND=60;               %������Ŀ(Number of individuals)
MAXGEN=200;             %����Ŵ�����(Maximum number of generations)
NVAR=3;                %������Ŀ
PRECI=25;              %�����Ķ�����λ��(Precision of variables)
GGAP=0.8;              %����(Generation gap)
%��������������(Build field descriptor)
FieldD=[rep([PRECI],[1,NVAR]);rep([0;10],[1,NVAR]);rep([1;0;1;1],[1,NVAR])];
Chrom=crtbp(NIND, NVAR*PRECI);                         %������ʼ��Ⱥ
gen=0;                                                 
trace=zeros(MAXGEN,6);                                 %�Ŵ��㷨���ܸ��ٳ�ʼֵ
c=bs2rv(Chrom, FieldD);                                %��ʼ��Ⱥʮ����ת��
[ar1 ac1]=size(c);
for i=1:ar1
    ObjV(i,:)=KELMdnapl_setup_D(c(i,1:3));      %�����ʼ��Ⱥ��Ŀ�꺯��ֵ
end
while gen<MAXGEN
    FitnV=ranking(ObjV);                               %������Ӧ��ֵ(Assign fitness values)
    SelCh=select('sus',Chrom,FitnV,GGAP);              %ѡ��
    SelCh=recombin('xovsp',SelCh,0.7);                 %����
    SelCh=mut(SelCh);                                  %����
    c=bs2rv(SelCh,FieldD);                             %�Ӵ�ʮ����ת��
    [ar2 ac2]=size(c);
    for i=1:ar2
    ObjVSel(i,:)=KELMdnapl_setup_D(c(i,1:3)); 
    end
    [Chrom ObjV]=reins(Chrom,SelCh,1,1,ObjV,ObjVSel);  %�ز���
    gen=gen+1;
    [M, I]=min(ObjV);
    M,bs2rv(Chrom(I,:),FieldD)                         %���ÿһ�ε����Ž⼰���Ӧ���Ա���ֵ
    trace(gen,1)=min(ObjV);                            %�Ŵ��㷨���ܸ���
    trace(gen,2)=sum(ObjV)/length(ObjV);
    trace(gen,3:5)=bs2rv(Chrom(I,:),FieldD);
end
%% �������
figure;
hold on;%ʹ�����߻���һ��ͼ��
plot(trace(:,1),'r*-','LineWidth',1.5);
plot(trace(:,2),'o-','LineWidth',1.5);
legend('�����Ӧ��','ƽ����Ӧ��');
xlabel('��������','FontSize',12);
ylabel('��Ӧ��','FontSize',12);
grid on;%(�������)
 
line1 = '��Ӧ������MSE[SAPSOmethod]';
line2 = ['(��ֹ����=', ...
    num2str(MAXGEN),',��Ⱥ����pop=', ...
    num2str(NIND),')'];
line3 = ['ans=',num2str(ans),];
title({line1;line2;line3},'FontSize',12);



  
    




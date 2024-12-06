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

%定义遗传算法参数
NIND=60;               %个体数目(Number of individuals)
MAXGEN=200;             %最大遗传代数(Maximum number of generations)
NVAR=3;                %变量数目
PRECI=25;              %变量的二进制位数(Precision of variables)
GGAP=0.8;              %代沟(Generation gap)
%建立区域描述器(Build field descriptor)
FieldD=[rep([PRECI],[1,NVAR]);rep([0;10],[1,NVAR]);rep([1;0;1;1],[1,NVAR])];
Chrom=crtbp(NIND, NVAR*PRECI);                         %创建初始种群
gen=0;                                                 
trace=zeros(MAXGEN,6);                                 %遗传算法性能跟踪初始值
c=bs2rv(Chrom, FieldD);                                %初始种群十进制转换
[ar1 ac1]=size(c);
for i=1:ar1
    ObjV(i,:)=KELMdnapl_setup_D(c(i,1:3));      %计算初始种群的目标函数值
end
while gen<MAXGEN
    FitnV=ranking(ObjV);                               %分配适应度值(Assign fitness values)
    SelCh=select('sus',Chrom,FitnV,GGAP);              %选择
    SelCh=recombin('xovsp',SelCh,0.7);                 %重组
    SelCh=mut(SelCh);                                  %变异
    c=bs2rv(SelCh,FieldD);                             %子代十进制转换
    [ar2 ac2]=size(c);
    for i=1:ar2
    ObjVSel(i,:)=KELMdnapl_setup_D(c(i,1:3)); 
    end
    [Chrom ObjV]=reins(Chrom,SelCh,1,1,ObjV,ObjVSel);  %重插入
    gen=gen+1;
    [M, I]=min(ObjV);
    M,bs2rv(Chrom(I,:),FieldD)                         %输出每一次的最优解及其对应的自变量值
    trace(gen,1)=min(ObjV);                            %遗传算法性能跟踪
    trace(gen,2)=sum(ObjV)/length(ObjV);
    trace(gen,3:5)=bs2rv(Chrom(I,:),FieldD);
end
%% 结果分析
figure;
hold on;%使所有线画在一张图上
plot(trace(:,1),'r*-','LineWidth',1.5);
plot(trace(:,2),'o-','LineWidth',1.5);
legend('最佳适应度','平均适应度');
xlabel('进化代数','FontSize',12);
ylabel('适应度','FontSize',12);
grid on;%(添加网格)
 
line1 = '适应度曲线MSE[SAPSOmethod]';
line2 = ['(终止代数=', ...
    num2str(MAXGEN),',种群数量pop=', ...
    num2str(NIND),')'];
line3 = ['ans=',num2str(ans),];
title({line1;line2;line3},'FontSize',12);



  
    




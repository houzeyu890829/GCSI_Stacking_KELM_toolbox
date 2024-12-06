function F=KELMdnapl_PRES(Q)

a = Q;
b = 1;

f =[b,a];
fid34 = fopen('sinc_test','w');
fprintf(fid34,'%12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f\n',f');
f=f';
fclose(fid34);


%%
kernel_pars1(1:2)=[119.382504206374,1.06626156169956];
kernel_pars2(1)=[174.994771927439];
kernel_pars3(1:3)=[174.994771927439,4823.25046727808,0.151693825474197];
%train
%[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy] = elm('sinc_train', 'sinc_test', 0, 20, 'sig')
%[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy] = elm_kernel('sinc_train1', 'sinc_test1', 0, 9000, 'RBF_kernel',2000)
%[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy] = elm_kernel('mpg_train', 'mpg_test', 0, 990, 'RBF_kernel',2)
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY1_W1_PRES] = elm_kernel('sinc_train1', 'sinc_test', 0, 110.967013566703, 'poly_kernel',kernel_pars1);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY2_W1_PRES] = elm_kernel('sinc_train1', 'sinc_test', 0, 4999.99746680252, 'RBF_kernel',kernel_pars2);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY3_W1_PRES] = elm_kernel('sinc_train1', 'sinc_test', 0, 4999.99746680252, 'wav_kernel',kernel_pars3);

[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY1_W2_PRES] = elm_kernel('sinc_train2', 'sinc_test', 0, 110.967013566703, 'poly_kernel',kernel_pars1);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY2_W2_PRES] = elm_kernel('sinc_train2', 'sinc_test', 0, 4999.99746680252, 'RBF_kernel',kernel_pars2);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY3_W2_PRES] = elm_kernel('sinc_train2', 'sinc_test', 0, 4999.99746680252, 'wav_kernel',kernel_pars3);

[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY1_W3_PRES] = elm_kernel('sinc_train3', 'sinc_test', 0, 110.967013566703, 'poly_kernel',kernel_pars1);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY2_W3_PRES] = elm_kernel('sinc_train3', 'sinc_test', 0, 4999.99746680252, 'RBF_kernel',kernel_pars2);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY3_W3_PRES] = elm_kernel('sinc_train3', 'sinc_test', 0, 4999.99746680252, 'wav_kernel',kernel_pars3);
% 
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY1_W4_PRES] = elm_kernel('sinc_train4', 'sinc_test', 0, 110.967013566703, 'poly_kernel',kernel_pars1);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY2_W4_PRES] = elm_kernel('sinc_train4', 'sinc_test', 0, 4999.99746680252, 'RBF_kernel',kernel_pars2);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY3_W4_PRES] = elm_kernel('sinc_train4', 'sinc_test', 0, 4999.99746680252, 'wav_kernel',kernel_pars3);

[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY1_W5_PRES] = elm_kernel('sinc_train5', 'sinc_test', 0, 110.967013566703, 'poly_kernel',kernel_pars1);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY2_W5_PRES] = elm_kernel('sinc_train5', 'sinc_test', 0, 4999.99746680252, 'RBF_kernel',kernel_pars2);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY3_W5_PRES] = elm_kernel('sinc_train5', 'sinc_test', 0, 4999.99746680252, 'wav_kernel',kernel_pars3);

[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY1_W6_PRES] = elm_kernel('sinc_train6', 'sinc_test', 0, 110.967013566703, 'poly_kernel',kernel_pars1);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY2_W6_PRES] = elm_kernel('sinc_train6', 'sinc_test', 0, 4999.99746680252, 'RBF_kernel',kernel_pars2);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY3_W6_PRES] = elm_kernel('sinc_train6', 'sinc_test', 0, 4999.99746680252, 'wav_kernel',kernel_pars3);

[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY1_W7_PRES] = elm_kernel('sinc_train7', 'sinc_test', 0, 110.967013566703, 'poly_kernel',kernel_pars1);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY2_W7_PRES] = elm_kernel('sinc_train7', 'sinc_test', 0, 4999.99746680252, 'RBF_kernel',kernel_pars2);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY3_W7_PRES] = elm_kernel('sinc_train7', 'sinc_test', 0, 4999.99746680252, 'wav_kernel',kernel_pars3);

[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY1_W8_PRES] = elm_kernel('sinc_train8', 'sinc_test', 0, 110.967013566703, 'poly_kernel',kernel_pars1);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY2_W8_PRES] = elm_kernel('sinc_train8', 'sinc_test', 0, 4999.99746680252, 'RBF_kernel',kernel_pars2);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY3_W8_PRES] = elm_kernel('sinc_train8', 'sinc_test', 0, 4999.99746680252, 'wav_kernel',kernel_pars3);
% fid = fopen('TY1','w');
% fprintf(fid,'%2.8f\n',TY);
% TY2=load('TY1')
% [TrainingTime, TrainingAccuracy]=elm_train('sinc_train', 0, 20, 'sig')
% [TestingTime, TestingAccuracy] = elm_predict('sinc_test')
%TY=[-0.4744	-0.9236	0.5047	0.3408	-0.2459	0.8941	-0.2186	-0.4021	-0.5576	0.9114	-0.1027	-0.9459	-0.7833	-0.8742	0.4307	-0.0056	-0.3316	0.6325	-0.0568	0.5446]
% predict=mapminmax('reverse',TY2',DATA1ps)
% predict=predict';

% figure(1)
% hold on;
% plot(predict,'r*-');
% legend('original','predict');
% % title('矿山地质环境评价及预测的SVM网络模型预测结果输出曲线');
% xlabel('Sample points');
% ylabel('Comprehensive index');
% hold off
TY_W1_PRES=0.471761213*TY1_W1_PRES+0.2243132638*TY2_W1_PRES+0.3039255248*TY3_W1_PRES;
TY_W2_PRES=0.471761213*TY1_W2_PRES+0.2243132638*TY2_W2_PRES+0.3039255248*TY3_W2_PRES;
TY_W3_PRES=0.471761213*TY1_W3_PRES+0.2243132638*TY2_W3_PRES+0.3039255248*TY3_W3_PRES;
TY_W4_PRES=0.471761213*TY1_W4_PRES+0.2243132638*TY2_W4_PRES+0.3039255248*TY3_W4_PRES;
TY_W5_PRES=0.471761213*TY1_W5_PRES+0.2243132638*TY2_W5_PRES+0.3039255248*TY3_W5_PRES;
TY_W6_PRES=0.471761213*TY1_W6_PRES+0.2243132638*TY2_W6_PRES+0.3039255248*TY3_W6_PRES;
TY_W7_PRES=0.471761213*TY1_W7_PRES+0.2243132638*TY2_W7_PRES+0.3039255248*TY3_W7_PRES;
TY_W8_PRES=0.471761213*TY1_W8_PRES+0.2243132638*TY2_W8_PRES+0.3039255248*TY3_W8_PRES;

F=[TY_W1_PRES,TY_W2_PRES,TY_W3_PRES,TY_W4_PRES,TY_W5_PRES,TY_W6_PRES,TY_W7_PRES,TY_W8_PRES];

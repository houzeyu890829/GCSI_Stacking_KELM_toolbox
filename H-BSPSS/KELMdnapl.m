function F=KELMdnapl(Q)
a = Q;
b = 1;

f =[b,a];
fid33 = fopen('sinc_test','w');
fprintf(fid33,'%12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f\n',f');
f=f';

fclose(fid33);

kernel_pars1(1:2)=[4574.96477886930,3.46526513890222];
kernel_pars2(1)=[101.222249901958];
kernel_pars3(1:3)=[101.222249901958,3542.79066749783,2040.73926927862];

%%
%train
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY1_W1_up] = elm_kernel('sinc_train1', 'sinc_test', 0, 2151.04541632668, 'poly_kernel',kernel_pars1);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY2_W1_up] = elm_kernel('sinc_train1', 'sinc_test', 0, 4999.99746680252, 'RBF_kernel',kernel_pars2);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY3_W1_up] = elm_kernel('sinc_train1', 'sinc_test', 0, 4999.99746680252, 'wav_kernel',kernel_pars3);

[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY1_W2_up] = elm_kernel('sinc_train2', 'sinc_test', 0, 2151.04541632668, 'poly_kernel',kernel_pars1);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY2_W2_up] = elm_kernel('sinc_train2', 'sinc_test', 0, 4999.99746680252, 'RBF_kernel',kernel_pars2);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY3_W2_up] = elm_kernel('sinc_train2', 'sinc_test', 0, 4999.99746680252, 'wav_kernel',kernel_pars3);

[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY1_W3_up] = elm_kernel('sinc_train3', 'sinc_test', 0, 2151.04541632668, 'poly_kernel',kernel_pars1);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY2_W3_up] = elm_kernel('sinc_train3', 'sinc_test', 0, 4999.99746680252, 'RBF_kernel',kernel_pars2);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY3_W3_up] = elm_kernel('sinc_train3', 'sinc_test', 0, 4999.99746680252, 'wav_kernel',kernel_pars3);
% 
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY1_W4_up] = elm_kernel('sinc_train4', 'sinc_test', 0, 2151.04541632668, 'poly_kernel',kernel_pars1);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY2_W4_up] = elm_kernel('sinc_train4', 'sinc_test', 0, 4999.99746680252, 'RBF_kernel',kernel_pars2);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY3_W4_up] = elm_kernel('sinc_train4', 'sinc_test', 0, 4999.99746680252, 'wav_kernel',kernel_pars3);

[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY1_W5_up] = elm_kernel('sinc_train5', 'sinc_test', 0, 2151.04541632668, 'poly_kernel',kernel_pars1);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY2_W5_up] = elm_kernel('sinc_train5', 'sinc_test', 0, 4999.99746680252, 'RBF_kernel',kernel_pars2);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY3_W5_up] = elm_kernel('sinc_train5', 'sinc_test', 0, 4999.99746680252, 'wav_kernel',kernel_pars3);

[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY1_W6_up] = elm_kernel('sinc_train6', 'sinc_test', 0, 2151.04541632668, 'poly_kernel',kernel_pars1);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY2_W6_up] = elm_kernel('sinc_train6', 'sinc_test', 0, 4999.99746680252, 'RBF_kernel',kernel_pars2);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY3_W6_up] = elm_kernel('sinc_train6', 'sinc_test', 0, 4999.99746680252, 'wav_kernel',kernel_pars3);

[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY1_W7_up] = elm_kernel('sinc_train7', 'sinc_test', 0, 2151.04541632668, 'poly_kernel',kernel_pars1);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY2_W7_up] = elm_kernel('sinc_train7', 'sinc_test', 0, 4999.99746680252, 'RBF_kernel',kernel_pars2);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY3_W7_up] = elm_kernel('sinc_train7', 'sinc_test', 0, 4999.99746680252, 'wav_kernel',kernel_pars3);

[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY1_W8_up] = elm_kernel('sinc_train8', 'sinc_test', 0, 2151.04541632668, 'poly_kernel',kernel_pars1);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY2_W8_up] = elm_kernel('sinc_train8', 'sinc_test', 0, 4999.99746680252, 'RBF_kernel',kernel_pars2);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY3_W8_up] = elm_kernel('sinc_train8', 'sinc_test', 0, 4999.99746680252, 'wav_kernel',kernel_pars3);

[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY1_W1_mid] = elm_kernel('sinc_train9', 'sinc_test', 0, 2151.04541632668, 'poly_kernel',kernel_pars1);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY2_W1_mid] = elm_kernel('sinc_train9', 'sinc_test', 0, 4999.99746680252, 'RBF_kernel',kernel_pars2);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY3_W1_mid] = elm_kernel('sinc_train9', 'sinc_test', 0, 4999.99746680252, 'wav_kernel',kernel_pars3);

[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY1_W2_mid] = elm_kernel('sinc_train10', 'sinc_test', 0, 2151.04541632668, 'poly_kernel',kernel_pars1);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY2_W2_mid] = elm_kernel('sinc_train10', 'sinc_test', 0, 4999.99746680252, 'RBF_kernel',kernel_pars2);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY3_W2_mid] = elm_kernel('sinc_train10', 'sinc_test', 0, 4999.99746680252, 'wav_kernel',kernel_pars3);

[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY1_W3_mid] = elm_kernel('sinc_train11', 'sinc_test', 0, 2151.04541632668, 'poly_kernel',kernel_pars1);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY2_W3_mid] = elm_kernel('sinc_train11', 'sinc_test', 0, 4999.99746680252, 'RBF_kernel',kernel_pars2);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY3_W3_mid] = elm_kernel('sinc_train11', 'sinc_test', 0, 4999.99746680252, 'wav_kernel',kernel_pars3);
% 
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY1_W4_mid] = elm_kernel('sinc_train12', 'sinc_test', 0, 2151.04541632668, 'poly_kernel',kernel_pars1);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY2_W4_mid] = elm_kernel('sinc_train12', 'sinc_test', 0, 4999.99746680252, 'RBF_kernel',kernel_pars2);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY3_W4_mid] = elm_kernel('sinc_train12', 'sinc_test', 0, 4999.99746680252, 'wav_kernel',kernel_pars3);

[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY1_W5_mid] = elm_kernel('sinc_train13', 'sinc_test', 0, 2151.04541632668, 'poly_kernel',kernel_pars1);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY2_W5_mid] = elm_kernel('sinc_train13', 'sinc_test', 0, 4999.99746680252, 'RBF_kernel',kernel_pars2);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY3_W5_mid] = elm_kernel('sinc_train13', 'sinc_test', 0, 4999.99746680252, 'wav_kernel',kernel_pars3);

[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY1_W6_mid] = elm_kernel('sinc_train14', 'sinc_test', 0, 2151.04541632668, 'poly_kernel',kernel_pars1);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY2_W6_mid] = elm_kernel('sinc_train14', 'sinc_test', 0, 4999.99746680252, 'RBF_kernel',kernel_pars2);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY3_W6_mid] = elm_kernel('sinc_train14', 'sinc_test', 0, 4999.99746680252, 'wav_kernel',kernel_pars3);

[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY1_W7_mid] = elm_kernel('sinc_train15', 'sinc_test', 0, 2151.04541632668, 'poly_kernel',kernel_pars1);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY2_W7_mid] = elm_kernel('sinc_train15', 'sinc_test', 0, 4999.99746680252, 'RBF_kernel',kernel_pars2);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY3_W7_mid] = elm_kernel('sinc_train15', 'sinc_test', 0, 4999.99746680252, 'wav_kernel',kernel_pars3);

[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY1_W8_mid] = elm_kernel('sinc_train16', 'sinc_test', 0, 2151.04541632668, 'poly_kernel',kernel_pars1);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY2_W8_mid] = elm_kernel('sinc_train16', 'sinc_test', 0, 4999.99746680252, 'RBF_kernel',kernel_pars2);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY3_W8_mid] = elm_kernel('sinc_train16', 'sinc_test', 0, 4999.99746680252, 'wav_kernel',kernel_pars3);

[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY1_W1_bot] = elm_kernel('sinc_train17', 'sinc_test', 0, 2151.04541632668, 'poly_kernel',kernel_pars1);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY2_W1_bot] = elm_kernel('sinc_train17', 'sinc_test', 0, 4999.99746680252, 'RBF_kernel',kernel_pars2);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY3_W1_bot] = elm_kernel('sinc_train17', 'sinc_test', 0, 4999.99746680252, 'wav_kernel',kernel_pars3);

[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY1_W2_bot] = elm_kernel('sinc_train18', 'sinc_test', 0, 2151.04541632668, 'poly_kernel',kernel_pars1);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY2_W2_bot] = elm_kernel('sinc_train18', 'sinc_test', 0, 4999.99746680252, 'RBF_kernel',kernel_pars2);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY3_W2_bot] = elm_kernel('sinc_train18', 'sinc_test', 0, 4999.99746680252, 'wav_kernel',kernel_pars3);

[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY1_W3_bot] = elm_kernel('sinc_train19', 'sinc_test', 0, 2151.04541632668, 'poly_kernel',kernel_pars1);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY2_W3_bot] = elm_kernel('sinc_train19', 'sinc_test', 0, 4999.99746680252, 'RBF_kernel',kernel_pars2);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY3_W3_bot] = elm_kernel('sinc_train19', 'sinc_test', 0, 4999.99746680252, 'wav_kernel',kernel_pars3);
% 
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY1_W4_bot] = elm_kernel('sinc_train20', 'sinc_test', 0, 2151.04541632668, 'poly_kernel',kernel_pars1);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY2_W4_bot] = elm_kernel('sinc_train20', 'sinc_test', 0, 4999.99746680252, 'RBF_kernel',kernel_pars2);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY3_W4_bot] = elm_kernel('sinc_train20', 'sinc_test', 0, 4999.99746680252, 'wav_kernel',kernel_pars3);

[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY1_W5_bot] = elm_kernel('sinc_train21', 'sinc_test', 0, 2151.04541632668, 'poly_kernel',kernel_pars1);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY2_W5_bot] = elm_kernel('sinc_train21', 'sinc_test', 0, 4999.99746680252, 'RBF_kernel',kernel_pars2);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY3_W5_bot] = elm_kernel('sinc_train21', 'sinc_test', 0, 4999.99746680252, 'wav_kernel',kernel_pars3);

[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY1_W6_bot] = elm_kernel('sinc_train22', 'sinc_test', 0, 2151.04541632668, 'poly_kernel',kernel_pars1);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY2_W6_bot] = elm_kernel('sinc_train22', 'sinc_test', 0, 4999.99746680252, 'RBF_kernel',kernel_pars2);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY3_W6_bot] = elm_kernel('sinc_train22', 'sinc_test', 0, 4999.99746680252, 'wav_kernel',kernel_pars3);

[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY1_W7_bot] = elm_kernel('sinc_train23', 'sinc_test', 0, 2151.04541632668, 'poly_kernel',kernel_pars1);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY2_W7_bot] = elm_kernel('sinc_train23', 'sinc_test', 0, 4999.99746680252, 'RBF_kernel',kernel_pars2);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY3_W7_bot] = elm_kernel('sinc_train23', 'sinc_test', 0, 4999.99746680252, 'wav_kernel',kernel_pars3);

[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY1_W8_bot] = elm_kernel('sinc_train24', 'sinc_test', 0, 2151.04541632668, 'poly_kernel',kernel_pars1);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY2_W8_bot] = elm_kernel('sinc_train24', 'sinc_test', 0, 4999.99746680252, 'RBF_kernel',kernel_pars2);
[TrainingTime, TestingTime, TrainingAccuracy, TestingAccuracy,TY3_W8_bot] = elm_kernel('sinc_train24', 'sinc_test', 0, 4999.99746680252, 'wav_kernel',kernel_pars3);


% fid = fopen('TY1','w');
% fprintf(fid,'%2.8f\n',TY);
% TY2=load('TY1')
% [TrainingTime, TrainingAccuracy]=elm_train('sinc_train', 0, 20, 'sig')
% [TestingTime, TestingAccuracy] = elm_predict('sinc_test')
%TY=[-0.4744	-0.9236	0.5047	0.3408	-0.2459	0.8941	-0.2186	-0.4021	-0.5576	0.9114	-0.1027	-0.9459	-0.7833	-0.8742	0.4307	-0.0056	-0.3316	0.6325	-0.0568	0.5446]
% predict=mapminmax('reverse',TY2',DATA1ps)
% predict=predict';
TY_W1_up=0.471761213*TY1_W1_up+0.2243132638*TY2_W1_up+0.3039255248*TY3_W1_up;
TY_W2_up=0.471761213*TY1_W2_up+0.2243132638*TY2_W2_up+0.3039255248*TY3_W2_up;
TY_W3_up=0.471761213*TY1_W3_up+0.2243132638*TY2_W3_up+0.3039255248*TY3_W3_up;
TY_W4_up=0.471761213*TY1_W4_up+0.2243132638*TY2_W4_up+0.3039255248*TY3_W4_up;
TY_W5_up=0.471761213*TY1_W5_up+0.2243132638*TY2_W5_up+0.3039255248*TY3_W5_up;
TY_W6_up=0.471761213*TY1_W6_up+0.2243132638*TY2_W6_up+0.3039255248*TY3_W6_up;
TY_W7_up=0.471761213*TY1_W7_up+0.2243132638*TY2_W7_up+0.3039255248*TY3_W7_up;
TY_W8_up=0.471761213*TY1_W8_up+0.2243132638*TY2_W8_up+0.3039255248*TY3_W8_up;
TY_W1_mid=0.471761213*TY1_W1_mid+0.2243132638*TY2_W1_mid+0.3039255248*TY3_W1_mid;
TY_W2_mid=0.471761213*TY1_W2_mid+0.2243132638*TY2_W2_mid+0.3039255248*TY3_W2_mid;
TY_W3_mid=0.471761213*TY1_W3_mid+0.2243132638*TY2_W3_mid+0.3039255248*TY3_W3_mid;
TY_W4_mid=0.471761213*TY1_W4_mid+0.2243132638*TY2_W4_mid+0.3039255248*TY3_W4_mid;
TY_W5_mid=0.471761213*TY1_W5_mid+0.2243132638*TY2_W5_mid+0.3039255248*TY3_W5_mid;
TY_W6_mid=0.471761213*TY1_W6_mid+0.2243132638*TY2_W6_mid+0.3039255248*TY3_W6_mid;
TY_W7_mid=0.471761213*TY1_W7_mid+0.2243132638*TY2_W7_mid+0.3039255248*TY3_W7_mid;
TY_W8_mid=0.471761213*TY1_W8_mid+0.2243132638*TY2_W8_mid+0.3039255248*TY3_W8_mid;
TY_W1_bot=0.471761213*TY1_W1_bot+0.2243132638*TY2_W1_bot+0.3039255248*TY3_W1_bot;
TY_W2_bot=0.471761213*TY1_W2_bot+0.2243132638*TY2_W2_bot+0.3039255248*TY3_W2_bot;
TY_W3_bot=0.471761213*TY1_W3_bot+0.2243132638*TY2_W3_bot+0.3039255248*TY3_W3_bot;
TY_W4_bot=0.471761213*TY1_W4_bot+0.2243132638*TY2_W4_bot+0.3039255248*TY3_W4_bot;
TY_W5_bot=0.471761213*TY1_W5_bot+0.2243132638*TY2_W5_bot+0.3039255248*TY3_W5_bot;
TY_W6_bot=0.471761213*TY1_W6_bot+0.2243132638*TY2_W6_bot+0.3039255248*TY3_W6_bot;
TY_W7_bot=0.471761213*TY1_W7_bot+0.2243132638*TY2_W7_bot+0.3039255248*TY3_W7_bot;
TY_W8_bot=0.471761213*TY1_W8_bot+0.2243132638*TY2_W8_bot+0.3039255248*TY3_W8_bot;
% figure(1)
% hold on;
% plot(predict,'r*-');
% legend('original','predict');
% % title('矿山地质环境评价及预测的SVM网络模型预测结果输出曲线');
% xlabel('Sample points');
% ylabel('Comprehensive index');
% hold off


F=[TY_W1_up,TY_W2_up,TY_W3_up,TY_W4_up,TY_W5_up,TY_W6_up,TY_W7_up,TY_W8_up,TY_W1_mid,TY_W2_mid,TY_W3_mid,TY_W4_mid,TY_W5_mid,TY_W6_mid,TY_W7_mid,TY_W8_mid,TY_W1_bot,TY_W2_bot,TY_W3_bot,TY_W4_bot,TY_W5_bot,TY_W6_bot,TY_W7_bot,TY_W8_bot];

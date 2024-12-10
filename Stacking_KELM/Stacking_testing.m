clc
clear
%y标准化了精度高，用这个
% figure(1);
% plot(d,'o-');
% % grid on;
% whos d;
load 'Syangben.txt'

M=Syangben;


XX(1:20,1:32)= M(201:220,17:48);



% for i=1:20
% 
%     Y_P1_1=KELMdnapl_P1_L11(XX(i,:));
%     Y_P1_2=KELMdnapl_P1_L12(XX(i,:));
%     Y_P1_3=KELMdnapl_P1_L13(XX(i,:));
%     Y_P1_4=KELMdnapl_P1_L14(XX(i,:));
%     XX_2(1,1:32)=XX(i,:);
%     XX_2(1,33)=Y_P1_1;
%     Y_P1_2_1=KELMdnapl_P1_L2(XX_2(1,:));
%     XX_2(1,33)=Y_P1_2;
%     Y_P1_2_2=KELMdnapl_P1_L2(XX_2(1,:));
%     XX_2(1,33)=Y_P1_3;
%     Y_P1_2_3=KELMdnapl_P1_L2(XX_2(1,:));
%     XX_2(1,33)=Y_P1_4;
%     Y_P1_2_4=KELMdnapl_P1_L2(XX_2(1,:));
%     Stacking_Y(i,1)=(Y_P1_2_1+Y_P1_2_2+Y_P1_2_3+Y_P1_2_4)/4;
% end

% for i=1:20
% 
%     Y_P2_1=KELMdnapl_P2_L11(XX(i,:));
%     Y_P2_2=KELMdnapl_P2_L12(XX(i,:));
%     Y_P2_3=KELMdnapl_P2_L13(XX(i,:));
%     Y_P2_4=KELMdnapl_P2_L14(XX(i,:));
%     XX_2(1,1:32)=XX(i,:);
%     XX_2(1,33)=Y_P2_1;
%     Y_P2_2_1=KELMdnapl_P2_L2(XX_2(1,:));
%     XX_2(1,33)=Y_P2_2;
%     Y_P2_2_2=KELMdnapl_P2_L2(XX_2(1,:));
%     XX_2(1,33)=Y_P2_3;
%     Y_P2_2_3=KELMdnapl_P2_L2(XX_2(1,:));
%     XX_2(1,33)=Y_P2_4;
%     Y_P2_2_4=KELMdnapl_P2_L2(XX_2(1,:));
%     Stacking_Y(i,2)=(Y_P2_2_1+Y_P2_2_2+Y_P2_2_3+Y_P2_2_4)/4;
% end

% for i=1:20
% 
%     Y_P3_1=KELMdnapl_P3_L11(XX(i,:));
%     Y_P3_2=KELMdnapl_P3_L12(XX(i,:));
%     Y_P3_3=KELMdnapl_P3_L13(XX(i,:));
%     Y_P3_4=KELMdnapl_P3_L14(XX(i,:));
%     XX_2(1,1:32)=XX(i,:);
%     XX_2(1,33)=Y_P3_1;
%     Y_P3_2_1=KELMdnapl_P3_L2(XX_2(1,:));
%     XX_2(1,33)=Y_P3_2;
%     Y_P3_2_2=KELMdnapl_P3_L2(XX_2(1,:));
%     XX_2(1,33)=Y_P3_3;
%     Y_P3_2_3=KELMdnapl_P3_L2(XX_2(1,:));
%     XX_2(1,33)=Y_P3_4;
%     Y_P3_2_4=KELMdnapl_P3_L2(XX_2(1,:));
%     Stacking_Y(i,3)=(Y_P3_2_1+Y_P3_2_2+Y_P3_2_3+Y_P3_2_4)/4;
% end

% for i=1:20
% 
%     Y_P4_1=KELMdnapl_P4_L11(XX(i,:));
%     Y_P4_2=KELMdnapl_P4_L12(XX(i,:));
%     Y_P4_3=KELMdnapl_P4_L13(XX(i,:));
%     Y_P4_4=KELMdnapl_P4_L14(XX(i,:));
%     XX_2(1,1:32)=XX(i,:);
%     XX_2(1,33)=Y_P4_1;
%     Y_P4_2_1=KELMdnapl_P4_L2(XX_2(1,:));
%     XX_2(1,33)=Y_P4_2;
%     Y_P4_2_2=KELMdnapl_P4_L2(XX_2(1,:));
%     XX_2(1,33)=Y_P4_3;
%     Y_P4_2_3=KELMdnapl_P4_L2(XX_2(1,:));
%     XX_2(1,33)=Y_P4_4;
%     Y_P4_2_4=KELMdnapl_P4_L2(XX_2(1,:));
%     Stacking_Y(i,4)=(Y_P4_2_1+Y_P4_2_2+Y_P4_2_3+Y_P4_2_4)/4;
% end

% 
% for i=1:20
% 
%     Y_P5_1=KELMdnapl_P5_L11(XX(i,:));
%     Y_P5_2=KELMdnapl_P5_L12(XX(i,:));
%     Y_P5_3=KELMdnapl_P5_L13(XX(i,:));
%     Y_P5_4=KELMdnapl_P5_L14(XX(i,:));
%     XX_2(1,1:32)=XX(i,:);
%     XX_2(1,33)=Y_P5_1;
%     Y_P5_2_1=KELMdnapl_P5_L2(XX_2(1,:));
%     XX_2(1,33)=Y_P5_2;
%     Y_P5_2_2=KELMdnapl_P5_L2(XX_2(1,:));
%     XX_2(1,33)=Y_P5_3;
%     Y_P5_2_3=KELMdnapl_P5_L2(XX_2(1,:));
%     XX_2(1,33)=Y_P5_4;
%     Y_P5_2_4=KELMdnapl_P5_L2(XX_2(1,:));
%     Stacking_Y(i,5)=(Y_P5_2_1+Y_P5_2_2+Y_P5_2_3+Y_P5_2_4)/4;
% end
% 
% for i=1:20
% 
%     Y_P6_1=KELMdnapl_P6_L11(XX(i,:));
%     Y_P6_2=KELMdnapl_P6_L12(XX(i,:));
%     Y_P6_3=KELMdnapl_P6_L13(XX(i,:));
%     Y_P6_4=KELMdnapl_P6_L14(XX(i,:));
%     XX_2(1,1:32)=XX(i,:);
%     XX_2(1,33)=Y_P6_1;
%     Y_P6_2_1=KELMdnapl_P6_L2(XX_2(1,:));
%     XX_2(1,33)=Y_P6_2;
%     Y_P6_2_2=KELMdnapl_P6_L2(XX_2(1,:));
%     XX_2(1,33)=Y_P6_3;
%     Y_P6_2_3=KELMdnapl_P6_L2(XX_2(1,:));
%     XX_2(1,33)=Y_P6_4;
%     Y_P6_2_4=KELMdnapl_P6_L2(XX_2(1,:));
%     Stacking_Y(i,6)=(Y_P6_2_1+Y_P6_2_2+Y_P6_2_3+Y_P6_2_4)/4;
% end


% for i=1:20
% 
%     Y_P7_1=KELMdnapl_P7_L11(XX(i,:));
%     Y_P7_2=KELMdnapl_P7_L12(XX(i,:));
%     Y_P7_3=KELMdnapl_P7_L13(XX(i,:));
%     Y_P7_4=KELMdnapl_P7_L14(XX(i,:));
%     XX_2(1,1:32)=XX(i,:);
%     XX_2(1,33)=Y_P7_1;
%     Y_P7_2_1=KELMdnapl_P7_L2(XX_2(1,:));
%     XX_2(1,33)=Y_P7_2;
%     Y_P7_2_2=KELMdnapl_P7_L2(XX_2(1,:));
%     XX_2(1,33)=Y_P7_3;
%     Y_P7_2_3=KELMdnapl_P7_L2(XX_2(1,:));
%     XX_2(1,33)=Y_P7_4;
%     Y_P7_2_4=KELMdnapl_P7_L2(XX_2(1,:));
%     Stacking_Y(i,7)=(Y_P7_2_1+Y_P7_2_2+Y_P7_2_3+Y_P7_2_4)/4;
% end

% for i=1:20
% 
%     Y_P8_1=KELMdnapl_P8_L11(XX(i,:));
%     Y_P8_2=KELMdnapl_P8_L12(XX(i,:));
%     Y_P8_3=KELMdnapl_P8_L13(XX(i,:));
%     Y_P8_4=KELMdnapl_P8_L14(XX(i,:));
%     XX_2(1,1:32)=XX(i,:);
%     XX_2(1,33)=Y_P8_1;
%     Y_P8_2_1=KELMdnapl_P8_L2(XX_2(1,:));
%     XX_2(1,33)=Y_P8_2;
%     Y_P8_2_2=KELMdnapl_P8_L2(XX_2(1,:));
%     XX_2(1,33)=Y_P8_3;
%     Y_P8_2_3=KELMdnapl_P8_L2(XX_2(1,:));
%     XX_2(1,33)=Y_P8_4;
%     Y_P8_2_4=KELMdnapl_P8_L2(XX_2(1,:));
%     Stacking_Y(i,8)=(Y_P8_2_1+Y_P8_2_2+Y_P8_2_3+Y_P8_2_4)/4;
% end
% 
% for i=1:20
% 
%     Y_P9_1=KELMdnapl_P9_L11(XX(i,:));
%     Y_P9_2=KELMdnapl_P9_L12(XX(i,:));
%     Y_P9_3=KELMdnapl_P9_L13(XX(i,:));
%     Y_P9_4=KELMdnapl_P9_L14(XX(i,:));
%     XX_2(1,1:32)=XX(i,:);
%     XX_2(1,33)=Y_P9_1;
%     Y_P9_2_1=KELMdnapl_P9_L2(XX_2(1,:));
%     XX_2(1,33)=Y_P9_2;
%     Y_P9_2_2=KELMdnapl_P9_L2(XX_2(1,:));
%     XX_2(1,33)=Y_P9_3;
%     Y_P9_2_3=KELMdnapl_P9_L2(XX_2(1,:));
%     XX_2(1,33)=Y_P9_4;
%     Y_P9_2_4=KELMdnapl_P9_L2(XX_2(1,:));
%     Stacking_Y(i,9)=(Y_P9_2_1+Y_P9_2_2+Y_P9_2_3+Y_P9_2_4)/4;
% end
% 
% for i=1:20
% 
%     Y_P10_1=KELMdnapl_P10_L11(XX(i,:));
%     Y_P10_2=KELMdnapl_P10_L12(XX(i,:));
%     Y_P10_3=KELMdnapl_P10_L13(XX(i,:));
%     Y_P10_4=KELMdnapl_P10_L14(XX(i,:));
%     XX_2(1,1:32)=XX(i,:);
%     XX_2(1,33)=Y_P10_1;
%     Y_P10_2_1=KELMdnapl_P10_L2(XX_2(1,:));
%     XX_2(1,33)=Y_P10_2;
%     Y_P10_2_2=KELMdnapl_P10_L2(XX_2(1,:));
%     XX_2(1,33)=Y_P10_3;
%     Y_P10_2_3=KELMdnapl_P10_L2(XX_2(1,:));
%     XX_2(1,33)=Y_P10_4;
%     Y_P10_2_4=KELMdnapl_P10_L2(XX_2(1,:));
%     Stacking_Y(i,10)=(Y_P10_2_1+Y_P10_2_2+Y_P10_2_3+Y_P10_2_4)/4;
% end

% for i=1:20
% 
%     Y_P11_1=KELMdnapl_P11_L11(XX(i,:));
%     Y_P11_2=KELMdnapl_P11_L12(XX(i,:));
%     Y_P11_3=KELMdnapl_P11_L13(XX(i,:));
%     Y_P11_4=KELMdnapl_P11_L14(XX(i,:));
%     XX_2(1,1:32)=XX(i,:);
%     XX_2(1,33)=Y_P11_1;
%     Y_P11_2_1=KELMdnapl_P11_L2(XX_2(1,:));
%     XX_2(1,33)=Y_P11_2;
%     Y_P11_2_2=KELMdnapl_P11_L2(XX_2(1,:));
%     XX_2(1,33)=Y_P11_3;
%     Y_P11_2_3=KELMdnapl_P11_L2(XX_2(1,:));
%     XX_2(1,33)=Y_P11_4;
%     Y_P11_2_4=KELMdnapl_P11_L2(XX_2(1,:));
%     Stacking_Y(i,11)=(Y_P11_2_1+Y_P11_2_2+Y_P11_2_3+Y_P11_2_4)/4;
% end
% 
% for i=1:20
% 
%     Y_P12_1=KELMdnapl_P12_L11(XX(i,:));
%     Y_P12_2=KELMdnapl_P12_L12(XX(i,:));
%     Y_P12_3=KELMdnapl_P12_L13(XX(i,:));
%     Y_P12_4=KELMdnapl_P12_L14(XX(i,:));
%     XX_2(1,1:32)=XX(i,:);
%     XX_2(1,33)=Y_P12_1;
%     Y_P12_2_1=KELMdnapl_P12_L2(XX_2(1,:));
%     XX_2(1,33)=Y_P12_2;
%     Y_P12_2_2=KELMdnapl_P12_L2(XX_2(1,:));
%     XX_2(1,33)=Y_P12_3;
%     Y_P12_2_3=KELMdnapl_P12_L2(XX_2(1,:));
%     XX_2(1,33)=Y_P12_4;
%     Y_P12_2_4=KELMdnapl_P12_L2(XX_2(1,:));
%     Stacking_Y(i,12)=(Y_P12_2_1+Y_P12_2_2+Y_P12_2_3+Y_P12_2_4)/4;
% end
% 
% for i=1:20
% 
%     Y_P13_1=KELMdnapl_P13_L11(XX(i,:));
%     Y_P13_2=KELMdnapl_P13_L12(XX(i,:));
%     Y_P13_3=KELMdnapl_P13_L13(XX(i,:));
%     Y_P13_4=KELMdnapl_P13_L14(XX(i,:));
%     XX_2(1,1:32)=XX(i,:);
%     XX_2(1,33)=Y_P13_1;
%     Y_P13_2_1=KELMdnapl_P13_L2(XX_2(1,:));
%     XX_2(1,33)=Y_P13_2;
%     Y_P13_2_2=KELMdnapl_P13_L2(XX_2(1,:));
%     XX_2(1,33)=Y_P13_3;
%     Y_P13_2_3=KELMdnapl_P13_L2(XX_2(1,:));
%     XX_2(1,33)=Y_P13_4;
%     Y_P13_2_4=KELMdnapl_P13_L2(XX_2(1,:));
%     Stacking_Y(i,13)=(Y_P13_2_1+Y_P13_2_2+Y_P13_2_3+Y_P13_2_4)/4;
% end
% 
% for i=1:20
% 
%     Y_P14_1=KELMdnapl_P14_L11(XX(i,:));
%     Y_P14_2=KELMdnapl_P14_L12(XX(i,:));
%     Y_P14_3=KELMdnapl_P14_L13(XX(i,:));
%     Y_P14_4=KELMdnapl_P14_L14(XX(i,:));
%     XX_2(1,1:32)=XX(i,:);
%     XX_2(1,33)=Y_P14_1;
%     Y_P14_2_1=KELMdnapl_P14_L2(XX_2(1,:));
%     XX_2(1,33)=Y_P14_2;
%     Y_P14_2_2=KELMdnapl_P14_L2(XX_2(1,:));
%     XX_2(1,33)=Y_P14_3;
%     Y_P14_2_3=KELMdnapl_P14_L2(XX_2(1,:));
%     XX_2(1,33)=Y_P14_4;
%     Y_P14_2_4=KELMdnapl_P14_L2(XX_2(1,:));
%     Stacking_Y(i,14)=(Y_P14_2_1+Y_P14_2_2+Y_P14_2_3+Y_P14_2_4)/4;
% end
% 
% for i=1:20
% 
%     Y_P15_1=KELMdnapl_P15_L11(XX(i,:));
%     Y_P15_2=KELMdnapl_P15_L12(XX(i,:));
%     Y_P15_3=KELMdnapl_P15_L13(XX(i,:));
%     Y_P15_4=KELMdnapl_P15_L14(XX(i,:));
%     XX_2(1,1:32)=XX(i,:);
%     XX_2(1,33)=Y_P15_1;
%     Y_P15_2_1=KELMdnapl_P15_L2(XX_2(1,:));
%     XX_2(1,33)=Y_P15_2;
%     Y_P15_2_2=KELMdnapl_P15_L2(XX_2(1,:));
%     XX_2(1,33)=Y_P15_3;
%     Y_P15_2_3=KELMdnapl_P15_L2(XX_2(1,:));
%     XX_2(1,33)=Y_P15_4;
%     Y_P15_2_4=KELMdnapl_P15_L2(XX_2(1,:));
%     Stacking_Y(i,15)=(Y_P15_2_1+Y_P15_2_2+Y_P15_2_3+Y_P15_2_4)/4;
% end
for i=1:20

    Y_P16_1=KELMdnapl_P16_L11(XX(i,:));
    Y_P16_2=KELMdnapl_P16_L12(XX(i,:));
    Y_P16_3=KELMdnapl_P16_L13(XX(i,:));
    Y_P16_4=KELMdnapl_P16_L14(XX(i,:));
    XX_2(1,1:32)=XX(i,:);
    XX_2(1,33)=Y_P16_1;
    Y_P16_2_1=KELMdnapl_P16_L2(XX_2(1,:));
    XX_2(1,33)=Y_P16_2;
    Y_P16_2_2=KELMdnapl_P16_L2(XX_2(1,:));
    XX_2(1,33)=Y_P16_3;
    Y_P16_2_3=KELMdnapl_P16_L2(XX_2(1,:));
    XX_2(1,33)=Y_P16_4;
    Y_P16_2_4=KELMdnapl_P16_L2(XX_2(1,:));
    Stacking_Y(i,16)=(Y_P16_2_1+Y_P16_2_2+Y_P16_2_3+Y_P16_2_4)/4;
end
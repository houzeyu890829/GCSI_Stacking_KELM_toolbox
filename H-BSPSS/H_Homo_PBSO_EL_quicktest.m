%function S=H_Homo_hyper_EL(ob)
clc
clear
load 'Syangben.txt'

M=Syangben;

X(1:200,1:16)= M(1:200,1:16);
Y1(1:200,1) = M(1:200,17);
Y2(1:200,1) = M(1:200,18);
Y3(1:200,1) = M(1:200,19);
Y4(1:200,1) = M(1:200,20);
Y5(1:200,1) = M(1:200,21);
Y6(1:200,1) = M(1:200,22);
Y7(1:200,1) = M(1:200,23);
Y8(1:200,1) = M(1:200,24);
Y9(1:200,1) = M(1:200,25);
Y10(1:200,1) = M(1:200,26);
Y11(1:200,1) = M(1:200,27);
Y12(1:200,1) = M(1:200,28);
Y13(1:200,1) = M(1:200,29);
Y14(1:200,1) = M(1:200,30);
Y15(1:200,1) = M(1:200,31);
Y16(1:200,1) = M(1:200,32);
Y17(1:200,1) = M(1:200,33);
Y18(1:200,1) = M(1:200,34);
Y19(1:200,1) = M(1:200,35);
Y20(1:200,1) = M(1:200,36);
Y21(1:200,1) = M(1:200,37);
Y22(1:200,1) = M(1:200,38);
Y23(1:200,1) = M(1:200,39);
Y24(1:200,1) = M(1:200,40);
Y25(1:200,1) = M(1:200,41);
Y26(1:200,1) = M(1:200,42);
Y27(1:200,1) = M(1:200,43);
Y28(1:200,1) = M(1:200,44);
Y29(1:200,1) = M(1:200,45);
Y30(1:200,1) = M(1:200,46);
Y31(1:200,1) = M(1:200,47);
Y32(1:200,1) = M(1:200,48);


e1=[Y1,X];
fid1 = fopen('sinc_train1','w');
fprintf(fid1,'%12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f\n',e1');
e1=e1';
e2=[Y2,X];
fid2 = fopen('sinc_train2','w');
fprintf(fid2,'%12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f% 12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f\n',e2');
e2=e2';
e3=[Y3,X];
fid3 = fopen('sinc_train3','w');
fprintf(fid3,'%12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f\n',e3');
e3=e3';
e4=[Y4,X];
fid4 = fopen('sinc_train4','w');
fprintf(fid4,'%12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f\n',e4');
e4=e4';
e5=[Y5,X];
fid5 = fopen('sinc_train5','w');
fprintf(fid5,'%12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f\n',e5');
e5=e5';
e6=[Y6,X];
fid6 = fopen('sinc_train6','w');
fprintf(fid6,'%12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f\n',e6');
e6=e6';
e7=[Y7,X];
fid7 = fopen('sinc_train7','w');
fprintf(fid7,'%12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f\n',e7');
e7=e7';
e8=[Y8,X];
fid8 = fopen('sinc_train8','w');
fprintf(fid8,'%12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f\n',e8');
e8=e8';
e9=[Y9,X];
fid9 = fopen('sinc_train9','w');
fprintf(fid9,'%12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f\n',e9');
e9=e9';
e10=[Y10,X];
fid10 = fopen('sinc_train10','w');
fprintf(fid10,'%12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f\n',e10');
e10=e10';
e11=[Y11,X];
fid11 = fopen('sinc_train11','w');
fprintf(fid11,'%12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f\n',e11');
e11=e11';
e12=[Y12,X];
fid12 = fopen('sinc_train12','w');
fprintf(fid12,'%12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f\n',e12');
e12=e12';
e13=[Y13,X];
fid13 = fopen('sinc_train13','w');
fprintf(fid13,'%12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f\n',e13');
e13=e13';
e14=[Y14,X];
fid14 = fopen('sinc_train14','w');
fprintf(fid14,'%12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f\n',e14');
e14=e14';
e15=[Y15,X];
fid15 = fopen('sinc_train15','w');
fprintf(fid15,'%12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f\n',e15');
e15=e15';
e16=[Y16,X];
fid16 = fopen('sinc_train16','w');
fprintf(fid16,'%12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f\n',e16');
e16=e16';
e17=[Y17,X];
fid17 = fopen('sinc_train17','w');
fprintf(fid17,'%12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f\n',e17');
e17=e17';
e18=[Y18,X];
fid18 = fopen('sinc_train18','w');
fprintf(fid18,'%12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f% 12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f\n',e18');
e18=e18';
e19=[Y19,X];
fid19 = fopen('sinc_train19','w');
fprintf(fid19,'%12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f\n',e19');
e19=e19';
e20=[Y20,X];
fid20 = fopen('sinc_train20','w');
fprintf(fid20,'%12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f\n',e20');
e20=e20';
e21=[Y21,X];
fid21 = fopen('sinc_train21','w');
fprintf(fid21,'%12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f\n',e21');
e21=e21';
e22=[Y22,X];
fid22 = fopen('sinc_train22','w');
fprintf(fid22,'%12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f\n',e22');
e22=e22';
e23=[Y23,X];
fid23 = fopen('sinc_train23','w');
fprintf(fid23,'%12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f\n',e23');
e23=e23';
e24=[Y24,X];
fid24 = fopen('sinc_train24','w');
fprintf(fid24,'%12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f\n',e24');
e24=e24';
e25=[Y25,X];
fid25 = fopen('sinc_train25','w');
fprintf(fid25,'%12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f\n',e25');
e25=e25';
e26=[Y26,X];
fid26 = fopen('sinc_train26','w');
fprintf(fid26,'%12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f\n',e26');
e26=e26';
e27=[Y27,X];
fid27 = fopen('sinc_train27','w');
fprintf(fid27,'%12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f\n',e27');
e27=e27';
e28=[Y28,X];
fid28 = fopen('sinc_train28','w');
fprintf(fid28,'%12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f\n',e28');
e28=e28';
e29=[Y29,X];
fid29 = fopen('sinc_train29','w');
fprintf(fid29,'%12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f\n',e29');
e29=e29';
e30=[Y30,X];
fid30 = fopen('sinc_train30','w');
fprintf(fid30,'%12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f\n',e30');
e30=e30';
e31=[Y31,X];
fid31 = fopen('sinc_train31','w');
fprintf(fid31,'%12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f\n',e31');
e31=e31';
e32=[Y32,X];
fid32 = fopen('sinc_train32','w');
fprintf(fid32,'%12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f %12.8f\n',e32');
e32=e32';


fclose(fid1);
fclose(fid2);
fclose(fid3);
fclose(fid4);
fclose(fid5);
fclose(fid6);
fclose(fid7);
fclose(fid8);
fclose(fid9);
fclose(fid10);
fclose(fid11);
fclose(fid12);
fclose(fid13);
fclose(fid14);
fclose(fid15);
fclose(fid16);
fclose(fid17);
fclose(fid18);
fclose(fid19);
fclose(fid20);
fclose(fid21);
fclose(fid22);
fclose(fid23);
fclose(fid24);
fclose(fid25);
fclose(fid26);
fclose(fid27);
fclose(fid28);
fclose(fid29);
fclose(fid30);
fclose(fid31);
fclose(fid32);

Initial_S(1,1:16)=[0.433223759,0.848088702,0.663966473,0.219158917,0.532433786,0.63961713,0.865813752,0.60136627,0.508828521,0.472546682,0.424432084,0.718702137,0.343663633,0.918316587,0.580594162,0.580594162];
Initial_output=ES_model(Initial_S);

n_identification=16;
ob=[0.901448639,0.862145065,0.668057263,0.907903543,0.902565896,0.776156963,0.920231571,0.832252348,0.900829284,0.859684898,0.664805778,0.907307259,0.900814647,0.774336494,0.91923871,0.828010249,0.900564057,0.858897917,0.663833069,0.907132243,0.90023972,0.773846201,0.919095653,0.82780256,0.917609047,0.919191919,0.917910448,0.918650794,0.92,0.92,0.91958042,0.917602996];


[Y(1,1:n_identification),fit_gen1_PSO,avgfitness_gen1_BSO,v_r1]=P_BSO_EL_L(Initial_S,Initial_output,3,ob,0.1);


[Y(2,1:n_identification),fit_gen2_PSO,avgfitness_gen2_BSO,v_r2]=P_BSO_EL_L(Y(1,1:n_identification),Initial_output,3,ob,0.234923789);


[Y(3,1:n_identification),fit_gen3_PSO,avgfitness_gen3_BSO,v_r3]=P_BSO_EL_L(Y(2,1:n_identification),Initial_output,3,ob,0.381677891);


[Y(4,1:n_identification),fit_gen4_PSO,avgfitness_gen4_BSO,v_r4]=P_BSO_EL_L(Y(3,1:n_identification),Initial_output,3,ob,0.526552882);


[Y(5,1:n_identification),fit_gen5_PSO,avgfitness_gen5_BSO,v_r5]=P_BSO_EL_L(Y(4,1:n_identification),Initial_output,3,ob,0.659753955);


[Y(6,1:n_identification),fit_gen6_PSO,avgfitness_gen6_BSO,v_r6]=P_BSO_EL_L(Y(5,1:n_identification),Initial_output,3,ob,0.774596669);


[Y(7,1:n_identification),fit_gen7_PSO,avgfitness_gen7_BSO,v_r7]=P_BSO_EL_L(Y(6,1:n_identification),Initial_output,3,ob,0.867040164);


[Y(8,1:n_identification),fit_gen8_PSO,avgfitness_gen8_BSO,v_r8]=P_BSO_EL_L(Y(7,1:n_identification),Initial_output,3,ob,0.935248448);


[Y(9,1:n_identification),fit_gen9_PSO,avgfitness_gen9_BSO,v_r9]=P_BSO_EL_L(Y(8,1:n_identification),Initial_output,3,ob,0.979148362);


[Y(10,1:n_identification),fit_gen10_PSO,avgfitness_gen10_BSO,SR,MC,v_r10,v_r_all10]=P_BSO_EL_F(Y(9,1:n_identification),Initial_output,3,ob,1);
save('Feed_H_PBSO_4');



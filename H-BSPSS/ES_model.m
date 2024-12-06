function Z=ES_model(Q)
% a=SVM_W1(Q);
% b=SVM_W2(Q);
% c=SVM_W3(Q);
% d=SVM_W4(Q);
% e=SVM_W5(Q);
% f=SVM_W6(Q);
% g=SVM_W7(Q);
% h=SVM_W8(Q);
% F=[a,b,c,d,e,f,g,h];
X=KELMdnapl(Q);

Y=KELMdnapl_PRES(Q);

Z=[X,Y];
function [S,fit_gen,avgfitness_gen,SR,MC,v_r,v_r_all]=P_BSO_EL_F(Q,Initial_output,iterations,ob,p)

%%  parameters Setting 
Size=30;  %%  Dim-->the dimensions of dimension; Size --> Population Size 
GenMax=iterations;        %% GenMax-->Generation Maximum  
cluster_num=5;       %%  the number of kmeans clusters 
p_replace=0.1;        %%  the probability of replacing operator  
p_one= 0.5;                 %% the probability of selecting one cluster   
p_two=1-p_one;             %% the probability of selecting two clusters       
p_one_center=0.3;           %% the probability of selecting the center of one cluster 
p_two_center=0.2;           %% the probability of selecting the centers of two clusters 
omega1=0.3; 
omega2=0.4;

%%  Population Initialization

MAX=[599.6950677,219.5777216,0.27909677,0.299583466,900,0.340997326,0.3980923,0.560995418,37825.50072,8729.800881,153.9357473,70.70937087,18.40917255,130.2283353,0.307632345,0.360747515];
MIN=[440.5066384,60.70025821,0.080214354,0.100684851,600,0.280339587,0.331335197,0.440728567,31652.47927,7426.343354,46.58612812,48.91585912,11.68017118,114.5540089,0.171740346,0.05408236];
% 产生初始粒子的位置和速度
for i=1:16
amax(i) =Q(i)+0.1;
amin(i) =Q(i)-0.1;
    if amax(i) > 0.98
         amax(i) = 0.98;
    end
     if amin(i) < 0.02
         amin(i) = 0.02;
     end
end

for q=1:Size  
  for t=1:16   
% 随机产生种群的位置和速度（位置实际上就是所求各变量的值）
    Population(q,t) = Q(t)+0.1*(amax(t)-2*amax(t)*rand);    
        if Population(q,t) > amax(t)
            Population(q,t) = (amax(t)-amin(t))*rand+amin(t);
        end
        if Population(q,t) < amin(t)
            Population(q,t) = (amax(t)-amin(t))*rand+amin(t);
        end
  end
       fitness(q) = H_State_eva_fun(Population(q,1:16),Q,Initial_output,ob,p);
  end
local_fitness=fitness;
local_x=Population; 
T=4;

for g=1:GenMax 
%% K-means Clustering 
[Idx,C,sumD,D]=kmeans(Population,cluster_num,'Distance','city','Replicates',2);    
cluster=cell(cluster_num,2);     %   Store the soutions in each clusters 
order_cluster=cell(cluster_num,2);   % Store the soutions in each clusters according to their fitness values

for ii=1: cluster_num     
    cluster{ii,1}= Population(Idx==ii, :);    %  Store the solutions in each clusters according to the Idx of kmeans       
    [cluster_row(ii), cluster_col(ii)] = size(cluster{ii,1});   % calculate the number of rows and columns of each clusters 

        for j=1:cluster_row(ii)             
               Pop(j,:)=cluster{ii,1}(j,:);       % keep the solutions in each cluster into Pop              
               cluster{ii,2}(j,1)= H_State_eva_fun(Pop(j, :),Q,Initial_output,ob,p);    %calculate the fitness value of each solution       
        end     
    [order_cluster{ii,2}, order_index] = sort(cluster{ii,2}) ; % rank the fitness values in each cluster     
    order_cluster{ii,1}=cluster{ii,1}(order_index, :);    % adjust the slutions position according to the order_index of fitness values in each cluster     
    order_index=0;   % clear the order_index of fitness values 
end


cluster_fit=cell2mat(order_cluster);  % transform the cell array into numerical array 
best=min(cluster_fit(:,end));   %  calculate the best fitness value and store it in best 
average =mean(cluster_fit(:,end));  %  calculate the average fitness value and store it in average   
worst =max(cluster_fit(:,end));   %  calculate the worst fitness value and store it in worst

%% replacing operator   
R1=rand(1,1) ;

if R1<=p_replace          
% select a cluster center randomly          
repalce_cluster_num= randi([1, cluster_num],1, 1);           
% generate a replace_solution randomly 
replace_solution= amin(1,16)+(amax(1)-amin(1))*rand(1, 16);             
% replace the cluster center with the new one 
order_cluster{repalce_cluster_num,1}(1,:)= replace_solution;     % calculate the fitness value of the new solution 
replace_solution_fitness=H_State_eva_fun(replace_solution,Q,Initial_output,ob,p);   % store the replace_solution into the order cluster          
order_cluster{repalce_cluster_num,2}(1,:)= replace_solution_fitness;      
end 

%% creating operator    
for i=1:Size       
    if rand()<p_one % creating pattern 1&2  select one cluster             
           select_one_cluster= randi([1, cluster_num],1, 1);  % generate a cluster number randomly  
           if rand()<p_one_center|cluster_row(select_one_cluster)==1                
                  indi_temp(1,:)= order_cluster{select_one_cluster,1}(1,:);    % select the cluster center of the selected cluster                
           else                 
                  r_1=  randi([2,cluster_row(select_one_cluster)],1,1);         % select a cluster number randomly                        
                  indi_temp(1,:)= order_cluster{select_one_cluster,1}(r_1,:); % select a solution in the cluster             
          end       
     else  % creating pattern 3&4  select two clusters             
          cluster_two =[0,0];               % generate two cluster number randomly             
          while cluster_two(1,1)==cluster_two(1,2)                 
          cluster_two=randi([1,cluster_num],1,2);    % the two cluster number should not be the same             
          end                     
            if (rand()<p_two_center)|(cluster_row(cluster_two(1,1))==1&cluster_row(cluster_two(1,2))==1)                 
             % % select the cluster centers of the two selected clusters                    
                   indi_temp(1,:) = omega1 * order_cluster{cluster_two(1,1),1}(1,:) + omega2* order_cluster{cluster_two(1,2),1}(1,:);              
            else
                  if cluster_row(cluster_two(1,1))==1                          
                    % % select one cluster center of the two selected clusters                        
                        r_2= randi([2,cluster_row(cluster_two(1,2))],1, 1);                       
                        indi_temp(1,:) = omega1 * order_cluster{cluster_two(1,1),1}(1,:) + omega2* order_cluster{cluster_two(1,2),1}(r_2,:);                
                  elseif cluster_row(cluster_two(1,2))==1                       
                        r_3= randi([2,cluster_row(cluster_two(1,1))],1, 1);                       
                        indi_temp(1,:) = omega1 * order_cluster{cluster_two(1,1),1}(r_3,:) + omega2* order_cluster{cluster_two(1,2),1}(1,:);                                         
                  elseif cluster_row(cluster_two(1,1))>1&cluster_row(cluster_two(1,2))>1                              
                    % % select two solution in the two selected clusters                       
                        r_4= randi([2,cluster_row(cluster_two(1,1))],1, 1);                      
                        r_5= randi([2,cluster_row(cluster_two(1,2))],1, 1);                      
                        indi_temp(1,:) =omega1 *  order_cluster{cluster_two(1,1),1}(r_4,:) +omega2*order_cluster{cluster_two(1,2),1}(r_5,:);                
                  end
             end     
     end
                Step_size = logsig(((0.5*GenMax - g)/20)) * rand(1,16);                
                        indi_temp(1,:) = indi_temp(1,:) + Step_size .* normrnd(0,1,1,16);  
      for t=1:16 
        if indi_temp(1,t) > amax(t)
            indi_temp(1,t) = amax(t);
        end
        if indi_temp(1,t) < amin(t)
            indi_temp(1,t) = amin(t);
        end  
      end
                fit_indi_temp =   H_State_eva_fun(indi_temp,Q,Initial_output,ob,p);        
               r=rand;
               MC(i,g)=exp((log10(1/fit_indi_temp)-log10(1/local_fitness(i)))/T);
               if  MC(i,g)>r      % better than the previous one, replace            
                  Population(i,:) = indi_temp(1,:);  
                  local_x(i,:)=Population(i,:);
                  local_fitness(i) = fit_indi_temp;
                end   

%                if  1/fit_indi_temp>1/local_fitness(i)      % better than the previous one, replace            
%                   Population(i,:) = indi_temp(1,:);  
%                   local_x(i,:)=Population(i,:);
%                   local_fitness(i) = fit_indi_temp;
%                elseif fit_indi_temp/local_fitness(i)<5000 && T>r   
%                   Population(i,:) = indi_temp(1,:);  
%                   local_x(i,:)=Population(i,:);
%                   local_fitness(i) = fit_indi_temp;
%                end
end 


    fit_gen(g)=best;
    avgfitness_gen(g) = average;
    trace_local1(g,:)=local_x(1,:);
    trace_local2(g,:)=local_x(2,:);
    trace_local3(g,:)=local_x(3,:);
    trace_local4(g,:)=local_x(4,:);
    trace_local5(g,:)=local_x(5,:);
    trace_local6(g,:)=local_x(6,:);
    trace_local7(g,:)=local_x(7,:);
    trace_local8(g,:)=local_x(8,:);
    trace_local9(g,:)=local_x(9,:);
    trace_local10(g,:)=local_x(10,:);
    trace_local11(g,:)=local_x(11,:);
    trace_local12(g,:)=local_x(12,:);
    trace_local13(g,:)=local_x(13,:);
    trace_local14(g,:)=local_x(14,:);
    trace_local15(g,:)=local_x(15,:);
    trace_local16(g,:)=local_x(16,:);
    trace_local17(g,:)=local_x(17,:);
    trace_local18(g,:)=local_x(18,:);
    trace_local19(g,:)=local_x(19,:);
    trace_local20(g,:)=local_x(20,:);
    trace_local21(g,:)=local_x(21,:);
    trace_local22(g,:)=local_x(22,:);
    trace_local23(g,:)=local_x(23,:);
    trace_local24(g,:)=local_x(24,:);
    trace_local25(g,:)=local_x(25,:);
    trace_local26(g,:)=local_x(26,:);
    trace_local27(g,:)=local_x(27,:);
    trace_local28(g,:)=local_x(28,:);
    trace_local29(g,:)=local_x(29,:);
    trace_local30(g,:)=local_x(30,:);
%     trace_local31(g,:)=local_x(31,:);
%     trace_local32(g,:)=local_x(32,:);
%     trace_local33(g,:)=local_x(33,:);
%     trace_local34(g,:)=local_x(34,:);
%     trace_local35(g,:)=local_x(35,:);
%     trace_local36(g,:)=local_x(36,:);
%     trace_local37(g,:)=local_x(37,:);
%     trace_local38(g,:)=local_x(38,:);
%     trace_local39(g,:)=local_x(39,:);
%     trace_local40(g,:)=local_x(40,:);
%     trace_local41(g,:)=local_x(41,:);
%     trace_local42(g,:)=local_x(42,:);
%     trace_local43(g,:)=local_x(43,:);
%     trace_local44(g,:)=local_x(44,:);
%     trace_local45(g,:)=local_x(45,:);
%     trace_local46(g,:)=local_x(46,:);
%     trace_local47(g,:)=local_x(47,:);
%     trace_local48(g,:)=local_x(48,:);
%     trace_local49(g,:)=local_x(49,:);
%     trace_local50(g,:)=local_x(50,:);

    for i=1:16 
    trace_local(g,1,i)=trace_local1(g,i);
    trace_local(g,2,i)=trace_local2(g,i);
    trace_local(g,3,i)=trace_local3(g,i);
    trace_local(g,4,i)=trace_local4(g,i);
    trace_local(g,5,i)=trace_local5(g,i);
    trace_local(g,6,i)=trace_local6(g,i);
    trace_local(g,7,i)=trace_local7(g,i);
    trace_local(g,8,i)=trace_local8(g,i);
    trace_local(g,9,i)=trace_local9(g,i);
    trace_local(g,10,i)=trace_local10(g,i);
    trace_local(g,11,i)=trace_local11(g,i);
    trace_local(g,12,i)=trace_local12(g,i);
    trace_local(g,13,i)=trace_local13(g,i);
    trace_local(g,14,i)=trace_local14(g,i);
    trace_local(g,15,i)=trace_local15(g,i);
    trace_local(g,16,i)=trace_local16(g,i);
    trace_local(g,17,i)=trace_local17(g,i);
    trace_local(g,18,i)=trace_local18(g,i);
    trace_local(g,19,i)=trace_local19(g,i);
    trace_local(g,20,i)=trace_local20(g,i);
    trace_local(g,21,i)=trace_local21(g,i);
    trace_local(g,22,i)=trace_local22(g,i);
    trace_local(g,23,i)=trace_local23(g,i);
    trace_local(g,24,i)=trace_local24(g,i);
    trace_local(g,25,i)=trace_local25(g,i);
    trace_local(g,26,i)=trace_local26(g,i);
    trace_local(g,27,i)=trace_local27(g,i);
    trace_local(g,28,i)=trace_local28(g,i);
    trace_local(g,29,i)=trace_local29(g,i);
    trace_local(g,30,i)=trace_local30(g,i);
%     trace_local(g,31,i)=trace_local31(g,i);
%     trace_local(g,32,i)=trace_local32(g,i);
%     trace_local(g,33,i)=trace_local33(g,i);
%     trace_local(g,34,i)=trace_local34(g,i);
%     trace_local(g,35,i)=trace_local35(g,i);
%     trace_local(g,36,i)=trace_local36(g,i);
%     trace_local(g,37,i)=trace_local37(g,i);
%     trace_local(g,38,i)=trace_local38(g,i);
%     trace_local(g,39,i)=trace_local39(g,i);
%     trace_local(g,40,i)=trace_local40(g,i);
%     trace_local(g,41,i)=trace_local41(g,i);
%     trace_local(g,42,i)=trace_local42(g,i);
%     trace_local(g,43,i)=trace_local43(g,i);
%     trace_local(g,44,i)=trace_local44(g,i);
%     trace_local(g,45,i)=trace_local45(g,i);
%     trace_local(g,46,i)=trace_local46(g,i);
%     trace_local(g,47,i)=trace_local47(g,i);
%     trace_local(g,48,i)=trace_local48(g,i);
%     trace_local(g,49,i)=trace_local49(g,i);
%     trace_local(g,50,i)=trace_local50(g,i);

    trace_local1(g,i)=trace_local1(g,i)*(MAX(i)-MIN(i))+MIN(i);
    trace_local2(g,i)=trace_local2(g,i)*(MAX(i)-MIN(i))+MIN(i);
    trace_local3(g,i)=trace_local3(g,i)*(MAX(i)-MIN(i))+MIN(i);
    trace_local4(g,i)=trace_local4(g,i)*(MAX(i)-MIN(i))+MIN(i);
    trace_local5(g,i)=trace_local5(g,i)*(MAX(i)-MIN(i))+MIN(i);
    trace_local6(g,i)=trace_local6(g,i)*(MAX(i)-MIN(i))+MIN(i);
    trace_local7(g,i)=trace_local7(g,i)*(MAX(i)-MIN(i))+MIN(i);
    trace_local8(g,i)=trace_local8(g,i)*(MAX(i)-MIN(i))+MIN(i);
    trace_local9(g,i)=trace_local9(g,i)*(MAX(i)-MIN(i))+MIN(i);
    trace_local10(g,i)=trace_local10(g,i)*(MAX(i)-MIN(i))+MIN(i);
    trace_local11(g,i)=trace_local11(g,i)*(MAX(i)-MIN(i))+MIN(i);
    trace_local12(g,i)=trace_local12(g,i)*(MAX(i)-MIN(i))+MIN(i);
    trace_local13(g,i)=trace_local13(g,i)*(MAX(i)-MIN(i))+MIN(i);
    trace_local14(g,i)=trace_local14(g,i)*(MAX(i)-MIN(i))+MIN(i);
    trace_local15(g,i)=trace_local15(g,i)*(MAX(i)-MIN(i))+MIN(i);
    trace_local16(g,i)=trace_local16(g,i)*(MAX(i)-MIN(i))+MIN(i);
    trace_local17(g,i)=trace_local17(g,i)*(MAX(i)-MIN(i))+MIN(i);
    trace_local18(g,i)=trace_local18(g,i)*(MAX(i)-MIN(i))+MIN(i);
    trace_local19(g,i)=trace_local19(g,i)*(MAX(i)-MIN(i))+MIN(i);
    trace_local20(g,i)=trace_local20(g,i)*(MAX(i)-MIN(i))+MIN(i);
    trace_local21(g,i)=trace_local21(g,i)*(MAX(i)-MIN(i))+MIN(i);
    trace_local22(g,i)=trace_local22(g,i)*(MAX(i)-MIN(i))+MIN(i);
    trace_local23(g,i)=trace_local23(g,i)*(MAX(i)-MIN(i))+MIN(i);
    trace_local24(g,i)=trace_local24(g,i)*(MAX(i)-MIN(i))+MIN(i);
    trace_local25(g,i)=trace_local25(g,i)*(MAX(i)-MIN(i))+MIN(i);
    trace_local26(g,i)=trace_local26(g,i)*(MAX(i)-MIN(i))+MIN(i);
    trace_local27(g,i)=trace_local27(g,i)*(MAX(i)-MIN(i))+MIN(i);
    trace_local28(g,i)=trace_local28(g,i)*(MAX(i)-MIN(i))+MIN(i);
    trace_local29(g,i)=trace_local29(g,i)*(MAX(i)-MIN(i))+MIN(i);
    trace_local30(g,i)=trace_local30(g,i)*(MAX(i)-MIN(i))+MIN(i);
%     trace_local31(g,i)=trace_local31(g,i)*(MAX(i)-MIN(i))+MIN(i);
%     trace_local32(g,i)=trace_local32(g,i)*(MAX(i)-MIN(i))+MIN(i);
%     trace_local33(g,i)=trace_local33(g,i)*(MAX(i)-MIN(i))+MIN(i);
%     trace_local34(g,i)=trace_local34(g,i)*(MAX(i)-MIN(i))+MIN(i);
%     trace_local35(g,i)=trace_local35(g,i)*(MAX(i)-MIN(i))+MIN(i);
%     trace_local36(g,i)=trace_local36(g,i)*(MAX(i)-MIN(i))+MIN(i);
%     trace_local37(g,i)=trace_local37(g,i)*(MAX(i)-MIN(i))+MIN(i);
%     trace_local38(g,i)=trace_local38(g,i)*(MAX(i)-MIN(i))+MIN(i);
%     trace_local39(g,i)=trace_local39(g,i)*(MAX(i)-MIN(i))+MIN(i);
%     trace_local40(g,i)=trace_local40(g,i)*(MAX(i)-MIN(i))+MIN(i);
%     trace_local41(g,i)=trace_local41(g,i)*(MAX(i)-MIN(i))+MIN(i);
%     trace_local42(g,i)=trace_local42(g,i)*(MAX(i)-MIN(i))+MIN(i);
%     trace_local43(g,i)=trace_local43(g,i)*(MAX(i)-MIN(i))+MIN(i);
%     trace_local44(g,i)=trace_local44(g,i)*(MAX(i)-MIN(i))+MIN(i);
%     trace_local45(g,i)=trace_local45(g,i)*(MAX(i)-MIN(i))+MIN(i);
%     trace_local46(g,i)=trace_local46(g,i)*(MAX(i)-MIN(i))+MIN(i);
%     trace_local47(g,i)=trace_local47(g,i)*(MAX(i)-MIN(i))+MIN(i);
%     trace_local48(g,i)=trace_local48(g,i)*(MAX(i)-MIN(i))+MIN(i);
%     trace_local49(g,i)=trace_local49(g,i)*(MAX(i)-MIN(i))+MIN(i);
%     trace_local50(g,i)=trace_local50(g,i)*(MAX(i)-MIN(i))+MIN(i);
    end
   
    
    for i=1:16 
    mean_local(1,i)=mean(trace_local1(:,i),1);
    mean_local(2,i)=mean(trace_local2(:,i),1);
    mean_local(3,i)=mean(trace_local3(:,i),1);
    mean_local(4,i)=mean(trace_local4(:,i),1);
    mean_local(5,i)=mean(trace_local5(:,i),1);
    mean_local(6,i)=mean(trace_local6(:,i),1);
    mean_local(7,i)=mean(trace_local7(:,i),1);
    mean_local(8,i)=mean(trace_local8(:,i),1);
    mean_local(9,i)=mean(trace_local9(:,i),1);
    mean_local(10,i)=mean(trace_local10(:,i),1);
    mean_local(11,i)=mean(trace_local11(:,i),1);
    mean_local(12,i)=mean(trace_local12(:,i),1);
    mean_local(13,i)=mean(trace_local13(:,i),1);
    mean_local(14,i)=mean(trace_local14(:,i),1);
    mean_local(15,i)=mean(trace_local15(:,i),1);
    mean_local(16,i)=mean(trace_local16(:,i),1);
    mean_local(17,i)=mean(trace_local17(:,i),1);
    mean_local(18,i)=mean(trace_local18(:,i),1);
    mean_local(19,i)=mean(trace_local19(:,i),1);
    mean_local(20,i)=mean(trace_local20(:,i),1);
    mean_local(21,i)=mean(trace_local21(:,i),1);
    mean_local(22,i)=mean(trace_local22(:,i),1);
    mean_local(23,i)=mean(trace_local23(:,i),1);
    mean_local(24,i)=mean(trace_local24(:,i),1);
    mean_local(25,i)=mean(trace_local25(:,i),1);
    mean_local(26,i)=mean(trace_local26(:,i),1);
    mean_local(27,i)=mean(trace_local27(:,i),1);
    mean_local(28,i)=mean(trace_local28(:,i),1);
    mean_local(29,i)=mean(trace_local29(:,i),1);
    mean_local(30,i)=mean(trace_local30(:,i),1);
%     mean_local(31,i)=mean(trace_local31(:,i),1);
%     mean_local(32,i)=mean(trace_local32(:,i),1);
%     mean_local(33,i)=mean(trace_local33(:,i),1);
%     mean_local(34,i)=mean(trace_local34(:,i),1);
%     mean_local(35,i)=mean(trace_local35(:,i),1);
%     mean_local(36,i)=mean(trace_local36(:,i),1);
%     mean_local(37,i)=mean(trace_local37(:,i),1);
%     mean_local(38,i)=mean(trace_local38(:,i),1);
%     mean_local(39,i)=mean(trace_local39(:,i),1);
%     mean_local(40,i)=mean(trace_local40(:,i),1);
%     mean_local(41,i)=mean(trace_local41(:,i),1);
%     mean_local(42,i)=mean(trace_local42(:,i),1);
%     mean_local(43,i)=mean(trace_local43(:,i),1);
%     mean_local(44,i)=mean(trace_local44(:,i),1);
%     mean_local(45,i)=mean(trace_local45(:,i),1);
%     mean_local(46,i)=mean(trace_local46(:,i),1);
%     mean_local(47,i)=mean(trace_local47(:,i),1);
%     mean_local(48,i)=mean(trace_local48(:,i),1);
%     mean_local(49,i)=mean(trace_local49(:,i),1);
%     mean_local(50,i)=mean(trace_local50(:,i),1);
%     mean_local(51,i)=mean(trace_local51(:,i),1);
%     mean_local(52,i)=mean(trace_local52(:,i),1);
%     mean_local(53,i)=mean(trace_local53(:,i),1);
%     mean_local(54,i)=mean(trace_local54(:,i),1);
%     mean_local(55,i)=mean(trace_local55(:,i),1);
%     mean_local(56,i)=mean(trace_local56(:,i),1);
%     mean_local(57,i)=mean(trace_local57(:,i),1);
%     mean_local(58,i)=mean(trace_local58(:,i),1);
%     mean_local(59,i)=mean(trace_local59(:,i),1);
%     mean_local(60,i)=mean(trace_local60(:,i),1);
   end 
    
    for i=1:16 
    variance_local(1,i)=var(trace_local1(:,i),1);
    variance_local(2,i)=var(trace_local2(:,i),1);
    variance_local(3,i)=var(trace_local3(:,i),1);
    variance_local(4,i)=var(trace_local4(:,i),1);
    variance_local(5,i)=var(trace_local5(:,i),1);
    variance_local(6,i)=var(trace_local6(:,i),1);
    variance_local(7,i)=var(trace_local7(:,i),1);
    variance_local(8,i)=var(trace_local8(:,i),1);
    variance_local(9,i)=var(trace_local9(:,i),1);
    variance_local(10,i)=var(trace_local10(:,i),1);
    variance_local(11,i)=var(trace_local11(:,i),1);
    variance_local(12,i)=var(trace_local12(:,i),1);
    variance_local(13,i)=var(trace_local13(:,i),1);
    variance_local(14,i)=var(trace_local14(:,i),1);
    variance_local(15,i)=var(trace_local15(:,i),1);
    variance_local(16,i)=var(trace_local16(:,i),1);
    variance_local(17,i)=var(trace_local17(:,i),1);
    variance_local(18,i)=var(trace_local18(:,i),1);
    variance_local(19,i)=var(trace_local19(:,i),1);
    variance_local(20,i)=var(trace_local20(:,i),1);
    variance_local(21,i)=var(trace_local21(:,i),1);
    variance_local(22,i)=var(trace_local22(:,i),1);
    variance_local(23,i)=var(trace_local23(:,i),1);
    variance_local(24,i)=var(trace_local24(:,i),1);
    variance_local(25,i)=var(trace_local25(:,i),1);
    variance_local(26,i)=var(trace_local26(:,i),1);
    variance_local(27,i)=var(trace_local27(:,i),1);
    variance_local(28,i)=var(trace_local28(:,i),1);
    variance_local(29,i)=var(trace_local29(:,i),1);
    variance_local(30,i)=var(trace_local30(:,i),1);
%     variance_local(31,i)=var(trace_local31(:,i),1);
%     variance_local(32,i)=var(trace_local32(:,i),1);
%     variance_local(33,i)=var(trace_local33(:,i),1);
%     variance_local(34,i)=var(trace_local34(:,i),1);
%     variance_local(35,i)=var(trace_local35(:,i),1);
%     variance_local(36,i)=var(trace_local36(:,i),1);
%     variance_local(37,i)=var(trace_local37(:,i),1);
%     variance_local(38,i)=var(trace_local38(:,i),1);
%     variance_local(39,i)=var(trace_local39(:,i),1);
%     variance_local(40,i)=var(trace_local40(:,i),1);
%     variance_local(41,i)=var(trace_local41(:,i),1);
%     variance_local(42,i)=var(trace_local42(:,i),1);
%     variance_local(43,i)=var(trace_local43(:,i),1);
%     variance_local(44,i)=var(trace_local44(:,i),1);
%     variance_local(45,i)=var(trace_local45(:,i),1);
%     variance_local(46,i)=var(trace_local46(:,i),1);
%     variance_local(47,i)=var(trace_local47(:,i),1);
%     variance_local(48,i)=var(trace_local48(:,i),1);
%     variance_local(49,i)=var(trace_local49(:,i),1);
%     variance_local(50,i)=var(trace_local50(:,i),1);
%     variance_local(51,i)=var(trace_local51(:,i),1);
%     variance_local(52,i)=var(trace_local52(:,i),1);
%     variance_local(53,i)=var(trace_local53(:,i),1);
%     variance_local(54,i)=var(trace_local54(:,i),1);
%     variance_local(55,i)=var(trace_local55(:,i),1);
%     variance_local(56,i)=var(trace_local56(:,i),1);
%     variance_local(57,i)=var(trace_local57(:,i),1);
%     variance_local(58,i)=var(trace_local58(:,i),1);
%     variance_local(59,i)=var(trace_local59(:,i),1);
%     variance_local(60,i)=var(trace_local60(:,i),1);
   end 
   
    variance_mean_local(g,:)=mean(variance_local(:,:),1);
    for i=1:16 
    mean_variance_local(g,i)=var(mean_local(:,i),1);
    end
    for i=1:16 
    SR(g,i)=(((g-1)/g)+30/29*mean_variance_local(g,i)/variance_mean_local(g,i)).^0.5;
    end
    T=T*0.98;
end
trace_local_v1(:,:)=trace_local(:,:,1);
trace_local_v2(:,:)=trace_local(:,:,2);
trace_local_v3(:,:)=trace_local(:,:,3);
trace_local_v4(:,:)=trace_local(:,:,4);
trace_local_v5(:,:)=trace_local(:,:,5);
trace_local_v6(:,:)=trace_local(:,:,6);
trace_local_v7(:,:)=trace_local(:,:,7);
trace_local_v8(:,:)=trace_local(:,:,8);
trace_local_v9(:,:)=trace_local(:,:,9);
trace_local_v10(:,:)=trace_local(:,:,10);
trace_local_v11(:,:)=trace_local(:,:,11);
trace_local_v12(:,:)=trace_local(:,:,12);
trace_local_v13(:,:)=trace_local(:,:,13);
trace_local_v14(:,:)=trace_local(:,:,14);
trace_local_v15(:,:)=trace_local(:,:,15);
trace_local_v16(:,:)=trace_local(:,:,16);

trace_local_v1_r=trace_local_v1(101:150,:);
trace_local_v2_r=trace_local_v2(101:150,:);
trace_local_v3_r=trace_local_v3(101:150,:);
trace_local_v4_r=trace_local_v4(101:150,:);
trace_local_v5_r=trace_local_v5(101:150,:);
trace_local_v6_r=trace_local_v6(101:150,:);
trace_local_v7_r=trace_local_v7(101:150,:);
trace_local_v8_r=trace_local_v8(101:150,:);
trace_local_v9_r=trace_local_v9(101:150,:);
trace_local_v10_r=trace_local_v10(101:150,:);
trace_local_v11_r=trace_local_v11(101:150,:);
trace_local_v12_r=trace_local_v12(101:150,:);
trace_local_v13_r=trace_local_v13(101:150,:);
trace_local_v14_r=trace_local_v14(101:150,:);
trace_local_v15_r=trace_local_v15(101:150,:);
trace_local_v16_r=trace_local_v16(101:150,:);

trace_local_v1_r_all=trace_local_v1(1:150,:);
trace_local_v2_r_all=trace_local_v2(1:150,:);
trace_local_v3_r_all=trace_local_v3(1:150,:);
trace_local_v4_r_all=trace_local_v4(1:150,:);
trace_local_v5_r_all=trace_local_v5(1:150,:);
trace_local_v6_r_all=trace_local_v6(1:150,:);
trace_local_v7_r_all=trace_local_v7(1:150,:);
trace_local_v8_r_all=trace_local_v8(1:150,:);
trace_local_v9_r_all=trace_local_v9(1:150,:);
trace_local_v10_r_all=trace_local_v10(1:150,:);
trace_local_v11_r_all=trace_local_v11(1:150,:);
trace_local_v12_r_all=trace_local_v12(1:150,:);
trace_local_v13_r_all=trace_local_v13(1:150,:);
trace_local_v14_r_all=trace_local_v14(1:150,:);
trace_local_v15_r_all=trace_local_v15(1:150,:);
trace_local_v16_r_all=trace_local_v16(1:150,:);

v1=trace_local_v1_r(:);
v2=trace_local_v2_r(:);
v3=trace_local_v3_r(:);
v4=trace_local_v4_r(:);
v5=trace_local_v5_r(:);
v6=trace_local_v6_r(:);
v7=trace_local_v7_r(:);
v8=trace_local_v8_r(:);
v9=trace_local_v9_r(:);
v10=trace_local_v10_r(:);
v11=trace_local_v11_r(:);
v12=trace_local_v12_r(:);
v13=trace_local_v13_r(:);
v14=trace_local_v14_r(:);
v15=trace_local_v15_r(:);
v16=trace_local_v16_r(:);

v1_all=trace_local_v1_r_all(:);
v2_all=trace_local_v2_r_all(:);
v3_all=trace_local_v3_r_all(:);
v4_all=trace_local_v4_r_all(:);
v5_all=trace_local_v5_r_all(:);
v6_all=trace_local_v6_r_all(:);
v7_all=trace_local_v7_r_all(:);
v8_all=trace_local_v8_r_all(:);
v9_all=trace_local_v9_r_all(:);
v10_all=trace_local_v10_r_all(:);
v11_all=trace_local_v11_r_all(:);
v12_all=trace_local_v12_r_all(:);
v13_all=trace_local_v13_r_all(:);
v14_all=trace_local_v14_r_all(:);
v15_all=trace_local_v15_r_all(:);
v16_all=trace_local_v16_r_all(:);


v1_r=v1*(MAX(1)-MIN(1))+MIN(1);
v2_r=v2*(MAX(2)-MIN(2))+MIN(2);
v3_r=v3*(MAX(3)-MIN(3))+MIN(3);
v4_r=v4*(MAX(4)-MIN(4))+MIN(4);
v5_r=v5*(MAX(5)-MIN(5))+MIN(5);
v6_r=v6*(MAX(6)-MIN(6))+MIN(6);
v7_r=v7*(MAX(7)-MIN(7))+MIN(7);
v8_r=v8*(MAX(8)-MIN(8))+MIN(8);
v9_r=v9*(MAX(9)-MIN(9))+MIN(9);
v10_r=v10*(MAX(10)-MIN(10))+MIN(10);
v11_r=v11*(MAX(11)-MIN(11))+MIN(11);
v12_r=v12*(MAX(12)-MIN(12))+MIN(12);
v13_r=v13*(MAX(13)-MIN(13))+MIN(13);
v14_r=((v14*(MAX(14)-MIN(14))+MIN(14))-101.325)/10.1325/650*1000;
v15_r=v15*(MAX(15)-MIN(15))+MIN(15);
v16_r=v16*(MAX(16)-MIN(16))+MIN(16);

v1_r_all=v1_all*(MAX(1)-MIN(1))+MIN(1);
v2_r_all=v2_all*(MAX(2)-MIN(2))+MIN(2);
v3_r_all=v3_all*(MAX(3)-MIN(3))+MIN(3);
v4_r_all=v4_all*(MAX(4)-MIN(4))+MIN(4);
v5_r_all=v5_all*(MAX(5)-MIN(5))+MIN(5);
v6_r_all=v6_all*(MAX(6)-MIN(6))+MIN(6);
v7_r_all=v7_all*(MAX(7)-MIN(7))+MIN(7);
v8_r_all=v8_all*(MAX(8)-MIN(8))+MIN(8);
v9_r_all=v9_all*(MAX(9)-MIN(9))+MIN(9);
v10_r_all=v10_all*(MAX(10)-MIN(10))+MIN(10);
v11_r_all=v11_all*(MAX(11)-MIN(11))+MIN(11);
v12_r_all=v12_all*(MAX(12)-MIN(12))+MIN(12);
v13_r_all=v13_all*(MAX(13)-MIN(13))+MIN(13);
v14_r_all=((v14_all*(MAX(14)-MIN(14))+MIN(14))-101.325)/10.1325/650*1000;
v15_r_all=v15_all*(MAX(15)-MIN(15))+MIN(15);
v16_r_all=v16_all*(MAX(16)-MIN(16))+MIN(16);


[pdf1,x_1]=ksdensity(v1);
[max_pdf1,bestindex]=max(pdf1);
S(1,1)=x_1(bestindex);

[pdf2,x_2]=ksdensity(v2);
[max_pdf2,bestindex]=max(pdf2);
S(1,2)=x_2(bestindex);

[pdf3,x_3]=ksdensity(v3);
[max_pdf3,bestindex]=max(pdf3);
S(1,3)=x_3(bestindex);

[pdf4,x_4]=ksdensity(v4);
[max_pdf4,bestindex]=max(pdf4);
S(1,4)=x_4(bestindex);

[pdf5,x_5]=ksdensity(v5);
[max_pdf5,bestindex]=max(pdf5);
S(1,5)=x_5(bestindex);

[pdf6,x_6]=ksdensity(v6);
[max_pdf6,bestindex]=max(pdf6);
S(1,6)=x_6(bestindex);

[pdf7,x_7]=ksdensity(v7);
[max_pdf7,bestindex]=max(pdf7);
S(1,7)=x_7(bestindex);

[pdf8,x_8]=ksdensity(v8);
[max_pdf8,bestindex]=max(pdf8);
S(1,8)=x_8(bestindex);

[pdf9,x_9]=ksdensity(v9);
[max_pdf9,bestindex]=max(pdf9);
S(1,9)=x_9(bestindex);

[pdf10,x_10]=ksdensity(v10);
[max_pdf10,bestindex]=max(pdf10);
S(1,10)=x_10(bestindex);

[pdf11,x_11]=ksdensity(v11);
[max_pdf11,bestindex]=max(pdf11);
S(1,11)=x_11(bestindex);

[pdf12,x_12]=ksdensity(v12);
[max_pdf12,bestindex]=max(pdf12);
S(1,12)=x_12(bestindex);

[pdf13,x_13]=ksdensity(v13);
[max_pdf13,bestindex]=max(pdf13);
S(1,13)=x_13(bestindex);

[pdf14,x_14]=ksdensity(v14);
[max_pdf14,bestindex]=max(pdf14);
S(1,14)=x_14(bestindex);

[pdf15,x_15]=ksdensity(v15);
[max_pdf15,bestindex]=max(pdf15);
S(1,15)=x_15(bestindex);

[pdf16,x_16]=ksdensity(v16);
[max_pdf16,bestindex]=max(pdf16);
S(1,16)=x_16(bestindex);


v_r(:,1)=v1_r;
v_r(:,2)=v2_r;
v_r(:,3)=v3_r;
v_r(:,4)=v4_r;
v_r(:,5)=v5_r;
v_r(:,6)=v6_r;
v_r(:,7)=v7_r;
v_r(:,8)=v8_r;
v_r(:,9)=v9_r;
v_r(:,10)=v10_r;
v_r(:,11)=v11_r;
v_r(:,12)=v12_r;
v_r(:,13)=v13_r;
v_r(:,14)=v14_r;
v_r(:,15)=v15_r;
v_r(:,16)=v16_r;

v_r_all(:,1)=v1_r_all;
v_r_all(:,2)=v2_r_all;
v_r_all(:,3)=v3_r_all;
v_r_all(:,4)=v4_r_all;
v_r_all(:,5)=v5_r_all;
v_r_all(:,6)=v6_r_all;
v_r_all(:,7)=v7_r_all;
v_r_all(:,8)=v8_r_all;
v_r_all(:,9)=v9_r_all;
v_r_all(:,10)=v10_r_all;
v_r_all(:,11)=v11_r_all;
v_r_all(:,12)=v12_r_all;
v_r_all(:,13)=v13_r_all;
v_r_all(:,14)=v14_r_all;
v_r_all(:,15)=v15_r_all;
v_r_all(:,16)=v16_r_all;
% histogram(v5_r,'Normalization','pdf')
% hold on
% ksdensity(v5_r)
end
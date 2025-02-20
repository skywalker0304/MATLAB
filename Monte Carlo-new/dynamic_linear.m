function[dyn,Alloc_linear,obj_dyn_mu,obj_dyn_sd,obj_lin_mu,obj_lin_mu1,obj_lin_sd,obj_lin_sd1,dem_mean,sol_mean] = dynamic_linear(n,p,Beta)
Cost_imp_mu = 12;
Cost_imp_sd = 4;
 Rain_mu = csvread('rainfall_avg.csv')';
 Rain_sd = csvread('rain_sd.csv')';
 V1_mu = [627.3 656.99 598.6];
 MDDL = [619.4 646 590.1];
 V1_sd = (V1_mu - MDDL)*0.233826;
 
 E_mu = csvread('solar.csv');
 E_sd = csvread('solar_sd.csv');
 [dyn,sum_hydro(1,:),obj_dyn] = run_dyn(n,Cost_imp_mu,Beta,Rain_mu,Rain_sd,V1_mu,V1_sd,E_mu,E_sd);
 for i = 2:p
    [temp,sum_hydro(i,:),obj_temp] = run_dyn(n,Cost_imp_mu,Beta,Rain_mu,Rain_sd,V1_mu,V1_sd,E_mu,E_sd);
    dyn = [dyn,temp];
    obj_dyn = [obj_dyn,obj_temp];
    %obj_dyn1 = [obj_dyn1,obj_temp1];
    clearvars temp;
 end
 %disp(sum_hydro);
obj_dyn_mu = mean(obj_dyn');
obj_dyn_sd = std(obj_dyn');
sum_hydro = mean(sum_hydro);
disp(sum_hydro);
%disp(sum);
fprintf('The value of Objective function after %d iterations of %d samples is: %e\n',p,n, mean(obj_dyn_mu));
csvwrite('Hydro_Alloc_dyn.csv',dyn);
csvwrite('Objective_Value_dynamic.csv',obj_dyn);
Day = csvread('Synthetic_Days.csv');
Demand_mu(:,:,1) = xlsread('Demand Data.csv', 'A2:B25');
Demand_mu(:,:,2) = xlsread('Demand Data.csv', 'C2:D25');
Demand_mu(:,:,3) = xlsread('Demand Data.csv', 'E2:F25');
Demand_mu(:,:,4) = xlsread('Demand Data.csv', 'G2:H25');
Demand_mu(:,:,5) = xlsread('Demand Data.csv', 'I2:J25');
Demand_mu(:,:,6) = xlsread('Demand Data.csv', 'K2:L25');
Demand_mu(:,:,7) = xlsread('Demand Data.csv', 'M2:N25');
Demand_mu(:,:,8) = xlsread('Demand Data.csv', 'O2:P25');
Demand_mu(:,:,9) = xlsread('Demand Data.csv', 'Q2:R25');
Demand_mu(:,:,10) = xlsread('Demand Data.csv', 'S2:T25');
Demand_mu(:,:,11) = xlsread('Demand Data.csv', 'U2:V25');
Demand_mu(:,:,12) = xlsread('Demand Data.csv', 'W2:X25');

Demand_sd(:,:,1) = xlsread('Demand Data sd.csv', 'A2:B25');
Demand_sd(:,:,2) = xlsread('Demand Data sd.csv', 'C2:D25');
Demand_sd(:,:,3) = xlsread('Demand Data sd.csv', 'E2:F25');
Demand_sd(:,:,4) = xlsread('Demand Data sd.csv', 'G2:H25');
Demand_sd(:,:,5) = xlsread('Demand Data sd.csv', 'I2:J25');
Demand_sd(:,:,6) = xlsread('Demand Data sd.csv', 'K2:L25');
Demand_sd(:,:,7) = xlsread('Demand Data sd.csv', 'M2:N25');
Demand_sd(:,:,8) = xlsread('Demand Data sd.csv', 'O2:P25');
Demand_sd(:,:,9) = xlsread('Demand Data sd.csv', 'Q2:R25');
Demand_sd(:,:,10) = xlsread('Demand Data sd.csv', 'S2:T25');
Demand_sd(:,:,11) = xlsread('Demand Data sd.csv', 'U2:V25');
Demand_sd(:,:,12) = xlsread('Demand Data sd.csv', 'W2:X25');

Sol_mu(:,:,1) = repmat(xlsread('Solar_mu_daily.csv','A1:A24'),1,2);
Sol_mu(:,:,2) = repmat(xlsread('Solar_mu_daily.csv','B1:B24'),1,2);
Sol_mu(:,:,3) = repmat(xlsread('Solar_mu_daily.csv','C1:C24'),1,2);
Sol_mu(:,:,4) = repmat(xlsread('Solar_mu_daily.csv','D1:D24'),1,2);
Sol_mu(:,:,5) = repmat(xlsread('Solar_mu_daily.csv','E1:E24'),1,2);
Sol_mu(:,:,6) = repmat(xlsread('Solar_mu_daily.csv','F1:F24'),1,2);
Sol_mu(:,:,7) = repmat(xlsread('Solar_mu_daily.csv','G1:G24'),1,2);
Sol_mu(:,:,8) = repmat(xlsread('Solar_mu_daily.csv','H1:H24'),1,2);
Sol_mu(:,:,9) = repmat(xlsread('Solar_mu_daily.csv','I1:I24'),1,2);
Sol_mu(:,:,10) = repmat(xlsread('Solar_mu_daily.csv','J1:J24'),1,2);
Sol_mu(:,:,11) = repmat(xlsread('Solar_mu_daily.csv','K1:K24'),1,2);
Sol_mu(:,:,12) = repmat(xlsread('Solar_mu_daily.csv','L1:L24'),1,2);

Sol_sd(:,:,1)= repmat(xlsread('Solar_sd_daily.csv','A1:A24'),1,2);
Sol_sd(:,:,2) = repmat(xlsread('Solar_sd_daily.csv','B1:B24'),1,2);
Sol_sd(:,:,3) = repmat(xlsread('Solar_sd_daily.csv','C1:C24'),1,2);
Sol_sd(:,:,4) = repmat(xlsread('Solar_sd_daily.csv','D1:D24'),1,2);
Sol_sd(:,:,5) = repmat(xlsread('Solar_sd_daily.csv','E1:E24'),1,2);
Sol_sd(:,:,6) = repmat(xlsread('Solar_sd_daily.csv','F1:F24'),1,2);
Sol_sd(:,:,7) = repmat(xlsread('Solar_sd_daily.csv','G1:G24'),1,2);
Sol_sd(:,:,8) = repmat(xlsread('Solar_sd_daily.csv','H1:H24'),1,2);
Sol_sd(:,:,9) = repmat(xlsread('Solar_sd_daily.csv','I1:I24'),1,2);
Sol_sd(:,:,10) = repmat(xlsread('Solar_sd_daily.csv','J1:J24'),1,2);
Sol_sd(:,:,11) = repmat(xlsread('Solar_sd_daily.csv','K1:K24'),1,2);
Sol_sd(:,:,12) = repmat(xlsread('Solar_sd_daily.csv','L1:L24'),1,2);

reg = zeros(12,24);
hol = zeros(12,24);
obj_lin_mu = zeros(1,12);
obj_lin_mu1 = zeros(1,12);
dem_mean = zeros(24,2,12);
sol_mean =zeros(24,2,12);
Alloc_linear = zeros(25,17);
obj_lin_sd = [];
obj_lin_sd1 = [];
for i = 1:12
    disp(i);
    Hydro_avg = sum_hydro(i);
    [Alloc_temp,reg1,hol1,cobj_lin_mu,cobj_lin_sd] = run_linear(Day(i,:),Beta,Hydro_avg,Demand_mu(:,:,i),Demand_sd(:,:,i),Cost_imp_mu,Cost_imp_sd,Sol_mu(:,:,i),Sol_sd(:,:,i),n);
    reg(i,:) = reg(i,:) + reg1;
    hol(i,:) = hol(i,:) + hol1;
    for j = 2:p
       [Alloc,reg1,hol1,obj_mu_temp,obj_sd_temp] = run_linear(Day(i,:),Beta,Hydro_avg,Demand_mu(:,:,i),Demand_sd(:,:,i),Cost_imp_mu,Cost_imp_sd,Sol_mu(:,:,i),Sol_sd(:,:,i),n);
       Alloc_temp = [Alloc_temp, Alloc];
       cobj_lin_mu = [cobj_lin_mu; obj_mu_temp];
       cobj_lin_sd = [cobj_lin_sd; obj_sd_temp];
       %cobj_lin_mu1 = [cobj_lin_mu1; obj_mu_temp1];
       %cobj_lin_sd1 = [cobj_lin_sd1; obj_sd_temp1];
       reg(i,:) = reg(i,:) + reg1;
       hol(i,:) = hol(i,:) + hol1;
       %[Hyd_reg(i,:),Hyd_hol(i,:)] = func.Alloc_Hydro(Alloc_linear(:,:,i),24);
    end
    s = size(Alloc_temp);
    disp(size(cobj_lin_mu));
    d = size(cobj_lin_mu);
    %e = size(cobj_lin_mu1);
    obj_lin_mu(1:d(1),i) = cobj_lin_mu;
    %obj_lin_mu1(1:e(1),i) = cobj_lin_mu1;
    obj_lin_sd = [obj_lin_sd, cobj_lin_sd];
    %obj_lin_sd1 = [obj_lin_sd1, cobj_lin_sd1];
    Alloc_linear((25*(i-1)+1):25*i,1:s(2)) = Alloc_temp;
    reg(i,:) = reg(i,:)/p;
    hol(i,:) = hol(i,:)/p;
end
fprintf('The objective value from Monte Carlo Optimised is: %e\n', sum(mean(obj_lin_mu)));
fprintf('The objective value from Monte Carlo Realistic is: %e\n', sum(mean(obj_lin_mu1)));

%disp(obj_lin_mu1);
x1 = 1:24;
subplot(2,2,[1,2]);
x = 1:12;
plot(x,sum_hydro);
subplot(2,2,3); 
    plot(x1,reg(i,:));
    subplot(2,2,4); 
    plot(x1,hol(i,:));

%csvwrite('Objective_Value_dynamic-corrected.csv',obj_dyn1);
obj_dyn = [obj_dyn_mu,obj_dyn_sd];
obj_lin = [obj_lin_mu];
%obj_lin1 = [obj_lin_mu1];
csvwrite('Dynamic_objective.csv',obj_dyn);
csvwrite('Monthly_Alloc.csv',Alloc_linear);
csvwrite('Linear_objective.csv',obj_lin);
%csvwrite('Linear_objective-corrected.csv',obj_lin1);
end
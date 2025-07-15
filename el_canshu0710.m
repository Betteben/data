T2MWH=3.6*1E9;
T_H2P=0.0033;% NM3 - MW
%% 
n_cell=260;%
n_F=0.79;%
F_fld=96485.3;
AA=167;BB=2;CC=-576;
AA=196;BB=0.303;CC=-100;
% AA=185;BB=0.303;CC=-100;
% AA=180;BB=0.303;CC=-100;
% AA=211;BB=0.303;CC=-100;
P_ele_max=4*ones(N_EL,1);
P_ele_min=0.18*P_ele_max;
n_ele_prod_max=1000*ones(N_EL,1);
r_n_ele_prod_max=1600*ones(N_EL,1);
r_n_ele_prod_min=-4800*ones(N_EL,1);

n_heat=0.8;
n_cool=0.8;
paux=0;

C_temp=1.163*1e8;
hh=1;

a0=2;a1=0;a2=0;Uth=1.48;
T_am=5+273;R_diss=1.2*1e-4;
T_cool=5+273;R_cool=2*1e-5;
Q_heat_max=1*T2MWH*ones(N_EL,1);

n_h2_im_in=0.003182;
c_im_out=5.68*1e5;



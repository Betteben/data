
%% 
mpc = IEEE33BW;
PLOAD = 100*mpc.Pload;
PLOAD=1.2*PLOAD(:,1:T);
QLOAD = 0.75*PLOAD;

BRANCH = mpc.branch;
BRANCH(:,3) = BRANCH(:,3)*5/(12.66^2);
R = real(BRANCH(:,3));
X = imag(BRANCH(:,3));
RR=diag(R);
XX=diag(X);

nb = 33;
nl = 32;

upstream_doc=BRANCH(:,1);
dnstream_doc=BRANCH(:,2);
upstream=zeros(nb,nl);
dnstream=zeros(nb,nl);
k=1;
for i=upstream_doc'
upstream(i,k)=1;
k=k+1;
end
k=1;
for i=dnstream_doc'
dnstream(i,k)=1;
k=k+1;
end

Vmax = [1.05*1.05*ones(nb-1,T)
        1.05*1.05*ones(1,T)];
Vmin = [0.95*0.95*ones(nb-1,T)
        1.05*1.05*ones(1,T)];
%%
ROOT_location=[33];
ROOT_num=length(ROOT_location);
A_ROOT = zeros(nb,ROOT_num);  
for i = 1:ROOT_num
    A_ROOT(ROOT_location(i),i) = 1;
end

PW_location=[11 20 24 31];
PW_num=length(PW_location);
A_PW = zeros(nb,PW_num);  
for i = 1:PW_num
    A_PW(PW_location(i),i) = 1;
end

ESS_location=[4 10];
ESS_num=length(ESS_location);
A_ESS = zeros(nb,ESS_num); 
for i = 1:ESS_num
    A_ESS(ESS_location(i),i) = 1;
end

MT_location=[1 7 28];
MT_num=length(MT_location);
A_MT = zeros(nb,MT_num);  
for i = 1:MT_num
    A_MT(MT_location(i),i) = 1;
end


Thu=4;
Thd=4;
Pmt_max=3;
Pmt_min=0.05*Pmt_max;
Qmt_max=Pmt_max*0.75;
Qmt_min=-Qmt_max;

SVC_location=[13 22 30];
SVC_num=length(SVC_location);
A_SVC = zeros(nb,SVC_num);  
for i = 1:SVC_num
    A_SVC(SVC_location(i),i) = 1;
end
Cel=0.02*1e3;
Cfc=0.01*1e3;
Ces=0.05*1e3;
Chs=0.05*1e3;
Cqfqg=0.15*1e3;

Cmt=0.2*1e3;
Csu=0.1*1e3;
Csd=0.1*1e3;
Cmt1=0.2*1e3;
Ces1=0.05*1e3;
%% 
HPLOAD=0.15*[0.5	0.57142857142857	0.46428571428571	0.35714285714286	0.25000000000000	0.33571428571429	0.72857142857143	0.82142857142857	0.91428571428571	1.30714285714286	1.50000000000000	2.39285714285714	2.28571428571429	2.12500000000000	1.57857142857143	1.18571428571429	1.13928571428571	1.39285714285714	2.34642857142857	2.60000000000000	2.35357142857143	2.28571428571429	1.60714285714286	1.62857142857143];
PW_forcast=0.21*[9.24800000000000	9.94200000000000	10.4000000000000	10.2340000000000	10.1680000000000	9.96800000000000	9.78200000000000	9.46200000000000	5.30400000000000	3.47600000000000	2.15800000000000	2.03000000000000	2.76800000000000	4.12200000000000	4.11600000000000	4.99600000000000	5.49000000000000	5.60200000000000	5.68400000000000	5.68600000000000	5.17600000000000	4.78600000000000	4	4.26800000000000];

EL_location=[18 22 25 33];
EL_num=length(EL_location);
A_EL = zeros(nb,EL_num); 
for i = 1:EL_num
    A_EL(EL_location(i),i) = 1;
end

PW_forcast=ones(PW_num,1)*PW_forcast(:,1:T);
HPLOAD=ones(EL_num,1)*HPLOAD(:,1:T);

% %% 
% close all
% figure(111)
% hold on
% plot(sum(PLOAD))
% plot(sum(HPLOAD))
% plot(sum(PW_forcast))
% legend('PL','HL','PW')
% 
% figure(222)
% hold on
% plot(sum(PW_forcast)-sum(PLOAD)-sum(HPLOAD))
% legend('PW-pl-hl')

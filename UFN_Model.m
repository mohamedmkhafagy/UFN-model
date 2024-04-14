
main_DFN = dlmread('DFN(200).txt');
nf = main_DFN(1,1);
main_DFN = dlmread('DFN(200).txt','',1,0);
xmin_DFN = 0; %Xmin of fracture network
xmax_DFN = max(main_DFN(:,3)); %Xmax of fracture network
ymin_DFN = 0; %Ymin of fracture network
ymax_DFN = xmax_DFN; %Ymax of fracture network

REV_no = 5; 
no_all_REV = REV_no * REV_no; 

%Set the injection length along the left boundary
Inj_Lower_point = 0;
Inj_Upper_point = 1000;

B_RWPT_Transport_in_DFN_Generate_Elements

input=dlmread('trans_prop.txt','',0,1);
input(5,1)=input(5,1) * 1;

for nnnn = 1 : no_all_REV
    if size(Small_REV_Hz{nnnn},1) == 1
        continue
    end
    geom = Small_REV_Hz{nnnn};
    nf = geom(1,1);
    geom = Small_REV_Hz{nnnn}(2:end,:);
    xmin = 0; %Xmin of REV
    xmax = xmax_DFN/REV_no; %Xmax of REV
    ymin = 0; %Ymin of REV
    ymax = ymax_DFN/REV_no; %Ymax of REV
    
    if ismember(2,frac(:,8))
        inj_boundary = 1; 
        E1_RWPT_Transport_in_Hz_REV_Different_BCs
    end
    
    if ismember(1,frac(:,8))
        inj_boundary = 2; 
        E1_RWPT_Transport_in_Hz_REV_Different_BCs
    end
    
    if ismember(3,frac(:,8))
        inj_boundary = 3; 
        E1_RWPT_Transport_in_Hz_REV_Different_BCs
    end
end

n1=0;
n2=0;
n3=0;
n4=0;
n5=0;
for n = 1 : no_all_REV
    if ismember(1,frac(:,8)) && isempty(BTC_no1{n}) == 0 && BTC_no1{n}(end,2) ~= 0
        BTC_no1_AVG(:,n1) = BTC_no1{n}(:,2)/BTC_no1{n}(end,2);
    end
    if ismember(2,frac(:,8)) && isempty(BTC_no2{n}) == 0 && BTC_no2{n}(end,2) ~= 0
        BTC_no2_AVG(:,n2) = BTC_no2{n}(:,2)/BTC_no2{n}(end,2);
    end
    if ismember(3,frac(:,8)) && isempty(BTC_no3{n}) == 0 && BTC_no3{n}(end,2) ~= 0
        BTC_no3_AVG(:,n3) = BTC_no3{n}(:,2)/BTC_no3{n}(end,2);
    end
    if ismember(4,frac(:,8)) && isempty(BTC_no4{n}) == 0 && BTC_no4{n}(end,2) ~= 0
        BTC_no4_AVG(:,n4) = BTC_no4{n}(:,2)/BTC_no4{n}(end,2);
    end
    if ismember(5,frac(:,8)) && isempty(BTC_no5{n}) == 0 && BTC_no5{n}(end,2) ~= 0
        BTC_no5_AVG(:,n5) = BTC_no5{n}(:,2)/BTC_no5{n}(end,2);
    end
end

%Plotting all the BTC element Cases
figure;

if  exist('BTC_no1_AVG','var') == 1
    BTC_no1_AVG = mean(BTC_no1_AVG, 2);
    AVG_BTC_no{1} = [BTC_no1{index1}(:,1) BTC_no1_AVG];
    for n = 1 : no_all_REV
        if isempty(BTC_no1{n}) == 0
            plot(BTC_no1{n}(:,1)/24/3600,BTC_no1{n}(:,2)/BTC_no1{n}(end,2),'-g','MarkerSize',12)
            hold on
        end
    end
end
if  exist('BTC_no2_AVG','var') == 1
    BTC_no2_AVG = mean(BTC_no2_AVG, 2);
    AVG_BTC_no{2} = [BTC_no2{index2}(:,1) BTC_no2_AVG];
    for n = 1 : no_all_REV
        if isempty(BTC_no2{n}) == 0
            plot(BTC_no2{n}(:,1)/24/3600,BTC_no2{n}(:,2)/BTC_no2{n}(end,2),'-g','MarkerSize',12)
            hold on
        end
    end
end
if  exist('BTC_no3_AVG','var') == 1
    BTC_no3_AVG = mean(BTC_no3_AVG, 2);
    AVG_BTC_no{3} = [BTC_no3{index3}(:,1) BTC_no3_AVG];
    for n = 1 : no_all_REV
        if isempty(BTC_no3{n}) == 0
            plot(BTC_no3{n}(:,1)/24/3600,BTC_no3{n}(:,2)/BTC_no3{n}(end,2),'-g','MarkerSize',12)
            hold on
        end
    end
end
if  exist('BTC_no4_AVG','var') == 1
    BTC_no4_AVG = mean(BTC_no4_AVG, 2);
    AVG_BTC_no{4} = [BTC_no4{index4}(:,1) BTC_no4_AVG];
    for n = 1 : no_all_REV
        if isempty(BTC_no4{n}) == 0
            plot(BTC_no4{n}(:,1)/24/3600,BTC_no4{n}(:,2)/BTC_no4{n}(end,2),'-g','MarkerSize',12)
            hold on
        end
    end
end
if  exist('BTC_no5_AVG','var') == 1
    BTC_no5_AVG = mean(BTC_no5_AVG, 2);
    AVG_BTC_no{5} = [BTC_no5{index5}(:,1) BTC_no5_AVG];
    for n = 1 : no_all_REV
        if isempty(BTC_no5{n}) == 0
            plot(BTC_no5{n}(:,1)/24/3600,BTC_no5{n}(:,2)/BTC_no5{n}(end,2),'-g','MarkerSize',12)
            hold on
        end
    end
end

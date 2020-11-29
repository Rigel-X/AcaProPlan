% Read and generate training data/label of indicated format
% Rigel Xiang, 2020/11/22

%addpath(genpath('hospital_data1\B4F83CD5109F428EA56424B4F1B43182'));
%addpath(genpath('hospital_data1\Segmentation'));
addpath(genpath('hospital_data2\3C9A56D701824456BCBBE6A41E9B8C1A'));
addpath(genpath('hospital_data2\Segmentation'));

addpath(genpath('NIfTI'));

%% Training data
for i=1:120
    I=dicomread([int2str(i),'_',int2str(i-1),'.dcm']);   % read .dcm file
    imshow(I,[],'border','tight','initialmagnification','fit');   % show images without white margin
    % imshow(I,[]);  % with white margin
    set (gcf,'Position',[0,0,512,512]);
    axis normal;
    saveas(gca,['E:\academic_promotion\hospital_data2\TrainImgPng\','2_',int2str(i),'_',int2str(i-1),'.png']);
end

%% Label
%files = gunzip('hospi_1_qyy.nii.gz');  % unzip .nii.gz file
files = gunzip('hospi_2.nii.gz');
info  = load_nii(files{1});
image = info.img;   % read images
for j=1:120
    imshow(fliplr(rot90(image(:,:,j),1)),[],'border','tight','initialmagnification','fit');
    set (gcf,'Position',[0,0,512,512]);
    axis normal;
    saveas(gca,['E:\academic_promotion\hospital_data2\LabelImgPng\','2_',int2str(j),'_',int2str(j-1),'.png']);
end

clc;clear all;close all;
File_Name = input('Enter File Name : ');
File_Format = input('Enter File Format : ');
Original_Image = im2double(imread([File_Name '.' File_Format]));
Red_Channel = Original_Image(:, :, 1);
Green_Channel = Original_Image(:, :, 2);
Blue_Channel = Original_Image(:, :, 3);

PCs_array = input('Enter differnet number of PC Values : ');

% Display Original image
subplot(floor(length(PCs_array)/2)+1, 2, 1);
imshow(Original_Image);
title('Original Image');
hold on;

for i = 1:length(PCs_array)
Reconstructed_Red_Channel = PCA_Compressor(Red_Channel,PCs_array(i));
Reconstructed_Green_Channel = PCA_Compressor(Green_Channel,PCs_array(i));
Reconstructed_Blue_Channel = PCA_Compressor(Blue_Channel,PCs_array(i));
Reconstructed_Image = cat(3, Reconstructed_Red_Channel, Reconstructed_Green_Channel, Reconstructed_Blue_Channel);
imwrite(Reconstructed_Image,[File_Name '_Compressed_' num2str(PCs_array(i),'%d') '_PCs' '.' File_Format]);
disp([File_Name '_Compressed_' num2str(PCs_array(i),'%d') '_PCs' '.' File_Format ' has ' num2str(PCs_array(i),'%d') ' PCs']);

% Display Compressed image
subplot(floor(length(PCs_array)/2)+1, 2, i+1);
imshow(Reconstructed_Image);
title(['Compressed has ' num2str(PCs_array(i),'%d') ' PCs']);
hold on;
end
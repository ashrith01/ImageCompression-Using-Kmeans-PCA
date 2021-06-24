clc; clear all; close all;
File_Name = input('Enter File Name : ');
File_Format = input('Enter File Format : ');
Original_Image = double(imread([File_Name '.' File_Format]));
Original_Image = Original_Image/255;
Original_Image_Size = size(Original_Image);
Reshaped_Original_Image_Size = reshape(Original_Image, Original_Image_Size(1)*Original_Image_Size(2), 3);
unique_colors=Unique_Colors([File_Name '.' File_Format]);
disp([File_Name '.' File_Format ' has ' num2str(unique_colors,'%d') ' unique colours']);

K_array = input('Enter differnet k Values : ');
Max_Iterations = input('Enter the maximum iterations : ');

% Display Original image
subplot(floor(length(K_array)/2)+1, 2, 1);
imshow(Original_Image);
title(['Original Image ' ' has ' num2str(unique_colors,'%d') ' colours']);
hold on;

for i = 1:length(K_array)
Initial_Centroids = kMeans_Initialize_Centroids(Reshaped_Original_Image_Size, K_array(i));
[centroids, idx] = kMeans_Compressor(Reshaped_Original_Image_Size, Initial_Centroids, Max_Iterations);
idx = Find_Closest_Centroids(Reshaped_Original_Image_Size, centroids);
Reconstructed_Image = centroids(idx, :);
Reconstructed_Image = reshape(Reconstructed_Image, Original_Image_Size(1), Original_Image_Size(2), 3);
imwrite(Reconstructed_Image,[File_Name '_Compressed_' num2str(K_array(i),'%d') '_kMeans' '.' File_Format])
unique_colors=Unique_Colors([File_Name '_Compressed_' num2str(K_array(i),'%d') '_kMeans' '.' File_Format]);
disp([File_Name '_Compressed_' num2str(K_array(i),'%d') '_kMeans' '.' File_Format ' has ' num2str(unique_colors,'%d') ' colours']);

% Display Compressed image
subplot(floor(length(K_array)/2)+1, 2, i+1);
imshow(Reconstructed_Image);
title(['Compressed has ' num2str(unique_colors,'%d') ' unique colours']);
hold on;
end
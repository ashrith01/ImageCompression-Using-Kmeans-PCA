function count = Unique_Colors(image)
format longg;format compact;

rgbImage = imread(image);
[rows, columns, ~] = size(rgbImage);
redChannel = rgbImage(:, :, 1);
greenChannel = rgbImage(:, :, 2);
blueChannel = rgbImage(:, :, 3);

% Construct the 3D color gamut (3D histogram).
gamut3D = zeros(256,256,256);
for column = 1: columns
	for row = 1 : rows
		rIndex = redChannel(row, column) + 1;
		gIndex = greenChannel(row, column) + 1;
		bIndex = blueChannel(row, column) + 1;
		gamut3D(rIndex, gIndex, bIndex) = gamut3D(rIndex, gIndex, bIndex) + 1;
	end
end

% Get a list of non-zero colors so we can put it into scatter3()
% so that we can visualize the colors that are present.
count=0;
r = zeros(256, 1);
g = zeros(256, 1);
b = zeros(256, 1);
nonZeroPixel = 1;
for red = 1 : 256
	for green = 1: 256
		for blue = 1: 256
			if (gamut3D(red, green, blue) > 1)
				% Record the RGB position of the color.
				r(nonZeroPixel) = red;
				g(nonZeroPixel) = green;
				b(nonZeroPixel) = blue;
				nonZeroPixel = nonZeroPixel + 1;
                count=count+1;
			end
		end
	end
end
%{
scatter3(r, g, b, 3);
title(image);
xlabel('R', 'FontSize', 20);
ylabel('G', 'FontSize', 20);
zlabel('B', 'FontSize', 20);
%}
end
function Reconstructed_Channel = PCA_Compressor(Channel,PC)
[m, n]= size(Channel);
mean_of_every_column = mean(Channel);
column_mean_zero = (Channel - repmat(mean_of_every_column,[m 1]));
cov_column_mean_zero = cov(column_mean_zero);
[V, D] = eig(cov_column_mean_zero);
[~,ind] = sort(diag(D));
V = V(:,ind);
Reduced_V = V; % n*n
numpcs = n - PC;
for i = 1:numpcs
    Reduced_V(:,1) = [];
end
Y=Reduced_V'* column_mean_zero';  %n*k.T  * m*n.T  = k*n * n*m = k*m                                 
Compressed_Data=Reduced_V*Y;      %n*k * k*m = n*m                                  
Compressed_Data = Compressed_Data' + repmat(mean_of_every_column,[m 1]); %n*m.T + m*n = m*n +m*n
Reconstructed_Channel = (Compressed_Data); %m*n
end
function [centroids, idx] = kMeans_Compressor(X, initial_centroids, max_iters)
    [m, n] = size(X);
    K = size(initial_centroids, 1);
    centroids = initial_centroids;
    idx = zeros(m, 1);
    for i = 1:max_iters
        idx = Find_Closest_Centroids(X, centroids);
        centroids = Compute_Centroids(X, idx, K);
    end
end
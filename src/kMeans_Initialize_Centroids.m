function Initial_Centroids = kMeans_Initialize_Centroids(X, K)
    randidx = randperm(size(X, 1));
    Initial_Centroids = X(randidx(1:K), :);
end
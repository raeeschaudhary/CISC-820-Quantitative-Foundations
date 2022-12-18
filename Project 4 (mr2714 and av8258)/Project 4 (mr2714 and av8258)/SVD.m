function [PCs, pPCA, faces_mean, total_var] = SVD(train_faces, length)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
train_faces = train_faces';
faces_mean = mean(train_faces, 2); %find the mean of the data
[p, n] = size(train_faces);
faces_sub = train_faces - repmat(faces_mean, 1, n);
Q = faces_sub ./ (n-1); %get covariance matrix
[pPCA, S, V] = svd(Q);
pPCA = pPCA(:, 1:length);
PCs = pPCA' * faces_sub;
sv = diag(S);
total_var = sv/sum(sv);
end
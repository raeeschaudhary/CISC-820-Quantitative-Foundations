function [PCs, pPCA, faces_mean, total_var, var_sorted] = PCA(train_faces, length) 
%input : faces (for PCA), length (eigenvectors), 
% input svd (either eigendecomposition or SVD for bonus marks)
%output : principal components, eigenfaces, mean, variance (total & sorted)

train_faces = train_faces';
faces_mean = mean(train_faces, 2); %find the mean of the data
[p, n] = size(train_faces);
faces_sub = train_faces - repmat(faces_mean, 1, n);
Q = (faces_sub * faces_sub') ./ (n-1); %get covariance matrix
[eVec, eVal] = eig(Q); %get eigenvectors
[var_sorted, index] = sort(diag(eVal), 'descend');
eVec_sorted = eVec(:, index);
pPCA = eVec_sorted(:, 1:length);
PCs = pPCA' * faces_sub;
total_var = sum(var_sorted);
end
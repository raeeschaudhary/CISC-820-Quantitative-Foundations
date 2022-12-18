function PCA_Reconstruct(PCs, pPCA, faces_mean, sub_faces)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
[p, n] = size (PCs);
figure;
subplot(4, 7, 1), imshow(reshape(sub_faces(1, :), [112, 92]), []);
title('Original Face-1');
for plt = 1:6
    img = PCs(1:(plt * 55) - 30, :)' * pPCA(:, 1:(plt * 55) - 30)';
    img = img + repmat(faces_mean, 1, n)';
    subplot(4, 7, plt + 1), imshow(reshape(img(9, :), [112, 92]), []);
    title (strcat(strcat('Constructed at-', int2str((plt * 55) - 30)),'-EV'));
end

subplot(4, 7, 8), imshow(reshape(sub_faces(2, :), [112, 92]), []);
title('Original Face-2');
for plt = 1:6
    img = PCs(1:(plt * 55) - 30, :)' * pPCA(:, 1:(plt * 55) - 30)';
    img = img + repmat(faces_mean, 1, n)';
    subplot(4, 7, plt + 8), imshow(reshape(img(17, :), [112, 92]), []);
    title (strcat(strcat('Constructed at-', int2str((plt * 55) - 30)),'-EV'));
end


subplot(4, 7, 15), imshow(reshape(sub_faces(3, :), [112, 92]), []);
title('Original Face-3');
for plt = 1:6
    img = PCs(1:(plt * 55) - 30, :)' * pPCA(:, 1:(plt * 55) - 30)';
    img = img + repmat(faces_mean, 1, n)';
    subplot(4, 7, plt + 15), imshow(reshape(img(25, :), [112, 92]), []);
    title (strcat(strcat('Constructed at-', int2str((plt * 55) - 30)),'-EV'));
end

subplot(4, 7, 22), imshow(reshape(sub_faces(4, :), [112, 92]), []);
title('Original Face-4');
for plt = 1:6
    img = PCs(1:(plt * 55) - 30, :)' * pPCA(:, 1:(plt * 55) - 30)';
    img = img + repmat(faces_mean, 1, n)';
    subplot(4, 7, plt + 22), imshow(reshape(img(33, :), [112, 92]), []);
    title (strcat(strcat('Constructed at-', int2str((plt * 55) - 30)),'-EV'));
end

end
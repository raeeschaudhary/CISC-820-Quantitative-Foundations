function Show_Eigen_Faces(pPCA, leading)
%input: eigenfaces to display
if leading == true
    figure;
    for i = 1:5
        subplot(1, 5, i), imshow(reshape(pPCA(:, i), [112, 92]), []);
        title(strcat(int2str(i), '-th eigenface'), 'FontSize', 10);
    end
else
    figure;
    j = 0;
    for i = 100:50:300
        j = j + 1;
        subplot(1, 5, j), imshow(reshape(pPCA(:, i), [112, 92]), []);
        title(strcat(int2str(i), '-th eigenface'), 'FontSize', 10);
    end
end
end
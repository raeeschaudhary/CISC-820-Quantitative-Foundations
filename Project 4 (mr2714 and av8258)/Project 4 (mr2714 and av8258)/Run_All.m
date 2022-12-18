function Run_All()
%all functions go from here

%Read faces data into train and test splits
%Also read some non_faces; second parameter true
disp('Running Experiments with PCA');
[train_faces, test_faces, non_faces] = Read_Images('att_faces/s', true);

%Combine train and test for PCA
all_faces = [train_faces; test_faces];
[PCs, pPCA, faces_mean, total_var, var_sorted] = PCA(all_faces, 300);

%Draw variance graph with respect to eigenfaces.
var_per = zeros(1, 400); % taking top 400, ideally to length
for i = 1:length(var_per)
    var_per(i) = var_sorted(i) / total_var;
end
figure;
var_plot = cumsum(var_per);
plot(var_plot, 'o');
ylim([0 1.001]);
xlabel('eigenfaces', 'fontsize', 12);
ylabel('variance', 'fontsize', 12);

%Display leading and least eigenfaces
Show_Eigen_Faces(pPCA, true); % show leading eigen faces
Show_Eigen_Faces(pPCA, false); % show less-leading eigen faces

%Take subset of faces and reconstruct to observe effect
sub_faces = all_faces([9, 17, 25, 33], :); %chosen four subjects
PCA_Reconstruct(PCs, pPCA, faces_mean, sub_faces); %Reconstruct at 25, 80, 135, 190, 245, 300 on 4 samples

%Face Recognition and Classification
%Train PCA using training faces
[PCs, pPCA, faces_mean, total_var, var_sorted] = PCA(train_faces, 300);

%Do the recognition task with Linear Method
recog_task = true; knn = false;
accuracy = Face_Recog_Class(PCs, pPCA, faces_mean, test_faces, non_faces, recog_task, knn);
disp('Recognitiotn Accuracy='); disp(accuracy);

%Do the identification task with Linear Method
recog_task = false; knn = false;
accuracy = Face_Recog_Class(PCs, pPCA, faces_mean, test_faces, non_faces, recog_task, knn);
disp('Identification Accuracy='); disp(accuracy);


%Do the recognition task with Bonus Method - KNN
recog_task = true; knn = true;
accuracy = Face_Recog_Class(PCs, pPCA, faces_mean, test_faces, non_faces, recog_task, knn);
disp('Recognitiotn Accuracy(KNN)='); disp(accuracy);

%Do the identification task with Bonus Method - KNN
recog_task = false; knn = true;
accuracy = Face_Recog_Class(PCs, pPCA, faces_mean, test_faces, non_faces, recog_task, knn);
disp('Identification Accuracy(KNN)='); disp(accuracy);


disp("Running Same Experiments with SVD");
%Running with SVD 
%Combine train and test for PCA
[PCs, pPCA, faces_mean, total_var] = SVD(all_faces, 300);

%Draw variance graph with respect to svd.
figure;
var_plot = cumsum(total_var);
plot(var_plot, 'o');
ylim([0 1.001]);
xlabel('svd', 'fontsize', 12);
ylabel('variance', 'fontsize', 12);

%Display leading and least eigenfaces
Show_Eigen_Faces(pPCA, true); % show leading eigen faces
Show_Eigen_Faces(pPCA, false); % show less-leading eigen faces

%Take subset of faces and reconstruct to observe effect using SVD
sub_faces = all_faces([9, 17, 25, 33], :); %chosen four subjects
PCA_Reconstruct(PCs, pPCA, faces_mean, sub_faces); %Reconstruct at 25, 80, 135, 190, 245, 300 on 4 samples

%Face Recognition and Classification
%Train PCA-SVd using training faces
[PCs, pPCA, faces_mean, total_var] = SVD(train_faces, 300);

%Do the recognition task with Linear Method
recog_task = true; knn = false;
accuracy = Face_Recog_Class(PCs, pPCA, faces_mean, test_faces, non_faces, recog_task, knn);
disp('Recognitiotn Accuracy='); disp(accuracy);

%Do the identification task with Linear Method
recog_task = false; knn = false;
accuracy = Face_Recog_Class(PCs, pPCA, faces_mean, test_faces, non_faces, recog_task, knn);
disp('Identification Accuracy='); disp(accuracy);


%Do the recognition task with Bonus Method - KNN
recog_task = true; knn = true;
accuracy = Face_Recog_Class(PCs, pPCA, faces_mean, test_faces, non_faces, recog_task, knn);
disp('Recognitiotn Accuracy(KNN)='); disp(accuracy);

%Do the identification task with Bonus Method - KNN
recog_task = false; knn = true;
accuracy = Face_Recog_Class(PCs, pPCA, faces_mean, test_faces, non_faces, recog_task, knn);
disp('Identification Accuracy(KNN)='); disp(accuracy);

disp('View Figures to See Results');
end
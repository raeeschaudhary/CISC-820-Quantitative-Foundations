function [accuracy] = Face_Recog_Class(PCs, pPCA, faces_mean, test_faces, non_faces, recog_task, knn)
%Perform recognition and classification 

if recog_task == true
    test_images = [test_faces; non_faces];
else
    test_images = test_faces;
end
[n, p] = size(test_images);
test_images = test_images';
test_images_mean = test_images - repmat(faces_mean, 1, n);
Z = pPCA' * test_images_mean;

if recog_task == true
    test_labels = [ones(120, 1); ones(15, 1) * 2];
    if knn == true
        [indexes, D] = knnsearch(PCs', Z');
        threshold = max(D); 
        outputs = ones(n, 1);
        outputs(D > threshold) = 2;
    else
        face_train_labels = ones(280, 1);
        test_labels = test_labels';
        Y = bsxfun(@eq, face_train_labels(:), 1:2);
        W = (Y' * PCs') * pinv(PCs * PCs');
        recogs = W * Z;
        [scores, outputs] = max(recogs);
    end
    accuracy = (sum(outputs == test_labels) * 100) / length(test_labels);
else
    test_labels = [repelem((1:35)', 2); repelem((36:40)', 10)];
    train_labels = repelem ((1:35)', 8);
    if knn == true
        [indexes, D] = knnsearch(PCs', Z');
        threshold = max(D);
        outputs = train_labels(indexes);
        outputs(D > threshold) = 36;
    else
        test_labels = test_labels';
        Y = bsxfun(@eq, train_labels(:), 1:36);
        W = (Y' * PCs') * pinv(PCs * PCs');
        class_predict = W * Z;
        [scores, outputs] = max(class_predict);
    end
    accuracy = (sum(outputs == test_labels) * 100 ) / length(test_labels);
end
end
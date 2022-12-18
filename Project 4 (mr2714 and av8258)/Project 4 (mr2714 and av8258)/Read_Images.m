function [train_faces, test_faces, non_faces] = Read_Images(data_path, read_nonfaces)
% input: images path
% output Read the face images into training and test sets, also non_faces

train_faces = zeros(280, 112 * 92); %35 classes x 8 images each = 280
test_faces = zeros(120, 112 * 92); %35 classes x 2 images each = 70 5 classes x 10 images each = 50
for clas = 1:40
    image_set_path = strcat(data_path, string(clas));
    image_set = dir(image_set_path);
    for i = 3 : length(image_set) %first two are ..
        image_name = strcat(strcat(image_set_path,'/'), image_set(i).name);
        if (clas <= 35)
            if (i <= 10)
                train_faces((clas - 1) * 8 + (i - 2), :) = reshape(imread(convertStringsToChars(image_name)), 1 ,[]);
            else
                test_faces((clas - 1) * 2 + (i - 10), :) = reshape(imread(convertStringsToChars(image_name)), 1, []);
            end
        else
            test_faces((clas - 29) * 10 + (i - 2), :) = reshape(imread(convertStringsToChars(image_name)), 1, []);
        end
    end
end
if read_nonfaces == true
    non_faces = zeros(15, 112*92); %15 images of same dimensions 
    for i = 0:14
        [Image, c] = imread(".\nonface\" + num2str(i) + ".ppm");
        [height, width] = size(Image(:, :, 1));
        img = zeros(height, width);
        for j = 1:height
            for k = 1:width
                img(j, k) = int8(Image(j, k));
            end
        end
        non_faces(i+1, :) = reshape(img, [1, 112*92]);
    end
end
end
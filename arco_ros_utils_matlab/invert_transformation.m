function inverted_T = invert_transformation(T)
%invert_transformation inverts a 4x4 transformation matrix.
% T [R, d; 0, 1] then inverted_T = [R^T, -R^T * d; 0, 1]

R = T(1:3,1:3);
d = T(1:3,4);


inverted_T = [R', -R' * d;
              0.0, 0.0, 0.0, 1.0];
end


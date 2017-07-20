function p = predict(Theta1, Theta2, X)
%PREDICT Predict the label of an input given a trained neural network
%   p = PREDICT(Theta1, Theta2, X) outputs the predicted label of X given the
%   trained weights of a neural network (Theta1, Theta2)

% Useful values
m = size(X, 1);
num_labels = size(Theta2, 1);

% You need to return the following variables correctly 
p = zeros(size(X, 1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Complete the following code to make predictions using
%               your learned neural network. You should set p to a 
%               vector containing labels between 1 to num_labels.
%
% Hint: The max function might come in useful. In particular, the max
%       function can also return the index of the max element, for more
%       information see 'help max'. If your examples are in rows, then, you
%       can use max(A, [], 2) to obtain the max for each row.
%

X = [ones(m,1) X];
Y = zeros(m, 25);
Y = sigmoid(X * Theta1');
Y = [ones(m,1) Y];
Z = zeros(m, 10);
Z = sigmoid(Y * Theta2');

for iter=1:m
  [val, idx] = max(Z(iter,:));
  if(idx==10)
    p(iter,1) = 0;
  else
    p(iter,1) = idx;
  endif
endfor

% =========================================================================

end

function [Zw, T] = whitenRows(Z)
%WHITENROWS Returns the whitened (identity covariance) version of the input data
%
% Syntax:       [Zw, T] = whitenRows(Z);
%               
% Inputs:       Z is an (d x n) matrix containing n samples of a
%               d-dimensional random vector
%               
% Outputs:      Zw is the whitened version of Z
%               
%               T is the (d x d) whitening transformation of Z
%               
% Description:  Returns the whitened (identity covariance) version of the
%               input data
%               
% Notes:        (a) Must have n >= d to fully whitenRows Z
%               
%               (b) Z = T \ Zcw
%               
% Author:       Brian Moore
%               brimoor@umich.edu
%               
% Date:         November 1, 2016
%
% Update:       2022-10-22 Added to +transform package/namespace Max Murphy

% Compute sample covariance
R = cov(Z');

% Whiten data
[U, S, ~] = svd(R,'econ');
T  = U * diag(1 ./ sqrt(diag(S))) * U';
Zw = T * Z;

end
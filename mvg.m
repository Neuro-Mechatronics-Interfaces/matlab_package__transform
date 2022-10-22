function Z = mvg(MU,SIGMA,n)
%MVG Generates n samples from a d-dimensional multivariate Gaussian (MVG) random variable with mean vector MU and covariance matrix SIGMA
%
% Syntax:       Z = mvg(MU,SIGMA);
%               Z = mvg(MU,SIGMA,n);
%               
% Inputs:       MU is the desired (d x 1) mean vector
%               
%               SIGMA is the desired (d x d) covariance matrix
%               
%               [OPTIONAL] n is the desired number of samples. The default
%               value is n = 1
%               
% Outputs:      Z is a (d x n) matrix containing n multivariate Gaussian 
%               samples
%               
% Description:  Generates n samples from a d-dimensional multivariate
%               Gaussian (MVG) random variable with mean vector MU and
%               covariance matrix SIGMA
%               
% Notes:        (a) mean(Z,2) ~ MU
%               (b) cov(Z') ~ SIGMA
%               
% Author:       Brian Moore
%               brimoor@umich.edu
%               
% Date:         November 1, 2016
%
% Update:       Added to +transform package/namespace 2022-10-22 Max Murphy

% Parse inputs
if ~exist('n','var') || isempty(n)
    % Default # samples
    n = 1;
end

% Generate samples
d = size(SIGMA,1);
L = chol(SIGMA,'lower');
Z = bsxfun(@plus,MU,L * randn(d,n));

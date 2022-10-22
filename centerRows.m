function [Zc, mu] = centerRows(Z)
%CENTERROWS Returns the centered (zero mean) version of the input data
%
% Syntax:       [Zc, mu] = transform.centerRows(Z);
%               
% Inputs:       Z is an (d x n) matrix containing n samples of a
%               d-dimensional random vector
%               
% Outputs:      Zc is the centered version of Z
%               
%               mu is the (d x 1) sample mean of Z
%               
% Description:  Returns the centered (zero mean) version of the input data
%               
% Note:         Z = Zc + repmat(mu,1,n)
%               
% Author:       Brian Moore
%               brimoor@umich.edu
%               
% Date:         November 1, 2016
%
% Update:       Put into +transform namespace by Max Murphy on 2022-10-22

% Compute sample mean
mu = mean(Z,2);

% Subtract mean
Zc = bsxfun(@minus,Z,mu);

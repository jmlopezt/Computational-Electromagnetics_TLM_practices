function [ vc_ref ] = nodoFinal( vmas, vc_inc, z0, zc)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

% Para seguir con la nomnclatura del nodo mitad
% vmas seria v_left_inc
% vc_inc sería v_right_inc

gammama_source = (2.0*zc)/(z0+zc);
gamma_inc = (z0-zc)/(z0+zc);

vc_ref = gammama_source*vmas+gamma_inc*vc_inc;



end


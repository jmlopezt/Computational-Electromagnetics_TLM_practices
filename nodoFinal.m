function [ vc_ref ] = nodoFinal( vmas, vc_inc, z0, zc)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

% Para seguir con la nomnclatura del nodo mitad
% vmas seria v_left_inc
% vc_inc sería v_right_inc

gammama_source = (2.0*zc)/(z0+zc);
gamma_inc = (z0-zc)/(z0+zc);

vc_ref(k) = gammama_source*vmas(k)+gamma_inc*vc_inc(k);
%v_menos(k) = vc_inc(k)+vcref(k)-vmas(k);
% vcinc(k+1) = vcref(k); esto se haría fuera del bucle


end


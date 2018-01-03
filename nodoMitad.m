function [ vLeft_m_ref,vRight_m_ref ] = nodoMitad( vLeft_m_inc, vRight_m_inc, z0 )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here


%Lossless line
Zm=z0;
Zm_pre=Zm;

gamma_left = ((Zm-Zm_pre)/(Zm+Zm_pre));
gamma_right = ((2*Zm_pre)/(Zm+Zm_pre));

vLeft_m_ref = gamma_left*vLeft_m_inc + gamma_right*vRight_m_inc;
vRight_m_ref = gamma_right*vLeft_m_inc - gamma_left*vRight_m_inc;

end


function [ vLeft_m_ref,vRight_m_ref ] = nodoMitad( v_Left_m_inc, v_Right_m_inc, z0 )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here


%Lossless line
Zm=z0;
Zm_pre=Zm;

gamma_left = ((Zm-Zm_pre)/(Zm+Zm_pre));
gamma_right = ((2*Zm_pre)/(Zm+Zm_pre));

vLeft_m_ref = gamma_left*v_Left_m_inc + gamma_right*v_Right_m_inc;
vRight_m_ref = gamma_right*v_Left_m_inc - gamma_left*v_Right_m_inc;

end


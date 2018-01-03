function [ v_Right_ref ] = nodoInicial( v_Right_inc, vSource, vBobina, z0, r, z_bobina)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
z_linea = z0;
gamma1 = z_linea / (z_linea + r + z_bobina);
%gamma2 = 2*z_linea / (z1 + r+ z_bobina); % 2*gamma1
gamma3 = (r + z_bobina - z_linea ) / (z_linea +r + z_bobina);

v_Right_ref = gamma1*vSource + 2*gamma1*vBobina + gamma3*v_Right_inc;
end


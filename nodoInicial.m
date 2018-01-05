function [ v_Right_ini_ref ] = nodoInicial( v_Right_ini_inc, vSource, vBobina, z0, z_source)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

%z_source = r + z_Bobina;

z_linea = z0;
gamma1 = z_linea / (z_linea + z_source);
%gamma2 = 2*z_linea / (z1 + z_source); % 2*gamma1
gamma3 = (z_source - z_linea ) / (z_linea + z_source);

v_Right_ini_ref = gamma1*vSource + 2*gamma1*vBobina + gamma3*v_Right_ini_inc;
end


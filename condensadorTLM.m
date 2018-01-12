%% Análisis de Transitorios en una Línea de Transmisión (LT)
% * Análisis teórico y numérico (TLM) de transitorios en líneas con cargas capacitivas.
%
%
%% Análisis Numérico (TLM): transitorio en una LT con carga capacitiva con 3 nodos
% En este apartado se muestra la solución numérica.
%
% Inicializamos variables
clear all; close all; clc;

z0 = 75;                          % impedancia caracteristica de la linea (ohmios)
zl = 20.0e-6;                      % impedancia de carga 1nF
deltat = 1.0e-9;                  % incremento temporal utilizado en la solución numérica
timefinal = 300.0e-9;             % instante temporal final del calculo
zc = (2.0*zl)/deltat;             % impedancia equivalente del condensador
ntemp = int16(timefinal/deltat);  % número de instantes temporales para el calculo

% continue ...

r = 50;                           % Resistencia de la fuente
L = 1.0e-9;                       % Impedandia de la bobina
z_Bobina = deltat/(2.0*L);        % impedancia equivalente de la bobina
z_source = r + z_Bobina;          % Impedancia equivalente de la fuente

tau1=5.0e-9;
tau2=10.0e-9;
v0=4.0;
t=0:deltat:timefinal;

vSource=4.0*v0*(-exp(-t/tau1)+exp(-t/tau2));
vBobina=4.0*v0*(-exp(-t/tau1)+exp(-t/tau2)); % esto hay que calcularlo bien, esta copiado por motivos de test


v_Right_ini_ref = zeros(1,ntemp+1);
v_Right_ini_inc = zeros(1,ntemp+1);
v_Left_m_ref = zeros(1,ntemp+1);
v_Right_m_ref = zeros(1,ntemp+1);
v_Left_m_inc = zeros(1,ntemp+1);
v_Right_m_inc = zeros(1,ntemp+1);
vc_ref = zeros(1,ntemp+1);
vmas = zeros(1,ntemp+1);
vc_inc = zeros(1,ntemp+1);

for k=1:ntemp+1
    
    v_Right_ini_ref(1,k) = nodoInicial(v_Right_ini_inc(1,k), vSource(1,k), vBobina(1,k), z0, z_source);
    [ v_Left_m_ref(1,k), v_Right_m_ref(1,k) ] = nodoMitad( v_Left_m_inc(1,k), v_Right_m_inc(1,k), z0);
    vc_ref(1,k) = nodoFinal(vmas(1,k), vc_inc(1,k), z0, zc);
    
    v_Right_ini_inc(1,k+1) = v_Left_m_ref(1,k);
    v_Left_m_inc(1,k+1) = v_Right_ini_ref(1,k);
    v_Right_m_inc(1,k+1) = vc_inc(1,k);
    vmas(1,k+1) = v_Right_m_ref(1,k);
    vc_inc(1,k+1) = vc_ref(1,k);
    
end

%% Plot de voltajes incidentes

t=0:deltat:timefinal+deltat;
figure;
plot(1e9*t,vmas,'blue');
hold on
plot(1e9*t,vc_inc,'g');
plot(1e9*t, v_Right_ini_inc,'r');
plot(1e9*t,v_Left_m_inc,'k');
plot(1e9*t, v_Right_m_inc,'m');
xlabel('Tiempo (ns)'); ylabel('Tensión (V)')
%legend('V^+(t) ','V^-_{TLM}','V^-_{teor}(t)')
grid
title('Solución numérica (TLM), transitorio sobre carga capacitiva 1nF')

%% Plot de voltajes reflejados

t=0:deltat:timefinal;

figure;
plot(1e9*t,vSource,'blue');
hold on
plot(1e9*t,vc_ref,'g');
plot(1e9*t, v_Right_ini_ref,'r');
plot(1e9*t,v_Left_m_ref,'k');
plot(1e9*t, v_Right_m_ref,'m');
xlabel('Tiempo (ns)'); ylabel('Tensión (V)')
%legend('V^+(t) ','V^-_{TLM}','V^-_{teor}(t)')
grid
title('Solución numérica (TLM), transitorio sobre carga capacitiva 1nF')
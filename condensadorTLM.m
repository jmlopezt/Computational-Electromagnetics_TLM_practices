%% Análisis de Transitorios en una Línea de Transmisión (LT)
% * Análisis teórico y numérico (TLM) de transitorios en líneas con cargas capacitivas.
%  
% 
%% Análisis Numérico (TLM): transitorio en una LT con carga capacitiva con 3 nodos
% En este apartado se muestra la solución numérica. 
% 
z0=75;                          %impedancia caracteristica de la linea (ohmios)
zl=1.0e-9;                      %impedancia de carga 1nF
deltat=1.0e-9;                  %incremento temporal utilizado en la solución numérica
timefinal=300.0e-9;             %instante temporal final del calculo
zc=deltat/(2.0*zl);             %impedancia equivalente del condensador
ntemp=int16(timefinal/deltat);  % numero de instantes temporales para el calculo


% continue ...
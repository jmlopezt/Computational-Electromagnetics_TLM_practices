%% An�lisis de Transitorios en una L�nea de Transmisi�n (LT)
% * An�lisis te�rico y num�rico (TLM) de transitorios en l�neas con cargas capacitivas.
%  
% 
%% An�lisis Num�rico (TLM): transitorio en una LT con carga capacitiva con 3 nodos
% En este apartado se muestra la soluci�n num�rica. 
% 
z0=75;                          %impedancia caracteristica de la linea (ohmios)
zl=1.0e-9;                      %impedancia de carga 1nF
deltat=1.0e-9;                  %incremento temporal utilizado en la soluci�n num�rica
timefinal=300.0e-9;             %instante temporal final del calculo
zc=deltat/(2.0*zl);             %impedancia equivalente del condensador
ntemp=int16(timefinal/deltat);  % numero de instantes temporales para el calculo


% continue ...
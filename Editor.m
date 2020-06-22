%******************************************************************
%                           ARMADURAS                             ;
%                Elaborado por: Oswaldo Russian                   ; 
%*****************************************************************;

clear all
clc
AddPath

%%

Coord=[300,600;300,0;800,0;0,600;0,0];
Conectividad=[5,2,35,2100000;5,4,35,2100000;2,1,35,2100000;4,1,35,2100000;4,2,25,2100000;5,1,25,2100000;2,3,30,2100000;1,3,30,2100000];
Restricciones=[3,2,0;4,1,0;5,1,0;5,2,0];

NumNodos=size(Coord,1);
Nele=size(Conectividad,1);
nodos_por_ele=2;
gdl_por_nodo=2;
NRest=size(Restricciones,1);

%=========================================;
%     Llamando Matriz_Identificacion.m    ;
%=========================================;

[GlobalID,NIncog]=Matriz_Identificacion(Restricciones,gdl_por_nodo,NRest,NumNodos);


%======================================;
% Llamando Calcular_Matriz_Global.m    ;
%======================================;

[kdd,kdr,krd,krr,Fd,Fr]=Calcular_Matriz_Global(Conectividad,Coord,NIncog,NRest,Nele,GlobalID,gdl_por_nodo,nodos_por_ele);


%==========================================;
%            Llamando Operador.m           ;
%==========================================;

[Q,R,qd,qr]=Operador(Restricciones,gdl_por_nodo,NRest,NumNodos,Conectividad,Coord,Nele,nodos_por_ele)

Matriz_Fuerzas_Int(nodos_por_ele,gdl_por_nodo,GlobalID,Nele,Conectividad,qr,qd,Coord)
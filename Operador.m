function[Q,R,qd,qr]=Operador(Restricciones,gdl_por_nodo,NRest,NumNodos,Conectividad,Coord,Nele,nodos_por_ele)

%===============================================;
%        Llamando Matriz_Identificacion.m       ;
%===============================================;

[GlobalID,NIncog]=Matriz_Identificacion(Restricciones,gdl_por_nodo,NRest,NumNodos);

%================================================;
%        Llamando ObtenerRestricciones.m         ;
%================================================;

[qr]=ObtenerRestricciones(Restricciones,GlobalID,NRest);

%=======================================;
%   Llamando Calcular_Matriz_Global.m   ;
%=======================================;

[kdd,kdr,krd,krr,Fd,Fr]=Calcular_Matriz_Global(Conectividad,Coord,NIncog,NRest,Nele,GlobalID,gdl_por_nodo,nodos_por_ele);

for i=1:NumNodos
    xcoord=Coord(i,1);
    ycoord=Coord(i,2);
    if xcoord==300 && ycoord==600
        numero_nodo=i;
        gdl_X=GlobalID(numero_nodo,1);
        gdl_Y=GlobalID(numero_nodo,2);
        Fd(gdl_X)=Fd(gdl_X)+6000;
        Fd(gdl_Y)=Fd(gdl_Y)-12000;
    else
        continue;
    end
end

for i=1:NumNodos
    xcoord=Coord(i,1);
    ycoord=Coord(i,2);
    if xcoord==300 && ycoord==0
        numero_nodo=i;
        gdl_Y=GlobalID(numero_nodo,2);
        Fd(gdl_Y)=Fd(gdl_Y)-30000;
    else
        continue;
    end
end
for i=1:NumNodos
    xcoord=Coord(i,1);
    ycoord=Coord(i,2);
    if xcoord==800 && ycoord==0
        numero_nodo=i;
        gdl_X=GlobalID(numero_nodo,1);
        Fd(gdl_X)=Fd(gdl_X)+18000;
    else
        continue;
    end
end

%======================================;
%         Resolver para qd             ;
%======================================;

qd=kdd\(Fd-kdr*qr);

Fr=krd*qd+krr*qr;

%========================================================;
%  Llamando Procesado.m para Construir Q desde qr y qd   ;
%========================================================;

[Q,R,qd,qr]=Procesado(gdl_por_nodo,GlobalID,NumNodos,qd,qr,Fd,Fr);
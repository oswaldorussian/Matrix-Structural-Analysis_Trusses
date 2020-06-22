function[kdd,kdr,krd,krr,Fd,Fr]=Calcular_Matriz_Global(Conectividad,Coord,NIncog,NRest,Nele,GlobalID,gdl_por_nodo,nodos_por_ele)

%======================================;
%           Inicializando              ;
%======================================;

    kdd=zeros(NIncog,NIncog);
    kdr=zeros(NIncog,NRest);
    krd=zeros(NRest,NIncog);
    krr=zeros(NRest,NRest);
    Fd=zeros(NIncog,1);
    Fr=zeros(NRest,1);
    
%=================================================================;
% Construccion de los componentes de la Matriz de rigidez Global  ;
%=================================================================;    
for ele=1:Nele
    NodosEle(1)=Conectividad(ele,1)';
    NodosEle(2)=Conectividad(ele,2)';
    xcap=Coord(NodosEle,:);
    A=Conectividad(ele,3);
    E=Conectividad(ele,4);
    [klocal,flocal]=Calcular_Matriz_Local(nodos_por_ele,gdl_por_nodo,xcap,A,E);
    
%===============================================================;
% Llamando Ensamblaje.m para sumar cada klocal  (flocal)        ;
%===============================================================;
    
    [kdd,kdr,krd,krr,Fd,Fr]=Ensamblaje(gdl_por_nodo,NodosEle,GlobalID,klocal,flocal,kdd,kdr,krd,krr,Fd,Fr);
   
end
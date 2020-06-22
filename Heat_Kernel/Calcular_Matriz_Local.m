function[klocal,flocal]=Calcular_Matriz_Local(nodos_por_ele,gdl_por_nodo,xcap,A,E)

%=============================================;
%  Calculando gdl de elementos (gdl_por_ele   ;
%=============================================;

elegdl=nodos_por_ele*gdl_por_nodo;

%======================================;
%            Inicializando             ;
%======================================;

klocal=zeros(elegdl,elegdl);
flocal=zeros(elegdl,1);
L=sqrt((xcap(1,1)-xcap(2,1))^2+(xcap(1,2)-xcap(2,2))^2);
cos_alfa=(xcap(2,1)-xcap(1,1))/L;
sen_alfa=(xcap(2,2)-xcap(1,2))/L;
klocal=((A*E)/L)*[cos_alfa^2,cos_alfa*sen_alfa,-cos_alfa^2,-cos_alfa*sen_alfa;cos_alfa*sen_alfa,sen_alfa^2,-cos_alfa*sen_alfa,-sen_alfa^2;-cos_alfa^2,-cos_alfa*sen_alfa,cos_alfa^2,cos_alfa*sen_alfa;-cos_alfa*sen_alfa,-sen_alfa^2,cos_alfa*sen_alfa,sen_alfa^2];

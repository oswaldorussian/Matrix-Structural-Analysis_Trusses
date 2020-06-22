function[GlobalID,NIncog]=Matriz_Identificacion(Restricciones,gdl_por_nodo,NRest,NumNodos)

%====================================================================;
%Chequear que Restricciones, NRest y NumNodos son validos/compatibles;
%====================================================================;

if size(Restricciones,1)==NRest
        
        %Initialization
        GlobalID=zeros(NumNodos,gdl_por_nodo);
        
        %====================================================================;
        %                   Numerando los nodos restringidos                 ;
        %====================================================================;
        
        for i=1:NRest
            GlobalID(Restricciones(i,1),Restricciones(i,2))=-i;
        end
        
        %Initialization
        NIncog=0;
        
        %====================================================================;
        %                 Numerando los nodos no restringidos                ;
        %====================================================================;
        
        for i=1:NumNodos
            for j=1:gdl_por_nodo
                if GlobalID(i,j)==0
                    NIncog=NIncog+1;
                    GlobalID(i,j)=NIncog;
                end
            end
        end
else
    error('Error en Matriz_Identificacion.m. Numero de filas de la Matriz de Restricciones debe ser igual a NRest')
end
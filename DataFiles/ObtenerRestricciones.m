function[qd]=ObtenerRestricciones(Restricciones,GlobalID,NRest)

%======================================;
%           Inicializando              ;
%======================================;

qd=zeros(NRest,1);

%======================================;
%  Repitiendo sobre Restricciones      ;
%======================================;

for i=1:NRest
    nodo=Restricciones(i,1);
    gdl=Restricciones(i,2);
    
%=========================================================================;
%              Si el gdl es positivo, el valor no pertenece a qd          ;
%=========================================================================; 
    
    if GlobalID(nodo,gdl)>0
        error('Input esta errado')             
    end
    
%========================================================================================;
% Si gdl es negativo, buscar valor correspondiente en restricciones para almacenar en qd ;
%========================================================================================; 
    
    qd(abs(GlobalID(nodo,gdl)))=Restricciones(i,3);
end
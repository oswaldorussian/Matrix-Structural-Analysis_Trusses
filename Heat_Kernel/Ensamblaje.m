function[kdd,kdr,krd,krr,Fd,Fr]=Ensamblaje(gdl_por_nodo,NodosEle,GlobalID,klocal,flocal,kdd,kdr,krd,krr,Fd,Fr)

%======================================;
%  Obtener nodos_por_ele de NodosEle   ;
%======================================;

nodos_por_ele=length(NodosEle);

%======================================;
%      Inicializando v_vector          ;
%======================================;

%%%Nota: v_vector contiene el numero de cada gdl/restriccion de un elemento;

v_vector=zeros(nodos_por_ele*gdl_por_nodo,1);

for nodo=1:nodos_por_ele
    for gdl=1:gdl_por_nodo
        
        %========================================================;
        % Asignar a cada componente del v_vector el gdl apropiado;
        %========================================================;
        
        v_vector((nodo-1)*gdl_por_nodo+gdl,1)=GlobalID(NodosEle(nodo),gdl);
    end
end

%==================================================;
%    Chequear donde almacenar cada contribucion    ;
%==================================================;

for fila=1:length(v_vector)
    fila_loc=v_vector(fila);
    if fila_loc>0
        Fd(fila_loc)=Fd(fila_loc)+flocal(fila);
    else
        Fr(abs(fila_loc))=Fr(abs(fila_loc))+flocal(fila);
    end
    for col=1:length(v_vector)
        col_loc=v_vector(col);
%==================================================;
%              Asignar en Fd y kdd                 ;
%==================================================;
    if fila_loc>0
            if col_loc>0
                kdd(fila_loc,col_loc)=kdd(fila_loc,col_loc)+klocal(fila,col);
            else
%==================================================;
%                Asignar en kdr                    ;
%==================================================;
                kdr(fila_loc,abs(col_loc))=kdr(fila_loc,abs(col_loc))+klocal(fila,col);
            end
    else
            if col_loc<0
              
%==================================================;
%                Asignar en krr                    ;
%==================================================;
                
                krr(abs(fila_loc),abs(col_loc))=krr(abs(fila_loc),abs(col_loc))+klocal(fila,col);
            end
    end
    end
end

krd=kdr';
        
function[Q,R,qd,qr]=Procesado(gdl_por_nodo,GlobalID,NumNodos,qd,qr,Fd,Fr)

%======================================;
%           Inicializando              ;
%======================================;

Q=zeros(NumNodos,gdl_por_nodo);
R=zeros(NumNodos,gdl_por_nodo);

%======================================;
%            Ensamblando Q             ;
%======================================;

for node=1:NumNodos
    for dof=1:gdl_por_nodo
        loc=GlobalID(node,dof);
        if loc<0
            Q(node,dof)=qr(abs(loc));
            R(node,dof)=Fr(abs(loc));
        else
            Q(node,dof)=qd(loc);
            R(node,dof)=Fd(loc);
        end
    end
end

function[]=Matriz_Fuerzas_Int(nodos_por_ele,gdl_por_nodo,GlobalID,Nele,Conectividad,qr,qd,Coord)

%==============================================;
%   Calculando gdl por elemento (gdl_por_nodo) ;
%==============================================;

elegdl=nodos_por_ele*gdl_por_nodo;

for ele=1:Nele
    NodosEle(1)=Conectividad(ele,1)';
    gdl_ID_1=GlobalID(NodosEle(1),1);
    gdl_ID_2=GlobalID(NodosEle(1),2);
    NodosEle(2)=Conectividad(ele,2)';
    gdl_ID_3=GlobalID(NodosEle(2),1);
    gdl_ID_4=GlobalID(NodosEle(2),2);
    
    if gdl_ID_1<0
        q(1)=qr(abs(gdl_ID_1));
    else
        q(1)=qd(gdl_ID_1);
    end
        if gdl_ID_2<0
        q(2)=qr(abs(gdl_ID_2));
    else
        q(2)=qd(gdl_ID_2);
        end
        if gdl_ID_3<0
        q(3)=qr(abs(gdl_ID_3));
    else
        q(3)=qd(gdl_ID_3);
        end
        if gdl_ID_4<0
        q(4)=qr(abs(gdl_ID_4));
    else
        q(4)=qd(gdl_ID_4);
        end
    
    xcap=Coord(NodosEle,:);
    A=Conectividad(ele,3);
    E=Conectividad(ele,4);

%======================================;
%            Inicializando             ;
%======================================;

    klocal=zeros(elegdl,elegdl);
    flocal=zeros(elegdl,1);
    L=sqrt((xcap(1,1)-xcap(2,1))^2+(xcap(1,2)-xcap(2,2))^2);
    cos_alfa=(xcap(2,1)-xcap(1,1))/L;
    sen_alfa=(xcap(2,2)-xcap(1,2))/L;
    T=[cos_alfa,sen_alfa,0,0;-sen_alfa,cos_alfa,0,0;0,0,cos_alfa,sen_alfa;0,0,-sen_alfa,cos_alfa];
    d=T*q';
    klocal=((A*E)/L)*[1,0,-1,0;0,0,0,0;-1,0,1,0;0,0,0,0];
    f=klocal*d
end
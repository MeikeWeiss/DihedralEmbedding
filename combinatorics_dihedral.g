# Computes the vertices of faces of the ring for even n
Ring_vof:=function(n)
    local F1, F2, perm1, perm2, i, G, o;
    F1:=[1,2,n+2];
    F2:=[1,n+1,n+2];

    perm1:=[];
    perm2:=[];
    for i in [1..n-1] do
        if IsOddInt(i) then
            perm1:=Concatenation(perm1,[i,n+i+1]);
        else
            perm2:=Concatenation(perm2,[i,n+i+1]);
        fi;
    od;
    perm2:=Concatenation(perm2,[n,n+1]);

    G:=Group(CycleFromList(perm1)*CycleFromList(perm2));
    o:=Orbits(G,[F1,F2],OnTuples);
    return Concatenation(o[1],o[2]);
end;

# Computes the vertices of faces of T_n for even n
Tn_vof:=function(n)
    local v, w, list1, list2, i;
    v:=2*n+1;
    w:=2*n+2;

    list1:=[];
    list2:=[];

    for i in [1..n-1] do 
        Add(list1,[i,i+1,v]);
        Add(list2,[i+n,i+n+1,w]);
    od;
    Add(list1,[1,n,v]);
    Add(list2,[n+1,2*n,w]);

    return Concatenation(Ring_vof(n),Concatenation(list1,list2));
end;

s:=PolygonalComplexByVerticesInFaces(Tn_vof(8));
co8_3 := [[-Sqrt(2.), 0., 1.], [-Sqrt(2.)/2, Sqrt(2.)/2, 1.], [0., Sqrt(2.), 1.], [Sqrt(2.)/2, Sqrt(2.)/2, 1.], [Sqrt(2.), 0., 1.], [Sqrt(2.)/2, -Sqrt(2.)/2, 1.], [0., -Sqrt(2.), 1.], [-Sqrt(2.)/2, -Sqrt(2.)/2, 1.], [1., 0., 0.], [1., -1., 0.], [0., -1., 0.], [-1., -1., 0.], [-1., 0., 0.], [-1., 1., 0.], [0., 1., 0.], [1., 1., 0.], [0., 0., Sqrt(3. + 2*Sqrt(2.)) + 1.], [0., 0., -Sqrt(3. + 2*Sqrt(2.))]];
co8_1 := [[Sqrt(2.), 0., 1.], [Sqrt(2.)/2, Sqrt(2.)/2, 1.], [0., Sqrt(2.), 1.], [-Sqrt(2.)/2, Sqrt(2.)/2, 1.], [-Sqrt(2.), 0., 1.], [-Sqrt(2.)/2, -Sqrt(2.)/2, 1.], [0., -Sqrt(2.), 1.], [Sqrt(2.)/2, -Sqrt(2.)/2, 1.], [1., 0., 0.], [1., 1., 0.], [0., 1., 0.], [-1., 1., 0.], [-1., 0., 0.], [-1., -1., 0.], [0., -1., 0.], [1., -1., 0.], [0., 0., Sqrt(3 - 2*Sqrt(2.)) + 1], [0., 0., -Sqrt(3 - 2*Sqrt(2.))]];

pr:=SetVertexCoordinates3D(s,co8_3,rec());
DrawComplexToJavaScript(s,"D8_3",pr);
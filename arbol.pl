madre(alma,pepa).
madre(alma,bruno).
madre(alma,julieta).
madre(pepa,camilo).
madre(pepa,antonio).
madre(pepa,dolores).
madre(julieta,isabela).
madre(julieta,luisa).
madre(julieta,maribel).
madre(alvarine,jaqueline).
madre(yuma,abe).
madre(jaqueline,marge).
madre(jaqueline,patty).
madre(jaqueline,selma).
madre(mona,homero).
madre(marge,lisa).
madre(marge,bart).
madre(marge,maggie).
madre(patty,ling).
madre(selma,ling).

padre(pedro,pepa).
padre(pedro,bruno).
padre(pedro,julieta).
padre(felix,camilo).
padre(felix,antonio).
padre(felix,dolores).
padre(agustin,isabela).
padre(agustin,luisa).
padre(agustin,maribel).
padre(ferdinand,jaqueline).
padre(orville,abe).
padre(abe,homero).
padre(clancy,marge).
padre(clancy,patty).
padre(clancy,selma).
padre(homero,lisa).
padre(homero,bart).
padre(homero,maggie).

%personajes encanto
hombre(pedro).
hombre(felix).
hombre(bruno).
hombre(agustin).
hombre(antonio).
hombre(camilo).
hombre(ferdinand).
hombre(orville).
hombre(abe).
hombre(clancy).
hombre(homero).
hombre(antonio).
hombre(camilo).
hombre(ferdinand).
hombre(bart).

mujer(alma).
mujer(pepa).
mujer(julieta).
mujer(dolores).
mujer(isabela).
mujer(luisa).
mujer(maribel).
mujer(alvarine).
mujer(yuma).
mujer(jaqueline).
mujer(mona).
mujer(marge).
mujer(patty).
mujer(selma).
mujer(lisa).
mujer(maggie).
mujer(ling).

pareja(X,Y):-(padre(X,Z),madre(Y,Z));(padre(Y,Z),madre(X,Z)).

%reglas
hijos(X,Y):-(madre(Y,X);padre(Y,X)).
hijo(X,Y):-(madre(Y,X);padre(Y,X)),hombre(X).
hija(X,Y):-(madre(Y,X);padre(Y,X)),mujer(X).

hermanos(X,Y):-(hijos(X,Z),hijos(Y,Z)), not(X==Y).
hermano(X,Y):-hombre(X),hermanos(X,Y).
hermana(X,Y):-mujer(X),hermanos(X,Y).


esposo(X,Y):-pareja(X,Y),hombre(X).
esposa(X,Y):-pareja(X,Y),mujer(X).

suegro(X,Y):-padre(X,Z),pareja(Y,Z).
suegra(X,Y):-madre(X,Z),pareja(Y,Z).

yerno(X,Y):-suegro(Y,X);suegra(Y,X),hombre(X).
nuera(X,Y):-suegro(Y,X);suegra(Y,X),mujer(X).


cunados(X,Y):-pareja(X,Z),hermanos(Z,Y).
cunado(X,Y):-cunados(X,Y),hombre(X).
cunada(X,Y):-cunados(Y,X),mujer(X).

abuelo(X,Y):-hijos(Y,Z),(madre(X,Z);padre(X,Z)).
abuela(X,Y):-hijos(Y,Z),(madre(X,Z);padre(X,Z)).

nieto(X,Y):-hijos(Y,Z),hijos(Z,X),hombre(X).
nieta(X,Y):-hijos(Y,Z),hijos(Z,X),mujer(X).

tio(X,Y):-hijos(Z,Y),(hermano(X,Z);cunado(X,Z)).
tia(X,Y):-hijos(Z,Y),(hermana(X,Z);cunada(X,Z)).

primo(X,Y):-hijos(Z,X),hijo(W,Y),hermanos(Z,W),hombre(X).
prima(X,Y):-hijos(Z,X),hijos(W,Y),hermanos(Z,W),mujer(X).

bisabuelo(X,Y):-abuelo(X,Z),(madre(Z,Y);padre(Z,Y)).
bisabuela(X,Y):-abuela(X,Z),(madre(Z,Y);padre(Z,Y)).

bisnieto(X,Y):-(bisabuelo(Y,X);bisabuela(Y,X)),hombre(X).
bisnieta(X,Y):-(bisabuelo(Y,X);bisabuela(Y,X)),mujer(X).

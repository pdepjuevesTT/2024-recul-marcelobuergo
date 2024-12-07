% Solución en Prolog

viveEn(juan, casa).
viveEn(nico, depto).
viveEn(alf, depto).
viveEn(julian, loft).
viveEn(vale, depto).
viveEn(fer, casa).
viveEn(rocio, casa).

ubicadoEn(alf, almagro).
ubicadoEn(juan, almagro).
ubicadoEn(nico, almagro).
ubicadoEn(julian, almagro).
ubicadoEn(vale, flores).
ubicadoEn(fer, flores).

ocupaMetrosCuadrados(juan, 120).
ocupaMetrosCuadrados(fer, 110).
ocupaMetrosCuadrados(rocio, 90).

tieneAmbientes(nico, 3).
tieneAmbientes(alf, 3).
tieneAmbientes(vale, 4).

tieneBanios(nico, 2).
tieneBanios(alf, 1).
tieneBanios(vale, 1).

construidoEn(julian, 2000).


barrioCopado(Barrio):-
    forall((ubicadoEn(Persona, Barrio), viveEn(Persona, Tipo)), viveEnCopado(Persona, Tipo)).

viveEnCopado(Persona, casa):-
    ocupaMetrosCuadrados(Persona, Cantidad),
    Cantidad > 100.

viveEnCopado(Persona, depto):-
    tieneAmbientes(Persona, Cantidad),
    Cantidad > 3.
    
viveEnCopado(Persona, depto):-
    tieneBanios(Persona, Cantidad),
    Cantidad > 1.

viveEnCopado(Persona, loft):-
    construidoEn(Persona, Anio),
    Anio > 2015.

barrioCaro(Barrio):-    
    forall((ubicadoEn(Persona, Barrio), viveEn(Persona, Tipo)), not(viveBarato(Persona, Tipo))).

viveBarato(Persona, loft):-
    construidoEn(Persona, Anio),
    Anio < 2005.

viveBarato(Persona, casa):-
    ocupaMetrosCuadrados(Persona, Cantidad),
    Cantidad < 90.

viveBarato(Persona, depto):-
    tieneAmbientes(Persona, Cantidad),
    Cantidad >= 1,
    Cantidad < 3.

suCasaVale(juan, 150000).
suCasaVale(nico, 80000).
suCasaVale(alf, 75000). 
suCasaVale(julian, 140000).
suCasaVale(vale, 95000).
suCasaVale(fer, 60000).

saberQueComprar(Persona, Plata):-
    suCasaVale(Persona, Valor),
    Plata >= Valor,
    Plata is Plata - Valor,
    saberQueComprar(Persona, Plata).
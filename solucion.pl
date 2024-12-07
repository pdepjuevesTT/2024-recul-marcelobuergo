% Solución en Prolog

% viveEn(Persona, Propiedad) %
/*viveEn(juan, casajuan).
viveEn(nico, deptonico).
viveEn(alf, deptoalf).
viveEn(julian, loftjulian).
viveEn(vale, deptovale).
viveEn(fer, casafer).
viveEn(rocio, casarocio).

%esUn(Propiedad, Tipo)%
ocupaMetrosCuadrados(casajuan, 120).
ocupaMetrosCuadrados(casafer, 110).
ocupaMetrosCuadrados(casarocio, 90).

tieneAmbientes(deptonico, 3).
tieneAmbientes(deptoalf, 3).
tieneAmbientes(deptovale, 4).

tieneBanios(deptonico, 2).

tieneBanios(deptoalf, 1).
tieneBanios(deptovale, 1).

construidoEn(loftjulian, 2000).
*/

%situadaEn(Barrio, Propiedad)%
%situadaEn()
%
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
/*
esUn(casajuan, casa).
esUn(deptonico, depto).
esUn(deptoalf, depto).
esUn(loftjulian, loft).
esUn(deptovale, depto).
esUn(casafer, casa).
esUn(casarocio, casa).*/
/*
barrioCopado(Barrio):-
    forall((ubicadoEn(Persona, Barrio), esUn(Propiedad, Tipo),localidad(Propiedad, Barrio)), esCopada(Propiedad, Tipo)).
*/

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
    Fecha = 2015.

barrioCaro(Barrio):-    
%    forall((ubicadoEn(Persona, Barrio), localidad(Propiedad, Barrio)), not(esBarata(Propiedad))).
    forall((ubicadoEn(Persona, Barrio), viveEn(Persona, Tipo)), not(viveBarato(Persona, Tipo))).

viveBarato(Persona, loft):-
    construidoEn(Persona, Anio),
    Anio < 2005.

viveBarato(Persona, casa):-
    ocupaMetrosCuadrados(Persona, Cantidad),
    Cantidad < 90.

viveBarato(Persona, depto):-
    tieneAmbientes(Persona, Cantidad),
    Cantidad > 0,
    Cantidad < 3.

suCasaVale(juan, 150000).
suCasaVale(nico, 80000).
suCasaVale(alf, 75000).
suCasaVale(julian, 140000).
suCasaVale(vale, 95000).
suCasaVale(fer, 60000).

saberQueComprar(Plata):-
    suCasaVale(_, Valor).
    Plata > Valor.
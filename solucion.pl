% Solución en Prolog
% viveEn(Persona, Propiedad) %
viveEn(juan, casajuan).
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


%situadaEn(Barrio, Propiedad)%
%situadaEn()
%
ubicadoEn(alf, almagro).
ubicadoEn(juan, almagro).
ubicadoEn(nico, almagro).
ubicadoEn(julian, almagro).
ubicadoEn(vale, flores).
ubicadoEn(fer, flores).
localidad(Propiedad, Barrio):-
    viveEn(Persona, Propiedad),
    ubicadoEn(Persona, Barrio).

barrioCopado(Barrio):-
    forall(ubicadoEn(Persona, Barrio), localidad(Propiedad, Barrio), esCopada(Propiedad)).




esCopada(Propiedad):-
            ocupaMetrosCuadrados(Propiedad, Cantidad),
        Cantidad > 100.

esCopada(Propiedad):-
    tieneAmbientes(Propiedad, Cantidad),  
    Cantidad > 3.
    
esCopada(Propiedad):-
    tieneBanios(Propiedad, Cantidad),
    Cantidad > 1.

esCopada(Propiedad):-
    construidoEn(Propiedad, Fecha),
    Fecha = 2015.


esBarata(Propiedad):-
    construidoEn(Propiedad, Anio),
    Anio < 2005.

esBarata(Propiedad):-
    ocupaMetrosCuadrados(Propiedad, Cantidad),
    Cantidad < 90.

esBarata(Propiedad):-
    tieneAmbientes(Propiedad, Cantidad),
    Cantidad > 0,
    Cantidad < 3.


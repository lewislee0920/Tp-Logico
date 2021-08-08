esCandidatoDelPartido(rojo, frank).
esCandidatoDelPartido(rojo, claire).
esCandidatoDelPartido(azul, garrett).
esCandidatoDelPartido(azul, linda).
esCandidatoDelPartido(amarillo, jackie).
esCandidatoDelPartido(rojo, catherine).
esCandidatoDelPartido(amarillo, seth).
esCandidatoDelPartido(amarillo, heather).

edad(frank, 50).
edad(claire, 52).
edad(garrett, 64).
edad(linda, 30).
edad(peter, 26).
edad(jackie, 38).
edad(catherine, 59).

nacioEn(1969, heather).

postulaEn(buenosAires, azul).
postulaEn(chaco, azul).
postulaEn(neuquen, azul).
postulaEn(tierraDelFuego, azul).
postulaEn(sanLuis, azul).
postulaEn(chaco, amarillo).
postulaEn(formosa, amarillo).
postulaEn(tucumán, amarillo).
postulaEn(salta, amarillo).
postulaEn(santaCruz, amarillo).
postulaEn(laPampa, amarillo).
postulaEn(corrientes, amarillo).
postulaEn(misiones, amarillo).
postulaEn(buenosAires, amarillo).
postulaEn(buenosAires, rojo).
postulaEn(sanLuis, rojo).
postulaEn(santaFe, rojo).
postulaEn(cordoba, rojo).
postulaEn(chubut, rojo).
postulaEn(tierraDelFuego, rojo).

cantidadDeHabitantes(buenosAires, 15355000).
cantidadDeHabitantes(chaco, 1143201).
cantidadDeHabitantes(tierraDelFuego, 160720).
cantidadDeHabitantes(sanLuis, 489255).
cantidadDeHabitantes(neuquen, 637913).
cantidadDeHabitantes(santaFe, 3397532).
cantidadDeHabitantes(cordoba, 3567654).

esPicante(Provincia):-
  postulaEn(Provincia, Partido1),
  postulaEn(Provincia, Partido2),
  Partido1 \= Partido2 ,
  cantidadDeHabitantes(Provincia, Habitantes),
  Habitantes > 1000000 .
  
intencionDeVotoEn(buenosAires, rojo, 40).
intencionDeVotoEn(buenosAires, azul, 30).
intencionDeVotoEn(buenosAires, amarillo, 30).
intencionDeVotoEn(chaco, rojo, 50).
intencionDeVotoEn(chaco, azul, 20).
intencionDeVotoEn(chaco, amarillo, 0).
intencionDeVotoEn(tierraDelFuego, rojo, 40).
intencionDeVotoEn(tierraDelFuego, azul, 20).
intencionDeVotoEn(tierraDelFuego, amarillo, 10).
intencionDeVotoEn(sanLuis, rojo, 50).
intencionDeVotoEn(sanLuis, azul, 20).
intencionDeVotoEn(sanLuis, amarillo, 0).
intencionDeVotoEn(neuquen, rojo, 80).
intencionDeVotoEn(neuquen, azul, 10).
intencionDeVotoEn(neuquen, amarillo, 0).
intencionDeVotoEn(santaFe, rojo, 20).
intencionDeVotoEn(santaFe, azul, 40).
intencionDeVotoEn(santaFe, amarillo, 40).
intencionDeVotoEn(cordoba, rojo, 10).
intencionDeVotoEn(cordoba, azul, 60).
intencionDeVotoEn(cordoba, amarillo, 20).
intencionDeVotoEn(chubut, rojo, 15).
intencionDeVotoEn(chubut, azul, 15).
intencionDeVotoEn(chubut, amarillo, 15).
intencionDeVotoEn(formosa, rojo, 0).
intencionDeVotoEn(formosa, azul, 0).
intencionDeVotoEn(formosa, amarillo, 0).
intencionDeVotoEn(tucuman, rojo, 40).
intencionDeVotoEn(tucuman, azul, 40).
intencionDeVotoEn(tucuman, amarillo, 20).
intencionDeVotoEn(salta, rojo, 30).
intencionDeVotoEn(salta, azul, 60).
intencionDeVotoEn(salta, amarillo, 10).
intencionDeVotoEn(santaCruz, rojo, 10).
intencionDeVotoEn(santaCruz, azul, 20).
intencionDeVotoEn(santaCruz, amarillo, 30).
intencionDeVotoEn(laPampa, rojo, 25).
intencionDeVotoEn(laPampa, azul, 25).
intencionDeVotoEn(laPampa, amarillo, 40).
intencionDeVotoEn(corrientes, rojo, 30).
intencionDeVotoEn(corrientes, azul, 30).
intencionDeVotoEn(corrientes, amarillo, 10).
intencionDeVotoEn(misiones, rojo, 90).
intencionDeVotoEn(misiones, azul, 0).
intencionDeVotoEn(misiones, amarillo, 0).

leGana(Candidato1,Candidato2,Provincia):-
  compitenAmbos(Candidato1,Candidato2,Provincia),
  esCandidatoDelPartido(Partido1,Candidato1),
  esCandidatoDelPartido(Partido2,Candidato2),
  Partido1 \= Partido2,
  intencionDeVotoEn(Provincia,Partido1,Numero1),
  intencionDeVotoEn(Provincia,Partido2,Numero2),
  Numero1 > Numero2.
 
leGana(Candidato1,Candidato2,Provincia):-
  esCandidatoDelPartido(Partido1,Candidato1),
  esCandidatoDelPartido(Partido1,Candidato2),
  postulaEn(Provincia,Partido1).
 
leGana(Candidato1,Candidato2,Provincia):-
  compitenEn(Provincia,Candidato1),
  not(compitenEn(Provincia,Candidato2)).

compitenEn(Provincia,Candidato):-
  esCandidatoDelPartido(Partido,Candidato),
  postulaEn(Provincia, Partido).
 
compitenAmbos(Candidato1,Candidato2,Provincia):-
  compitenEn(Provincia,Candidato1),
  compitenEn(Provincia,Candidato2).
  
elGranCandidato(Candidato):-
  esCandidatoDelPartido(Partido, Candidato),
  forall(postulaEn(Provincia, Partido), leGana(Candidato, _, Provincia)),
  candidatoMasJoven(Partido, Candidato) .
  
candidatoMasJoven(Partido, Candidato):-
  esCandidatoDelPartido(Partido, Candidato),
  forall(esCandidatoDelPartido(Partido, Candidatos), esMasJovenQue(Candidatos, Candidato)) .
  
esMasJovenQue(Candidato1, Candidato2):-
  edad(Candidato2, Edad2),
  edad(Candidato1, Edad1),
  Edad2 =< Edad1 .  

ajusteConsultora(Partido, Provincia, VotoVerdadero):-
  ganabaEnVoto(Partido, Provincia),
  intencionDeVotoEn(Provincia, Partido, Votos),
  VotoVerdadero is Votos - 20 .
  
ajusteConsultora(Partido, Provincia, VotoVerdadero):-  
  not(ganabaEnVoto(Partido, Provincia)),
  intencionDeVotoEn(Provincia, Partido, Votos),
  VotoVerdadero is Votos + 5 .
  
ganabaEnVoto(Partido, Provincia):-
  intencionDeVotoEn(Provincia, Partido, Votos1),
  forall(intencionDeVotoEn(Provincia, _, Votos2), Votos1 >= Votos2) .
  
  
promete(amarillo, construir([edilicio(hospital, 100), edilicio(universidad, 1), edilicio(comidaria, 200)])).

promete(rojo, nuevosPuestosDeTrabajo(800000)).

promete(amarillo, nuevosPuestosDeTrabajo(10000)).

promete(azul,inflacion(2,4)).

promete(amarillo,inflacion(1,15)).

promete(rojo,inflacion(10,30)).

influenciaDePromesas(promete(_, inflacion(CotaInferior, CotaSuperior)), VariacionDeVoto):-
  promedioInflacion(inflacion(CotaInferior, CotaSuperior), Promedio),
  VariacionDeVoto is Promedio * (-1) .

influenciaDePromesas(promete(_,nuevosPuestosDeTrabajo(PuestosNuevos)), 3):-
  PuestosNuevos > 50000 .

influenciaDePromesas(promete(_,nuevosPuestosDeTrabajo(PuestosNuevos)), 0):-
  PuestosNuevos =< 50000 .

promedioInflacion(inflacion(CotaInferior, CotaSuperior), Promedio):-
  Promedio is (CotaInferior + CotaSuperior) / 2 .

promedioDeCrecimiento(Partido, SumatoriaDeCrecimiento):-
  findall(Cambios, influenciaDePromesas(promete(Partido, _), Cambios), ListaDelCambios),
  sumlist(ListaDelCambios, Suma),
  SumatoriaDeCrecimiento is Suma . 











  
  
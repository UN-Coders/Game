# RPG-Game _(Titulo por decidir)_

|Nombre|GitHub User|
|--------|-----------------|
| Sebastian Garnica | SGarnicaQ |
| David Esteban Avila | davilab |
| Harrison Pinto| HASPIMA |
| Diego Ruiz | daruiz31 |
| Nicolas Arias| R-WolfGang |


>## Introducción

>>### Problemática

Desarrollo de un programa que use programacion orientada objetos

>>### Marco teórico

A partir del uso de la funcion `noise()` de processing, se genera el terreno del mapa principal de manera aleatoria, en el cual el personaje puede moverse libremente y elegir a donde entrar, entre las 7 _dungeon_, la _tienda_, o la _dungeon del **boss final**_, esta ultima tiene un prerrequisito para poder acceder.

Dentro de las _dungeons_ se encuentran una serie de pasadizos estilo Laberinto donde podran aparecer _mobs/enemigos_ contra los cuales se debe enfrentar el personaje y a su ves _loot/items_, al final de cada _dungeon_ se encontrara un **boss** el cual dara una de las 7 _llaves_.

Al completar las 7 _dungeons_ y tener las 7 _llaves_ se podra entrar a la _dungeon del **boss final**_ para completar el juego.

Las batallas estan orientadas al estilo _estrategia por turnos_, en la cual a partir de las habilidades, stats e items que el personaje tenga, podra hacer una eleccion y atacar para acabar con su oponente antes de que ocurra lo contrario.

Los _sprites_ usados para los personajes se desarrollaron usando la pagina de [Universal LPC Spritesheet Character Generator](http://gaurav.munjal.us/Universal-LPC-Spritesheet-Character-Generator/).


>>### Antecedentes

<Aplicaciones similares, url's de los repos>

>## Objetivos

>>### General

>>>Desarrollar un juego tipo RPG con batallas de _estrategia por turnos_.

>>### Específicos

>>>Usar generacion aleatoria en el mapa principal.

>>>Permitir la seleccion del personaje.

>>>Guardado del mundo.

>>>Uso de una _AI_ decente para las batallas.

>## Requisitos

>>##### El lenguaje utilizado es Java a partir de Processing, no requiere el uso de ninguna libreria externa

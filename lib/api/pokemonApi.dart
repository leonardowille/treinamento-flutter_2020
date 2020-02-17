import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pokedex_app/enums/typesEnum.dart';
import 'package:pokedex_app/models/pokemon.dart';

class PokemonApi {
  TypeEnum getType(String value) {
    switch (value) {
      case 'fire':
        return TypeEnum.fire;
      case 'grass':
        return TypeEnum.grass;
      case 'poison':
        return TypeEnum.poison;
      case 'flying':
        return TypeEnum.flying;
      case 'water':
        return TypeEnum.water;
      case 'bug':
        return TypeEnum.bug;
      case 'normal':
        return TypeEnum.normal;
      case 'electric':
        return TypeEnum.electric;
      default:
        return null;
    }
  }

  Future<List<Pokemon>> getPokemons() async {
    Response response = await Dio().get("http://localhost:3000/list");
    final Map data = JsonDecoder().convert(response.toString());

    List<Pokemon> pokemons = [];
    (data['pokemons'] as List).forEach((pokemon) {
      List<TypeEnum> types = [];
      (pokemon['types'] as List).forEach((type) {
        types.add(PokemonApi().getType(type));
      });

      pokemons.add(Pokemon.fromJson(pokemon, types));
    });

    return pokemons;
  }

  Future<Pokemon> getPokemon(String id) async {
    Response response = await Dio().get("http://localhost:3000/details/$id");
    final Map data = JsonDecoder().convert(response.toString());

    Pokemon pokemon;
    List<TypeEnum> types = [];
    (data['types'] as List).forEach((type) {
      types.add(PokemonApi().getType(type));
    });

    pokemon = Pokemon.fromJson(data, types);

    return pokemon;
  }
}

import 'package:flutter/material.dart';
import 'package:pokedex_app/api/pokemonApi.dart';
import 'package:pokedex_app/models/pokemon.dart';
import 'package:pokedex_app/uiComponents/loader.dart';
import 'package:pokedex_app/uiComponents/pokemonListItem.dart';

class PokemonListPage extends StatefulWidget {
  @override
  _PokemonListPageState createState() => _PokemonListPageState();
}

class _PokemonListPageState extends State<PokemonListPage> {
  List<Pokemon> pokemons;
  List<Pokemon> pokemonsFiltered;

  _getPokemons() async {
    pokemons = await PokemonApi().getPokemons();
    pokemonsFiltered = pokemons;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  Widget _pokemonList() {
    if (pokemonsFiltered == null) {
      _getPokemons();
      return Loader();
    }

    return ListView.builder(
      itemCount: pokemonsFiltered.length,
      itemBuilder: (context, index) {
        return PokemonListItem(pokemon: pokemonsFiltered[index]);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 300),
      child: _pokemonList(),
    );
  }
}

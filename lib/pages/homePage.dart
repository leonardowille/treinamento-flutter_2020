import 'package:flutter/material.dart';
import 'package:pokedex_app/api/pokemonApi.dart';
import 'package:pokedex_app/models/pokemon.dart';
import 'package:pokedex_app/uiComponents/loader.dart';
import 'package:pokedex_app/uiComponents/pokemonListItem.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Pokemon> _pokemons;

  _getPokemons() async {
    _pokemons = await PokemonApi().getPokemons();
    setState(() {});
  }

  Widget _mainContainer() {
    if (_pokemons == null) {
      _getPokemons();
      return Loader();
    }

    return Container(
      child: ListView.builder(
        itemCount: _pokemons.length,
        itemBuilder: (context, index) {
          return PokemonListItem(pokemon: _pokemons[index]);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.category), title: Text("Pokemon")),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_box), title: Text("Moves")),
            BottomNavigationBarItem(
                icon: Icon(Icons.assignment_returned), title: Text("Items")),
          ],
        ),
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
        ),
        body: _mainContainer());
  }
}

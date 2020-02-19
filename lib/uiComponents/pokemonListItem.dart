import 'package:flutter/material.dart';
import 'package:pokedex_app/models/pokemon.dart';
import 'package:pokedex_app/pages/pokemonDetailPage.dart';
import 'package:pokedex_app/uiComponents/pokemonType.dart';

class PokemonListItem extends StatelessWidget {
  final Pokemon pokemon;

  PokemonListItem({this.pokemon});

  Widget _getTypes() {
    return Row(
      children: pokemon.types
          .map((type) => PokemonType(typeEnum: type, showLabel: false))
          .toList(),
    );
  }

  _goToDetailPage(context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PokemonDetailPage(
                  pokemonId: pokemon.id,
                  primaryType: pokemon.types.first,
                  image: pokemon.image,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: InkWell(
        onTap: () => _goToDetailPage(context),
        splashColor: Colors.lightBlueAccent,
        highlightColor: Colors.lightBlueAccent,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 12, top: 12, bottom: 12),
                  child: Container(
                    height: 50,
                    width: 50,
                    child: Image.network(pokemon.image),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      pokemon.name,
                      style: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    Text(
                      '#${pokemon.id.padLeft(3, "0")}',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                Spacer(),
                _getTypes()
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Container(
                height: 1,
                width: double.infinity,
                color: Colors.grey.withOpacity(0.4),
              ),
            )
          ],
        ),
      ),
    );
  }
}

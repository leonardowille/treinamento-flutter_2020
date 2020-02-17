import 'package:flutter/material.dart';
import 'package:pokedex_app/api/pokemonApi.dart';
import 'package:pokedex_app/enums/typesEnum.dart';
import 'package:pokedex_app/models/pokemon.dart';
import 'package:pokedex_app/uiComponents/loader.dart';
import 'package:pokedex_app/uiComponents/pokemonStat.dart';
import 'package:pokedex_app/uiComponents/pokemonTypeLabel.dart';

class PokemonDetailPage extends StatefulWidget {
  @override
  _PokemonDetailPageState createState() => _PokemonDetailPageState();

  final String pokemonId;
  final TypeEnum primaryType;
  final String image;

  PokemonDetailPage({this.pokemonId, this.primaryType, this.image});
}

class _PokemonDetailPageState extends State<PokemonDetailPage> {
  Pokemon _pokemon;

  _getPokemon() async {
    _pokemon = await PokemonApi().getPokemon(widget.pokemonId);
    setState(() {});
  }

  Widget _getTypes() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _pokemon.types
            .map((type) => PokemonTypeLabel(typeEnum: type))
            .toList());
  }

  Widget _getStats() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
          children: _pokemon.stats
              .map((stat) => PokemonStat(
                    stat: stat,
                    color: widget.primaryType.color,
                  ))
              .toList()),
    );
  }

  Widget _mainComponent() {
    if (_pokemon == null) {
      _getPokemon();
      return Loader(
        color: widget.primaryType.color,
      );
    }

    return Column(
      children: [
        Text(
          _pokemon.name,
          style: TextStyle(fontSize: 24),
        ),
        Container(height: 16),
        _getTypes(),
        Container(height: 16),
        Text(
          _pokemon.description,
          style: TextStyle(fontSize: 14),
        ),
        Container(height: 16),
        Text(
          'Stats',
          style: TextStyle(
            fontSize: 24,
            color: widget.primaryType.color,
          ),
        ),
        _getStats(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.topLeft,
              colors: [widget.primaryType.color.withOpacity(0.7), widget.primaryType.color],
            ),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.8,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(70),
                    topRight: Radius.circular(70)),
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 50),
                child: _mainComponent(),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 36.0),
            child: Container(
              height: 150,
              width: 150,
              child: Image.network(widget.image),
            ),
          ),
        ),
      ],
    ));
  }
}

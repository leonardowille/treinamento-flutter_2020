import 'package:flutter/material.dart';
import 'package:pokedex_app/api/pokemonApi.dart';
import 'package:pokedex_app/enums/typesEnum.dart';
import 'package:pokedex_app/models/pokemon.dart';
import 'package:pokedex_app/uiComponents/loader.dart';
import 'package:pokedex_app/uiComponents/pokemonStat.dart';
import 'package:pokedex_app/uiComponents/pokemonType.dart';

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
  bool _showStatsBar = false;
  bool _showPokemonDetails = false;

  _getPokemon() async {
    _pokemon = await PokemonApi().getPokemon(widget.pokemonId);
    setState(() {});
  }

  Widget _getTypes() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _pokemon.types
            .map((type) => PokemonType(
                  typeEnum: type,
                  showLabel: true,
                  enableAction: false,
                ))
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
                    showBar: _showStatsBar,
                  ))
              .toList()),
    );
  }

  _completeStatsBar() {
    setState(() {
      _showStatsBar = true;
    });
  }

  _updateShowPokemonDetails() {
    setState(() {
      _showPokemonDetails = true;
    });
  }

  Widget _mainComponent() {
    if (_pokemon == null) {
      _getPokemon();
      return Loader(
        color: widget.primaryType.color,
      );
    }

    Future.delayed(Duration(milliseconds: 25), () => _completeStatsBar());
    return Column(
      children: [
        Text(
          _pokemon.name,
          style: TextStyle(fontSize: 36),
        ),
        Container(height: 24),
        _getTypes(),
        Container(height: 24),
        Text(
          _pokemon.description,
          style: TextStyle(fontSize: 16),
        ),
        Container(height: 24),
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

  Widget _showContent() {
    Future.delayed(
        Duration(milliseconds: 1000), () => _updateShowPokemonDetails());

    return !_showPokemonDetails
        ? Container()
        : Stack(
            children: <Widget>[
              Align(
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
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: InkWell(
                    onTap: () => {Navigator.pop(context)},
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: RotatedBox(
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ),
                        quarterTurns: 3,
                      ),
                    ),
                  ),
                ),
              ),
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
              colors: [
                widget.primaryType.color.withOpacity(0.7),
                widget.primaryType.color
              ],
            ),
          ),
          child: _showContent(),
        ),
        AnimatedContainer(
          duration: Duration(milliseconds: 500),
          alignment:
              _showPokemonDetails ? Alignment.topCenter : Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(top: 36.0),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 500),
              height: _showPokemonDetails ? 150 : 300,
              width: _showPokemonDetails ? 150 : 300,
              child: Image.network(widget.image),
            ),
          ),
        ),
      ],
    ));
  }
}

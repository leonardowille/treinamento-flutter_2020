import 'package:flutter/material.dart';
import 'package:pokedex_app/enums/typesEnum.dart';

class PokemonTypeCircle extends StatelessWidget {
  final TypeEnum typeEnum;

  PokemonTypeCircle({this.typeEnum});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: typeEnum.color,
            boxShadow: [
              BoxShadow(
                color: typeEnum.color,
                blurRadius: 5,
                spreadRadius: 1,
              )
            ]),
        child: Center(child: typeEnum.icon),
      ),
    );
  }
}

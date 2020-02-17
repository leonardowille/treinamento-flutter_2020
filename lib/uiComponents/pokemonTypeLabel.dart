import 'package:flutter/material.dart';
import 'package:pokedex_app/enums/typesEnum.dart';

class PokemonTypeLabel extends StatelessWidget {
  final TypeEnum typeEnum;

  PokemonTypeLabel({this.typeEnum});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          color: typeEnum.color,
            boxShadow: [
              BoxShadow(
                color: typeEnum.color,
                blurRadius: 5,
                spreadRadius: 1,
              )
            ]),
        child: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Center(child: typeEnum.icon),
              ),
              Center(
                  child: Text(
                typeEnum.text,
                style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

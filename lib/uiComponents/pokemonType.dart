import 'package:flutter/material.dart';
import 'package:pokedex_app/enums/typesEnum.dart';

class PokemonType extends StatelessWidget {
  final TypeEnum typeEnum;
  final bool showLabel;

  PokemonType({this.typeEnum, this.showLabel});

  BoxDecoration _containerDecoration() {
    return showLabel
        ? BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            color: typeEnum.color,
            boxShadow: [
                BoxShadow(
                  color: typeEnum.color,
                  blurRadius: 5,
                  spreadRadius: 1,
                )
              ])
        : BoxDecoration(
            shape: BoxShape.circle,
            color: typeEnum.color,
            boxShadow: [
                BoxShadow(
                  color: typeEnum.color,
                  blurRadius: 5,
                  spreadRadius: 1,
                )
              ]);
  }

  Widget _label() {
    return !showLabel
        ? Container()
        : Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Center(
              child: Text(
                typeEnum.text,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        height: 30,
        decoration: _containerDecoration(),
        child: Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Row(
            children: <Widget>[Center(child: typeEnum.icon), _label()],
          ),
        ),
      ),
    );
  }
}

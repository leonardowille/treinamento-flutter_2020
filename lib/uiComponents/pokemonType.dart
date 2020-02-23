import 'package:flutter/material.dart';
import 'package:pokedex_app/enums/typesEnum.dart';

class PokemonType extends StatefulWidget {
  final TypeEnum typeEnum;
  final bool showLabel;
  final bool enableAction;

  PokemonType({this.typeEnum, this.showLabel, this.enableAction});

  @override
  _PokemonTypeState createState() => _PokemonTypeState();
}

class _PokemonTypeState extends State<PokemonType> {
  bool _showLabel;

  void _setInitialState() {
    setState(() {
      if (_showLabel == null) _showLabel = widget.showLabel;
    });
  }

  _changeLabel() {
    if (widget.enableAction) {
      setState(() {
        _showLabel = !_showLabel;
      });
    }
  }

  BoxDecoration _containerDecoration() {
    return _showLabel
        ? BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(50)),
            color: widget.typeEnum.color,
            boxShadow: [
                BoxShadow(
                  color: widget.typeEnum.color,
                  blurRadius: 5,
                  spreadRadius: 1,
                )
              ])
        : BoxDecoration(
            shape: BoxShape.circle,
            color: widget.typeEnum.color,
            boxShadow: [
                BoxShadow(
                  color: widget.typeEnum.color,
                  blurRadius: 5,
                  spreadRadius: 1,
                )
              ]);
  }

  Widget _label() {
    return !_showLabel
        ? Container()
        : Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Center(
              child: Text(
                widget.typeEnum.text,
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
    _setInitialState();
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: InkWell(
        onTap: () => _changeLabel(),
        child: Container(
          height: 30,
          decoration: _containerDecoration(),
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12),
            child: Row(
              children: <Widget>[Center(child: widget.typeEnum.icon), _label()],
            ),
          ),
        ),
      ),
    );
  }
}

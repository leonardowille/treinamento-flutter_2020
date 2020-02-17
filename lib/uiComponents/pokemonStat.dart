import 'package:flutter/material.dart';
import 'package:pokedex_app/models/stat.dart';

class PokemonStat extends StatelessWidget {
  final Stat stat;
  final Color color;
  final bool showBar;

  PokemonStat({this.stat, this.color, this.showBar});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Text(
                stat.nick,
                style: TextStyle(color: color, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(stat.value.toString().padLeft(3, '0')),
            ),
            Expanded(
              flex: 7,
              child: Stack(
                children: <Widget>[
                  Container(
                    height: 8,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.topRight,
                          colors: [
                            Color.fromRGBO(151, 151, 151, .1),
                            Color.fromRGBO(151, 151, 151, .3)
                          ]),
                    ),
                  ),
                  AnimatedContainer(
                    height: 8,
                    width: showBar ? stat.value.toDouble() * 2 : 0,
                    duration: Duration(milliseconds: 250),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.topRight,
                          colors: [color.withOpacity(0.7), color]),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

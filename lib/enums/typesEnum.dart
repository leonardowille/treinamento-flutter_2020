import 'package:flutter/material.dart';

enum TypeEnum {
  fire,
  grass,
  poison,
  flying,
  water,
  bug,
  normal,
  electric,
}

extension TypesExtension on TypeEnum {
  Color get color {
    switch (this) {
      case TypeEnum.fire:
        return Color.fromRGBO(251, 155, 81, 1);
      case TypeEnum.grass:
        return Color.fromRGBO(95, 188, 81, 1);
      case TypeEnum.poison:
        return Color.fromRGBO(168, 100, 199, 1);
      case TypeEnum.flying:
        return Color.fromRGBO(144, 167, 218, 1);
      case TypeEnum.water:
        return Color.fromRGBO(74, 144, 221, 1);
      case TypeEnum.bug:
        return Color.fromRGBO(146, 188, 44, 1);
      case TypeEnum.normal:
        return Color.fromRGBO(146, 152, 164, 1);
      case TypeEnum.electric:
        return Color.fromRGBO(237, 213, 62, 1);
      default:
        return null;
    }
  }

  Image get icon {
    switch (this) {
      case TypeEnum.fire:
        return Image.asset('assets/images/fire.png');
      case TypeEnum.grass:
        return Image.asset('assets/images/grass.png');
      case TypeEnum.poison:
        return Image.asset('assets/images/poison.png');
      case TypeEnum.flying:
        return Image.asset('assets/images/flying.png');
      case TypeEnum.water:
        return Image.asset('assets/images/water.png');
      case TypeEnum.bug:
        return Image.asset('assets/images/bug.png');
      case TypeEnum.normal:
        return Image.asset('assets/images/normal.png');
      case TypeEnum.electric:
        return Image.asset('assets/images/electric.png');
      default:
        return null;
    }
  }

  String get text {
    switch (this) {
      case TypeEnum.fire:
        return "FIRE";
      case TypeEnum.grass:
        return "GRASS";
      case TypeEnum.poison:
        return "POISON";
      case TypeEnum.flying:
        return "FLYING";
      case TypeEnum.water:
        return "WATER";
      case TypeEnum.bug:
        return "BUG";
      case TypeEnum.normal:
        return "NORMAL";
      case TypeEnum.electric:
        return "ELECTRIC";
      default:
        return null;
    }
  }
}

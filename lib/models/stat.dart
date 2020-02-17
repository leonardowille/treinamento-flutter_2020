class Stat {
  String name;
  int value;

  Stat.fromJson(Map jsonMap)
      : name = jsonMap['name'],
        value = jsonMap['value'];
}

extension StatExtension on Stat {
  String get nick {
    switch (this.name) {
      case 'speed':
        return 'SPD';
      case 'special-defense':
        return 'SDEF';
      case 'special-attack':
        return 'SATK';
      case 'defense':
        return 'DEF';
      case 'attack':
        return 'ATK';
      case 'hp':
        return 'HP';
      default:
        return null;
    }
  }
}

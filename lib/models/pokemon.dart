import 'package:pokedex_app/enums/typesEnum.dart';
import 'package:pokedex_app/models/stat.dart';

class Pokemon {
  String id;
  String name;
  String image;
  String description;
  List<TypeEnum> types;
  List<Stat> stats;

  Pokemon.fromJson(Map jsonMap, List<TypeEnum> types)
      : id = jsonMap['id'],
        name = jsonMap['name'],
        image = jsonMap['image'],
        description = jsonMap['description'],
        stats = jsonMap.containsKey("stats")
            ? jsonMap['stats']
                .map<Stat>((dynamic stat) => Stat.fromJson(stat))
                .toList()
            : [],
        types = types;
}

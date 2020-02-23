import 'package:flutter/material.dart';
import 'package:pokedex_app/api/pokemonApi.dart';
import 'package:pokedex_app/models/pokemon.dart';
import 'package:pokedex_app/uiComponents/loader.dart';
import 'package:pokedex_app/uiComponents/pokemonListItem.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Pokemon> _pokemons;
  List<Pokemon> _pokemonsFiltered;
  TextEditingController _filterInputController = TextEditingController();
  int _currentIndex = 0;
  String _appBarTitle = "Pokemon";

  _filterPokemonList() {
    if (_pokemons != null && _pokemons.isNotEmpty) {
      List<Pokemon> pokes = [];
      if (_filterInputController != null && _filterInputController.text != "") {
        _pokemons.forEach((pokemon) => {
              if (pokemon.name.contains(_filterInputController.text))
                {pokes.add(pokemon)}
            });
      } else {
        pokes = _pokemons;
      }

      setState(() {
        _pokemonsFiltered = pokes;
      });
    }
  }

  _updateIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  _getPokemons() async {
    _pokemons = await PokemonApi().getPokemons();
    _pokemonsFiltered = _pokemons;
    setState(() {});
  }

  Widget _mainContainer() {
    if (_pokemonsFiltered == null) {
      _getPokemons();
      return Loader();
    }

    switch (_currentIndex) {
      case 0:
        return Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Container(
            child: ListView.builder(
              itemCount: _pokemonsFiltered.length,
              itemBuilder: (context, index) {
                return PokemonListItem(pokemon: _pokemonsFiltered[index]);
              },
            ),
          ),
        );
      default:
        return Center(child: Text("TODO"));
    }
  }

  Widget _appBar() {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.lightBlueAccent.withOpacity(0.3),
          Colors.lightGreenAccent.withOpacity(0.3)
        ]),
      ),
      child: Column(
        children: <Widget>[
          Container(height: 16),
          Text(
            _appBarTitle,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          Container(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Container(
              height: 36,
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.3),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: TextField(
                autofocus: false,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black54,
                    ),
                    suffixIcon: Icon(
                      Icons.mic,
                      color: Colors.black54,
                    ),
                    hintText: "Search",
                    border: InputBorder.none),
                controller: _filterInputController,
              ),
            ),
          ),
          Container(height: 10),
          Container(
            height: 4,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.lightBlueAccent,
                Colors.lightGreenAccent,
              ]),
            ),
          )
        ],
      ),
    );
  }

  Widget _bottomNavigationBar() {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.lightBlueAccent, Colors.lightGreenAccent]),
      ),
      child: Column(
        children: <Widget>[
          Container(
            height: 4,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.lightBlueAccent,
                Colors.lightGreenAccent,
              ]),
            ),
          ),
          Theme(
            data: Theme.of(context).copyWith(
                primaryColor: Colors.black,
                textTheme: Theme.of(context)
                    .textTheme
                    .copyWith(caption: new TextStyle(color: Colors.grey))),
            child: BottomNavigationBar(
              backgroundColor: Colors.white.withOpacity(0.7),
              currentIndex: _currentIndex,
              onTap: _updateIndex,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(Icons.category), title: Text("Pokemon")),
                BottomNavigationBarItem(
                    icon: Icon(Icons.add_box), title: Text("Moves")),
                BottomNavigationBarItem(
                    icon: Icon(Icons.assignment_returned),
                    title: Text("Items")),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _filterInputController.addListener(_filterPokemonList);
  }

  @override
  void dispose() {
    _filterInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: _bottomNavigationBar(),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            _appBar(),
            _mainContainer(),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pokemon_app_001/models/pokemon.dart';
import 'package:provider/provider.dart';

import '../services/api_service.dart';
import '../widgets/pokemon_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Pokemon>> _pokemonFuture;

  @override
  void initState() {
    super.initState();
    _pokemonFuture = _fetchPokemon();
  }

  Future<List<Pokemon>> _fetchPokemon() async {
    return await Provider.of<ApiService>(
      context,
      listen: false,
    ).fetchRandomPokemon();
  }

  void _refresh() {
    setState(() {
      _pokemonFuture = _fetchPokemon();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Pokémon'),
        actions: [IconButton(icon: Icon(Icons.refresh), onPressed: _refresh)],
      ),
      body: FutureBuilder<List<Pokemon>>(
        future: _pokemonFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error loading Pokémon'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No Pokémon found'));
          }

          return ListView.builder(
            padding: EdgeInsets.all(8),
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final pokemon = snapshot.data![index];
              return PokemonCard(pokemon: pokemon);
            },
          );
        },
      ),
    );
  }
}

import 'dart:convert';
import 'dart:math';

import 'package:http/http.dart' as http;

import '../models/pokemon.dart';

class ApiService {
  static const baseUrl = 'https://pokeapi.co/api/v2';

  Future<List<Pokemon>> fetchRandomPokemon() async {
    final random = Random();
    final List<Pokemon> pokemons = [];

    while (pokemons.length < 10) {
      final randomId =
          random.nextInt(1010) + 1; // There are currently 1010 Pokémon
      final response = await http.get(Uri.parse('$baseUrl/pokemon/$randomId'));

      if (response.statusCode == 200) {
        pokemons.add(Pokemon.fromJson(jsonDecode(response.body)));
      }
    }

    return pokemons;
  }
}

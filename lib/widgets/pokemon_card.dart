import 'package:flutter/material.dart';

import '../models/pokemon.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonCard({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (pokemon.imageUrl.isNotEmpty)
              Image.network(pokemon.imageUrl, height: 100),
            Text(
              pokemon.name.toUpperCase(),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Types: ${pokemon.types.join(', ')}'),
            Text('Abilities: ${pokemon.abilities.join(', ')}'),
          ],
        ),
      ),
    );
  }
}

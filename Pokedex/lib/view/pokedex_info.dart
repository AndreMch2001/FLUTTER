import 'package:flutter/material.dart';
import 'package:pokedex/model/poke_model.dart';

class PokedexInfo extends StatelessWidget {
  final PokedexModel pokemon;

  const PokedexInfo({super.key, required this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color.fromRGBO(100, 172, 236, 1),
        title: Text(
          pokemon.name,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    Card(
                      color: Colors.grey[100],
                      elevation: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Stack(
                          children: [
                            Center(
                              child: Image.network(
                                pokemon.thumbnailImage,
                              ),
                            ),
                            Positioned(
                              top: 5,
                              right: 5,
                              child: Text(
                                '#${pokemon.number}',
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Card(
                      elevation: 0,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(pokemon.description),
                            const SizedBox(height: 15),
                            const Text(
                              'Tipo:',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(pokemon.type.join(', ')),
                            const SizedBox(height: 16),
                            const Text(
                              'Fraquezas:',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(pokemon.weakness.join(', ')),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

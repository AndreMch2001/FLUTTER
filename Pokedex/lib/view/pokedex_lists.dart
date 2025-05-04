import 'package:flutter/material.dart';
import 'package:pokedex/controller/poke_controller.dart';
import 'package:pokedex/model/poke_model.dart';
import 'package:pokedex/view/pokedex_info.dart';

class Pokedex extends StatefulWidget {
  const Pokedex({super.key});

  @override
  PokemonViewState createState() => PokemonViewState();
}

class PokemonViewState extends State<Pokedex> {
  final PokedexController controller = PokedexController();
  late Future<List<PokedexModel>> futurePokemons;

  @override
  // INICIA O CONTROLLER PARA GERENCIAR AS INFORMAÇÕES.
  void initState() {
    super.initState();
    futurePokemons = controller.fetchPokemons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Pokedex',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Image.network(
              'https://raw.githubusercontent.com/RafaelBarbosatec/SimplePokedex/master/assets/pokebola_img.png',
              scale: 20,
            ),
          )
        ],
        // POR ALGUM MOTIVO A COR PADRÃO NÃO É RECONHECIDA, ENTÃO FIZ MANUALMENTE.
        backgroundColor: const Color.fromRGBO(100, 172, 236, 1),
      ),
      body: FutureBuilder<List<PokedexModel>>(
        future: futurePokemons,
        builder: (context, pokeList) {
          // SE A CONEXÃO ESTIVER DEMORANDO VAI MOSTRAR UM LOADIN PADRÃO, REDONDINHO
          if (pokeList.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: pokeList.data!.length,
              itemBuilder: (context, index) {
                PokedexModel pokemon = pokeList.data![index];
                return GestureDetector(
                  // PUXA A SEGUNDA TELA "LEVANDO" AS INFORMAÇÕES DA PRIMEIRA
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PokedexInfo(pokemon: pokemon),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 1,
                    color: Colors.white,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: ListTile(
                      leading: Image.network(pokemon.thumbnailImage),
                      trailing: Text(
                        '#${pokemon.number}',
                        style: const TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                      title: Text(pokemon.name),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}

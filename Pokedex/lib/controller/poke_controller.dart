import 'package:dio/dio.dart';
import 'package:pokedex/model/poke_model.dart';

class PokedexController {
  final String url = 'https://rafaelbarbosatec.github.io/api/pokemon/pokemons.json';
  Dio dio = Dio();

  Future<List<PokedexModel>> fetchPokemons() async {
    try {
      Response response = await dio.get(url);
      List<dynamic> data = response.data;
      return data.map((pokemon) => PokedexModel.fromJson(pokemon)).toList();
    } catch (e) {
      throw Exception('Failed to load pokemons: $e');
    }
  }
}

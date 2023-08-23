import 'package:pokemon_list/features.auth/data/models/pokemons.dart';

abstract class PokemonsRepository {
  Future<List<PokemonsModel>> getNewPokemons();
}

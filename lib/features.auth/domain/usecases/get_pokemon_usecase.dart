import 'package:pokemon_list/features.auth/domain/entities/pokemons.dart';
import 'package:pokemon_list/features.auth/domain/repository/pokemons_repository.dart';

import '../../../core/resources/data_state.dart';

class GetPokemonUseCase {
  final PokemonsRepository pokemonsRepository;

  GetPokemonUseCase(this.pokemonsRepository);

  Future<DataState<List<PokemonsEntity>>> invoke() async {
    try {
      final pokemons = await pokemonsRepository.getNewPokemons();
      final pokemonsEntity = pokemons.map((pokemon) => pokemon.toEntity()).toList();
      return DataState.Sucess(data: pokemonsEntity);
    } catch (Ex){
      return DataState.Error();
    }
  }


}
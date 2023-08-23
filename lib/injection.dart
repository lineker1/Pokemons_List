import 'package:get_it/get_it.dart';
import 'package:pokemon_list/features.auth/data/repository/pokemons_repository_impl.dart';
import 'package:pokemon_list/features.auth/domain/repository/pokemons_repository.dart';
import 'package:pokemon_list/features.auth/domain/usecases/get_pokemon_usecase.dart';
import 'package:pokemon_list/features.auth/presentation/bloc/pokemon_bloc.dart';

final sl = GetIt.I;

void setup() {
  sl.registerFactory(() => PokemonBloc(sl()));

  sl.registerSingleton<PokemonsRepository>(PokemonsRepositoryImpl());

  sl.registerSingleton(GetPokemonUseCase(sl()));

  // sl.registerSingleton(Dio());
}

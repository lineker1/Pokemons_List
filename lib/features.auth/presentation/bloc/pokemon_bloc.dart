import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_list/core/resources/data_state.dart';
import 'package:pokemon_list/features.auth/domain/entities/pokemons.dart';
import 'package:pokemon_list/features.auth/presentation/bloc/pokemon_bloc_event.dart';
import 'package:pokemon_list/features.auth/presentation/bloc/pokemon_bloc_state.dart';

import '../../domain/usecases/get_pokemon_usecase.dart';

class PokemonBloc extends Bloc<PokemonBlocEvent, PokemonBlocState> {
  final GetPokemonUseCase _getPokemonUseCase;
  List<PokemonsEntity> _searchPokemons = [];

  PokemonBloc(this._getPokemonUseCase)
      : super(PokemonErrorState('Ocorreu um erro')) {
    on<GetPokemonsEvent>(onGetPokemons);

    on<SearchEvent>(onSearchEvents);
  }

  void onGetPokemons(
    GetPokemonsEvent event,
    Emitter<PokemonBlocState> emit,
  ) async {
    emit(PokemonLoadState());
    final result = await _getPokemonUseCase.invoke();
    if (result.status == DataStateStatus.sucess) {
      _searchPokemons = result.data ?? [];
      emit(PokemonSucessState(result.data!));
    } else {
      emit(PokemonErrorState('Ocorreu um erro'));
    }
  }

  void onSearchEvents(SearchEvent event, Emitter<PokemonBlocState> emit) {
    final pokemons = _filterPokemonList(event.query);
    emit(PokemonSucessState(pokemons));
  }

  List<PokemonsEntity> _filterPokemonList(String query) {
    final searchResults = _searchPokemons
        .where((pokemonsSearch) =>
            pokemonsSearch.name!.toLowerCase().contains(query.toLowerCase()) ||
            pokemonsSearch.number!.contains(query))
        .toList();
    return searchResults;
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_list/core/resources/data_state.dart';
import 'package:pokemon_list/features.auth/presentation/bloc/pokemon_bloc_event.dart';
import 'package:pokemon_list/features.auth/presentation/bloc/pokemon_bloc_state.dart';
import '../../domain/usecases/get_pokemon_usecase.dart';

class PokemonBloc extends Bloc<PokemonBlocEvent, PokemonBlocState> {
  final GetPokemonUseCase _getPokemonUseCase;

  PokemonBloc(this._getPokemonUseCase) : super(PokemonErrorState('cu')) {
    on<GetPokemonsEvent>(onGetPokemons);
  }

  void onGetPokemons(
    GetPokemonsEvent event,
    Emitter<PokemonBlocState> emit,
  ) async {
    emit(PokemonLoadState());
    final result = await _getPokemonUseCase.invoke();
    if (result.status == DataStateStatus.sucess) {
      emit(PokemonSucessState(result.data!));
    } else {
      emit(PokemonErrorState('meu cu'));
    }
  }
}

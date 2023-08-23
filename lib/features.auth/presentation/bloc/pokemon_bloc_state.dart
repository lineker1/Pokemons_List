import '../../domain/entities/pokemons.dart';

abstract class PokemonBlocState {}

class PokemonInitialState extends PokemonBlocState {}

class PokemonLoadState extends PokemonBlocState {}

class PokemonSucessState extends PokemonBlocState {
  final List<PokemonsEntity> result;

  PokemonSucessState(this.result);
}

class PokemonErrorState extends PokemonBlocState {
  String errorMessage;

  PokemonErrorState(this.errorMessage);
}

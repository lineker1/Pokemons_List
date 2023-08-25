abstract class PokemonBlocEvent {
}

class GetPokemonsEvent extends PokemonBlocEvent {
  GetPokemonsEvent();
}

class SearchEvent extends PokemonBlocEvent {
  final String query;

  SearchEvent(this.query);
}

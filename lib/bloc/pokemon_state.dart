part of 'pokemon_bloc.dart';

abstract class PokemonState {}

class PokemonInitialState extends PokemonState {}

class PokemonLoadingState extends PokemonState {}

class PokemonSuccessState extends PokemonState {
  final List<Pokemon> pokemonList;
  PokemonSuccessState({required this.pokemonList});
}

class PokemonErrorState extends PokemonState {
  final String errorMessage;
  PokemonErrorState({required this.errorMessage});
}

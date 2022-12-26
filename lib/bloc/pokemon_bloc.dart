import 'package:blocpokemon/models/pokemon.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blocpokemon/services/pokemon_service.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<FetchPokemonEvent, PokemonState> {
  PokemonBloc() : super(PokemonInitialState()) {
    on<FetchPokemonEvent>((event, emit) async {
      emit(PokemonLoadingState());
      try {
        final pokeList = await PokemonService.fetchPokemonList();
        emit(PokemonSuccessState(pokemonList: pokeList));
      } catch (e) {
        emit(PokemonErrorState(errorMessage: e.toString()));
      }
    });
  }
}

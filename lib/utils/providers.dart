import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stacklab/pokedex/pokemon.dart';

final signinProvider = StateProvider((ref) => false);
final usernameProvider = StateProvider((ref) => '');

final appFavoriteProvider =
    StateNotifierProvider((ref) => AppFavoriteNotifier());

class AppFavoriteNotifier extends StateNotifier<List<Pokemon>> {
  AppFavoriteNotifier() : super(_initialState);
  static const _initialState = <Pokemon>[];

  void init() {
    state = _initialState;
  }

  void add(Pokemon pokemon) {
    final copy = <Pokemon>[];
    copy.addAll(state);
    if (copy.contains(pokemon))
      copy.remove(pokemon);
    else
      copy.add(pokemon);
    state = copy;
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:stacklab/utils/strings.dart';
import 'package:stacklab/utils/app_bar_title.dart';
import 'package:stacklab/utils/providers.dart';
import 'package:stacklab/pokedex/pokemon.dart';
import 'package:stacklab/pokedex/pokemon_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stacklab/account.dart';

final pokedexProvider = FutureProvider.autoDispose
    .family<List<Pokemon>, BuildContext>((ref, context) async {
  String data =
      await DefaultAssetBundle.of(context).loadString("assets/pokedex.json");
  final jsonResult = json.decode(data);

  final list = <Pokemon>[];
  for (final loop in jsonResult) {
    final pokemon = Pokemon.fromJson(loop);
    list.add(pokemon);
  }
  return list;
});

class Dashboard extends ConsumerWidget {
  const Dashboard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final pokedex = watch(pokedexProvider(context));
    return pokedex.when(
      loading: () => const Scaffold(
          backgroundColor: Colors.white,
          body: Center(child: CircularProgressIndicator())),
      error: (err, stack) {
        print(err);
        print(stack);
        return Scaffold(body: Text('Error: $err'));
      },
      data: (p) {
        return body(p, context);
      },
    );
  }

  Widget body(List<Pokemon> pokedex, BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              title: AppBarTitle(title: Strings.dashboardTitle),
              actions: <Widget>[
                GestureDetector(
                    onTap: () async {
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyAccountPage()));
                    },
                    child: Image.asset('assets/images/trainer_icon.png',
                        width: 40)),
              ],
              bottom: TabBar(
                indicatorColor: Colors.white,
                tabs: [
                  Tab(text: Strings.dashboardTab1),
                  Tab(text: Strings.dashboardTab2),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                listOfPokemons(pokedex),
                listOfFavouritesPokemons(),
              ],
            )));
  }

  Widget listOfFavouritesPokemons() {
    return Consumer(builder: (context, watch, __) {
      final favourites = watch(appFavoriteProvider.state);

      if (favourites.length == 0) {
        return Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.white,
            child: Center(child: Text(Strings.dashboardNoFavourites)));
      }

      return Container(
          color: Colors.white,
          child: ListView.builder(
            itemCount: favourites.length,
            itemBuilder: (context, index) {
              final pokemon = favourites[index];
              return ListTile(
                  leading: Image.asset(
                      'assets/images/pokemons/${pokemon.id}.png',
                      width: 40),
                  title: Text(pokemon.getTitle()),
                  subtitle: Text(pokemon.getFormattedId()),
                  trailing: GestureDetector(
                      onTap: () {
                        context.read(appFavoriteProvider).add(pokemon);
                      },
                      child: Icon(favourites.contains(pokemon)
                          ? Icons.favorite
                          : Icons.favorite_border)));
            },
          ));
    });
  }

  Widget listOfPokemons(List<Pokemon> pokedex) {
    return Consumer(builder: (context, watch, __) {
      final favourites = watch(appFavoriteProvider.state);
      return Container(
          color: Colors.white,
          child: ListView.builder(
            itemCount: pokedex.length,
            itemBuilder: (context, index) {
              final pokemon = pokedex[index];
              return ListTile(
                  onTap: () {
                    onTapPokemon(context, pokemon);
                  },
                  leading: Image.asset(
                      'assets/images/pokemons/${pokemon.id}.png',
                      width: 40),
                  title: Text(pokemon.getTitle()),
                  subtitle: Text(pokemon.getFormattedId()),
                  trailing: GestureDetector(
                      onTap: () {
                        context.read(appFavoriteProvider).add(pokemon);
                      },
                      child: Icon(favourites.contains(pokemon)
                          ? Icons.favorite
                          : Icons.favorite_border)));
            },
          ));
    });
  }

  void onTapPokemon(BuildContext context, Pokemon pokemon) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MyPokemonPage(pokemon: pokemon)));
  }
}

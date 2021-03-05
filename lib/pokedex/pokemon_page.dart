import 'package:flutter/material.dart';
import 'package:stacklab/utils/strings.dart';
import 'package:stacklab/utils/button.dart';
import 'package:stacklab/utils/app_bar_title.dart';
import 'package:stacklab/profile.dart';
import 'package:stacklab/pokedex/pokemon.dart';
import 'package:stacklab/utils/providers.dart';
import 'package:stacklab/pokedex/pokemon.dart';
import 'package:stacklab/pokedex/pokemon_page.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyPokemonPage extends StatelessWidget {
  MyPokemonPage({@required this.pokemon});
  final Pokemon pokemon;

  Widget displayName(Pokemon pokemon) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          for (final entry in pokemon.name.entries)
            Text(
              '(${entry.key.substring(0, 2).toUpperCase()}): ${entry.value}',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
            ),
        ]);
  }

  Widget displayType(Pokemon pokemon) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          for (final t in pokemon.type)
            Text(
              '* $t',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.normal,
                  color: Colors.black),
            ),
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: AppBarTitle(title: pokemon.getTitle()),
          actions: <Widget>[
            GestureDetector(onTap: () {
              context.read(appFavoriteProvider).add(pokemon);
            }, child: Consumer(builder: (context, watch, __) {
              final favourites = watch(appFavoriteProvider.state);
              return Icon(favourites.contains(pokemon)
                  ? Icons.favorite
                  : Icons.favorite_border);
            })),
          ],
        ),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                      child: Image.asset(
                          'assets/images/pokemons/${pokemon.id}.png',
                          width: 40)),
                  const SizedBox(height: 20),
                  Text(
                    'ID: ${pokemon.getFormattedId()}',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Nom',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.black),
                  ),
                  const SizedBox(height: 10),
                  displayName(pokemon),
                  const SizedBox(height: 20),
                  Text(
                    'Type(s)',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.black),
                  ),
                  displayType(pokemon),
                ])));
  }
}

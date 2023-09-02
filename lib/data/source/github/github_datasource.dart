import 'dart:convert';

import 'package:pokedex/core/network.dart';
import 'package:pokedex/data/source/github/models/item.dart';
import 'package:pokedex/data/source/github/models/pokemon.dart';

class GithubDataSource {
  GithubDataSource(this.networkManager);

  static const String itemsURL =
      'https://gist.githubusercontent.com/bambangfery/da5a8dc5dba452d0174fde23a08cd559/raw/pokemon-items.json';

  static const String url =
      'https://gist.githubusercontent.com/bambangfery/959daffc15702554cd264726e23c64e9/raw/pokemons.json';

  final NetworkManager networkManager;

  Future<List<GithubPokemonModel>> getPokemons() async {
    final response = await networkManager.request(RequestMethod.get, url);

    final data = (json.decode(response.data) as List)
        .map((item) => GithubPokemonModel.fromJson(item))
        .toList();

    return data;
  }

  Future<List<GithubItemModel>> getItems() async {
    final response = await networkManager.request(RequestMethod.get, itemsURL);

    final data =
        (json.decode(response.data) as List).map((item) => GithubItemModel.fromJson(item)).toList();

    return data;
  }
}

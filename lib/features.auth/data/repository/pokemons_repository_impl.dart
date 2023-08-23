import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:pokemon_list/core/constants/contants.dart';
import 'package:pokemon_list/features.auth/data/models/pokemons.dart';
import 'package:pokemon_list/features.auth/domain/repository/pokemons_repository.dart';

class PokemonsRepositoryImpl implements PokemonsRepository {
  final LogInterceptor interceptor = LogInterceptor();

  final Dio dio = Dio();

  @override
  Future<List<PokemonsModel>> getNewPokemons() async {
    dio.interceptors.add(interceptor);

    final response = await dio.get(newsAPIBaseURL);
    final data = jsonDecode(response.data);
    final pokemons = data['pokemon'] as List<dynamic>;
    return pokemons.map((pokemon) => PokemonsModel.fromJson(pokemon)).toList();
  }
}

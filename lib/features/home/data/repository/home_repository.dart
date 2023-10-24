

import 'package:dio/dio.dart';
import 'package:learnagain/core/client/client.dart';
import 'package:learnagain/features/home/data/model/Pokemon.dart';

class HomeRepository {
  static Future getListPokemon() async{
    var endpoint = "pokemon";
    Response<String> response = await Client().dio.get(endpoint);
    return pokemonFromJson(response.data!);
  }
}
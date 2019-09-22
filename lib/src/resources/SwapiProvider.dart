import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/PlanetResult.dart';

class SwApiProvider
{
  Client client = Client();

  Future<ApiPlanets> fetchPlanetList() async
  {
    print("entered planet fetch");
    final responce = await client.
          get("https://swapi.co/api/planets/");
    print(responce.body.toString());
    if (responce.statusCode == 200)
    {
      return ApiPlanets.fromJson(json.decode(responce.body));
    }
    else
    {
      throw Exception('Failed to load post');
    }
  }
}
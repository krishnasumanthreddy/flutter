import 'dart:async';
import 'SwapiProvider.dart';
import '../models/PlanetResult.dart';

class Repository {
  final swApiProvider = SwApiProvider();

  Future<ApiPlanets> fetchAllPlanets() => swApiProvider.fetchPlanetList();
}
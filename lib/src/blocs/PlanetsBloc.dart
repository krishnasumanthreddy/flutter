import '../resources/repository.dart';
import 'package:rxdart/rxdart.dart';
import '../models/PlanetResult.dart';

class PlanetsBloc
{
  final _repository = Repository();
  final _planetsFetcher = PublishSubject<ApiPlanets>();

  Observable<ApiPlanets> get allPlanets =>
  _planetsFetcher.stream;

  fetchAllPlanets() async
  {
    ApiPlanets apiPlanets = await _repository.fetchAllPlanets();
    _planetsFetcher.sink.add(apiPlanets);
  }

  dispose()
  {
    _planetsFetcher.close();
  }
}

final bloc = PlanetsBloc();
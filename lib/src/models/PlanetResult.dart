
class ApiPlanets
{
  int count;
  String nextResult;
  String previousResult;
  List<_Planet> planets = [];

  ApiPlanets.fromJson(Map<String,dynamic>parsedJson)
  {
    count = parsedJson['count'];
    nextResult = parsedJson['next'];
    previousResult = parsedJson['previous'];
    for(int i=0;i<parsedJson['results'].length;i++)
    {
      planets.add(_Planet(parsedJson['results'][i]));
    }
  }
}

class _Planet
{
  String name;
  String rotationPeriod;
  String diameter;
  String climate;
  String gravity;
  String terrain;
  List<String> residents;
  List<String> films;
  _Planet(result)
  {
    name = result['name'];
    rotationPeriod = result['rotation_period'];
    diameter = result['diameter'];
    climate = result['climate'];
    gravity = result['gravity'];
    terrain = result['terrain'];
    // for(int i=0;i<result['residents'].length;i++)
    // {
    //   residents.add(result['residents'][i]);
    // }
    // for(int i=0;i<result['films'].length;i++)
    // {
    //   residents.add(result['films'][i]);
    // }
  }
}
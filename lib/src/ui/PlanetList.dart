import 'package:flutter/material.dart';
import '../models/PlanetResult.dart';
import '../blocs/PlanetsBloc.dart';

class PlanetList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    bloc.fetchAllPlanets();
    return Scaffold(
      appBar: AppBar(
        title: Text('Mysterious Planets'),
      ),
      body: StreamBuilder(
        stream: bloc.allPlanets,
        builder: (context, AsyncSnapshot<ApiPlanets> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget buildList(AsyncSnapshot<ApiPlanets> snapshot) {
    return GridView.builder(
        itemCount: snapshot.data.planets.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Text(snapshot.data.planets[index].name);
        });
  }
}
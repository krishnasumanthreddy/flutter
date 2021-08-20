import 'package:flutter/material.dart';
import 'package:csv/csv.dart';
import 'dart:io';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Blotter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BlotterState();
  }
}

class Starwars
{
   String name;
   String model;
   String manufacturer;
   
   Starwars({this.name,this.model,this.manufacturer});

}

class _BlotterState extends State {
  var result;
   List<Starwars> sw = [];
  String url = 'http://swapi.co/api/starships';
  List data = [
    {
      "name": "Executor",
      "model": "Executor-class star dreadnought",
      "manufacturer": "Kuat Drive Yards, Fondor Shipyards",
      "cost_in_credits": "1143350000",
      "length": "19000",
      "max_atmosphering_speed": "n/a",
      "crew": "279144",
      "passengers": "38000",
      "cargo_capacity": "250000000",
      "consumables": "6 years",
      "hyperdrive_rating": "2.0",
      "MGLT": "40",
      "starship_class": "Star dreadnought",
      "pilots": [],
      "films": [
        "https://swapi.co/api/films/2/",
        "https://swapi.co/api/films/3/"
      ],
      "created": "2014-12-15T12:31:42.547000Z",
      "edited": "2017-04-19T10:56:06.685592Z",
      "url": "https://swapi.co/api/starships/15/"
    }
  ];

  // Future<String> getSWaData(String uri) async {
  //   print('entered get swdata');

  //   print('parse complete');
  //   setState(() {

  //     data = resBody['results'];

  //     url = resBody['next'];

  //   });
  //   setState(() {

  //   });

  //   print('printing data');
  //     print(data);
  //     print(url);
  //   return 'Success';
  // }

  Future<String> getSWData(String uri) async {
    var res = await http
        .get(Uri.encodeFull(uri), headers: {"Accept": "application/json"});

    var resBody = json.decode(res.body);
    for(var ob  in resBody['results'])
    {
     // Starwars s = new Starwars(ob['0name'],ob['model'],ob['manufacturer']);
      //var v = s.name;
      sw.add(Starwars(name:ob['name'],model:ob['model'],manufacturer:ob['manufacturer']));
    }
    sw.sort((obj1,obj2)=>obj1.name.compareTo(obj2.name));
    setState(() {
      data = resBody['results'];
      url = resBody['next'];
    });
    return 'Success';
  }

  Future<String> readFile() async {
    final input = new File('assets/trades.txt');
    //final fields =  input.transform(new CsvToListConverter()).toList();
    String values = await input.readAsString();
    setState(() {
      result = const CsvToListConverter().convert(values.toString());
    });

    //result = res;
    return values;
  }

  @override
  void initState() {
    print('init state in blotter state');
    getSWData(url);
    //readFile();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print('build state in blotter state');
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("Blotter"),
        ),
        body: SingleChildScrollView(
            child: Container(
          margin: const EdgeInsets.all(30.0),
          padding: const EdgeInsets.all(20.0),
          decoration: new BoxDecoration(
              border: new Border.all(color: Colors.blueAccent)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              DataTable(),
              Container(
                child: Center(
                  child: Table(
                      border: TableBorder.all(),
                      
                      //TableRow(children: ),
                      children: data
                          .map(
                            (element) => TableRow(children: [
                              TableCell(
                                child: Text(element['name']),
                              ),
                              TableCell(
                                child: Text(element['model']),
                              ),
                              TableCell(
                                child: Text(element['manufacturer']),
                              ),
                              TableCell(
                                child: Text(element['manufacturer']),
                              ),
                              TableCell(
                                child: Text(element['manufacturer']),
                              ),
                              TableCell(
                                child: Text(element['manufacturer']),
                              ),
                              TableCell(
                                child: Text(element['manufacturer']),
                              ),
                              // TableCell(
                              //   child: Text(element['manufacturer']),
                              // ),
                              // TableCell(
                              //   child: Text(element['manufacturer']),
                              // ),
                              // TableCell(
                              //   child: Text(element['manufacturer']),
                              // ),
                            ]),
                          )
                          .toList()),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10.0),
                child: RaisedButton(
                  child: Text('load'),
                  onPressed: () {
                    //getapidata
                    print('button on pressed');
                    getSWData(url);
                    print('button on pressed released');
                  },
                ),
              )
            ],
          ),
        )));
  }
}

class Blotte extends StatelessWidget {
  var result;
  Blotte() {}

  Future<String> readFile() async {
    final input = new File('assets/trades.txt');
    //final fields =  input.transform(new CsvToListConverter()).toList();
    String values = await input.readAsString();

    result = const CsvToListConverter().convert(values.toString());

    //result = res;
    return values;
  }

  @override
  Widget build(BuildContext context) {
    var values = readFile();

    // print(res);
    // List<List<String>> strres = new List<List<String>>();
    // for (var item in res) {
    //   List<String> castItem = new List<String>();
    //   for (var i in item) {
    //      String ci = i;
    //   }
    // }
    //List<List<String>> strlist =  <List<List<String>>> res;
    var res1 = [
      ['1', '2', '3'],
      ['4', '5', '7']
    ];

    // TODO: implement build
    return Table(
        border: TableBorder.all(),
        children: result
            .map(
              (list) => TableRow(
                  children: list
                      .map((element) => TableCell(
                            child: Text(element.toString()),
                          ))
                      .toList()),
            )
            .toList());
  }
}

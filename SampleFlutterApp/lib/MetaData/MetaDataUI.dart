import 'dart:async';
import 'package:emfa/MetaData/MetaDataProvider.dart';
import 'package:flutter/material.dart';
import 'package:emfa/MetaData/MetaDataModel.dart';

class MetaDataWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MetaDataState();
  }
}

class _MetaDataState extends State {
  var filter = "";
  var metares;
  Metadata meta = new Metadata();
  void getMetadata() async {
    final metaProvider = new MetadataProvider();
    var result = await metaProvider.fetchMetadataFromApi();
    setState(() {
      meta = result;
      metares = result;
    });
  }

  @override
  void initState() {
    getMetadata();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          dataTableBuild(meta),
          Row(
            children: <Widget>[
              Text('Filter'),
              Expanded(
                child: TextField(
                  onEditingComplete: () {},
                  onSubmitted: (value) {
                    filter = value;
                    print(filter.toString());
                  },
                ),
              ),
              RaisedButton(
                  child: Text('apply'),
                  onPressed: () {
                    setState(() {
                      print(filter.toString());
                      filter = filter;
                    });
                  }),
            ],
          ),
          RaisedButton(
              child: Text('reset'),
              onPressed: () {
                setState(() {
                  filter = "";
                });
              })
        ],
      ),
    ));
  }

  SingleChildScrollView dataTableBuild(Metadata metad) {
    print(filter + "from table");
    List<String> currencies =
        meta.Currencies.where((a) => a.contains(filter)).toList();
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        child: DataTable(
            columns: <DataColumn>[
              DataColumn(
                  label: Text("Currency"),
                  numeric: false,
                  onSort: (i, b) {
                    setState(() {
                      currencies.sort((a, b) => a.compareTo(b));
                    });
                  })
            ],
            rows: currencies
                .map((currency) => DataRow(
                      cells: <DataCell>[DataCell(Text(currency))],
                    ))
                .toList()),
      ),
    );
  }
}

class MetadataSecuritesWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MetaDataSecuritesState();
  }
}

class _MetaDataSecuritesState extends State {
  var filter = '';
  Metadata meta = new Metadata();
  void getMetadata() async {
    final metaProvider = new MetadataProvider();
    var result = await metaProvider.fetchMetadataFromApi();
    setState(() {
      meta = result;
    });
  }

  @override
  void initState() {
    getMetadata();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Text('Filter'),
              Expanded(
                child: TextField(
                  onEditingComplete: () {},
                  onSubmitted: (value) {
                    filter = value;
                    print(filter.toString());
                  },
                ),
              ),
              RaisedButton(
                  child: Text('apply'),
                  onPressed: () {
                    setState(() {
                      print(filter.toString());
                      filter = filter;
                    });
                  }),
                  RaisedButton(
              child: Text('reset'),
              onPressed: () {
                setState(() {
                  filter = "";
                });
              }),
            ],
          ),
          
          dataTableBuild(meta),
        ],
      ),
    ));
  }

  SingleChildScrollView dataTableBuild(Metadata metad) {
    List<String> securities =
        meta.Securities.where((a) => a.contains(filter)).toList();
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        child: DataTable(
            columns: <DataColumn>[
              DataColumn(
                  label: Text("Securites"),
                  numeric: false,
                  onSort: (i, b) {
                    setState(() {
                      securities.sort((a, b) => a.compareTo(b));
                    });
                  })
            ],
            rows: securities
                .map((security) => DataRow(
                      cells: <DataCell>[DataCell(Text(security))],
                    ))
                .toList()),
      ),
    );
  }
}

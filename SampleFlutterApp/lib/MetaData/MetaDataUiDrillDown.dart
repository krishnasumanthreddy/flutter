import 'dart:async';
import 'package:emfa/MetaData/MetaDataProvider.dart';
import 'package:flutter/material.dart';
import 'package:emfa/MetaData/MetaDataModel.dart';


class MetaDataDrillDownWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MetaDataDrillDownState();
  }
}

class _MetaDataDrillDownState extends State {
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
              Text('Name'),
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
    print(filter+ "from table");
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        child: DataTable(
            columns: <DataColumn>[
              DataColumn(
                  label: Text("DataType"),
                  numeric: false,
                  onSort: (i, b) {
                    setState(() {
                      metad.BlotCols.sort((a, b) => a.DataType.compareTo(b.DataType));
                    });
                  }),
                  DataColumn(
                  label: Text("Name"),
                  numeric: false,
                  onSort: (i, b) {
                    setState(() {
                      metad.BlotCols.sort((a, b) => a.Name.compareTo(b.Name));
                    });
                  }),
                  DataColumn(
                  label: Text("CanBeSummarized"),
                  numeric: false,
                  onSort: (i, b) {
                    setState(() {
                      metad.BlotCols.sort((a, b) => a.Name.compareTo(b.Name));
                    });
                  }),
                  
                 
            ],
            rows: metad.BlotCols.where((x) => x.Name.contains(filter)).toList().map((blotcol) => DataRow(
                  cells: <DataCell>[
                    DataCell(Text(blotcol.DataType)),
                    DataCell(Text(blotcol.Name)),
                    DataCell(Text(blotcol.CanBeSummarized.toString())),
                  ],
                )).toList()),
      ),
    );
  }
}

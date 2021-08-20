class Metadata {
  List<String> Currencies = [];
  List<String> Securities = [];
  List<_BlotterColumn> BlotCols = [];

  Metadata()
  {}
  
  Metadata.fromJson(Map<String, dynamic> parsedJson) {
    for (String currency in parsedJson["Currencies"]) {
      Currencies.add(currency);
    }
    for (String security in parsedJson["Securities"]) {
      Securities.add(security);
    }
    for (int i = 0; i < parsedJson["DrillDownColumns"].length; i++) {
      BlotCols.add(_BlotterColumn(
        Name: parsedJson["DrillDownColumns"][i]["Name"],
        CanBeSummarized: parsedJson["DrillDownColumns"][i]["CanBeSummarized"],
        DataType: parsedJson["DrillDownColumns"][i]["DataType"],
        ModifiedOnPrice: parsedJson["DrillDownColumns"][i]["ModifiedOnPrice"],
      ));
    }
  }
}

class _BlotterColumn {
  String DataType;
  String Name;
  bool CanBeSummarized;
  bool ModifiedOnPrice;

  _BlotterColumn(
      {this.Name, this.DataType, this.CanBeSummarized, this.ModifiedOnPrice});
}

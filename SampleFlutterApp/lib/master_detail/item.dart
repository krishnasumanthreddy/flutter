import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:emfa/login.dart';
import 'package:emfa/blotter.dart';
import 'package:emfa/MetaData/MetaDataUI.dart';
import 'package:emfa/MetaData/MetaDataUiDrillDown.dart';

class Item{
  final String title;
  final String subtitle;
  StatefulWidget object;
  Item({@required this.title, @required this.subtitle, this.object});
}

final List<Item> items = <Item>[
  // Item(
  //   title: 'Star Wars',
  //   subtitle: 'This is the first item.',
  //   object : Blotter()
  // ),
  Item(
    title: 'Currencies',
    subtitle: 'This is the second item.',
    object: MetaDataWidget()
  ),
  Item(
    title: 'Securites',
    subtitle: 'This is the third item.',
    object: MetadataSecuritesWidget()
  ),
  Item(
    title: 'Drill Down',
    subtitle: 'This is the third item.',
    object: MetaDataDrillDownWidget()
  )
];
import 'package:emfa/MetaData/MetaDataUI.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:emfa/blotter.dart';

import 'package:emfa/master_detail/item.dart';

class ItemDetails extends StatelessWidget {
  ItemDetails({@required this.item});
  final Item item;

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final Widget content  = item.object;
    // Column(
    //   mainAxisAlignment: MainAxisAlignment.center,
    //   children: [
    //     // Text(
    //     //   //? and ?? are used to detect null and display and alternate message
    //     //   item?.title ?? 'no item selected',
    //     //   style: textTheme.headline,
    //     // ),
    //     // Text(
    //     //   item?.subtitle ?? 'please select an item',
    //     //   style: textTheme.subhead,
    //     // ),
    //      Blotter()
    //   ],
    // );

    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
      ),
      body: item?.object ?? Text('no item selected'),//item.object//Center(child: content),
    );
  }
}

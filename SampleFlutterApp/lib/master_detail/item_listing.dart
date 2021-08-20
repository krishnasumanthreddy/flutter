import 'package:emfa/master_detail/item_details.dart';
import 'package:emfa/master_detail/item.dart';
import 'package:flutter/material.dart';
import 'package:emfa/master_detail/master_detail_container.dart';

class ItemListing extends StatelessWidget {
final ValueChanged<Item> itemSelectedCallback;

ItemListing({@required this.itemSelectedCallback});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Master-detail flow sample'),
      // ),
      body: ListView(
        children: items.map((item) {
          return ListTile(
            title: Text(item.title),
            onTap: () => itemSelectedCallback(item),
          );
        }).toList(),
      ),
    );
  }
}
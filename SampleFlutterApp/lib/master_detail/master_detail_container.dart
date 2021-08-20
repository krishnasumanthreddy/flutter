
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:emfa/master_detail/item_details.dart';
import 'package:emfa/master_detail/item_listing.dart';
import 'package:emfa/master_detail/item.dart';

class MasterDetailContainer extends StatefulWidget
{
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MasterDetailContainerState();
  }
}

class _MasterDetailContainerState extends State<MasterDetailContainer>
{


  Item _selectedItem;

  Widget _buildMobileLayout(){
    return ItemListing(
      itemSelectedCallback : (item){
        Navigator.push(context, MaterialPageRoute(builder: (_)=>ItemDetails(item: item,)));
      }
    );
  }

  Widget _buildTabletLayout() {
    // For tablets, return a layout that has item listing on the left
    // and item details on the right.
    return Row(
      children: <Widget>[
        Flexible(
          flex: 1, 
          child: ItemListing(
            // Instead of pushing a new route here, we update
            // the currently selected item, which is a part of
            // our state now.
            itemSelectedCallback: (item) {
              setState(() {
                _selectedItem = item;
              });
            },
          ),
        ),
        Flexible(
          flex: 3,
          child: ItemDetails(
            // The item details just blindly accepts whichever
            // item we throw in its way, just like before.
            item: _selectedItem,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
double height = MediaQuery.of(context).size.height;
    // The equivalent of the "smallestWidth" qualifier on Android.
var shortestSide = MediaQuery.of(context).size.shortestSide;

// Determine if we should use mobile layout or not. The 
// number 600 here is a common breakpoint for a typical 
// 7-inch tablet.
final bool useMobileLayout = width < 400;
    if (useMobileLayout) {
      return _buildMobileLayout();
    }

    return _buildTabletLayout();
  }
}


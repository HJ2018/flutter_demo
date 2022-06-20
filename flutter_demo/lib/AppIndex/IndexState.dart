import 'package:flutter/material.dart';
import 'package:flutter_demo/Pages/FourPage/four.dart';
import 'package:flutter_demo/Pages/OnePage/one/one_view.dart';
import 'package:flutter_demo/Pages/ThreePage/three.dart';
import 'package:flutter_demo/Pages/TwoPage/two.dart';

class IndexState {

  /// 页面放到数组中
  /// EssencePageWidget
  /// InheritedWidgetTestContainer
  late List<Widget> listController;


  ///appTabrList
  late List<Map> appBarList;


  /// itme
  late List<BottomNavigationBarItem>  item;


  IndexState() {
    ///Initialize variables

    listController = [twoWidget(), twoWidget(), threeWidget(), fourWidget(),];

    appBarList = const [
      {"title":"title1", "icon":Icon(Icons.home)},
      {"title":"title2", "icon":Icon(Icons.reorder_rounded)},
      {"title":"title3", "icon":Icon(Icons.image_aspect_ratio)},
      {"title":"title4", "icon":Icon(Icons.account_circle)},
    ];

    item = appBarList.map((name) {
      return   BottomNavigationBarItem(
        icon: name["icon"],
        label: name["title"],
      );
    }).toList();

  }
}

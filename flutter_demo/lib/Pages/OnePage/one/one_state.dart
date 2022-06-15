import 'package:flutter/material.dart';
import 'package:basewidget/BaseTool.dart';
import 'package:basewidget/BaseTool.dart';
class OneState {


  ///tabs[TabController]
  late TabController? tabController;

  ///topName
  List? nameList;

  ///tabs[Title] 名字
  List<Widget>? tabs;

  ///tabs[tabBarView] tabsView
 late List<Widget>? tabBarView;


  OneState() {
    ///Initialize variables
    nameList = ["全部","视频","声音","图片","段子"];


    tabs = nameList?.map((name) {
      return Tab( text:name);
    }).toList();

    /// tabBar[title] name
    tabBarView =  [
      FlowDemo(), const Text("视频"),
      const Text("声音"),const Text("图片"),const Text("段子")
    ];

  }
}

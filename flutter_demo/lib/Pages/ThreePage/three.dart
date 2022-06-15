import 'package:flutter/material.dart';
import 'package:basewidget/BaseTool.dart';

class threeWidget extends BaseStateless {

  threeWidget({Key? key}) : super(key: key,appTitle: "title3",isBack: true);


  @override
  // TODO: implement backgroundColor
  Color get navBgColor => Colors.blueAccent;


  @override
  Widget initBody(BuildContext context) {
    // TODO: implement initBody
    return const Text("data");
  }
}

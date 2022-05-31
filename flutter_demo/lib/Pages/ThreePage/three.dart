import 'package:flutter/material.dart';
import 'package:flutter_demo/AppTool/Base/BaseWidget/BaseStateless.dart';


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

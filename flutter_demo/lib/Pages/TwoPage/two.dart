import 'package:flutter/material.dart';
import 'package:flutter_demo/AppTool/Base/BaseWidget/BaseStateless.dart';


class twoWidget extends BaseStateless {


  twoWidget({Key? key}) : super(key: key,appTitle: "title2",isBack: false);


  @override
  Widget initBody(BuildContext context) {
    // TODO: implement initBody
    return const Text("data");
  }

}

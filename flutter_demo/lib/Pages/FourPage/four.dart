import 'package:flutter/material.dart';
import 'package:flutter_demo/AppTool/Base/BaseWidget/BaseStateless.dart';


class fourWidget extends BaseStateless {


   fourWidget({Key? key}) : super(key: key,appTitle: "title4",isBack: false);




  @override
  Widget initBody(BuildContext context) {
    // TODO: implement initBody
    return const Text("data");
  }
}

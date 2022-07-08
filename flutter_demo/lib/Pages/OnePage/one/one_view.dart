import 'package:flutter/material.dart';
import 'package:basewidget/BaseTool.dart';
import 'package:get/get.dart';

import 'one_logic.dart';
import 'one_widget.dart';

class OneWidget extends BaseStateless {


  final logic = Get.put(OneLogic());
  final state = Get.find<OneLogic>().state;

   OneWidget({Key? key}) : super(key: key,appTitle: "二维码",isBack: false);


  /// 导航栏单独设置颜色
  @override
  // TODO: implement backgroundColor
  Color get navBgColor => Colors.green;



  @override
  // TODO: implement bottom
  PreferredSizeWidget? get bottom => essenceTabBarBottom(state);



  @override
  Widget initBody(BuildContext context) {
    // TODO: implement initBody
    return essenceContent(state);
  }
}


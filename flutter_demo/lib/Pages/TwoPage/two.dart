import 'package:flutter/material.dart';
import 'package:basewidget/BaseTool.dart';
import 'package:get/get.dart';

import 'Setting/setting_page/view.dart';
class twoWidget extends BaseStateless {


  twoWidget({Key? key}) : super(key: key,appTitle: "title2",isBack: false);


  @override
  Widget initBody(BuildContext context) {
    // TODO: implement initBody
    return InkWell(
      onTap: (){

        Get.to(() => SettingPageWidget());
      },
      child: const SizedBox(
        width: 100,height: 100,
        child: Text("data"),
      ),
    );
  }

}

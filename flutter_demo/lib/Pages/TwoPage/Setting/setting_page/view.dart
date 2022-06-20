import 'package:flutter/material.dart';
import 'package:flutter_demo/Pages/TwoPage/Setting/setting_page/widget.dart';
import 'package:get/get.dart';

import 'logic.dart';
import '../setting_base/BaseWidget/BaseStateless.dart';

class SettingPageWidget extends BaseStateless {

  final logic = Get.put(SettingPageLogic());

   SettingPageWidget({Key? key}) : super(key: key,appTitle: "设置");


  @override
  Widget initBody(BuildContext context) {
    // TODO: implement initBody
    return settingListView(logic, (name){


      print("点击了===$name");

      if(name == "姓名"){
        // 点击修改
        logic.titleName.value = "132232wqq";
      }
      if(name == "手机号"){
        // 点击修改
        logic.phoneNumber.value = "54656565";
      }
      if(name == "收货地址"){
        // 点击修改
        logic.address.value = "合肥市";
      }
    });
  }
}

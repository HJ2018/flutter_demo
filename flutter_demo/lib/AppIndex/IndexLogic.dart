import 'package:flutter/material.dart';
import 'package:basewidget/BaseTool.dart';
import 'package:get/get.dart';

import 'IndexState.dart';

class NewPageLogic extends GetxController with GetSingleTickerProviderStateMixin {
  final IndexState state = IndexState();


  /// 默认选择第一个页面[精华]
  var taBarIdx = 0.obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();


    /// 统一设置导航栏颜色
    BarConfig.instance.config.navBgColor = Colors.red;
  }


  /// navigationBar设置
  Widget navigationBar(){

   return BottomNavigationBar(
    onTap: (int index) => taBarIdx.value = index,
    currentIndex: taBarIdx.value,
     selectedFontSize: 12,
     unselectedFontSize: 12,
     selectedItemColor: Colors.red,
    type: BottomNavigationBarType.fixed,
    items: state.item,);

  }

}

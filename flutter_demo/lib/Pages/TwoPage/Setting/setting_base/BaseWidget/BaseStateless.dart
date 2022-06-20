import 'package:flutter/material.dart';

import '../BaseTabBar/BaseAppBar.dart';
import '../BaseTabBar/Config.dart';

abstract class BaseStateless extends StatelessWidget with appBarSetting{


  final String? appTitle;

  final bool isBack;
  ///构造函数
   BaseStateless({Key? key, this.appTitle ="",this.isBack = true}) : super(key: key);





  ///build
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:baseAppBar(
        context,

        /// appBarTitle
        appTitle!,

        ///是否显示返回按钮
        isBack: isBack,

        /// elevation
        elevation: elevation,

        ///右边多个按钮
        rightActions: rightActions,

        ///左边多个按钮
        leftItem: leftItem,

        ///右边的按钮文字
        rightText: rightText,

        ///右边的文字颜色
        rightTextColor: rightTextColor,

        ///右边的图片图片路径
        rightImgPath: rightImgPath,

        ///右边按钮点击事件
        rightItemCallBack: rightItemCallBack,

        ///返回按钮点击事件
        backCallBack: backCallBack,

        ///背景颜色
        backgroundColor:navBgColor,
        // (navBgColor !=Colors.white)?navBgColor:BarConfig.instance.config.navBgColor,

        /// brightness
        brightness: brightness,

        ///底部的PreferredSize
        bottom: bottom,
      ),
      body:initBody(context),
    );
  }

  ///界面构建
  Widget initBody(BuildContext context);


}



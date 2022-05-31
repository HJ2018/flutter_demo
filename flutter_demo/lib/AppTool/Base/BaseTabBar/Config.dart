import 'package:flutter/material.dart';


// ignore: camel_case_types
class appBarSetting{

   String baseTitle = "";

   String rightImgPath = "";

   double elevation = 0;

   Color navBgColor = Colors.white;

   Brightness brightness =  Brightness.light;

   String? rightText = "";

   Color rightTextColor = Colors.white;


   PreferredSizeWidget? get bottom => null;

   Function? get backCallBack => null;

   Function? get rightItemCallBack => null;

   Widget? get leftItem => null;

   List<Widget>? get rightActions => null;


}

class BarConfig{

   late appBarSetting config;

   static BarConfig? _instance;

   factory BarConfig() => instance;

   static BarConfig get instance => _instance ??= BarConfig._internal();

   BarConfig._internal() {
      ///初始化一些参数统一设置
      config = appBarSetting();

   }

}

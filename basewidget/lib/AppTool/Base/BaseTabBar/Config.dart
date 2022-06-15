import 'package:flutter/material.dart';


// ignore: must_be_immutable, camel_case_types
class appBarSetting{

   final String baseTitle = "";

   final String rightImgPath = "";

   final double elevation = 0;

   final Brightness brightness =  Brightness.light;

   final String? rightText = "";

   final Color rightTextColor = Colors.white;

   final Color navBgColor = Colors.white;

   PreferredSizeWidget? get bottom => null;

   Function? get backCallBack => null;

   Function? get rightItemCallBack => null;

   Widget? get leftItem => null;

   List<Widget>? get rightActions => null;


}


class BarConfig{


   Color navBgColor = Colors.white;


   late BarConfig config;

   static BarConfig? _instance;

   factory BarConfig() => instance;

   static BarConfig get instance => _instance ??= BarConfig._internal();

   BarConfig._internal() {
      ///初始化一些参数统一设置
      config = BarConfig();
   }

}

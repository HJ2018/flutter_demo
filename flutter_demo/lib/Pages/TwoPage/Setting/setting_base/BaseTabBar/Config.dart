import 'package:flutter/material.dart';


// ignore: must_be_immutable, camel_case_types
class appBarSetting{


   /// 重写set方法设置属性
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

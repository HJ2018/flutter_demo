
import 'package:flutter/material.dart';
import 'package:flutter_demo/AppIndex/IndexPage.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';


/// 进入APP
Widget appHome(){

  return indexWidget();
}



/// TransitionBuilder Scaffold
Widget appBuilder(child){
  return Scaffold(
    body:pluginBuilder(child),
  );
}


/// flutter_smart_dialog插件
Widget pluginBuilder(child){

  return FlutterSmartDialog(
    child:  child,
  );
}








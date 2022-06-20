import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'AppMain.dart';

class MyApp extends GetMaterialApp{

  const MyApp({Key? key}) : super(key: key);


  @override
  // TODO: implement home
  Widget? get home => appHome();


  @override
  // TODO: implement builder
  TransitionBuilder? get builder => (context, child) => appBuilder(child);

}


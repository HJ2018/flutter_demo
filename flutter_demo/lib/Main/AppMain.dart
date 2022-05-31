
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















///===================================

class Person {
  eat() {
    print('Person eat');
  }
}

class Dance {


  dance() {
    print('Dance dance');
  }
}

class Sing {
  sing() {
    print('Sing sing');
  }
}

mixin Code on Person{

  @override
  eat() {
    // TODO: implement eat
    super.eat();

  }

  code() {
    print('Code code');
  }
}




class A extends Person with Dance, Sing {}

class B extends Person with Sing, Code {}

class C extends Person with Code, Dance {}


// class Dog with Code{
//
// }













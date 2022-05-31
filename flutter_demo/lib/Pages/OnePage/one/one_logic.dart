import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'one_state.dart';

class OneLogic extends GetxController with GetSingleTickerProviderStateMixin{
  final OneState state = OneState();


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    state.tabController = TabController(length: state.tabs!.length, vsync: this);

  }

}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'IndexLogic.dart';

class indexWidget extends StatelessWidget {


  final logic = Get.put(NewPageLogic());
  final state = Get.find<NewPageLogic>().state;

   indexWidget({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Obx(() {
      return Scaffold(
        body: IndexedStack(
          index: logic.taBarIdx.value,
          children: state.listController,
        ),
        bottomNavigationBar: logic.navigationBar(),
      );
    });
  }


}

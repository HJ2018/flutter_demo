
import '../setting_base/BaseWidget/TextTool.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'logic.dart';

/// setting Page ListView
Widget settingListView(SettingPageLogic logic,callBackName){

  return ListView(
    children: listChild(callBackName,logic),
  );
}


List<Widget> listChild(callBackName,logic){

  logic.state.cellMap.forEach((key, value) {
    logic.state.childList.add(childWidget(logic,key,value,callBackName));
  });
  return logic.state.childList;
}


/// cell
Widget childWidget(logic,String name,value,callBackName){
  return  Container(
    color: Colors.white,
    child:  Column(
      children: [
        ListTile(
          onTap: (){ callBackName(name);},
          title: TextTool.textTitle(name,color: const Color(0xff333333)),
          contentPadding: const EdgeInsets.only(left: 15,right: 5),
          trailing:trailingWidget(name,value,logic),
        ),
        HorizontalLine(dashedWidth: Get.width - (logic.state.groupList.contains(name)?0:20),
          dashedHeight: logic.state.groupList.contains(name)?10.0:0.5,
          color:  logic.state.groupList.contains(name)?const Color(0xffF4F5F6):const Color(0xffCACBCC) ,
        )
      ],
    ),
  );
}


/// trailing
Widget trailingWidget(titleName,detailsValue,SettingPageLogic logic){
  return SizedBox(
    width: Get.width - 150,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        (detailsValue is RxString)? Obx(() {
          return TextTool.textTitle(detailsValue.value,color: Colors.grey);
        })
        :TextTool.textTitle( detailsValue,color: Colors.grey),
        (titleName == "姓名")?Container():const Icon(Icons.keyboard_arrow_right,color: Color(0xff999999),)
      ],
    ),
  );
}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:basewidget/BaseTool.dart';
import 'package:flutter_demo/Pages/ThreePage/select_scanner_style_page.dart';

import 'creator_page.dart';

class ThreeWidget extends BaseStateless {

  ThreeWidget({Key? key}) : super(key: key,appTitle: "扫码二维码",isBack: true);


  @override
  // TODO: implement backgroundColor
  Color get navBgColor => Colors.blueAccent;


  @override
  Widget initBody(BuildContext context) {
    // TODO: implement initBody
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: () {
                    //跳转页面=扫描二维码
                    // Airoute.pushNamed(
                    //   routeName: "/SelectScannerStylePage",
                    // );
                    Navigator.push(context, CupertinoPageRoute(builder: (context){
                      return SelectScannerStylePage();//状态变更
                    }));
                  },
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: const Text("Scan 1D barcode/QR code"),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  onPressed: () {
                    //跳转页面=生成二维码
                    // Airoute.pushNamed(
                    //   routeName: "/CreatorPage",
                    // );

                    Navigator.push(context, CupertinoPageRoute(builder: (context){
                      return CreatorPage();//状态变更
                    }));
                  },
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: const Text("Create QR code"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



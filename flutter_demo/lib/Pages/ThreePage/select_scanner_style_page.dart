import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_size_scanner_page.dart';
import 'full_screen_scanner_page.dart';

///
/// SelectScannerStylePage
class SelectScannerStylePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SelectScannerStyleState();
  }
}

///
/// _SelectScannerStyleState
class _SelectScannerStyleState extends State<SelectScannerStylePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Scanner Style"),
      ),
      body: Row(
        children: <Widget>[
          Spacer(),
          Column(
            children: <Widget>[
              Spacer(),
              RaisedButton(
                onPressed: () {
                  // Airoute.pushNamed(routeName: "/FullScreenScannerPage");

                  Navigator.push(context, CupertinoPageRoute(builder: (context){
                    return FullScreenScannerPage();//状态变更
                  }));
                },
                child: Text("FullScreen Style"),
                textTheme: ButtonTextTheme.accent,
              ),
              RaisedButton(
                onPressed: () {
                  // Airoute.pushNamed(routeName: "/CustomSizeScannerPage");

                  Navigator.push(context, CupertinoPageRoute(builder: (context){
                    return CustomSizeScannerPage();//状态变更
                  }));
                },
                child: Text("CustomSize Style"),
                textTheme: ButtonTextTheme.accent,
              ),
              Spacer(),
            ],
          ),
          Spacer(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ai_barcode/ai_barcode.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';

class TestingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TestingState();
  }
}

class _TestingState extends State<TestingPage> {
  ScannerController? _scannerController;

  @override
  void initState() {
    super.initState();
    _scannerController = ScannerController(scannerResult: (result) {
      //关闭识别
      _scannerController?.stopCameraPreview();
      //提示信息
      // Airoute.push(
      //   route: AwesomeMessageRoute(
      //     awesomeMessage: AwesomeHelper.createAwesome(
      //         title: "Detect result", message: "$result"),
      //     theme: null,
      //     settings: RouteSettings(name: "/messageRouteName"),
      //   ),
      // );

      SmartDialog.showToast("错误===$result");
      print("object=====$result");


      //打开识别
      _scannerController?.startCameraPreview();
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scannerController = null;
  }

  _startPreview() async {
    String result = await _scannerController?.startCameraPreview();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TestingWebFeature"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            MaterialButton(
              onPressed: () {
                _scannerController?.startCamera();
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("Start camera"),
            ),
            MaterialButton(
              onPressed: () {
                _startPreview();
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("Start camera preview"),
            ),
            MaterialButton(
              onPressed: () {
                //停止相机预览
                _scannerController?.stopCameraPreview();
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("Stop camera preview"),
            ),
            MaterialButton(
              onPressed: () {
                //释放相机
                _scannerController?.stopCamera();
              },
              textColor: Colors.white,
              color: Colors.blue,
              child: Text("Stop/Release camera"),
            ),
            Container(
              width: 750,
              height: 750,
              child: PlatformAiBarcodeScannerWidget(
                platformScannerController: _scannerController!,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


import 'dart:convert';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'dio_utils.dart';

typedef Success<T> = Function(T data);
typedef Fail = Function(int code);

class HttpUtils {

  //get 请求
  static void get<T>(
    String url,
    parameters, {
    Success? success,
    Fail? fail,
  }) {
    _request(Method.GET, url, parameters, success: success!, fail: fail!);
  }

  //post 请求
  static void post<T>(
    String url,
    parameters, {
    bool isUploadFile = false,
    Success? success,
    Fail? fail,
  }) {
    _request(Method.POST, url, parameters, isUploadFile: isUploadFile, success: success!, fail: fail!);
  }

  //_request 请求
  static void _request<T>(
    Method method,
    String url,
    parameters, {
      bool isUploadFile = false,
      Success? success,
      Fail? fail,
    }
  ) {
    DioUtils.request(method, url, parameters, isUploadFile: isUploadFile, success: (result) {
      if(result is String){
        result = jsonDecode(result);
      }
      // print("返回：$result");

      bool isSucc = result['code']==200 || result['code']=="200";
      if (isSucc) {

        SmartDialog.dismiss();

        if (success != null) {
          success(result);
        }
      } else {

        SmartDialog.dismiss();
        Future.delayed(Duration.zero,(){
          SmartDialog.showToast("错误");
        });
      }

    }, fail: (code, msg) {
      if (fail != null) {
        fail(code);
      }
    });
  }



  ///=====================================================



  //get 请求
  static void getData<T>(
      String url,
      parameters, {
        var model,
        bool? showHUD,
        bool? hideHUD ,
        Success? success,
        Fail? fail,
      }) {
    _newRequest(Method.GET, url, parameters,model:model, showHUD: showHUD!,hideHUD: hideHUD!,success: success!, fail: fail!);
  }

  //post 请求
  static void postData<T>(
      String url,
      parameters, {
        var model,
        bool? showHUD,
        bool? hideHUD ,
        Success? success,
        Fail? fail,
      }) {
    _newRequest(Method.POST, url, parameters,model:model, showHUD: showHUD!,hideHUD: hideHUD!,success: success!, fail: fail!);
  }


  //_request 请求
  static void _newRequest<T>(
      Method method,
      String url,
      parameters, {
        var model,
        bool? showHUD,
        bool? hideHUD ,
        Success? success,
        Fail? fail,
      }) {
    DioUtils.request(method, url, parameters, success: (result) {

      if(hideHUD!){
        SmartDialog.dismiss();
      }
      if(result is String){
        result = jsonDecode(result);
      }
      bool isSucc = result['code']==200 || result['code']=="200";
      if (isSucc) {
        if (success != null) {
          Map<String, dynamic> json = Map<String, dynamic>.from(result);
          // print(model.runtimeType);
          // var obj = model.runtimeType;
          // model.fromJson(json);
          success(json);
        }
      } else {
        Future.delayed(Duration.zero,(){
          SmartDialog.showToast("错误");
        });
      }

      print("返回：$result");


    }, fail: (code, msg) {
      if (fail != null) {
        if(hideHUD!){
          SmartDialog.dismiss();
        }
        fail(code);
      }
    },showHUD: showHUD);
  }
}





import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_demo/API/apis.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'error_handle.dart';


const int _connectTimeout = 300000; //15s 默认15000 修改了300000
const int _receiveTimeout = 300000;// 默认15000 修改了300000
const int _sendTimeout = 10000;
const int _sendFileTimeout = 120000;

typedef Success<T> = Function(T data);
typedef Fail = Function(int code, String msg);
//typedef SuccessListCallback<T> = Function(List<T> data);

class DioUtils {

  static Dio? _dio;
  static Dio? _dioFile;
  static String? tenantId;

  // 创建 dio 实例对象
  static Dio createInstance() {
    if (_dio == null) {
      var options = getOptions(_connectTimeout, _receiveTimeout, _sendTimeout);
      _dio =  Dio(options);
    }
    return _dio!;
  }

  static Dio createInstanceFile() {
    if (_dioFile == null) {
      var options = getOptions(_connectTimeout, _receiveTimeout, _sendFileTimeout);
      _dioFile =  Dio(options);
    }
    return _dioFile!;
  }

  static BaseOptions getOptions(int connectTimeout, int receiveTimeout, int sendTimeout){


    httpHeaders["token"] = "key";

    // 全局属性：请求前缀、连接超时时间、响应超时时间
    var options = BaseOptions(
      /// 请求的Content-Type，默认值是"application/json; charset=utf-8".
      /// 如果您想以"application/x-www-form-urlencoded"格式编码请求数据,
      /// 可以设置此选项为 `Headers.formUrlEncodedContentType`,  这样[Dio]就会自动编码请求体.
//        contentType: Headers.formUrlEncodedContentType, // 适用于post form表单提交
      responseType: ResponseType.json,
      validateStatus: (status) {
        // 不使用http状态码判断状态，使用AdapterInterceptor来处理（适用于标准REST风格）
        return true;
      },
      baseUrl: APIs.apiPrefix,
      headers: httpHeaders,
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      sendTimeout: sendTimeout,
    );
    return options;
  }

  // 清空 dio 对象
  static clear() {
    _dio = null;
    _dioFile = null;
  }

  // 请求，返回参数为 T
  // method：请求方法，Method.POST等
  // path：请求地址
  // params：请求参数
  // success：请求成功回调
  // error：请求失败回调
  static Future request<T>(Method method, String path, dynamic params,
      { Success? success, Fail? fail, bool? showHUD, bool isUploadFile = false}) async {
    try {
      //没有网络
      var connectivityResult = await ( Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {

        _onError(ExceptionHandle.net_error, '网络异常，请检查你的网络！', fail!);
        return;
      }
      if(showHUD ==true){
        SmartDialog.showLoading();
      }
      Dio _dio = isUploadFile?createInstanceFile():createInstance();
      //print(_dio.options.headers);

      var data;
      var queryParameters;
      if (method == Method.GET) {
        queryParameters = params;
      }
      if (method == Method.POST) {
        data = params;
      }
      Response response = await _dio.request(path,
          data: data,
          queryParameters: queryParameters,
          options: Options(method: MethodValues[method]));
      if (response != null) {
        success!(response.data);
      } else {
        _onError(ExceptionHandle.unknown_error, '未知错误', fail!);
      }
    } on DioError catch (e) {
      print('请求出错：' + e.toString());

      final NetError netError = ExceptionHandle.handleException(e);
      _onError(netError.code, netError.msg, fail!);
    }
  }


}

/// 自定义Header
 Map<String, dynamic> httpHeaders = {
  'Accept': 'application/json,*/*',
  'Content-Type': 'application/json',
  'token': "",
};


void _onError(int code, String msg, Fail fail) {
  if (code == null) {
    code = ExceptionHandle.unknown_error;
    msg = '未知异常';
  }
  //TODO 请求打印
  print('接口请求异常： code: $code, msg: $msg');

  fail(code, msg);
}

Map<String, dynamic> parseData(String data) {
  return json.decode(data) as Map<String, dynamic>;
}

// ignore: constant_identifier_names
enum Method { GET, POST, DELETE, PUT, PATCH, HEAD }
//使用：MethodValues[Method.POST]
// ignore: constant_identifier_names
const MethodValues = {
  Method.GET: "get",
  Method.POST: "post",
  Method.DELETE: "delete",
  Method.PUT: "put",
  Method.PATCH: "patch",
  Method.HEAD: "head",
};

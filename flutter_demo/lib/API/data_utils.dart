
import 'package:basewidget/BaseTool.dart';

import 'apis.dart';

typedef Success<T> = Function(T data);
typedef Fail = Function(int code);

class DataUtils {


  /// POST方法
  static void postReq<T>(
      parameters,
      url, {
        Success? success,
        Fail? fail,
        var model,///运行时类型获取调用方法不行 后面试试其他方法,暂时不传
        bool? showHUD = true,
        bool? hideHUD = true,
      }) {
    HttpUtils.postData(url, parameters, showHUD:showHUD,hideHUD: hideHUD,success: success!, fail: fail!);
  }



  /// GET方法
  static void getReq<T>(
      parameters,
      url, {
        Success? success,
        Fail? fail,
        var model,///运行时类型获取调用方法不行 后面试试其他方法,暂时不传
        bool? showHUD = true,
        bool? hideHUD = true,
      }) {
    HttpUtils.getData(url, parameters, showHUD:showHUD,hideHUD: hideHUD,success: success!, fail: fail!);
  }

  ///单独定义每一个接口

  //登录
  static void login<T>(
    parameters, {
    Success? success,
    Fail? fail,
  }) {
    HttpUtils.post(APIs.login, parameters, success: success!, fail: fail!);
  }

  //分页加载数据
  static void getPageList<T>(
    parameters, {
    Success? success,
    Fail? fail,
  }) {
    HttpUtils.get(APIs.getPage, parameters, success: success!, fail: fail!);
  }

  //分页加载分组数据
  static void getPageGroupList<T>(
    parameters, {
    Success? success,
    Fail? fail,
  }) {
    HttpUtils.get(APIs.getGroupPage, parameters, success: success!, fail: fail!);
  }
}

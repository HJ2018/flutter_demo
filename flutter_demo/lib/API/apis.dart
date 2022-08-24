
class APIs {
  //url 前缀
  static const String apiPrefix =
      "https://www.fastmock.site/mock/1010b262a743f0b06c565c7a31ee9739/root";

  //登录接口
  static String login = "/login";

  //获取分页数据
  static String getPage = "/mock/pages";

  //获取分页分组数据
  static String getGroupPage = "/mock/groupPages";

  //获取固定数据
  static String getSimpleArrDic = "/getSimpleArrDic";
}

///接口类型可以通过枚举来定义
// enum APIType {
//   Login,
//   GetPage,
// }
// //使用：APITypeValues[APIType.Login]
// const APITypeValues = {
//   APIType.Login: "/login",
//   APIType.GetPage: "/getPageArrDic"
// };


class PrintManager {

  Completer<String> _completer;

  static PrintManager manager;

  static initData() {
    manager ??= PrintManager();
  }

  //打印任务
  Future<String> printe(sendMessage) async {
    _completer = Completer<String>();
    sendMessage();
    print('在等待中');
    return _completer.future;
  }

  //回调
  static void callBack() {
    if (manager._completer?.isCompleted == false) {
      print('啊 我回调了, 可以执行下一个了');
      manager._completer.complete('完成');
    }
  }
}

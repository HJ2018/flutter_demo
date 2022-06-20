import 'package:get/get.dart';
import 'state.dart';

class SettingPageLogic extends GetxController {
  final SettingPageState state = SettingPageState();



  var titleName = "1".obs;

  /// 电话号码
  var phoneNumber = "2".obs;

  /// 收货地址
  var address = "3".obs;



  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    state.cellMap = {
      "姓名":titleName,
      "手机号":phoneNumber,
      "登录密码":state.loginPassword,
      "收货地址":address,
      "专属理财师":state.exclusive,
      "微信订阅号":state.weiChaNum,
      "关于太傅":"",
      "版本信息":state.version,
      "用户服务协议":"",
      "用户隐私协议":""
    };

  }


}

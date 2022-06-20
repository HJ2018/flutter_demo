import 'package:flutter/material.dart';


typedef OnCallBack = void Function(String name);

class SettingPageState {

  /// cell
  List<Widget> childList = [];

  /// rightTitle
  List rightTitle = [];

  /// 设置分组数组
  List<String> groupList = [];


  /// 登录密码
  String loginPassword = "修改密码";

  /// 专属理财师
  String exclusive = "";

  ///微信订阅号
  String weiChaNum = "";

  ///版本
  String version = "v1.2.4";

  /// cellmap
  Map cellMap = {};


  SettingPageState() {
    ///Initialize variables

    groupList = ["收货地址", "专属理财师","微信订阅号"];

  }
}

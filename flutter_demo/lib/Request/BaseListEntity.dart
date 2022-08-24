import 'package:flutter_demo/Request/EntityFactory.dart';

class BaseListEntity<T> {
  int? code;
  String? message;
  List<T>? data;

  BaseListEntity({this.code, this.message, this.data});

  factory BaseListEntity.fromJson(json) {
    List<T> mData =  <T>[];
    if (json['data'] != null) {
      //遍历data并转换为我们传进来的类型
      for (var v in (json['data'] as List)) {
        mData.add(EntityFactory.generateOBJ<T>(v)!);
      }
    }

    return BaseListEntity(
      code: json["code"],
      message: json["msg"],
      data: mData,
    );
  }
}


class ErrorEntity {
  int? code;
  String? message;
  ErrorEntity({this.code, this.message});
}
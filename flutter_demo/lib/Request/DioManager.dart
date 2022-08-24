//
// import 'package:dio/dio.dart';
//
//
// enum NWMethod {
//   GET,
//   POST,
//   DELETE,
//   PUT
// }
// //使用：NWMethodValues[NWMethod.POST]
// const NWMethodValues = {
//   NWMethod.GET: "get",
//   NWMethod.POST: "post",
//   NWMethod.DELETE: "delete",
//   NWMethod.PUT: "put"
// };
//
// class DioManager {
//   static final DioManager _shared = DioManager._internal();
//   factory DioManager() => _shared;
//   Dio dio;
//   DioManager._internal() {
//     if (dio == null) {
//       BaseOptions options = BaseOptions(
//         baseUrl: "baseApi",
//         contentType: Headers.jsonContentType,
//         responseType: ResponseType.json,
//         receiveDataWhenStatusError: false,
//         connectTimeout: 30000,
//         receiveTimeout: 3000,
//       );
//       dio = Dio(options);
//     }
//   }
// }
//
//
//
// // 请求，返回参数为 T
// // method：请求方法，NWMethod.POST等
// // path：请求地址
// // params：请求参数
// // success：请求成功回调
// // error：请求失败回调
// Future request<T>(NWMethod method, String path, {Map<String, dynamic> params, Function(T) success, Function(ErrorEntity) error}) async {
//   try {
//     Response response = await dio.request(path, queryParameters: params, options: Options(method: NWMethodValues[method]));
//     if (response != null) {
//       BaseEntity entity = BaseEntity<T>.fromJson(response.data);
//       if (entity.code == 0) {
//         success(entity.data);
//       } else {
//         error(ErrorEntity(code: entity.code, message: entity.message));
//       }
//     } else {
//       error(ErrorEntity(code: -1, message: "未知错误"));
//     }
//   } on DioError catch(e) {
//     error(createErrorEntity(e));
//   }
// }
//
// // 请求，返回参数为 List<T>
// // method：请求方法，NWMethod.POST等
// // path：请求地址
// // params：请求参数
// // success：请求成功回调
// // error：请求失败回调
// Future requestList<T>(NWMethod method, String path, {Map<String, dynamic> params, Function(List<T>) success, Function(ErrorEntity) error}) async {
//   try {
//     Response response = await dio.request(path, queryParameters: params, options: Options(method: NWMethodValues[method]));
//     if (response != null) {
//       BaseListEntity entity = BaseListEntity<T>.fromJson(response.data);
//       if (entity.code == 0) {
//         success(entity.data);
//       } else {
//         error(ErrorEntity(code: entity.code, message: entity.message));
//       }
//     } else {
//       error(ErrorEntity(code: -1, message: "未知错误"));
//     }
//   } on DioError catch(e) {
//     error(createErrorEntity(e));
//   }
// }
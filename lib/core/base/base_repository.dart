// import 'package:app_soslocalizapet/core/base/remote/http_client.dart';
// import 'package:app_soslocalizapet/core/flavor/app_flavors.dart';
// import 'package:flutter_modular/flutter_modular.dart';

// import 'base_response_api.dart';

// class BaseRepository {
//   String get baseUrl => appFlavor!.baseUrl;

//   Future<BaseResponseAPI> post<T>(String baseUrl, String endpoint,
//       {Map<String, dynamic>? data, dynamic queryParameters}) async {
//     return Modular.get<IHttpClient>().post(
//       baseUrl: baseUrl,
//       endpoint: endpoint,
//       body: data,
//     );
//   }

//   Future<BaseResponseAPI> get(String baseUrl, String endpoint,
//       {Map<String, dynamic>? headers}) async {
//     return Modular.get<IHttpClient>().get(
//       baseUrl: baseUrl,
//       endpoint: endpoint,
//       headers: headers,
//     );
//   }

//   Future<BaseResponseAPI> patch<T>(String baseUrl, String endpoint,
//       {dynamic data}) async {
//     return Modular.get<HttpClient>().patch(
//       baseUrl: baseUrl,
//       endpoint: endpoint,
//       body: data,
//     );
//   }

//   Future<BaseResponseAPI> put<T>(String baseUrl, String endpoint,
//       {dynamic data}) async {
//     return Modular.get<HttpClient>()
//         .put(baseUrl: baseUrl, endpoint: endpoint, body: data);
//   }

//   Future<BaseResponseAPI> delete<T>(String url, String? endpoint) async {
//     return Modular.get<HttpClient>().delete(baseUrl: url, endpoint: endpoint);
//   }
// }

// extension DynamicExt on Map<String, dynamic> {
//   List<dynamic> fromJson<T>(dynamic data, dynamic obj) {
//     final list = <dynamic>[];
//     for (final item in data) {
//       list.add(item.fromJson(data, obj));
//     }
//     return list;
//   }
// }

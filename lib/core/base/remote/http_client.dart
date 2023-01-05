// import 'dart:convert';
// import 'package:app_soslocalizapet/core/base/base_response_api.dart';
// import 'package:http/http.dart';

// abstract class IHttpClient {
//   Future<BaseResponseAPI> get(
//       {required String baseUrl,
//       String? endpoint,
//       Map<String, dynamic>? headers});

//   Future<BaseResponseAPI> post(
//       {required String baseUrl,
//       dynamic body,
//       String? endpoint,
//       Map<String, dynamic>? headers});

//   Future<BaseResponseAPI> put(
//       {required String baseUrl,
//       String? endpoint,
//       dynamic body,
//       Map<String, dynamic>? headers});

//   Future<BaseResponseAPI> patch(
//       {required String baseUrl,
//       String? endpoint,
//       dynamic body,
//       Map<String, dynamic>? headers});

//   Future<BaseResponseAPI> delete(
//       {required String baseUrl,
//       String? endpoint,
//       Map<String, String>? headers});
// }

// class HttpClient implements IHttpClient {
//   final Client client;
//   HttpClient(this.client);

//   @override
//   Future<BaseResponseAPI> get(
//       {required String baseUrl,
//       String? endpoint,
//       Map<String, dynamic>? headers}) async {
//     // final LoginResponse? user =
//     //     await Modular.get<ISecureStorageService>().readLoginResponse();
//     final response = await client
//         .get(Uri.parse(endpoint != null ? baseUrl + endpoint : baseUrl),
//             // headers: user != null && user.token != null
//             //     ? {HttpHeaders.authorizationHeader: "Bearer ${user.token}"}
//             headers: {});
//     final json = jsonDecode(utf8.decode(response.bodyBytes));
//     print(json);
//     if (response.statusCode >= 200 && response.statusCode <= 299) {
//       return BaseResponseAPI(
//           statusCode: response.statusCode,
//           statusMessage: json.toString(),
//           body: json);
//     } else if (response.statusCode == 401) {
//       //await Modular.get<AppController>().logout();
//       return BaseResponseAPI(
//           statusCode: response.statusCode,
//           body: json.toString(),
//           statusMessage: "Error");
//     } else {
//       print("${response.statusCode}, ${json['message']}");
//       return BaseResponseAPI(
//           statusCode: response.statusCode,
//           body: json.toString(),
//           statusMessage: "Error");
//     }
//   }

//   @override
//   Future<BaseResponseAPI> post(
//       {required String baseUrl,
//       dynamic body,
//       String? endpoint,
//       Map<String, dynamic>? headers}) async {
//     print("----------ENDPOINT---------");
//     print(endpoint != null ? baseUrl + endpoint : baseUrl);
//     final jsonBody = jsonEncode(body);
//     print("----------BODY-------------");
//     print(jsonBody);
//     print("----------RESPONSE---------");
//     // final user = await Modular.get<ISecureStorageService>().readLoginResponse();
//     final response = await client.post(
//         Uri.parse(endpoint != null ? baseUrl + endpoint : baseUrl),
//         body: jsonBody,
//         headers: // user != null && user.token != null
//             //?
//             {
//           //"Authorization": "Bearer ${user.token}",
//           "Content-Type": "application/json"
//         }
//         //: {}
//         );
//     dynamic json;
//     print(response.body);
//     print("---------------------------");
//     if (response.body.isNotEmpty) {
//       json = jsonDecode(utf8.decode(response.bodyBytes));
//     }
//     if (response.statusCode >= 200 && response.statusCode <= 299) {
//       return BaseResponseAPI(
//           statusCode: response.statusCode,
//           statusMessage: json.toString(),
//           body: json);
//     } else {
//       return BaseResponseAPI(
//           statusCode: response.statusCode, body: json, statusMessage: "Error");
//     }
//   }

//   @override
//   Future<BaseResponseAPI> put(
//       {required String baseUrl,
//       String? endpoint,
//       dynamic body,
//       Map<String, dynamic>? headers}) async {
//     print("----------ENDPOINT---------");
//     print(endpoint != null ? baseUrl + endpoint : baseUrl);
//     final jsonBody = jsonEncode(body);
//     print("----------BODY-------------");
//     print(jsonBody);
//     print("----------RESPONSE---------");
//     // final LoginResponse? user =
//     //     await Modular.get<ISecureStorageService>().readLoginResponse();
//     final response = await client.put(
//         Uri.parse(endpoint != null ? baseUrl + endpoint : baseUrl),
//         body: jsonBody,
//         headers: //user!.token != null
//             //?
//             {
//           'Content-Type': 'application/json',
//           //'Authorization': 'Bearer ${user.token}'
//         }
//         //: {}
//         );
//     dynamic json = '';
//     if (response.body.isNotEmpty) {
//       json = jsonDecode(utf8.decode(response.bodyBytes));
//     }

//     print(response.body);
//     print("---------------------------");
//     if (response.statusCode >= 200 && response.statusCode <= 299) {
//       return BaseResponseAPI(
//           statusCode: response.statusCode,
//           statusMessage: json.toString(),
//           body: json);
//     } else {
//       print("${response.statusCode}, ${json['message']}");
//       return BaseResponseAPI(
//           statusCode: response.statusCode,
//           body: json.toString(),
//           statusMessage: "Error");
//     }
//   }

//   @override
//   Future<BaseResponseAPI> patch(
//       {required String baseUrl,
//       String? endpoint,
//       dynamic body,
//       Map<String, dynamic>? headers}) async {
//     print("----------ENDPOINT---------");
//     print(endpoint != null ? baseUrl + endpoint : baseUrl);
//     final jsonBody = jsonEncode(body);
//     print("----------BODY-------------");
//     print(jsonBody);
//     print("----------RESPONSE---------");
//     // final LoginResponse? user =
//     //     await Modular.get<ISecureStorageService>().readLoginResponse();

//     final response = await client.patch(
//         Uri.parse(endpoint != null ? baseUrl + endpoint : baseUrl),
//         body: jsonBody,
//         headers: //user.token != null ?
//             {
//           'Content-Type': 'application/json',
//           //W'Authorization': 'Bearer ${user.token}'
//         }
//         //W: {}
//         );
//     dynamic json = '';
//     if (response.body.isNotEmpty) {
//       json = jsonDecode(utf8.decode(response.bodyBytes));
//     }

//     print(response.body);
//     print("---------------------------");
//     if (response.statusCode >= 200 && response.statusCode <= 299) {
//       return BaseResponseAPI(
//           statusCode: response.statusCode,
//           statusMessage: json.toString(),
//           body: json);
//     } else {
//       print("${response.statusCode}, ${json['message']}");
//       return BaseResponseAPI(
//           statusCode: response.statusCode,
//           body: json.toString(),
//           statusMessage: json['message'].toString());
//     }
//   }

//   @override
//   Future<BaseResponseAPI> delete(
//       {required String? baseUrl,
//       String? endpoint,
//       Map<String, String>? headers}) async {
//     //final user = await Modular.get<ISecureStorageService>().readLoginResponse();
//     final response = await client.delete(
//         Uri.parse(endpoint != null ? baseUrl! + endpoint : baseUrl!),
//         headers: //user!.token != null
//             // ? {'Authorization': 'Bearer ${user.token}'} :
//             {});
//     final json = jsonDecode(utf8.decode(response.bodyBytes));
//     print(json);
//     if (response.statusCode >= 200 && response.statusCode <= 299) {
//       return BaseResponseAPI(
//           statusCode: response.statusCode,
//           statusMessage: json.toString(),
//           body: json);
//     } else {
//       print("${response.statusCode}, ${json['message']}");
//       return BaseResponseAPI(
//           statusCode: response.statusCode,
//           body: json.toString(),
//           statusMessage: "Error");
//     }
//   }
// }

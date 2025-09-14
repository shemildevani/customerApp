// import 'dart:convert';
// import 'dart:io';
// import 'package:customer_app/api_service/api_constant.dart';
// import 'package:customer_app/preferences/app_preferences.dart';
// import 'package:customer_app/preferences/preferences_key.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';

// class ApiService {
//   late Dio dio = Dio();
//   String? _token = AppPref().getString(PrefKey.prefaccessToken);

//   static final ApiService instance = ApiService._apiService();

//   // FirebaseFirestore firestore = FirebaseFirestore.instance;

//   bool debug = true;

//   ApiService._apiService() {
//     dio = Dio(
//       BaseOptions(
//         // connectTimeout: Duration(seconds: 20),
//         // receiveTimeout: Duration(seconds: 20),
//         // sendTimeout: Duration(seconds: 20),
//         headers: {'content-type': 'application/json'},
//       ),
//     );

//     dio.interceptors.add(
//       InterceptorsWrapper(
//         onRequest: (options, handler) {
//           if (_token != null) {
//             options.headers['Authorization'] = 'Bearer $_token';
//           }
//           return handler.next(options);
//         },
//       ),
//     );

//     // dio.interceptors.add(
//     //   // PrettyDioLogger(
//     //   //   requestHeader: debug,
//     //   //   requestBody: debug,
//     //   //   responseHeader: debug,
//     //   //   compact: debug,
//     //   //   request: debug,
//     //   //   responseBody: debug,
//     //   // ),
//     // );
//   }

//   // request OTP
//   Future<bool> requestOtp(String phoneNumber) async {
//     try {
//       var response = await dio.post(
//         ApiRoutes.requestOTP,
//         data: {"phone": phoneNumber},
//       );

//       if (response.statusCode == 200) {
//         return true;
//       } else {
//         return false;
//       }
//     } on DioException catch (dioError) {
//       handleDioError(dioError);
//       return false;
//     } on SocketException {
//       // When server is down or DNS fails
//       SnackbarUtil.showSnackbar(
//         error: true,
//         massageText: 'Server is offline or not reachable',
//       );
//       debugPrint('Server is offline (SocketException)');
//       return false;
//     } catch (e, stackTrace) {
//       debugPrint('Unexpected error while sending OTP: $e');
//       debugPrint('StackTrace: $stackTrace');
//       SnackbarUtil.showSnackbar(
//         error: true,
//         massageText: 'Unexpected error while sending OTP.',
//       );
//       return false;
//     }
//   }

//   // Verify OTP
//   Future<bool> verifyOtp(String phoneNumber, String otp) async {
//     try {
//       var response = await dio.post(
//         ApiRoutes.verifyOtp,
//         data: {"otp": otp, "phone": phoneNumber},
//       );

//       if (response.statusCode == 200) {
//         return true;
//       } else {
//         return false;
//       }
//     } on DioException catch (dioError) {
//       handleDioError(dioError);
//       return false;
//     } on SocketException {
//       // When server is down or DNS fails
//       SnackbarUtil.showSnackbar(
//         error: true,
//         massageText: 'Server is offline or not reachable',
//       );
//       debugPrint('Server is offline (SocketException)');
//       return false;
//     } catch (e, stackTrace) {
//       debugPrint('Unexpected error while Verifying OTP $e');
//       debugPrint('StackTrace: $stackTrace');
//       SnackbarUtil.showSnackbar(
//         error: true,
//         massageText: 'Unexpected error while Verifying OTP.',
//       );
//       return false;
//     }
//   }

//   // set new password
//   Future<bool> setNewPassword(
//     String phoneNumber,
//     String otp,
//     String password,
//   ) async {
//     try {
//       var response = await dio.post(
//         ApiRoutes.setNewPassword,
//         data: {"otp": otp, "phone": phoneNumber, "password": password},
//       );

//       if (response.statusCode == 200) {
//         return true;
//       } else {
//         return false;
//       }
//     } on DioException catch (dioError) {
//       handleDioError(dioError);
//       return false;
//     } on SocketException {
//       // When server is down or DNS fails
//       SnackbarUtil.showSnackbar(
//         error: true,
//         massageText: 'Server is offline or not reachable',
//       );
//       debugPrint('Server is offline (SocketException)');
//       return false;
//     } catch (e, stackTrace) {
//       debugPrint('Unexpected error while updating Password: $e');
//       debugPrint('StackTrace: $stackTrace');
//       SnackbarUtil.showSnackbar(
//         error: true,
//         massageText: 'Unexpected error while updating Password.',
//       );
//       return false;
//     }
//   }

//   // check token valid or not
//   Future<UserModel?> verifyUserProfile() async {
//     try {
//       var response = await dio.get(ApiRoutes.getUserByJwtToken);

//       if (response.statusCode == 200) {
//         // Token is invalid, log out user
//         var data = UserModel.fromJson(response.data['data'], false);
//         return data;
//       } else {
//         return null;
//       }
//     } on DioException catch (dioError) {
//       handleDioError(dioError);
//       return null;
//     } on SocketException {
//       // When server is down or DNS fails
//       SnackbarUtil.showSnackbar(
//         error: true,
//         massageText: 'Server is offline or not reachable',
//       );
//       debugPrint('Server is offline (SocketException)');
//       return null;
//     } catch (e, stackTrace) {
//       debugPrint('Unexpected error while Verifying Profile: $e');
//       debugPrint('StackTrace: $stackTrace');
//       SnackbarUtil.showSnackbar(
//         error: true,
//         massageText: 'Unexpected error while Verifying Profile.',
//       );
//       return null;
//     }
//   }

//   // check user login using email and password
//   Future<bool> sendandchecklogin(String email, String password) async {
//     try {
//       var response = await dio.post(
//         ApiRoutes.getloginURL,
//         data: {'emailOrPhone': email, 'password': password},
//       );

//       if (response.statusCode == 200) {
//         SnackbarUtil.showSnackbar(massageText: 'Login Success');
//         var tokenData = response.data['data']["token"];
//         var user = response.data['data']['user'];
//         if (tokenData != null && tokenData["token"] != null) {
//           String token = tokenData["token"];
//           String userId = user["_id"];

//           _token = token;
//           AppPreference().setString(PreferencesKey.preftokenId, token);
//           AppPreference().setString(PreferencesKey.prefuserId, userId);
//           return true;
//         } else {
//           SnackbarUtil.showSnackbar(
//             error: true,
//             massageText: 'Token not found',
//           );
//           return false;
//         }
//       } else {
//         return false;
//       }
//     } on DioException catch (dioError) {
//       handleDioError(dioError);
//       return false;
//     } on SocketException {
//       // When server is down or DNS fails
//       SnackbarUtil.showSnackbar(
//         error: true,
//         massageText: 'Server is offline or not reachable',
//       );
//       debugPrint('Server is offline (SocketException)');
//       return false;
//     } catch (e, stackTrace) {
//       debugPrint('Unexpected error: $e');
//       debugPrint('StackTrace: $stackTrace');
//       SnackbarUtil.showSnackbar(error: true, massageText: 'Unexpected error.');
//       return false;
//     }
//   }

//   // user sign in
//   Future<bool> userSignIn(
//     String email,
//     String password,
//     String fName,
//     String lName,
//     String phoneno,
//   ) async {
//     try {
//       var response = await dio.post(
//         ApiRoutes.getSigninURL,
//         data: {
//           'email': email,
//           'firstName': fName,
//           'lastName': lName,
//           'mobileNo': phoneno,
//           'loginMethod': "email",
//           'metadata': {},
//           'password': password,
//           'status': "active",
//         },
//       );

//       if (response.statusCode == 201) {
//         SnackbarUtil.showSnackbar(massageText: 'Sign in Success');
//         return true;
//       } else {
//         SnackbarUtil.showSnackbar(error: true, massageText: 'Sign In failed');
//         return false;
//       }
//     } on DioException catch (dioError) {
//       handleDioError(dioError);
//       return false;
//     } on SocketException {
//       // When server is down or DNS fails
//       SnackbarUtil.showSnackbar(
//         error: true,
//         massageText: 'Server is offline or not reachable',
//       );
//       debugPrint('Server is offline (SocketException)');
//       return false;
//     } catch (e, stackTrace) {
//       debugPrint('Unexpected error while User Sign in : $e');
//       debugPrint('StackTrace: $stackTrace');
//       SnackbarUtil.showSnackbar(
//         error: true,
//         massageText: 'Unexpected error while User Sign in.',
//       );
//       return false;
//     }
//   }

//   // send token to databse google login
//   Future<bool> sendGoogleTokenToApi(String idToken) async {
//     try {
//       final response = await dio.post(
//         ApiRoutes.getPostURL,
//         data: {'tokenId': idToken},
//       );

//       if (response.statusCode == 200) {
//         String token = response.data["data"]["token"];

//         if (token.isEmpty) {
//           SnackbarUtil.showSnackbar(massageText: "Token is Missing");
//           return false;
//         } else {
//           _token = token;
//           AppPreference().setString(PreferencesKey.preftokenId, token);

//           return true;
//         }
//       } else {
//         SnackbarUtil.showSnackbar(error: true, massageText: 'Sign In failed');
//         return false;
//       }
//     } on DioException catch (dioError) {
//       handleDioError(dioError);
//       return false;
//     } on SocketException {
//       // When server is down or DNS fails
//       SnackbarUtil.showSnackbar(
//         error: true,
//         massageText: 'Server is offline or not reachable',
//       );
//       debugPrint('Server is offline (SocketException)');
//       return false;
//     } catch (e, stackTrace) {
//       debugPrint('Unexpected error while Google Sign In: $e');
//       debugPrint('StackTrace: $stackTrace');
//       SnackbarUtil.showSnackbar(
//         error: true,
//         massageText: 'Unexpected error while Google Sign In.',
//       );
//       return false;
//     }
//   }

//   // fetch any all data from api
//   Future<List<T>> fetchAllDataFromApi<T>({
//     required String url,
//     required T Function(Map<String, dynamic>) fromJson,
//     String errorMessage = "Failed to fetch data",
//   }) async {
//     try {
//       final response = await dio.get(url);

//       if (response.statusCode == 201 || response.statusCode == 200) {
//         List<T> dataList = (response.data['data'] as List)
//             .map((item) => fromJson(item))
//             .toList();
//         return dataList;
//       } else {
//         SnackbarUtil.showSnackbar(massageText: errorMessage, error: true);
//         return [];
//       }
//     } on DioException catch (dioError) {
//       handleDioError(dioError);
//       return [];
//     } on SocketException {
//       // When server is down or DNS fails
//       SnackbarUtil.showSnackbar(
//         error: true,
//         massageText: 'Server is offline or not reachable',
//       );
//       debugPrint('Server is offline (SocketException)');
//       return [];
//     } catch (e, stackTrace) {
//       debugPrint('Unexpected error while get Data: $e');
//       debugPrint('StackTrace: $stackTrace');
//       SnackbarUtil.showSnackbar(
//         error: true,
//         massageText: 'Unexpected error while get Data.',
//       );
//       return [];
//     }
//   }

//   // create any data in api
//   Future<T?> createDataInApi<T>({
//     required String url,
//     required Map<String, dynamic> body,
//     required T Function(Map<String, dynamic>) fromJson,
//     String successMessage = "Action successful",
//     String errorMessage = "Failed to create data",
//   }) async {
//     final encodedBody = jsonEncode(body);

//     try {
//       var response = await dio.post(url, data: encodedBody);

//       if (response.statusCode == 201 || response.statusCode == 200) {
//         var data = response.data['data'];
//         T result = fromJson(data);
//         return result;
//       } else {
//         SnackbarUtil.showSnackbar(
//           error: true,
//           massageText: response.data['message'] ?? errorMessage,
//         );
//         return null;
//       }
//     } on DioException catch (dioError) {
//       handleDioError(dioError);
//       return null;
//     } on SocketException {
//       // When server is down or DNS fails
//       SnackbarUtil.showSnackbar(
//         error: true,
//         massageText: 'Server is offline or not reachable',
//       );
//       debugPrint('Server is offline (SocketException)');
//       return null;
//     } catch (e, stackTrace) {
//       debugPrint('Unexpected error while creating: $e');
//       debugPrint('StackTrace: $stackTrace');
//       SnackbarUtil.showSnackbar(
//         error: true,
//         massageText: 'Unexpected error while creating.',
//       );
//       return null;
//     }
//   }

//   // update any data in api
//   Future<T?> updateDataInApi<T>({
//     required String url,
//     required Map<String, dynamic> body,
//     required String id,
//     required T Function(Map<String, dynamic>) fromJson,
//     String successMessage = "Action successful",
//     String errorMessage = "Failed to update data",
//   }) async {
//     final encodedBody = jsonEncode(body);

//     try {
//       var response = await dio.put(url + id, data: encodedBody);

//       if (response.statusCode == 201 || response.statusCode == 200) {
//         var data = response.data['data'];

//         T result = fromJson(data);
//         return result;
//       } else {
//         SnackbarUtil.showSnackbar(
//           error: true,
//           massageText: response.data['message'] ?? errorMessage,
//         );
//         return null;
//       }
//     } on DioException catch (dioError) {
//       handleDioError(dioError);
//       return null;
//     } on SocketException {
//       // When server is down or DNS fails
//       SnackbarUtil.showSnackbar(
//         error: true,
//         massageText: 'Server is offline or not reachable',
//       );
//       debugPrint('Server is offline (SocketException)');
//       return null;
//     } catch (e, stackTrace) {
//       debugPrint('Unexpected error while updating Data: $e');
//       debugPrint('StackTrace: $stackTrace');
//       SnackbarUtil.showSnackbar(
//         error: true,
//         massageText: 'Unexpected error while updating.',
//       );
//       return null;
//     }
//   }

//   // delete any data in api
//   Future<bool> deleteDataInApi({
//     required String url,
//     required String id,
//     String successMessage = "Deleted successfully",
//     String errorMessage = "Failed to delete data",
//   }) async {
//     try {
//       var response = await dio.delete(url + id);

//       if (response.statusCode == 200 || response.statusCode == 201) {
//         return true;
//       } else {
//         SnackbarUtil.showSnackbar(error: true, massageText: errorMessage);
//         return false;
//       }
//     } on DioException catch (dioError) {
//       handleDioError(dioError);
//       return false;
//     } on SocketException {
//       // When server is down or DNS fails
//       SnackbarUtil.showSnackbar(
//         error: true,
//         massageText: 'Server is offline or not reachable',
//       );
//       debugPrint('Server is offline (SocketException)');
//       return false;
//     } catch (e, stackTrace) {
//       debugPrint('Unexpected error while Deleting: $e');
//       debugPrint('StackTrace: $stackTrace');
//       SnackbarUtil.showSnackbar(
//         error: true,
//         massageText: 'Unexpected error while Deleting.',
//       );
//       return false;
//     }
//   }

//   // create multiple data
//   Future<bool> createdOfflineDataInApi({
//     required List<Map<String, dynamic>> dataList,
//     required String route,
//     required String name,
//   }) async {
//     try {
//       var response = await dio.post(route, data: dataList);

//       if (response.statusCode == 201 || response.statusCode == 200) {
//         debugPrint("ALL Offline $name Created");
//         return true;
//       } else {
//         debugPrint("Failed to Create all $name");
//         return false;
//       }
//     } on DioException catch (dioError) {
//       handleDioError(dioError);
//       return false;
//     } on SocketException {
//       // When server is down or DNS fails
//       SnackbarUtil.showSnackbar(
//         error: true,
//         massageText: 'Server is offline or not reachable',
//       );
//       debugPrint('Server is offline (SocketException)');
//       return false;
//     } catch (e, stackTrace) {
//       debugPrint('Unexpected error while updating $name: $e');
//       debugPrint('StackTrace: $stackTrace');
//       SnackbarUtil.showSnackbar(
//         error: true,
//         massageText: 'Unexpected error while updating $name.',
//       );
//       return false;
//     }
//   }

//   // update multiple data
//   Future<bool> updateOfflineDataInApi({
//     required List<Map<String, dynamic>> dataList,
//     required String route,
//     required String name,
//   }) async {
//     try {
//       var response = await dio.post(route, data: dataList);

//       if (response.statusCode == 201 || response.statusCode == 200) {
//         debugPrint("ALL Offline $name updated");
//         return true;
//       } else {
//         debugPrint("failed to upate all $name");
//         return false;
//       }
//     } on DioException catch (dioError) {
//       handleDioError(dioError);
//       return false;
//     } on SocketException {
//       // When server is down or DNS fails
//       SnackbarUtil.showSnackbar(
//         error: true,
//         massageText: 'Server is offline or not reachable',
//       );
//       debugPrint('Server is offline (SocketException)');
//       return false;
//     } catch (e, stackTrace) {
//       debugPrint('Unexpected error while updating $name: $e');
//       debugPrint('StackTrace: $stackTrace');
//       SnackbarUtil.showSnackbar(
//         error: true,
//         massageText: 'Unexpected error while updating $name.',
//       );
//       return false;
//     }
//   }

//   // delete multiple data
//   Future<bool> deleteOfflineDataFromApi({
//     required String route,
//     required String name,
//     String? idKey,
//     required List<String> ids,
//   }) async {
//     var data = {idKey: ids};

//     try {
//       var response = await dio.delete(route, data: data);

//       if (response.statusCode == 200) {
//         debugPrint("ALL Offline $name deleted");
//         return true;
//       } else {
//         debugPrint("Failed to delete all $name");
//         return false;
//       }
//     } on DioException catch (dioError) {
//       handleDioError(dioError);
//       return false;
//     } on SocketException {
//       // When server is down or DNS fails
//       SnackbarUtil.showSnackbar(
//         error: true,
//         massageText: 'Server is offline or not reachable',
//       );
//       debugPrint('Server is offline (SocketException)');
//       return false;
//     } catch (e, stackTrace) {
//       debugPrint('Unexpected error while updating $name: $e');
//       debugPrint('StackTrace: $stackTrace');
//       SnackbarUtil.showSnackbar(
//         error: true,
//         massageText: 'Unexpected error while updating $name.',
//       );
//       return false;
//     }
//   }

//   // add in favourites
//   Future<FavouriteModel?> addFavourite(String remedyId) async {
//     try {
//       var response = await dio.post(
//         ApiRoutes.addFavouriteURL,
//         data: {'remedyId': remedyId},
//       );

//       if (response.data != null) {
//         var favourite = FavouriteModel.fromJson(response.data['data']);
//         return favourite;
//       } else {
//         SnackbarUtil.showSnackbar(
//           error: true,
//           massageText: 'Failed to add Favourite',
//         );
//         return null;
//       }
//     } on DioException catch (dioError) {
//       handleDioError(dioError);
//       return null;
//     } on SocketException {
//       // When server is down or DNS fails
//       SnackbarUtil.showSnackbar(
//         error: true,
//         massageText: 'Server is offline or not reachable',
//       );
//       debugPrint('Server is offline (SocketException)');
//       return null;
//     } catch (e, stackTrace) {
//       debugPrint('Unexpected error while updating Favourite: $e');
//       debugPrint('StackTrace: $stackTrace');
//       SnackbarUtil.showSnackbar(
//         error: true,
//         massageText: 'Unexpected error while updating Favourite.',
//       );
//       return null;
//     }
//   }

//   // create pffline favourites
//   Future<bool> createdOfflineFavouritesDataInApi({
//     required List<String> list,
//     required String route,
//     required String name,
//   }) async {
//     try {
//       var response = await dio.post(route, data: list);

//       if (response.statusCode == 201 || response.statusCode == 200) {
//         debugPrint("ALL Offline $name Created");
//         return true;
//       } else {
//         debugPrint("Failed to Create all $name");
//         return false;
//       }
//     } on DioException catch (dioError) {
//       handleDioError(dioError);
//       return false;
//     } on SocketException {
//       // When server is down or DNS fails
//       SnackbarUtil.showSnackbar(
//         error: true,
//         massageText: 'Server is offline or not reachable',
//       );
//       debugPrint('Server is offline (SocketException)');
//       return false;
//     } catch (e, stackTrace) {
//       debugPrint('Unexpected error while updating $name: $e');
//       debugPrint('StackTrace: $stackTrace');
//       SnackbarUtil.showSnackbar(
//         error: true,
//         massageText: 'Unexpected error while updating $name.',
//       );
//       return false;
//     }
//   }

//   Future<String?> getPlanSubscriptionID(SubscriptionModel sub) async {
//     final encodedBody = sub.toJson();

//     try {
//       var response = await dio.post(
//         ApiRoutes.getPlanSubscriptionID,
//         data: encodedBody,
//       );

//       if (response.statusCode == 200) {
//         var data = response.data['data']['subscriptionId'];

//         return data;
//       } else {
//         return null;
//       }
//     } on DioException catch (dioError) {
//       handleDioError(dioError);
//       return null;
//     } on SocketException {
//       // When server is down or DNS fails
//       SnackbarUtil.showSnackbar(
//         error: true,
//         massageText: 'Server is offline or not reachable',
//       );
//       debugPrint('Server is offline (SocketException)');
//       return null;
//     } catch (e, stackTrace) {
//       debugPrint('Unexpected error while creating: $e');
//       debugPrint('StackTrace: $stackTrace');
//       SnackbarUtil.showSnackbar(
//         error: true,
//         massageText: 'Unexpected error while creating.',
//       );
//       return null;
//     }
//   }
// }

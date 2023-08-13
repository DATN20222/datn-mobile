import 'package:datn/constants/network.dart';
import 'package:datn/datas/sharedPreference/sharedPreferenceHelper.dart';
import 'package:datn/models/historyUser.dart';
import 'package:datn/models/users.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';


class UserApi {
  static UserApi _instance = UserApi._();
  UserApi._();
  static UserApi get instance => _instance;

  Dio dioClient = Dio();
  final getStorage = GetStorage();
  Future<User?> getUserInfo() async {
    // SharedPreferenceHelper _sharedPrefsHelper = SharedPreferenceHelper();
    try {
      // final token = await _sharedPrefsHelper.authToken;
      final token = getStorage.read("token");
      var baseOption = BaseOptions(
        baseUrl: Endpoints.userInfo,
        headers: {'Authorization': 'Bearer $token'}
      );
      Dio _dioClient = Dio(baseOption);
      Options options = Options(headers: {'Authorization': 'Bearer $token'});

      var res = await _dioClient.get(Endpoints.userInfo, options: options);

      User user = User.fromJson(res.data);
      getStorage.write("name", user.name);
      getStorage.write("id", user.id);
      getStorage.write("phone", user.phone);
      getStorage.write("role", user.role);
      getStorage.write("code", user.code);
      if (user.birthday != null){
        getStorage.write('birthday', user.birthday.toString());
      }
      getStorage.write("email", user.email);
      return user;
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
  }


  Future signUp(User user) async {
    var data = user.toJson();
    try {
      print("Request to register");
      var res = await dioClient.post(Endpoints.registerUrl, data: data, );
      return res.statusCode;
    } on DioError catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
  }

  Future signUpWithRoleByAdmin(User user) async{
    var data = user.toJson();
    try {
      final token = getStorage.read("token");
      Options options = Options(headers: {'Authorization': 'Bearer $token'});
      var res = await dioClient.post("${Endpoints.registerUrl}/admin", data: data, options: options);
      return {"statusCode":res.statusCode, "message": "Đăng ký thành công"};
    } on DioError catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
        return {"statusCode":e.response?.statusCode, "message": e.response?.data['message']};
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
  }

  Future getListUser() async {
    // Dio _dioClient = Dio();
    List<User> listUser = [];
    try {
      final token = getStorage.read("token");
      Options options = Options(headers: {'Authorization': 'Bearer $token'});
      var res = await dioClient.get(Endpoints.adminUser, options: options);
      if (res.statusCode == 200) {
        for (var i in res.data) {
          User s = User.fromJson(i);
          listUser.add(s);
        }
      }

      return listUser;
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
  }

  // Future updateAvatar(User user) async {
  //   Dio _dio = Dio();
  //   SharedPreferenceHelper _sharedPrefsHelper = SharedPreferenceHelper();
  //
  //   try {
  //     var data = user.toJson();
  //
  //     final token = await _sharedPrefsHelper.authToken;
  //     print(token);
  //     Options options = Options(headers: {'Authorization': 'Bearer $token'});
  //     var res =
  //     await _dio.put(Endpoints.userInfo, data: data, options: options);
  //     if (res.statusCode == 200) print("Thành công up dât role user");
  //     return res;
  //   } on DioError catch (e) {
  //     // The request was made and the server responded with a status code
  //     // that falls out of the range of 2xx and is also not 304.
  //     if (e.response != null) {
  //       print('Dio error!');
  //       print('STATUS: ${e.response?.statusCode}');
  //       print('DATA: ${e.response?.data}');
  //       print('HEADERS: ${e.response?.headers}');
  //     } else {
  //       // Error due to setting up or sending the request
  //       print('Error sending request!');
  //       print(e.message);
  //     }
  //   }
  // }

  // Future updateUser(User user) async {
  //   Dio _dio = Dio();
  //   SharedPreferenceHelper _sharedPrefsHelper = SharedPreferenceHelper();
  //   // _dio.options.connectTimeout = 5000; //5s
  //   // _dio.options.receiveTimeout = 3000;
  //
  //   try {
  //     var data = user.toJson();
  //
  //     final token = await _sharedPrefsHelper.authToken;
  //     print(token);
  //     Options options = Options(headers: {'Authorization': 'Bearer $token'});
  //     var res =
  //     await _dio.put(Endpoints.registerUrl, data: data, options: options);
  //     if (res.statusCode == 200) print("Thành công đăng ký role user");
  //     return res;
  //   } on DioError catch (e) {
  //     // The request was made and the server responded with a status code
  //     // that falls out of the range of 2xx and is also not 304.
  //     if (e.response != null) {
  //       print('Dio error!');
  //       print('STATUS: ${e.response?.statusCode}');
  //       print('DATA: ${e.response?.data}');
  //       print('HEADERS: ${e.response?.headers}');
  //     } else {
  //       print('Error sending request!');
  //       print(e.message);
  //     }
  //   }
  // }

  // Future changePassword(String oldPassword, String password) async {
  //   Dio _dioClient = Dio();
  //   try {
  //     await _dioClient.put(Endpoints.userChangePasswordUrl,
  //         data: {"oldPassword": oldPassword, "password": password});
  //   } on DioError catch (e) {
  //     // The request was made and the server responded with a status code
  //     // that falls out of the range of 2xx and is also not 304.
  //     if (e.response != null) {
  //       print('Dio error!');
  //       print('STATUS: ${e.response?.statusCode}');
  //       print('DATA: ${e.response?.data}');
  //       print('HEADERS: ${e.response?.headers}');
  //     } else {
  //       // Error due to setting up or sending the request
  //       print('Error sending request!');
  //       print(e.message);
  //     }
  //   }
  // }

  Future deleteUser(String login) async {
    try {
      final token = getStorage.read("token");
      Options options = Options(headers: {'Authorization': 'Bearer $token'});
      String url = "${Endpoints.adminUser}/$login";
      print(url);
      var res = await dioClient.delete(url, options: options);
      if (res.statusCode == 200) print("Xoá user có $login");
      return res.statusCode;
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
  }
  
  Future getInforUserById(String id) async{
    try {
      final token = getStorage.read("token");
      Options options = Options(headers: {'Authorization': 'Bearer $token'});
      var res = await dioClient.get(Endpoints.userById + id, options: options);
      print(res.data);
      User user = User.fromJson(res.data);
      return user;
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
  }

  Future updateRoleForUser(String role, int code, String id) async {
    try {
      final token = getStorage.read("token");
      Options options = Options(headers: {'Authorization': 'Bearer $token'});
      var res = await dioClient.put("${Endpoints.adminUser}/$id", options: options, data: {
        "role": role,
        "code": code
      });

      return res.statusCode;
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
  }

  Future getHistory(String id, DateTime startTime, DateTime endTime) async {
    List<HistoryUser> historyUsers = <HistoryUser>[];
    try {
      final token = getStorage.read("token");
      Options options = Options(headers: {'Authorization': 'Bearer $token'});
      String url = "${Endpoints.adminUser}/history/$id/${DateFormat('yyyy-MM-dd').format(startTime)}/${DateFormat('yyyy-MM-dd').format(endTime)}";

      var res = await dioClient.get(url, options: options);
      if (res.statusCode == 200){
        res.data.forEach((element) {
          historyUsers.add(HistoryUser.fromJson(element));
        });
      }
      return historyUsers;
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
  }

  Future updateInforForUser(String id, String name, String phone, String email, int code, String role,DateTime birthday ) async {
    try{
      final token = getStorage.read("token");
      Options options = Options(headers: {'Authorization': 'Bearer $token'});
      var res = await dioClient.patch("${Endpoints.adminUser}/admin/$id", options: options, data: {
        "name": name,
        "phone": phone,
        "email": email,
        "role": role,
        "birthday": DateFormat('yyyy-MM-dd').format(birthday!),
        "code": code
      });
      return res;
    } on DioError catch (e) {
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
  }

  Future getUserByToken() async{
    try {
      final token = getStorage.read("token");
      Options options = Options(headers: {'Authorization': 'Bearer $token'});
      var res = await dioClient.get("${Endpoints.userLoginUrl}/user", options: options);
      User user = User.fromJson(res.data);
      return user;
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print('Dio error!');
        print('STATUS: ${e.response?.statusCode}');
        print('DATA: ${e.response?.data}');
        print('HEADERS: ${e.response?.headers}');
      } else {
        // Error due to setting up or sending the request
        print('Error sending request!');
        print(e.message);
      }
    }
  }
}
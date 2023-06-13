import 'package:datn/constants/network.dart';
import 'package:datn/datas/sharedPreference/sharedPreferenceHelper.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class AuthApi {

  static AuthApi _instance = AuthApi._();

  AuthApi._();
  static AuthApi get instance => _instance;
  final getStorage = GetStorage();

  login(String phone, String password) async {
    try {
      BaseOptions option = BaseOptions(
          connectTimeout: const Duration(seconds: 60), // 60 seconds
          receiveTimeout: const Duration(seconds: 60),
      );
      Dio dioClient = Dio(option);
      // SharedPreferenceHelper _sharedPrefsHelper = SharedPreferenceHelper();
      var res = await dioClient.post(
        Endpoints.userLoginUrl,
        data: {"phone": phone, "password": password },
      );
      if (res.statusCode == 201) {
        getStorage.write("token", res.data["access_token"]);
        // await _sharedPrefsHelper.saveAuthToken(res.data["access_token"]);
        print("Tài khoản, mật khẩu chính xác");
      } else
        print("Tài khoản hoặc mật khẩu không đúng");
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

}
import 'package:datn/bindings/camera_binding.dart';
import 'package:datn/bindings/home_binding.dart';
import 'package:datn/bindings/login_binding.dart';
import 'package:datn/bindings/personal_binding.dart';
import 'package:datn/bindings/signup_binding.dart';
import 'package:datn/bindings/splash_binding.dart';
import 'package:datn/screen/camera_screen.dart';
import 'package:datn/screen/home/home.dart';
import 'package:datn/screen/login/login_screen.dart';
import 'package:datn/screen/personalInfor/personal_infor_screen.dart';
import 'package:datn/screen/signup/signup_screen.dart';
import 'package:datn/screen/splash.dart';
import 'package:get/get.dart';
part './app_routes.dart';

class AppPages {
  AppPages._();
  static const INITIAL = Routes.SPLASH;
  static final pages = [
    GetPage(
        name: Routes.HOME, page: () => HomeScreen(), binding: HomeBinding(),
    ),
    GetPage(
        name: Routes.SPLASH,  page: () => SplashScreen(), binding: SplashBinding()
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginScreen(),
      binding: LoginBinding()
    ),
    GetPage(name: Routes.PERSONAL, page: () => PersonalInfoScreen(), binding: PersonalBinding()),
    GetPage(name: Routes.SIGNUP, page: ()=> SignUpScreen(), binding: SignUpBinding()),
    // GetPage(name: Routes.CAMERADETAIL, page: () => CameraScreen(), binding: CameraBinding())
  ];
}
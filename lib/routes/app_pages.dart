import 'package:datn/bindings/add_student_binding.dart';
import 'package:datn/bindings/camera_binding.dart';
import 'package:datn/bindings/camera_door_detail_binding.dart';
import 'package:datn/bindings/cameras_binding.dart';
import 'package:datn/bindings/home_binding.dart';
import 'package:datn/bindings/login_binding.dart';
import 'package:datn/bindings/personal_binding.dart';
import 'package:datn/bindings/signup_binding.dart';
import 'package:datn/bindings/splash_binding.dart';
import 'package:datn/bindings/student_binding.dart';
import 'package:datn/bindings/student_detail_binding.dart';
import 'package:datn/screen/camera/camera_door.dart';
import 'package:datn/screen/camera/cameras_screen.dart';
import 'package:datn/screen/home/home.dart';
import 'package:datn/screen/camera/camera_detail_screen.dart';
import 'package:datn/screen/list_student/add_student.dart';
import 'package:datn/screen/list_student/student_detail.dart';
import 'package:datn/screen/list_student/students_screen.dart';
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
        name: Routes.SPLASH,  page: () => const SplashScreen(), binding: SplashBinding()
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => LoginScreen(),
      binding: LoginBinding()
    ),
    GetPage(name: Routes.PERSONAL, page: () => PersonalInfoScreen(), binding: PersonalBinding()),
    GetPage(name: Routes.SIGNUP, page: ()=> SignUpScreen(), binding: SignUpBinding()),
    GetPage(name: "${Routes.CAMERADETAIL}/:ip", page: () => CameraScreen(), binding: CameraBinding()),
    GetPage(name: Routes.STUDENTS, page: () => StudentsScreen(), binding: StudentBinding()),
    GetPage(name: "${Routes.STUDENTDETAIL}/:id", page: () => StudentDetailScreen(), binding:  StudentDetailBinding()),
    GetPage(name: Routes.CAMERAS, page:() => CamerasScreen(), binding: CamerasBinding()),
    GetPage(name: "${Routes.STUDENTPERMISSION}/:id", page: () => AddStudent(), binding:  AddStudentBinding() ),
    GetPage(name: '${Routes.CAMERADOORDETAIL}/:ip', page: () => CameraDoor(), binding: CameraDoorDetailBinding())
  ];
}
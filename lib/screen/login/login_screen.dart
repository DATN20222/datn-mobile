import 'dart:ui';
import 'package:datn/controller/login_controller.dart';
import 'package:datn/routes/app_pages.dart';
import 'package:datn/widgets/app_input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    LoginController controller = Get.find();
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Align(
          //   alignment: Alignment.topCenter,
          //   child: Stack(
          //       children: [
              Positioned(
                top: 0,
                left: 0,
                // right: 0,

                child: Container(
                  height: 548,
                  width: Get.width,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color.fromARGB(255, 89, 85, 238),
                      Color.fromARGB(255, 199, 109, 232)
                    ]),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(120),
                        bottomRight: Radius.circular(120)),
                    image: DecorationImage(
                      opacity: 0.3,
                      image: AssetImage("assets/lab_background4.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 62,
                child: SizedBox(
                  width: Get.width,
                  child: Center(
                    child: Image.asset(
                      "assets/logo.png",
                      height: 94,
                      width: 125.56,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 22,
                top: Get.height * 1 / 3 - 30,
                child: Text(
                  "LOGIN",
                  style: GoogleFonts.play(
                      textStyle: const TextStyle(
                    color: Colors.white,
                    fontSize: 43,
                    fontWeight: FontWeight.bold,
                  )),
                ),
              ),
              Positioned(
                left: 22,
                top: Get.height * 1 / 3 + 15,
                child: Text("System Monitor",
                    style: GoogleFonts.play(
                        textStyle: const TextStyle(
                            color: Colors.white, fontSize: 38))),
              ),
          //   ]),
          // ),
          Positioned(
            left: 20,
            top: Get.height * 1 / 3 + 65,
            bottom: 5,
            // child: GestureDetector(
            //   onTap: () {
            //     FocusScope.of(context).requestFocus(FocusNode());
            //   },
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // SizedBox(height:  Get.height * 1 / 3 + 65,),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        boxShadow: [
                          BoxShadow(
                              color: Color(0xFFD3D3D3),
                              spreadRadius: 1,
                              blurRadius: 7,
                              offset: Offset(5, 10))
                        ],
                      ),
                      height: 343,
                      width: Get.width - 40,
                      child: Padding(
                        padding:
                            const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "Welcome to my system! Sign in to motoring your room",
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFFCDCDCD),
                                        fontWeight: FontWeight.w400),
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                AppTextField(
                                  hintText: 'Phone...',
                                  keyboardType: TextInputType.phone,
                                  controller: phoneController,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Obx( () =>
                                   AppTextField(
                                    hintText: 'Password...',
                                    obscureText: controller.visiblePassword.value,
                                    suffixIcon: IconButton(
                                      icon: Icon(
                                        // Based on passwordVisible state choose the icon
                                        !controller.visiblePassword.value
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        color: Color(0xFF7632d6),
                                      ),
                                      onPressed: () {
                                        // Update the state i.e. toogle the state of passwordVisible variable
                                        controller.changeVisible();
                                      },
                                  ),
                                    keyboardType: TextInputType.visiblePassword,
                                    controller: passwordController,
                                  ),
                                ),
                                const SizedBox(height: 20,),
                                ElevatedButton(
                                  onPressed: () async {
                                    await controller.login(passwordController.text, phoneController.text);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10))),
                                  child: Ink(
                                    decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [Color(0xFF5955EE), Color(0xFFC76DE8)]),
                                        borderRadius: BorderRadius.circular(10)),
                                    child: Container(
                                      width: 270,
                                      height: 42,
                                      alignment: Alignment.center,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "Login",
                                            style: GoogleFonts.robotoMono(
                                                textStyle: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xFFF4E7CF))),
                                          ),
                                          const SizedBox(width: 5),
                                          controller.isLoading.value ? const SizedBox(
                                              height: 14,
                                              width: 14,
                                              child: CircularProgressIndicator(
                                                color: Colors.white,
                                                strokeWidth: 1.5,
                                              )
                                          ) : const Icon(Icons.login, size: 20, color: Color(0xFFF4E7CF)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text("Don't have an account yet?", style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w200, color: Color(0xFFAFADF0))
                                )),
                                InkWell(
                                  onTap: (){
                                    Get.toNamed(Routes.SIGNUP);
                                  },
                                  child: Text("Create an account", style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF824CF4)
                                    )
                                  )),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          // )
        ],
      ),
    );
  }
}


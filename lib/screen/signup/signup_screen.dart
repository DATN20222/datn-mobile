import 'dart:ui';

import 'package:datn/controller/signup_controller.dart';

import 'package:datn/widgets/app_input_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../routes/app_pages.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  SignUpScreenState createState() {
    return SignUpScreenState();
  }
}

class SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController phoneController;
  late TextEditingController passwordController;
  late TextEditingController emailController;
  late TextEditingController codeController;
  late TextEditingController nameController;

  @override
  void initState() {
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    emailController = TextEditingController();
    codeController = TextEditingController();
    nameController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SignUpController controller = Get.find();
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Stack(children: [
              Container(
                height: 548,
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
              Positioned(
                top: 62,
                child: Center(
                  child: SizedBox(
                    width: Get.width,
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
                top: Get.height* 1 /3 - 30 ,
                child: Text(
                  "SIGNUP",
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
                top: Get.height * 1 /3 + 8,
                child: Text("System Monitor",
                    style: GoogleFonts.play(
                        textStyle: const TextStyle(
                            color: Colors.white, fontSize: 38))),
              ),
            ]),
          ),
          Positioned(
            left: 20,
            top: Get.height * 1 /3 + 60,
            bottom: 5,
            right: 20,
            child: SingleChildScrollView(
              child: Container(
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
                // height: 400,
                width: 325,
                child: SingleChildScrollView(
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child:
                        Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Welcome to my system!",
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
                              height: 10,
                            ),
                            AppTextField(
                              hintText: 'Name...',
                              keyboardType: TextInputType.text,
                              controller: nameController,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            AppTextField(
                              hintText: 'Password...',
                              keyboardType: TextInputType.visiblePassword,
                              controller: passwordController,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            AppTextField(
                              hintText: 'Email...',
                              keyboardType: TextInputType.emailAddress,
                              controller: emailController,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            AppTextField(
                              hintText: 'Birthday...',
                              keyboardType: TextInputType.datetime,
                              controller: codeController,

                            ),
                            const SizedBox(height: 20,),
                            ElevatedButton(
                              onPressed: () async{
                                // signup();
                                await controller.signUp(phoneController.text, passwordController.text, emailController.text, int.parse(codeController.text), nameController.text);
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
                                  child: Text(
                                    "Sign up",
                                    style: GoogleFonts.robotoMono(
                                        textStyle: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xFFF4E7CF))),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 5,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("Do you have an account yet?", style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w200, color: Color(0xFFAFADF0))
                                )),
                                InkWell(
                                  onTap: (){
                                    Get.toNamed(Routes.LOGIN);
                                  },
                                  child: Text("Log in", style: GoogleFonts.poppins(
                                      textStyle: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xFF824CF4)
                                      )
                                  )),
                                ),
                              ],
                            ),
                      ],
                    ),
                  ),
                ),
              ),

            ),

          )
        ],
      ),
    );
  }
  // void signup(){
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(builder: (context) => const HomeScreen()),
  //   );
  // }
}

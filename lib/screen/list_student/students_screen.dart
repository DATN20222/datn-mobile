import 'package:datn/controller/student_controller.dart';
import 'package:datn/routes/app_pages.dart';
import 'package:datn/widgets/app_input_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class StudentsScreen extends StatefulWidget {
  const StudentsScreen({super.key});

  @override
  StudentsScreenState createState() {
    return StudentsScreenState();
  }
}

class StudentsScreenState extends State<StudentsScreen> {
  TextEditingController searchController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  // List<User> listUser = [
  //   User(name: "Test 1", phone: "0987642344", role: "ADMIN"),
  //   User(name: "Test 2", phone: "0987642344", role: "ADMIN")
  // ];

  StudentController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return controller.obx((state) {
      return Scaffold(
        body: Container(
          // decoration: const BoxDecoration(
          //     image: DecorationImage(
          //         image: AssetImage("assets/background_list.png"),
          //         fit: BoxFit.cover)),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 48,
                left: 24,
              ),
              child: Row(children: [
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            blurRadius: 21,
                            offset: Offset(3, 4),
                            color: Color.fromRGBO(111, 131, 231, 0.4)),
                      ]),
                  width: 30,
                  height: 30,
                  child: InkWell(
                      onTap: () {
                        Get.offAndToNamed(Routes.HOME);
                      },
                      child: const Icon(Icons.arrow_back_rounded,
                          color: Color(0xFF5141C7), size: 20)),
                ),
                const SizedBox(width: 40),
                Text("Danh sách người dùng",
                    style: GoogleFonts.play(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white)))
              ]),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextFormField(
                decoration: InputDecoration(
                    hintText: '  Search...',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0),
                        borderSide: const BorderSide(
                            width: 0, style: BorderStyle.none)),
                    suffixIcon: Container(
                        padding: EdgeInsets.zero,
                        margin: const EdgeInsets.only(
                            right: 4, top: 4, bottom: 4, left: 4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            gradient: const LinearGradient(colors: [
                              Color(0xFF704BFD),
                              Color(0xFFC979FF)
                            ])),
                        child: const Icon(Icons.search_sharp,
                            size: 24, color: Colors.white))),
                keyboardType: TextInputType.text,
                controller: searchController,
              ),
            ),
            SizedBox(
              height: Get.height - 165,
              child: ListView.builder(
                padding: const EdgeInsets.only(left: 12, right: 12, bottom: 8),
                itemCount: controller.users.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/lab_background4.png"),
                      ),
                      title: Text(controller.users[index].name),
                      subtitle: Text(controller.users[index].phone),
                      trailing: const Icon(CupertinoIcons.chevron_forward),
                      onTap: () {
                        Get.toNamed(
                            "${Routes.STUDENTDETAIL}/${controller.users[index].id}");
                      },
                    ),
                  );
                },
              ),
            )
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.bottomSheet(Stack(
                alignment: Alignment.topRight,
              children: [

                Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20, top: 10),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "ADD USER",
                        textAlign: TextAlign.left,
                        style: GoogleFonts.play(
                            textStyle: const TextStyle(
                          color: Color(0xFF5955EE),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        )),
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
                        hintText: 'Code...',
                        keyboardType: TextInputType.number,
                        controller: codeController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: ElevatedButton(
                          onPressed: () async {
                            // signup();
                            // await controller.signUp(phoneController.text, passwordController.text, emailController.text, int.parse(codeController.text), nameController.text);
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
                                    colors: [
                                      Color(0xFF5955EE),
                                      Color(0xFFC76DE8)
                                    ]),
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
                      ),
                      const SizedBox(height: 30),
                    ]),
              ),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                   shape: BoxShape.circle
                  ),

                  child: InkWell(
                      onTap: (){
                        Get.back();
                      },
                      child: const Icon(
                        Icons.close,
                        color: Color(0xFF704BFD),
                        size: 30,
                      )),
                )
              ]
            )
            );
          },
          tooltip: 'Add',
          backgroundColor: Colors.transparent,
          child: Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    colors: [Color(0xFF704BFD), Color(0xFFC979FF)])),
            child: const Icon(Icons.add),
          ),
        ),
      );
    });
  }
}

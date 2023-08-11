import 'package:datn/controller/list_camera_controller.dart';
import 'package:datn/models/camera.dart';
import 'package:datn/routes/app_pages.dart';
import 'package:datn/screen/loading_screen.dart';
import 'package:datn/widgets/app_input_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CamerasScreen extends StatefulWidget {
  const CamerasScreen({super.key});

  @override
  CamerasScreenState createState() {
    return CamerasScreenState();
  }
}

class CamerasScreenState extends State<CamerasScreen> {
  TextEditingController ipController = TextEditingController();
  TextEditingController roomController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController statusController = TextEditingController();

  ListCameraController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return controller.obx((state) {
      return WillPopScope(
        onWillPop: () async {
          Get.offAndToNamed(Routes.HOME);
          return false;
        },
        child: Scaffold(
          body: Column(children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 38,
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
                Text("Danh sách camera",
                    style: GoogleFonts.play(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Color(0xFF5955EE))))
              ]),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              Container(
                padding: EdgeInsets.zero,
                margin: EdgeInsets.zero,
                height: 30,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: (controller.typeCamera.value == "ROOM")
                            ? [const Color(0xFF5955EE), const Color(0xFFC76DE8)]
                            : [
                                const Color(0xFFC1D1D1),
                                const Color(0xFFDCCCCC),
                              ]),
                    borderRadius: BorderRadius.circular(30)),
                child: ElevatedButton(
                  onPressed: () async {
                    await controller.changeTypeRoom("ROOM");
                  },
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 0),
                    child: SizedBox(
                      height: 20,
                      width: (Get.width - 90) / 3,
                      child: Text(
                        "Camera phòng",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.robotoMono(
                            textStyle: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.zero,
                margin: EdgeInsets.zero,
                height: 30,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: (controller.typeCamera.value == "DOOR")
                            ? [const Color(0xFF5955EE), const Color(0xFFC76DE8)]
                            : [
                                const Color(0xFFC1D1D1),
                                const Color(0xFFDCCCCC),
                              ]),
                    borderRadius: BorderRadius.circular(30)),
                child: ElevatedButton(
                  onPressed: () async {
                    await controller.changeTypeRoom("DOOR");
                  },
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 0),
                    child: SizedBox(
                      height: 20,
                      width: (Get.width - 90) / 3,
                      child: Text(
                        "Camera cửa",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.robotoMono(
                            textStyle: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                                // color: Color(0xFFF4E7CF)
                                )),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.zero,
                margin: EdgeInsets.zero,
                height: 30,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: (controller.typeCamera.value == "ALL")
                            ? [const Color(0xFF5955EE), const Color(0xFFC76DE8)]
                            : [
                                const Color(0xFFC1D1D1),
                                const Color(0xFFDCCCCC),
                              ]),
                    borderRadius: BorderRadius.circular(30)),
                child: ElevatedButton(
                  onPressed: () async {
                    await controller.changeTypeRoom("ALL");
                  },
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 0),
                    child: SizedBox(
                      height: 20,
                      width: (Get.width - 90) / 3,
                      child: Text(
                        "Tất cả",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.robotoMono(
                            textStyle: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                      ),
                    ),
                  ),
                ),
              )
            ]),
            const SizedBox(
              height: 10,
            ),
           Expanded(
              // height: Get.height - 165,
              child: ListView.builder(
                padding: const EdgeInsets.only(left: 12, right: 12, bottom: 8),
                itemCount: controller.currentCameras.length,
                itemBuilder: (BuildContext context, int index) {
                  return Slidable(
                    endActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) async {
                            await controller.deleteCamera(controller.currentCameras[index].id!);
                            // await controller
                            //     .deleteUser(controller.users[index].id!);
                          },
                          backgroundColor: const Color(0xFF704BED),
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                          // spacing: 2,
                        )
                      ],
                    ),
                    child: Card(
                      child: ListTile(
                        leading: const CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/lab_background4.png"),
                        ),
                        title: Text(controller.currentCameras[index].name),
                        subtitle: Text(controller.currentCameras[index].room),
                        trailing: const Icon(
                          CupertinoIcons.chevron_forward,
                          color: Color(0xFF704BED),
                        ),
                        onTap: () {
                          if (controller.currentCameras[index].type == "ROOM"){
                            Get.toNamed(
                                "${Routes.CAMERADETAIL}/${controller.currentCameras[index].ip}");
                          }
                          else {
                            // Get.toNamed(page)
                          }
                        },
                      ),
                    ),
                  );
                },
              ),
            )
          ]),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Get.bottomSheet(
                  SingleChildScrollView(
                    child: Stack(alignment: Alignment.topRight, children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.all(12),
                        margin: const EdgeInsets.only(
                            bottom: 20, left: 20, right: 20, top: 10),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "ADD CAMERA",
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
                                hintText: 'IP...',
                                keyboardType: TextInputType.phone,
                                controller: ipController,
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
                                hintText: 'Room...',
                                keyboardType: TextInputType.text,
                                controller: roomController,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              // AppTextField(
                              //   hintText: 'Type...',
                              //   keyboardType: TextInputType.text,
                              //   controller: typeController,
                              // ),
                              Container(
                                padding: const EdgeInsets.only(
                                  left: 20,
                                  right: 20,
                                  top: 0,
                                  bottom: 0,
                                ),
                                height: 44.5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Color(0xFFC4BFEF))
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Type...",
                                      style: GoogleFonts.play(
                                          textStyle: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w300,
                                              color: Color(0xFFC4BFEF))),
                                    ),
                                    Obx(
                                          () => DropdownButton(
                                          padding: EdgeInsets.zero,
                                          iconEnabledColor: const Color(0xFF5955EE),
                                          items: controller.typeList
                                              .map((e) => DropdownMenuItem(
                                            value: e,
                                            child: Text(e, style:  GoogleFonts.play(
                                                textStyle: const TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w300,
                                                    color: Color(0xFFC4BFEF)
                                                )
                                            ),),
                                          ))
                                              .toList(),
                                          onChanged: (newValue) {
                                            controller.setSelectedType(newValue ?? 'ROOM');
                                          },
                                          value:
                                          controller.typeSelect.value),
                                    ),
                                  ],
                                ),
                              ),

                              // const SizedBox(
                              //   height: 10,
                              // ),
                              // AppTextField(
                              //   hintText: 'Status...',
                              //   keyboardType: TextInputType.text,
                              //   controller: statusController,
                              // ),
                              const SizedBox(
                                height: 20,
                              ),
                              Center(
                                child: ElevatedButton(
                                  onPressed: () async {
                                    // signup();
                                    // var result = await controller.signUpWithRole(
                                    //     phoneController.text,
                                    //     nameController.text,
                                    //     passwordController.text,
                                    //     emailController.text,
                                    //     int.parse(codeController.text),
                                    //     roleController.text);
                                    // if (result){
                                    //   await Future.delayed(const Duration(seconds: 1));
                                    //   Get.back();
                                    // }
                                    var result = await controller.addCamera(
                                        CameraModel(
                                            name: nameController.text,
                                            ip: ipController.text,
                                            room: roomController.text,
                                            type: controller.typeSelect.value,
                                            status: "OPEN"));
                                    if (result != null){
                                      // await Future.delayed(const Duration(seconds: 1));
                                      Get.back();
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                      padding: EdgeInsets.zero,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
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
                                        "Add camera",
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
                            color: Colors.white, shape: BoxShape.circle),
                        child: InkWell(
                            onTap: () {
                              Get.back();
                            },
                            child: const Icon(
                              Icons.close,
                              color: Color(0xFF704BFD),
                              size: 30,
                            )),
                      )
                    ]),
                  ),
                  isScrollControlled: true);
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
        ),
      );
    },
      onLoading:const LoadingScreen()
    );
  }
}

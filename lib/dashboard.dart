import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signspeak/all_signs.dart';
import 'package:signspeak/export.dart';
import 'package:signspeak/upload.dart';

class IconState extends GetxController {
  RxBool s1 = false.obs;
  RxBool s2 = false.obs;
  RxBool s3 = false.obs;
  RxBool s4 = false.obs;
  RxInt selected = 0.obs;
}

class ChoiceScreen extends StatelessWidget {
  ChoiceScreen({Key? key}) : super(key: key);
  final controller = Get.put(IconState());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        height: 80,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        // color: Colors.green,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: MaterialButton(
            // elevation: 10,
            color: Colors.amber,
            // elevation: 0,
            onPressed: () {
              switch (controller.selected.value) {
                case 1:
                  Get.to(() => const UploadScreen(),
                      transition: Transition.leftToRight);
                  break;
                case 2:
                  Get.to(() => RevTextHandler());
                  break;
                case 3:
                  Get.to(() => const RealtimeScreen(),
                      transition: Transition.leftToRight);
                  break;
                case 4:
                  Get.to(() => const AllSigns());
                  break;
                default:
                  Get.snackbar("Wait!", "Please select to continue...",
                      icon: const Icon(Icons.error));
              }
            },
            child: Text(
              "Continue",
              style: GoogleFonts.rubik(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Choose your Option..",
              style: GoogleFonts.rubik(
                color: Colors.black,
                shadows: [
                  const Shadow(
                      //  offset: Offset(1,-1),
                      blurRadius: 3,
                      color: Colors.grey),
                ],
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Flexible(
              child: GridView.count(
                scrollDirection: Axis.vertical,
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                padding: const EdgeInsets.all(10),
                children: [
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Obx(
                        () => GestureDetector(
                          onTap: () {
                            controller.s1.value = true;
                            controller.s3.value = false;
                            controller.s2.value = false;
                            controller.s4.value = false;
                            controller.selected.value = 1;
                          },
                          child: Container(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.file_upload,
                                    size: 60,
                                    color: (controller.s1.value)
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    "Upload",
                                    style: GoogleFonts.rubik(
                                      color: (controller.s1.value)
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ]),
                            decoration: BoxDecoration(
                                color: (controller.s1.value)
                                    ? Colors.amber
                                    : Colors.white,
                                boxShadow: const [
                                  BoxShadow(blurRadius: 15, color: Colors.grey)
                                ],
                                borderRadius: BorderRadius.circular(30)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Obx(
                        () => GestureDetector(
                          onTap: () {
                            controller.s2.value = true;
                            controller.s1.value = false;
                            controller.s3.value = false;
                            controller.s4.value = false;
                            controller.selected.value = 2;
                          },
                          child: Container(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.swap_horiz,
                                    size: 60,
                                    color: (controller.s2.value)
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    "Reverse",
                                    style: GoogleFonts.rubik(
                                      color: (controller.s2.value)
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ]),
                            decoration: BoxDecoration(
                                color: (controller.s2.value)
                                    ? Colors.amber
                                    : Colors.white,
                                boxShadow: const [
                                  BoxShadow(blurRadius: 15, color: Colors.grey)
                                ],
                                borderRadius: BorderRadius.circular(30)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Obx(
                        () => GestureDetector(
                          onTap: () {
                            controller.s3.value = true;
                            controller.s1.value = false;
                            controller.s2.value = false;
                            controller.s4.value = false;
                            controller.selected.value = 3;
                          },
                          child: Container(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.videocam,
                                    size: 60,
                                    color: (controller.s3.value)
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    "Realtime",
                                    style: GoogleFonts.rubik(
                                      color: (controller.s3.value)
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ]),
                            decoration: BoxDecoration(
                                color: (controller.s3.value)
                                    ? Colors.amber
                                    : Colors.white,
                                boxShadow: const [
                                  BoxShadow(blurRadius: 15, color: Colors.grey)
                                ],
                                borderRadius: BorderRadius.circular(30)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Obx(
                        () => GestureDetector(
                          onTap: () {
                            controller.s1.value = false;
                            controller.s3.value = false;
                            controller.s2.value = false;
                            controller.s4.value = true;
                            controller.selected.value = 4;
                          },
                          child: Container(
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Icon(
                                    Icons.follow_the_signs,
                                    size: 60,
                                    color: (controller.s4.value)
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    "All Signs",
                                    style: GoogleFonts.rubik(
                                      color: (controller.s4.value)
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ]),
                            decoration: BoxDecoration(
                                color: (controller.s4.value)
                                    ? Colors.amber
                                    : Colors.white,
                                boxShadow: const [
                                  BoxShadow(blurRadius: 15, color: Colors.grey)
                                ],
                                borderRadius: BorderRadius.circular(30)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}

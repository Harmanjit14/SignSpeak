import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
import 'export.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({Key? key}) : super(key: key);

  @override
  _UploadScreenState createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  final ImagePicker image = ImagePicker();
  XFile? photo;
  File? file;
  String? res;
  CameraController? controller;
  CameraImage? img;
  bool loading = false;

  @override
  void initState() {
    // Tflite.loadModel(
    //         model: "lib/assets/tflite/model.tflite",
    //         labels: "lib/assets/tflite/labels.txt",
    //         numThreads: 1, // defaults to 1
    //         isAsset:
    //             true, // defaults to true, set to false to load resources outside assets
    //         useGpuDelegate:
    //             false // defaults to false, set to true to use GPU delegate
    //         )
    //     .then((value) {
    //   print(value);
    // });
    Tflite.loadModel(
            model: "assets/tf/model.tflite",
            labels: "assets/tf/labels.txt",
            numThreads: 1, // defaults to 1
            isAsset:
                true, // defaults to true, set to false to load resources outside assets
            useGpuDelegate:
                false // defaults to false, set to true to use GPU delegate
            )
        .then((value) {
      print("hello");
      print(value);
    });

    controller = CameraController(cameras[0], ResolutionPreset.veryHigh);
    controller!.initialize().then((_) {
      if (!mounted) {
        print("Camera Not mounted!!");
        return;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return (loading)
        ? const Scaffold(
            body: Center(
              child: CircularProgressIndicator(color: Colors.amber),
            ),
          )
        : Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  // direction: Axis.vertical,
                  children: [
                    Expanded(
                      child: Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: (file == null)
                              ? Center(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(
                                        Icons.upload_file_rounded,
                                        size: 60,
                                        color: Colors.black,
                                      ),
                                      const SizedBox(height: 15),
                                      Text(
                                        "Upload Video or Image to continue...",
                                        style: GoogleFonts.rubik(
                                          fontSize: 18,
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              : Image.file(
                                  file!,
                                  fit: BoxFit.cover,
                                ),
                          // child: CameraPreview(controller!)
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(color: Colors.grey, blurRadius: 10),
                            ],
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      padding: const EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  // color: Colors.pink,
                                ),
                                child: ElevatedButton(
                                  onPressed: () async {
                                    photo = await image.pickImage(
                                        source: ImageSource.gallery);
                                    file = File(photo!.path);
                                    setState(() {});
                                  },
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    primary: Colors.grey[200],
                                    padding: const EdgeInsets.all(0),
                                    shape: const CircleBorder(),
                                  ),
                                  child: const Icon(Icons.image_sharp,
                                      size: 30, color: Colors.black),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 60,
                                width: 60,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  // color: Colors.pink,
                                ),
                                child: ElevatedButton(
                                  onPressed: () async {
                                    photo = await image.pickImage(
                                        source: ImageSource.camera);
                                    file = File(photo!.path);
                                    setState(() {});
                                  },
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    primary: Colors.grey[200],
                                    padding: const EdgeInsets.all(0),
                                    shape: const CircleBorder(),
                                  ),
                                  child: const Icon(Icons.camera_alt,
                                      size: 30, color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                          Container(
                              height: 60,
                              width: 130,
                              decoration: const BoxDecoration(
                                  // color: Colors.pink,
                                  ),
                              child: ElevatedButton.icon(
                                onPressed: () async {
                                  setState(() {
                                    loading = true;
                                  });
                                  await Tflite.runModelOnFrame(
                                    bytesList: img!.planes.map((plane) {
                                      return plane.bytes;
                                    }).toList(), // required
                                    imageHeight: img!.height,
                                    imageWidth: img!.width,
                                  ).then((value) => {
                                        print(value),
                                        Get.to(() => const SpeechScreen()),
                                      });
                                },
                                style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    primary: Colors.amber,
                                    padding: const EdgeInsets.all(0),
                                    shape: const StadiumBorder()),
                                icon: const Icon(Icons.volume_up_outlined,
                                    color: Colors.white, size: 30),
                                label: Text(
                                  "Done",
                                  style: GoogleFonts.rubik(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              )),
                        ],
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(color: Colors.grey, blurRadius: 10),
                          ],
                          borderRadius: BorderRadius.circular(20)),
                      height: 100,
                    )
                  ],
                ),
              ),
            ),
          );
  }
}

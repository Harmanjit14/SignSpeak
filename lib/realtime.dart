import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tflite/tflite.dart';
import 'export.dart';
import 'package:get/get.dart';

class RealtimeScreen extends StatefulWidget {
  const RealtimeScreen({Key? key}) : super(key: key);

  @override
  _RealtimeScreenState createState() => _RealtimeScreenState();
}

class _RealtimeScreenState extends State<RealtimeScreen> {
  CameraController? controller;
  CameraImage? img;
  bool loading = false;
  String res = "";

  @override
  void initState() {
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

      setState(() {
        controller!.startImageStream((image) => {
              img = image,
            });
      });
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
              child: Flex(
                direction: Axis.vertical,
                children: [
                  Flexible(
                    child: Container(
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: CameraPreview(controller!)),
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
                        Container(
                          height: 60,
                          width: 60,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            // color: Colors.pink,
                          ),
                          child: ElevatedButton(
                            onPressed: () async {
                              String temp;
                              await Tflite.runModelOnFrame(
                                bytesList: img!.planes.map((plane) {
                                  return plane.bytes;
                                }).toList(), // required
                                imageHeight: img!.height,
                                imageWidth: img!.width,
                              ).then((value) => {
                                    temp = value![0]["label"]
                                        .toString()
                                        .split(" ")
                                        .last,
                                    if (temp == '_')
                                      {
                                        res += " ",
                                      }
                                    else
                                      res += temp,
                                    Get.snackbar("Sign Converted",
                                        "Your sign says : $temp")
                                  });
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              primary: Colors.grey[200],
                              padding: const EdgeInsets.all(0),
                              shape: const CircleBorder(),
                            ),
                            child: const Icon(Icons.add,
                                size: 30, color: Colors.black),
                          ),
                        ),
                        Container(
                            height: 60,
                            width: 130,
                            decoration: const BoxDecoration(
                                // color: Colors.pink,
                                ),
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Get.to(() => SpeechScreen(res),
                                    transition: Transition.leftToRight);
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
            )),
          );
  }
}

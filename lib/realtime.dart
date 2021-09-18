import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
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

    controller = CameraController(cameras[0], ResolutionPreset.max);
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
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Flex(
          direction: Axis.vertical,
          children: [
            Flexible(
              child: Container(
                child: Expanded(child: CameraPreview(controller!)),
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
                mainAxisSize: MainAxisSize.max,
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

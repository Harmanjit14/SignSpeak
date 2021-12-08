import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class TimerSign extends GetxController {
  RxString char = 'a'.obs;
}

class RevScreen extends StatefulWidget {
  const RevScreen({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  State<RevScreen> createState() => _RevScreenState();
}

class _RevScreenState extends State<RevScreen> {
  final _state = Get.put(TimerSign());
  @override
  void initState() {
    _state.char.value = widget.text[0];
    Timer.periodic(const Duration(seconds: 2), (timer) {
      i++;
      _state.char.value =
          (widget.text[i].isAlphabetOnly) ? widget.text[i] : '_';
    });
    super.initState();
  }

  int i = 0;
  @override
  Widget build(BuildContext context) {
    const path = 'assets/signs/';
    const postfix = '.png';

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Realtime Conversion",
              style: GoogleFonts.rubik(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 200,
              width: 200,
              child: Obx(() => Image.asset(path + _state.char.value + postfix)),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                    blurRadius: 5,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

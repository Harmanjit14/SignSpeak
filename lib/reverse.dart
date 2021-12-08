import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signspeak/reversescreen.dart';

class RevTextHandler extends StatelessWidget {
  RevTextHandler({Key? key}) : super(key: key);
  final _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
              Get.off(()=>RevScreen(text: _controller.text));
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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Realtime Text to Sign",
                style: GoogleFonts.rubik(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Your text will be converted to signs in a natural way to help anyone in need.",
                textAlign: TextAlign.center,
                style: GoogleFonts.rubik(
                  fontSize: 16,
                  color: Colors.grey[700],

                  // fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 5,
                      color: Colors.grey,
                    )
                  ],
                ),
                child: TextField(
                  controller: _controller,
                  decoration: const InputDecoration(
                      border: InputBorder.none, hintText: "Enter your Text"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

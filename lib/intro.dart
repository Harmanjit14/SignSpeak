import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signspeak/dashboard.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => ChoiceScreen(), transition: Transition.leftToRight);
        },
        backgroundColor: Colors.yellow[700],
        child: const Icon(
          Icons.navigate_next,
          color: Colors.white,
          size: 30,
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sign Language to Speech Convertor!",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                        color: Colors.black,
                        fontSize: 35,
                        shadows: [
                          const Shadow(
                              //  offset: Offset(1,-1),
                              blurRadius: 3,
                              color: Colors.grey),
                        ],
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 15),
                  Text(
                    "Made by : Team Eternals",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.rubik(
                      color: Colors.grey[700],
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Image.asset("assets/hi.gif")
            ],
          ),
        ),
      ),
    );
  }
}

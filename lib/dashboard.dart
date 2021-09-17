import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';

class ChoiceScreen extends StatelessWidget {
  const ChoiceScreen({Key? key}) : super(key: key);

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
            color: Colors.amber,
            // elevation: 0,
            onPressed: () {},
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
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(blurRadius: 15, color: Colors.grey)
                            ],
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(blurRadius: 15, color: Colors.grey)
                            ],
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(blurRadius: 15, color: Colors.grey)
                            ],
                            borderRadius: BorderRadius.circular(30)),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}

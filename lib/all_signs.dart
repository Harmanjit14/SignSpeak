import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AllSigns extends StatelessWidget {
  const AllSigns({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const path = 'assets/signs/';
    const postfix = '.png';
    const List<String> char = [
      'a',
      'b',
      'c',
      'd',
      'e',
      'f',
      'g',
      'h',
      'i',
      'j',
      'k',
      'l',
      'm',
      'n',
      'o',
      'p',
      'q',
      'r',
      's',
      't',
      'u',
      'v',
      'w',
      'x',
      'y',
      'z',
      '_'
    ];
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          "All Signs on ASL Database",
          style: GoogleFonts.rubik(
            fontSize: 18,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: GridView.builder(
            itemCount: char.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 00,
              crossAxisSpacing: 0,
            ),
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(
                    left: 10, right: 10, top: 10, bottom: 10),
                padding: const EdgeInsets.all(5),
                child: Image.asset(path + char[index] + postfix),
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
              );
            }),
      ),
    );
  }
}

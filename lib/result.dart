import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_to_speech/text_to_speech.dart';

class SpeechScreen extends StatelessWidget {
  SpeechScreen(this.speech, {Key? key}) : super(key: key);
  final String speech;
  final TextToSpeech tts = TextToSpeech();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Image.asset("assets/eye.gif"),
              ),
              Text(
                "Your converted text is " + speech,
                textAlign: TextAlign.center,
                style: GoogleFonts.rubik(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      padding: const EdgeInsets.fromLTRB(30, 10, 30, 10)),
                  onPressed: () {
                    tts.setVolume(1.0);
                    tts
                        .speak("Your converted text is " + speech)
                        .then((value) => print(value));
                  },
                  icon: const Icon(
                    Icons.volume_up,
                    color: Colors.white,
                    size: 30,
                  ),
                  label: Text(
                    "Speak",
                    style: GoogleFonts.rubik(color: Colors.white, fontSize: 20),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

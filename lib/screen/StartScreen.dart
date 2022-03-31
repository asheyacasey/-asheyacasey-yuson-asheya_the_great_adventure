import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_great_adventure/screen/LockedDoorScreen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 150),
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                height: MediaQuery.of(context).size.height / 3,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage("asset/hugo.png"),
                )),
              ),
              Column(
                children: <Widget>[
                  Text("Navigation Act 1.0",
                      style: GoogleFonts.raleway(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 30,
                              color: Colors.deepPurple))),
                ],
              ),
              const SizedBox(height: 40),
              SizedBox(
                height: 50,
                width: 270,
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 60,
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const LockedDoorScreen(),
                        )
                    );
                  },
                  color: Colors.deepPurpleAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  child: Text(
                    "Start",
                    style: GoogleFonts.raleway(
                      textStyle:
                          const TextStyle(fontWeight: FontWeight.w700, fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

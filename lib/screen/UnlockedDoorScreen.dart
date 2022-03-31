import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_great_adventure/screen/FinalScreen.dart';
import 'package:the_great_adventure/widgets/UnlockedDoor.dart';


class UnlockedDoorScreen extends StatefulWidget {
  const UnlockedDoorScreen({Key? key}) : super(key: key);

  @override
  _UnlockedDoorScreenState createState() => _UnlockedDoorScreenState();
}

class _UnlockedDoorScreenState extends State<UnlockedDoorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("The door is opened!", style: GoogleFonts.raleway(
            textStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: Colors.white)),),
        centerTitle: true,
      ),
      body: SafeArea(
        //a stack widget shows the first child in children as the bottom layer and adds layers on top of it
        child: Stack(
          children: [
            const Center(child: UnlockedDoor()),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.all(18),
                      primary: Colors.white,
                      backgroundColor: Colors.deepPurpleAccent,
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(13))),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                    child: Text("Lock the door", style: GoogleFonts.raleway(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
                            color: Colors.white))),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.all(18),
                      primary: Colors.white,
                      backgroundColor: Colors.deepPurpleAccent,
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(13))),
                    ),
                    onPressed: () async {
                      String? player = await showDialog(
                          context: context,
                          builder: (BuildContext dialogContext) {
                            return const PlayerNameInput();
                          });
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => FinalScreen(
                            player: player ?? '',
                          ),
                        ),
                      );
                    },
                    child: Text("Step through the door", style: GoogleFonts.raleway(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 25,
                            color: Colors.white))),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PlayerNameInput extends StatefulWidget {
  const PlayerNameInput({
    Key? key,
  }) : super(key: key);

  @override
  State<PlayerNameInput> createState() => _PlayerNameInputState();
}

class _PlayerNameInputState extends State<PlayerNameInput> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Please enter your name"),
            TextFormField(
              controller: controller,
            ),
            OutlinedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.greenAccent),
              ),
              onPressed: () {
                Navigator.of(context).pop(controller.text);
              },
              child: const Text("Proceed"),
            ),
          ],
        ),
      ),
    );
  }
}
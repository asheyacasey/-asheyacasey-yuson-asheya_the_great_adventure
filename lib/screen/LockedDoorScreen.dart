import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_great_adventure/screen/DoorUnlockScreen.dart';
import 'package:the_great_adventure/widgets/LockedDoor.dart';
import 'package:the_great_adventure/screen/UnlockedDoorScreen.dart';

class LockedDoorScreen extends StatefulWidget {
  const LockedDoorScreen({Key? key}) : super(key: key);

  @override
  State<LockedDoorScreen> createState() => _LockedDoorScreenState();
}

class _LockedDoorScreenState extends State<LockedDoorScreen> {
  bool isUnlocked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text("You see a ${isUnlocked ? 'unlocked' : 'locked'} door",  style: GoogleFonts.raleway(
            textStyle: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 20,
                color: Colors.white))),
        centerTitle: true,
      ),
      body: SafeArea(
        //a stack widget shows the first child in children as the bottom layer and adds layers on top of it
        child: Stack(
          children: [
            const Center(child: LockedDoor()),
            Center(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.all(20),
                  primary: Colors.white,
                  backgroundColor: Colors.deepPurpleAccent,
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(13))),
                ),
                onPressed: () async {
                  if (isUnlocked) {
                    bool? reLockDoor = await Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const UnlockedDoorScreen()));
                    if (reLockDoor ?? false) {
                      if (mounted) {
                        setState(() {
                          isUnlocked = false;
                        });
                      }
                    }
                  } else {
                    bool? result = await Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => const DoorLockScreen()));

                    // result!=null? result: false
                    if (result ?? false) {
                      if (mounted) {
                        setState(() {
                          isUnlocked = true;
                        });
                      } else {
                        if (mounted) {
                          setState(() {
                            isUnlocked = false;
                          });
                        }
                      }
                    }
                  }
                },
                child: Text(isUnlocked ? "Open Door" : "Examine Door",   style: GoogleFonts.raleway(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 25,
                        color: Colors.white))),
              ),
            )
          ],
        ),
      ),
    );
  }
}
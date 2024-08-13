import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firstproject/signupFrame.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDialogWidget extends StatelessWidget {
  const CustomDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 300,
        height: 400,
        decoration: BoxDecoration(
          color: Color(0xFFCADCFC),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                'Well Done!!',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 25,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Now save the code below in case you forget your password',
                style: GoogleFonts.poppins(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: TextEditingController(text: 'Random code uwu'),
                readOnly: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'random code uwu',
                ),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

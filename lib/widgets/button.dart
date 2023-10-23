import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.callback,
    required this.textContent,
    this.bgColor = Colors.transparent,
  });

  final Function(String) callback;
  final String textContent;
  final Color bgColor;

  @override
  Widget build(context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: SizedBox(
        width: 65.0,
        height: 65.0,
        child: TextButton(
          onPressed: () => callback(textContent),
          style: TextButton.styleFrom(
            backgroundColor: bgColor,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.all(16.0),
            textStyle: const TextStyle(fontSize: 20.0),
          ),
          child: Text(
            textContent,
            style: GoogleFonts.rubik(
              textStyle: const TextStyle(
                fontSize: 20.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

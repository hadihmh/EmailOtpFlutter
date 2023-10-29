import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_login_app/constant/fonts.dart';
import 'package:timer_button/timer_button.dart';

class CustomTimerButton extends StatelessWidget {
  final VoidCallback onTap;
  final double size;
  final String? fontName;
  final String buttonText;
  final Gradient? gradient;
  final Color? textColor;
  const CustomTimerButton({
    super.key,
    required this.onTap,
    required this.size,
    this.fontName,
    required this.buttonText,
    this.gradient,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return TimerButton.builder(
      builder: (context, timeLeft) {
        return Opacity(
          opacity: timeLeft == -1 ? 1 : 0.4,
          child: Container(
            width: size,
            height: 40,
            decoration: BoxDecoration(
                gradient: gradient,
                color: Colors.white,
                borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: buttonText,
                      style: GoogleFonts.getFont(fontName ?? Fonts.josefin_sans,
                          fontWeight: FontWeight.bold, color: textColor),
                    ),
                    const TextSpan(
                      text: "  ",
                    ),
                    TextSpan(
                      text: timeLeft == -1 ? "" : timeLeft.toString(),
                      style: GoogleFonts.getFont(fontName ?? Fonts.josefin_sans,
                          fontWeight: FontWeight.bold, color: textColor),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
      onPressed: onTap,
      timeOutInSeconds: 180,
    );
  }
}

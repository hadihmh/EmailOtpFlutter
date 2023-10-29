import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_login_app/constant/fonts.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final double size;
  final String? fontName;
  final bool? isLoading;
  final String buttonText;
  final Gradient? gradient;
  final Color? textColor;
  const CustomButton({
    super.key,
    required this.onTap,
    required this.size,
    this.fontName,
    required this.buttonText,
    this.gradient,
    this.textColor,
    this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Opacity(
        opacity: (isLoading ?? false) ? 0.4 : 1,
        child: Container(
          width: size,
          height: 40,
          decoration: BoxDecoration(
              gradient: gradient,
              color: Colors.white,
              borderRadius: BorderRadius.circular(20)),
          child: Center(
              child: (isLoading ?? false)
                  ? const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 3,
                      ),
                    )
                  : Text(
                      buttonText,
                      style: GoogleFonts.getFont(fontName ?? Fonts.josefin_sans,
                          fontWeight: FontWeight.bold, color: textColor),
                    )),
        ),
      ),
    );
  }
}

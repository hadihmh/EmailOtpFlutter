import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_login_app/constant/fonts.dart';

class LogoOfApp extends StatelessWidget {
  const LogoOfApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
              text: 'MUSIC',
              style: GoogleFonts.getFont(
                Fonts.lilita_one,
                color: Colors.white,
                fontSize: 40,
                letterSpacing: 6.0,
              )),
          TextSpan(
            text: 'APP',
            style: GoogleFonts.getFont(Fonts.josefin_sans,
                letterSpacing: 3.0, color: Colors.white70, fontSize: 35),
          ),
        ],
      ),
    );
  }
}

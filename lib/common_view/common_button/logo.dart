import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/dimens.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/onboarding/logo.png',
          fit: BoxFit.fill,
          height: averageScreenSize * 0.07,
          width: averageScreenSize * 0.07,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('WOO',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                  color: const Color(0xffE73A40),
                  fontWeight: FontWeight.w900,
                  fontSize: averageScreenSize * 0.035,
                  height: averageScreenSize * 0.0015,
                ))),
            Text('DOG',
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                  color: const Color(0xffE73A40),
                  fontWeight: FontWeight.w900,
                  fontSize: averageScreenSize * 0.035,
                  height: averageScreenSize * 0.0015,
                ))),
          ],
        ),
      ],
    );
  }
}

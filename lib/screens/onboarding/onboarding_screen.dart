import 'package:dog_walking_app/utils/dimens.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common_view/common_button/eleveted_button.dart';
import '../../common_view/common_button/logo.dart';
import '../sign_up/sign_up_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    debugPrint('---------------------------------------->screenHeight = $screenHeight');
    debugPrint('---------------------------------------->screenWidth = $screenWidth');
    debugPrint('---------------------------------------->averageScreenSize = $averageScreenSize');

    // TODO: implement build
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.topStart,
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: AlignmentDirectional.topCenter,
                end: AlignmentDirectional.bottomCenter,
                colors: [
                  Color(0xffFFFFFF),
                  Color(0xff3C3C3C),
                  Color(0xff202020),
                  Color(0xff202020),
                  Color(0xff202020),
                ],
              ),
            ),
          ),
          Positioned(
            top: averageScreenSize * 0,
            right: 0,
            left: 0,
            child: Image.asset(
              'assets/images/onboarding/onbording_bg.png',
              width: screenWidth,
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: averageScreenSize * 0.05,
            left: averageScreenSize * 0.01,
            child: const Logo(),
          ),
          Positioned(
            top: screenHeight * 0.65,
            child: SizedBox(
              width: screenWidth,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: averageScreenSize * 0.026,
                        backgroundColor: const Color(0xffFCFCFC),
                        child: Text('1', style: GoogleFonts.poppins()),
                      ),
                      SizedBox(
                        width: screenWidth * 0.04,
                        child: Divider(
                          color: const Color(0xffF7F7F8),
                          indent: averageScreenSize * 0.005,
                          endIndent: averageScreenSize * 0.005,
                        ),
                      ),
                      CircleAvatar(
                        radius: averageScreenSize * 0.026,
                        backgroundColor: const Color(0xff404040),
                        child: Text('2', style: GoogleFonts.poppins(color: const Color(0xffF7F7F8))),
                      ),
                      SizedBox(
                        width: screenWidth * 0.04,
                        child: Divider(
                          color: const Color(0xffF7F7F8),
                          indent: averageScreenSize * 0.005,
                          endIndent: averageScreenSize * 0.005,
                        ),
                      ),
                      CircleAvatar(
                        radius: averageScreenSize * 0.026,
                        backgroundColor: const Color(0xff404040),
                        child: Text('3', style: GoogleFonts.poppins(color: const Color(0xffF7F7F8))),
                      )
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  Text(
                    'Too tired to walk your dog?',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: const Color(0xffFCFCFC),
                      fontWeight: FontWeight.w700,
                      fontSize: averageScreenSize * 0.04,
                    ),
                  ),
                  Text(
                    'Let’s help you!',
                    style: GoogleFonts.poppins(
                      color: const Color(0xffFCFCFC),
                      fontWeight: FontWeight.w700,
                      fontSize: averageScreenSize * 0.04,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  CustomElevatedButton(
                    width: screenWidth * 0.9,
                    height: screenHeight * 0.08,
                    borderRadius: averageScreenSize * 0.03,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpScreen()));
                    },
                    gradient: const LinearGradient(
                      begin: AlignmentDirectional.centerStart,
                      end: AlignmentDirectional.centerEnd,
                      colors: [
                        Color(0xffFB724C),
                        Color(0xffFE904B),
                      ],
                    ),
                    child: Text(
                      'Join our community',
                      style: GoogleFonts.poppins(
                          color: const Color(0xffFCFCFC),
                          fontWeight: FontWeight.w700,
                          fontSize: averageScreenSize * 0.030),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Already a member?',
                          style: GoogleFonts.poppins(
                            color: const Color(0xffFCFCFC),
                            fontWeight: FontWeight.w500,
                            fontSize: averageScreenSize * 0.022,
                          ),
                        ),
                        TextSpan(
                          text: ' ',
                          style: GoogleFonts.poppins(
                            color: const Color(0xffFB724C),
                            fontWeight: FontWeight.w700,
                            fontSize: averageScreenSize * 0.022,
                          ),
                        ),
                        TextSpan(
                          text: 'Sign in',
                          style: GoogleFonts.poppins(
                            color: const Color(0xffFB724C),
                            fontWeight: FontWeight.w600,
                            fontSize: averageScreenSize * 0.022,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

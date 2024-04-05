import 'package:dog_walking_app/common_view/common_button/eleveted_button.dart';
import 'package:dog_walking_app/utils/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../get_started/get_started_screen/get_started_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: SvgPicture.asset('assets/icons/leftback_arrow.svg', color: const Color(0xff2B2B2B))),
        toolbarHeight: averageScreenSize * 0.09,
      ),
      backgroundColor: const Color(0xffFCFCFC),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsetsDirectional.symmetric(
            vertical: screenHeight * 0.01,
            horizontal: screenWidth * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Let’s  start here',
                style: GoogleFonts.poppins(
                  color: const Color(0xff2B2B2B),
                  fontWeight: FontWeight.w700,
                  fontSize: averageScreenSize * 0.055,
                ),
              ),
              Text(
                'Fill in your details to begin',
                style: GoogleFonts.poppins(
                  color: const Color(0xff7A7A7A),
                  fontWeight: FontWeight.w500,
                  fontSize: averageScreenSize * 0.03,
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Container(
                padding: EdgeInsetsDirectional.only(
                  start: averageScreenSize * 0.04,
                  end: averageScreenSize * 0.04,
                  top: averageScreenSize * 0.015,
                  bottom: averageScreenSize * 0.01,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xffF0F0F0),
                  borderRadius: BorderRadius.all(Radius.circular(averageScreenSize * 0.03)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Full Name',
                      style: GoogleFonts.poppins(
                          color: const Color(0xffAEAEB2), fontSize: averageScreenSize * 0.02),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      style: GoogleFonts.poppins(
                        color: const Color(0xff2B2B2B),
                        fontWeight: FontWeight.w500,
                        fontSize: averageScreenSize * 0.030,
                        height: averageScreenSize * 0.002,
                      ),
                      cursorColor: const Color(0xffAEAEB2),
                      decoration: InputDecoration(
                        isDense: true,
                        filled: true,
                        fillColor: const Color(0xffF0F0F0),
                        contentPadding: EdgeInsetsDirectional.symmetric(vertical: averageScreenSize * 0.01),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xffF0F0F0)),
                          borderRadius: BorderRadius.circular(averageScreenSize * 0.03),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xffF0F0F0)),
                          borderRadius: BorderRadius.circular(averageScreenSize * 0.03),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xffF0F0F0)),
                          borderRadius: BorderRadius.circular(averageScreenSize * 0.03),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Container(
                padding: EdgeInsetsDirectional.only(
                  start: averageScreenSize * 0.04,
                  end: averageScreenSize * 0.04,
                  top: averageScreenSize * 0.015,
                  bottom: averageScreenSize * 0.01,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xffF0F0F0),
                  borderRadius: BorderRadius.all(Radius.circular(averageScreenSize * 0.03)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'E-mail',
                      style: GoogleFonts.poppins(
                        color: const Color(0xffAEAEB2),
                        fontSize: averageScreenSize * 0.02,
                      ),
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      style: GoogleFonts.poppins(
                        color: const Color(0xff2B2B2B),
                        fontWeight: FontWeight.w500,
                        fontSize: averageScreenSize * 0.030,
                        height: averageScreenSize * 0.002,
                      ),
                      cursorColor: const Color(0xffAEAEB2),
                      decoration: InputDecoration(
                        isDense: true,
                        filled: true,
                        fillColor: const Color(0xffF0F0F0),
                        contentPadding: EdgeInsetsDirectional.symmetric(vertical: averageScreenSize * 0.01),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xffF0F0F0)),
                          borderRadius: BorderRadius.circular(averageScreenSize * 0.03),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xffF0F0F0)),
                          borderRadius: BorderRadius.circular(averageScreenSize * 0.03),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color(0xffF0F0F0)),
                          borderRadius: BorderRadius.circular(averageScreenSize * 0.03),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Container(
                padding: EdgeInsetsDirectional.only(
                  start: averageScreenSize * 0.04,
                  end: averageScreenSize * 0.04,
                  top: averageScreenSize * 0.015,
                  bottom: averageScreenSize * 0.01,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xffF0F0F0),
                  borderRadius: BorderRadius.all(Radius.circular(averageScreenSize * 0.03)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 6,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Password',
                            style: GoogleFonts.poppins(
                                color: const Color(0xffAEAEB2), fontSize: averageScreenSize * 0.02),
                          ),
                          TextFormField(
                            style: GoogleFonts.poppins(
                              color: const Color(0xff2B2B2B),
                              fontWeight: FontWeight.w500,
                              fontSize: averageScreenSize * 0.030,
                              height: averageScreenSize * 0.002,
                            ),
                            obscureText: true,
                            cursorColor: const Color(0xffAEAEB2),
                            decoration: InputDecoration(
                              isDense: true,
                              filled: true,
                              fillColor: const Color(0xffF0F0F0),
                              contentPadding:
                                  EdgeInsetsDirectional.symmetric(vertical: averageScreenSize * 0.01),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(color: Color(0xffF0F0F0)),
                                borderRadius: BorderRadius.circular(averageScreenSize * 0.03),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Color(0xffF0F0F0)),
                                borderRadius: BorderRadius.circular(averageScreenSize * 0.03),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Color(0xffF0F0F0)),
                                borderRadius: BorderRadius.circular(averageScreenSize * 0.03),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/icons/hideclose_eye.svg',
                          color: const Color(0xffAEAEB2),
                          height: averageScreenSize * 0.035,
                          width: averageScreenSize * 0.035,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.025),
              CustomElevatedButton(
                width: screenWidth * 0.9,
                height: screenHeight * 0.08,
                borderRadius: averageScreenSize * 0.03,
                gradient: const LinearGradient(
                  begin: AlignmentDirectional.centerStart,
                  end: AlignmentDirectional.centerEnd,
                  colors: [
                    Color(0xffFB724C),
                    Color(0xffFE904B),
                  ],
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => GetStartedScreen()));
                },
                child: Text(
                  'Sign up',
                  style: GoogleFonts.poppins(
                    color: const Color(0xffFCFCFC),
                    fontWeight: FontWeight.w700,
                    fontSize: averageScreenSize * 0.030,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Center(
                child: Text(
                  'or',
                  style: GoogleFonts.poppins(
                    color: const Color(0xff2B2B2B),
                    fontWeight: FontWeight.w500,
                    fontSize: averageScreenSize * 0.03,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              CustomElevatedButton(
                width: screenWidth * 0.9,
                height: screenHeight * 0.08,
                borderRadius: averageScreenSize * 0.03,
                color: const Color(0xff3B5998),
                prefixIcon: SvgPicture.asset(
                  'assets/icons/facebook.svg',
                  height: averageScreenSize * 0.045,
                  width: averageScreenSize * 0.045,
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => GetStartedScreen()));
                },
                child: Text(
                  'Connect with Facebook',
                  style: GoogleFonts.poppins(
                    color: const Color(0xffFCFCFC),
                    fontWeight: FontWeight.w500,
                    fontSize: averageScreenSize * 0.028,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              CustomElevatedButton(
                width: screenWidth * 0.9,
                height: screenHeight * 0.08,
                borderRadius: averageScreenSize * 0.03,
                prefixIcon: Image.asset(
                  'assets/images/google.png',
                  height: averageScreenSize * 0.038,
                  width: averageScreenSize * 0.038,
                ),
                borderColor: const Color(0xffB0B0B0),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const GetStartedScreen()));
                  debugPrint('----------------------------------->$screenWidth');
                  debugPrint('----------------------------------->$screenHeight');
                  debugPrint('----------------------------------->$averageScreenSize');
                },
                child: Text(
                  'Connect with Google',
                  style: GoogleFonts.poppins(
                    color: const Color(0xff2B2B2B),
                    fontWeight: FontWeight.w500,
                    fontSize: averageScreenSize * 0.028,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Container(
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: averageScreenSize * 0.04,
                ),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'By signing in, I agree with',
                        style: GoogleFonts.poppins(
                          color: const Color(0xff7A7A7A),
                          fontWeight: FontWeight.w500,
                          fontSize: averageScreenSize * 0.022,
                        ),
                      ),
                      const TextSpan(text: ' '),
                      TextSpan(
                        text: 'Terms of Use and Privacy Policy',
                        style: GoogleFonts.poppins(
                          color: const Color(0xff2B2B2B),
                          fontWeight: FontWeight.w500,
                          fontSize: averageScreenSize * 0.022,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

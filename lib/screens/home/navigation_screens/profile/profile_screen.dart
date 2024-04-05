import 'package:dog_walking_app/utils/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../common_view/common_button/eleveted_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: screenHeight * 0.07,
        leading: Padding(
          padding: EdgeInsetsDirectional.all(averageScreenSize * 0.015),
          child: CircleAvatar(
            backgroundColor: const Color(0xffF0F0F0),
            child: SvgPicture.asset('assets/icons/setting_icon.svg', color: const Color(0xff2B2B2B)),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.all(averageScreenSize * 0.015),
            child: CircleAvatar(
              backgroundColor: const Color(0xffF0F0F0),
              child: SvgPicture.asset('assets/icons/notification_icon.svg', color: const Color(0xff2B2B2B)),
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xffFCFCFC),
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints.expand(width: screenWidth, height: screenHeight),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: averageScreenSize * 0.125,
                backgroundImage: const AssetImage('assets/images/home/profile/profile_pic.png'),
              ),
              SizedBox(height: screenHeight * 0.02),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Cristian Downey',
                    style: GoogleFonts.poppins(
                      color: const Color(0xff2B2B2B),
                      fontWeight: FontWeight.w700,
                      fontSize: averageScreenSize * 0.055,
                    ),
                  ),
                  SvgPicture.asset(
                    'assets/icons/edit_icon.svg',
                    color: const Color(0xff8D8D91),
                    height: averageScreenSize * 0.03,
                    width: averageScreenSize * 0.03,
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/icons/location_pin_icon.svg',
                    color: const Color(0xff8D8D91),
                    height: averageScreenSize * 0.028,
                    width: averageScreenSize * 0.028,
                  ),
                  SizedBox(width: averageScreenSize * 0.01),
                  Text(
                    'Moscow, Russia',
                    style: GoogleFonts.poppins(
                      color: const Color(0xffA1A1A2),
                      fontWeight: FontWeight.w500,
                      fontSize: averageScreenSize * 0.03,
                    ),
                  ),
                ],
              ),
              SizedBox(width: averageScreenSize * 0.02),
              Flexible(
                flex: 1,
                fit: FlexFit.loose,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    CustomCardButton(
                      icon: 'assets/icons/my_pet_icon.svg',
                      name: 'My pets',
                      onPressed: () {},
                    ),
                    CustomCardButton(
                      icon: 'assets/icons/my_fav_icon.svg',
                      name: 'My favourites',
                      onPressed: () {},
                    ),
                    CustomCardButton(
                      icon: 'assets/icons/my_badges_icon.svg',
                      name: 'My badges',
                      onPressed: () {},
                    ),
                    CustomCardButton(
                      icon: 'assets/icons/my_wallet_icon.svg',
                      name: 'My wallet',
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(height: averageScreenSize * 0.03),
              CustomElevatedButton(
                width: screenWidth * 0.9,
                height: screenHeight * 0.08,
                borderRadius: averageScreenSize * 0.03,
                color: const Color(0xff2B2B2B),
                onPressed: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (context) => GetStartedScreen()));
                },
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'View all',
                      style: GoogleFonts.poppins(
                        color: const Color(0xffF7F7F8),
                        fontWeight: FontWeight.w700,
                        fontSize: averageScreenSize * 0.030,
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.02),
                    SvgPicture.asset(
                      'assets/icons/rightfront_arrow.svg',
                      color: const Color(0xffF7F7F8),
                      height: averageScreenSize * 0.03,
                      width: averageScreenSize * 0.03,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomCardButton extends StatelessWidget {
  const CustomCardButton({super.key, required this.icon, required this.name, required this.onPressed});

  final String icon;
  final String name;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        constraints: BoxConstraints.expand(width: screenWidth * 0.90, height: screenHeight * 0.07),
        margin: EdgeInsetsDirectional.symmetric(
            horizontal: averageScreenSize * 0.03, vertical: averageScreenSize * 0.015),
        padding: EdgeInsetsDirectional.symmetric(horizontal: averageScreenSize * 0.03),
        decoration: BoxDecoration(
          color: const Color(0xffFAFAFA).withOpacity(1),
          borderRadius: BorderRadius.circular(averageScreenSize * 0.03),
          boxShadow: [
            BoxShadow(
              color: const Color(0xff2B2B2B).withOpacity(0.05),
              blurRadius: averageScreenSize * 0.005,
              spreadRadius: -(averageScreenSize * 0.01),
              offset: const Offset(0.0, 10.0),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            SvgPicture.asset(
              icon,
              height: averageScreenSize * 0.035,
              width: averageScreenSize * 0.035,
            ),
            SizedBox(
              width: averageScreenSize * 0.02,
            ),
            Text(
              name,
              style: GoogleFonts.poppins(
                color: const Color(0xff2B2B2B),
                fontWeight: FontWeight.w500,
                fontSize: averageScreenSize * 0.025,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

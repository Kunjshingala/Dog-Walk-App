import 'package:dog_walking_app/common_view/common_button/eleveted_button.dart';
import 'package:dog_walking_app/utils/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../walk_planning/walk_planning_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFCFCFC),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsetsDirectional.only(
              top: averageScreenSize * 0.06, start: averageScreenSize * 0.02, end: averageScreenSize * 0.02),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Home',
                        style: GoogleFonts.poppins(
                          color: const Color(0xff202020),
                          fontWeight: FontWeight.w700,
                          fontSize: averageScreenSize * 0.055,
                        ),
                      ),
                      Text(
                        'Explore dog walkers',
                        style: GoogleFonts.poppins(
                          color: const Color(0xffA1A1A1),
                          fontWeight: FontWeight.w500,
                          fontSize: averageScreenSize * 0.03,
                        ),
                      ),
                    ],
                  ),
                  CustomElevatedButton(
                    width: screenWidth * 0.28,
                    height: screenHeight * 0.05,
                    borderRadius: averageScreenSize * 0.01,
                    gradient: const LinearGradient(
                      begin: AlignmentDirectional.centerStart,
                      end: AlignmentDirectional.centerEnd,
                      colors: [
                        Color(0xffFB724C),
                        Color(0xffFE904B),
                      ],
                    ),
                    prefixIcon:
                        SvgPicture.asset('assets/icons/plus_icon.svg', color: const Color(0xffFCFCFC)),
                    prefixIconSpacing: screenWidth * 0.0001,
                    child: Text(
                      'Book a walk',
                      style: GoogleFonts.poppins(
                        color: const Color(0xffFCFCFC),
                        fontWeight: FontWeight.w700,
                        fontSize: averageScreenSize * 0.016,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.030),
              TextFormField(
                style: TextStyle(
                  color: const Color(0xffA1A1A1),
                  fontWeight: FontWeight.w400,
                  fontSize: averageScreenSize * 0.03,
                ),
                decoration: InputDecoration(
                  isDense: true,
                  filled: true,
                  fillColor: const Color(0xffF0F0F0),
                  hintText: 'Your location...',
                  hintStyle: GoogleFonts.poppins(
                    color: const Color(0xffA1A1A1),
                    fontWeight: FontWeight.w400,
                  ),
                  contentPadding: EdgeInsetsDirectional.symmetric(
                      horizontal: averageScreenSize * 0.01, vertical: averageScreenSize * 0.005),
                  prefixIcon: Padding(
                    padding: EdgeInsetsDirectional.all(averageScreenSize * 0.025),
                    child: Image.asset(
                      'assets/images/home/location_pin.png',
                      color: const Color(0xffA1A1A1),
                    ),
                  ),
                  suffixIcon: Padding(
                    padding: EdgeInsetsDirectional.all(averageScreenSize * 0.025),
                    child: Image.asset(
                      'assets/images/home/filter_icon.png',
                      color: const Color(0xffA1A1A1),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(averageScreenSize * 0.025),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(averageScreenSize * 0.025),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.circular(averageScreenSize * 0.025),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Stack(
                children: [
                  Image.asset(
                    'assets/images/home/home_banner.png',
                    width: screenWidth * 0.95,
                    height: screenHeight * 0.2,
                    fit: BoxFit.fitWidth,
                  ),
                  Positioned(
                    top: averageScreenSize * 0.03,
                    left: averageScreenSize * 0.38,
                    bottom: averageScreenSize * 0.02,
                    child: Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Image.asset(
                        'assets/images/home/banner_top.png',
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.01),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Top walkers',
                    style: GoogleFonts.poppins(
                      color: const Color(0xff202020),
                      fontWeight: FontWeight.w700,
                      fontSize: averageScreenSize * 0.055,
                    ),
                  ),
                  Text(
                    'View all',
                    style: GoogleFonts.poppins(
                      color: const Color(0xff202020),
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w400,
                      fontSize: averageScreenSize * 0.025,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.01),
              Container(
                constraints: BoxConstraints.expand(width: screenWidth, height: screenHeight * 0.3),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return ScrollCard(index: index);
                  },
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Divider(color: const Color(0xffE8E8E8), thickness: averageScreenSize * 0.003),
              SizedBox(height: screenHeight * 0.01),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Suggested',
                    style: GoogleFonts.poppins(
                      color: const Color(0xff202020),
                      fontWeight: FontWeight.w700,
                      fontSize: averageScreenSize * 0.055,
                    ),
                  ),
                  Text(
                    'View all',
                    style: GoogleFonts.poppins(
                      color: const Color(0xff202020),
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.w400,
                      fontSize: averageScreenSize * 0.025,
                    ),
                  ),
                ],
              ),
              Container(
                constraints: BoxConstraints.expand(width: screenWidth, height: screenHeight * 0.3),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return ScrollCard(index: index);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ScrollCard extends StatelessWidget {
  final int index;
  const ScrollCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(width: screenWidth * 0.6, height: screenHeight * 0.2),
      margin: EdgeInsetsDirectional.symmetric(horizontal: averageScreenSize * 0.02),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: AlignmentDirectional.topEnd,
            children: [
              ClipRRect(
                borderRadius: BorderRadiusDirectional.circular(averageScreenSize * 0.02),
                child: Image.asset(
                  index % 2 == 0 ? 'assets/images/home/card1.jpeg' : 'assets/images/home/card2.jpeg',
                  width: screenWidth * 0.6,
                  height: screenHeight * 0.18,
                  fit: BoxFit.fill,
                ),
              ),
              Container(
                constraints: BoxConstraints.expand(width: screenWidth * 0.15, height: screenHeight * 0.04),
                margin: EdgeInsetsDirectional.all(averageScreenSize * 0.02),
                padding: EdgeInsetsDirectional.symmetric(
                  horizontal: averageScreenSize * 0.015,
                  vertical: averageScreenSize * 0.01,
                ),
                decoration: BoxDecoration(
                    color: const Color(0xffE5E5EA).withOpacity(0.3),
                    borderRadius: BorderRadius.circular(averageScreenSize * 0.01)),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/icons/star_icon.svg',
                      color: const Color(0xffFFCB55),
                      height: averageScreenSize * 0.020,
                      width: averageScreenSize * 0.020,
                    ),
                    Text(
                      index % 2 == 0 ? '4.5' : '4.2',
                      style: GoogleFonts.poppins(
                          color: const Color(0xffFFCB55),
                          fontWeight: FontWeight.w600,
                          fontSize: averageScreenSize * 0.02),
                    ),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: screenHeight * 0.01, width: double.minPositive),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    index % 2 == 0 ? 'Mark Greene' : 'Trina Kain',
                    style: GoogleFonts.poppins(
                      color: const Color(0xff202020),
                      fontWeight: FontWeight.w500,
                      fontSize: averageScreenSize * 0.035,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.asset('assets/images/home/location_pin.png'),
                      SizedBox(width: averageScreenSize * 0.01),
                      Text(
                        index % 2 == 0 ? 'India, Guntur' : 'England, London',
                        style: GoogleFonts.poppins(
                          color: const Color(0xffA1A1A1),
                          fontWeight: FontWeight.w500,
                          fontSize: averageScreenSize * 0.02,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WalkPlanningScreen(),
                    ),
                  );
                },
                child: Container(
                  height: screenHeight * 0.04,
                  width: screenWidth * 0.2,
                  padding: EdgeInsetsDirectional.symmetric(
                      horizontal: averageScreenSize * 0.02, vertical: averageScreenSize * 0.01),
                  decoration: BoxDecoration(
                      color: const Color(0xff202020),
                      borderRadius: BorderRadiusDirectional.circular(averageScreenSize * 0.01)),
                  child: Center(
                    child: Text(
                      index % 2 == 0 ? '\$5/hr' : '\$7/hr',
                      style: GoogleFonts.poppins(
                        color: const Color(0xffFBFBFB),
                        fontWeight: FontWeight.w500,
                        fontSize: averageScreenSize * 0.02,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

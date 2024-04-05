import 'package:dog_walking_app/common_view/common_button/eleveted_button.dart';
import 'package:dog_walking_app/common_view/common_button/logo.dart';
import 'package:dog_walking_app/utils/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'moment_screen_data.dart';

class MomentsScreen extends StatefulWidget {
  const MomentsScreen({super.key});

  @override
  State<MomentsScreen> createState() => _MomentsScreenState();
}

class _MomentsScreenState extends State<MomentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFCFCFC),
      body: Container(
        padding: EdgeInsetsDirectional.symmetric(
            horizontal: averageScreenSize * 0.02, vertical: averageScreenSize * 0.035),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Logo(),
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
                  onPressed: () {},
                  prefixIcon: SvgPicture.asset(
                    'assets/icons/plus_icon.svg',
                    color: const Color(0xffFCFCFC),
                    height: averageScreenSize,
                    width: averageScreenSize,
                  ),
                  prefixIconHeight: averageScreenSize * 0.03,
                  prefixIconWidth: averageScreenSize * 0.03,
                  prefixIconSpacing: screenWidth * 0.0001,
                  child: Text(
                    'Add a post',
                    style: GoogleFonts.poppins(
                      color: const Color(0xffFCFCFC),
                      fontWeight: FontWeight.w700,
                      fontSize: averageScreenSize * 0.016,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.01),
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: screenHeight * 0.12),
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return StoryCard(index: index);
                },
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Text(
              'Recently added',
              style: GoogleFonts.poppins(
                color: const Color(0xff2B2B2B),
                fontWeight: FontWeight.w700,
                fontSize: averageScreenSize * 0.035,
              ),
            ),
            SizedBox(height: screenHeight * 0.01),
            Flexible(
              flex: 1,
              fit: FlexFit.tight,
              child: MasonryGridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: averageScreenSize * 0.02,
                crossAxisSpacing: averageScreenSize * 0.02,
                itemCount: momentScreenDataList.length,
                padding: EdgeInsetsDirectional.zero,
                itemBuilder: (BuildContext context, int index) {
                  return ClipRRect(
                    borderRadius: BorderRadiusDirectional.circular(averageScreenSize * 0.03),
                    child: Container(
                      constraints: BoxConstraints(maxWidth: screenWidth * 0.95 / 2),
                      color: Colors.red,
                      child: Stack(
                        children: [
                          Image.asset(momentScreenDataList[index].image, fit: BoxFit.cover),
                          Positioned(
                            top: averageScreenSize * 0.02,
                            left: averageScreenSize * 0.015,
                            child: SvgPicture.asset('assets/icons/three_dot_icon.svg'),
                          ),
                          Positioned(
                            left: averageScreenSize * 0.015,
                            bottom: averageScreenSize * 0.013,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  padding: EdgeInsetsDirectional.symmetric(
                                    horizontal: averageScreenSize * 0.012,
                                    vertical: averageScreenSize * 0.005,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xffA1A1A2).withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(averageScreenSize * 0.02),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icons/like_icon.svg',
                                        color: const Color(0xffFBFBFB),
                                        width: averageScreenSize * 0.02,
                                        height: averageScreenSize * 0.02,
                                      ),
                                      SizedBox(
                                        width: averageScreenSize * 0.005,
                                      ),
                                      Text(
                                        momentScreenDataList[index].likes,
                                        style: GoogleFonts.poppins(
                                          color: const Color(0xffFBFBFB),
                                          fontWeight: FontWeight.w500,
                                          fontSize: averageScreenSize * 0.02,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: averageScreenSize * 0.005,
                                ),
                                Container(
                                  padding: EdgeInsetsDirectional.symmetric(
                                    horizontal: averageScreenSize * 0.012,
                                    vertical: averageScreenSize * 0.005,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xffA1A1A2).withOpacity(0.4),
                                    borderRadius: BorderRadius.circular(averageScreenSize * 0.02),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/icons/comment_icon.svg',
                                        color: const Color(0xffFBFBFB),
                                        width: averageScreenSize * 0.02,
                                        height: averageScreenSize * 0.02,
                                      ),
                                      SizedBox(
                                        width: averageScreenSize * 0.005,
                                      ),
                                      Text(
                                        momentScreenDataList[index].commentsNumber.toString(),
                                        style: GoogleFonts.poppins(
                                          color: const Color(0xffFBFBFB),
                                          fontWeight: FontWeight.w500,
                                          fontSize: averageScreenSize * 0.02,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StoryCard extends StatelessWidget {
  const StoryCard({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: averageScreenSize * 0.12,
          height: averageScreenSize * 0.12,
          margin: EdgeInsetsDirectional.symmetric(horizontal: averageScreenSize * 0.01),
          padding: EdgeInsetsDirectional.all(averageScreenSize * 0.005),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xffFB724C), width: averageScreenSize * 0.003),
          ),
          child: index == 0
              ? Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: AlignmentDirectional.centerStart,
                      end: AlignmentDirectional.centerEnd,
                      colors: [Color(0xffFB724C), Color(0xffFE904B)],
                    ),
                  ),
                  child: Center(
                    child: SvgPicture.asset('assets/icons/plus_icon.svg'),
                  ),
                )
              : ClipRRect(
                  borderRadius: BorderRadiusDirectional.circular(averageScreenSize * 0.1),
                  child: Image.asset(
                    'assets/images/home/moments/story1.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
        ),
        SizedBox(height: screenHeight * 0.001),
        Text(
          index == 0 ? 'New' : 'Chloe H.',
          style: GoogleFonts.poppins(
            color: const Color(0xff2B2B2B),
            fontWeight: FontWeight.w500,
            fontSize: averageScreenSize * 0.02,
          ),
        ),
      ],
    );
  }
}

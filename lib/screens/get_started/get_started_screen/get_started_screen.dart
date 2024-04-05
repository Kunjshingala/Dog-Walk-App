import 'package:dog_walking_app/common_view/common_button/eleveted_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/dimens.dart';
import '../../home/navigation_screen.dart';
import '../get_started_pages/gs_page_1.dart';
import '../get_started_pages/gs_page_2.dart';
import 'get_started_bloc.dart';

class GetStartedScreen extends StatefulWidget {
  const GetStartedScreen({super.key});

  @override
  State<GetStartedScreen> createState() => _GetStartedScreenState();
}

class _GetStartedScreenState extends State<GetStartedScreen> {
  late GetStartedBloc getStartedBloc;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    getStartedBloc = GetStartedBloc(context: context);
  }

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
      body: Container(
        padding: EdgeInsetsDirectional.symmetric(horizontal: averageScreenSize * 0.02),
        width: screenWidth,
        height: screenHeight * 0.90,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'We’d love your pet',
              style: GoogleFonts.poppins(
                color: const Color(0xff2B2B2B),
                fontWeight: FontWeight.w700,
                fontSize: averageScreenSize * 0.055,
              ),
            ),
            Text(
              'Tell us something about your dog',
              style: GoogleFonts.poppins(
                color: const Color(0xffA1A1A1),
                fontWeight: FontWeight.w500,
                fontSize: averageScreenSize * 0.028,
              ),
            ),
            SizedBox(height: averageScreenSize * 0.03),
            StreamBuilder<int>(
              stream: getStartedBloc.getPageNumber,
              builder: (context, snapshot) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${snapshot.data.toString()}/2',
                      style: GoogleFonts.poppins(
                        color: const Color(0xffA1A1A1),
                        fontWeight: FontWeight.w500,
                        fontSize: averageScreenSize * 0.025,
                      ),
                    ),
                    SizedBox(height: averageScreenSize * 0.01),
                    LinearProgressIndicator(
                      color: const Color(0xffFB724C),
                      value: snapshot.hasData ? (snapshot.data! * 1) / 2 : 0,
                      borderRadius: BorderRadius.circular(averageScreenSize * 0.01),
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: averageScreenSize * 0.01),
            Expanded(
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  PageView(
                    scrollDirection: Axis.horizontal,
                    controller: getStartedBloc.pageController,
                    onPageChanged: (value) {
                      getStartedBloc.setPageNumber(value + 1);
                    },
                    children: const [
                      GSPageOne(),
                      GSPageTwo(),
                    ],
                  ),
                  Container(
                    margin: EdgeInsetsDirectional.only(bottom: averageScreenSize * 0.05),
                    child: CustomElevatedButton(
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
                      child: Text(
                        'Get Started',
                        style: GoogleFonts.poppins(
                          color: const Color(0xffFCFCFC),
                          fontWeight: FontWeight.w700,
                          fontSize: averageScreenSize * 0.030,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NavigationScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

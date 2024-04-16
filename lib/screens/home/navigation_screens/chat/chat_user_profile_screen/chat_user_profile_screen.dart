import 'package:dog_walking_app/common_view/common_button/eleveted_button.dart';
import 'package:dog_walking_app/screens/home/navigation_screens/chat/chat_user_profile_screen/chat_user_profile_tab_screen/chat_user_about_tab.dart';
import 'package:dog_walking_app/utils/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'chat_user_profile_bloc.dart';
import 'chat_user_profile_tab_screen/chat_user_location_tab.dart';
import 'chat_user_profile_tab_screen/chat_user_review_tab.dart';

class ChatUserProfileScreen extends StatefulWidget {
  const ChatUserProfileScreen({super.key, required this.name, required this.image});

  final String image;
  final String name;

  @override
  State<ChatUserProfileScreen> createState() => _ChatUserProfileScreenState();
}

class _ChatUserProfileScreenState extends State<ChatUserProfileScreen> with SingleTickerProviderStateMixin {
  late TabController tabController;
  late DraggableScrollableController draggableScrollableController;

  late ChatUserProfileBloc chatUserProfileBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    draggableScrollableController = DraggableScrollableController();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    chatUserProfileBloc = ChatUserProfileBloc(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        titleSpacing: 0,
        leadingWidth: averageScreenSize * 0.0,
        title: Container(
          width: screenWidth,
          margin: EdgeInsetsDirectional.symmetric(horizontal: averageScreenSize * 0.02),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: averageScreenSize * 0.08,
                height: averageScreenSize * 0.08,
                padding: EdgeInsetsDirectional.all(averageScreenSize * 0.01),
                alignment: AlignmentDirectional.center,
                decoration: BoxDecoration(
                  color: const Color(0xffC4C4C4).withOpacity(0.5),
                  borderRadius: BorderRadius.circular(averageScreenSize * 0.03),
                ),
                child: SvgPicture.asset(
                  'assets/icons/cancel_icon.svg',
                  color: const Color(0xffF7F7F8),
                ),
              ),
              CustomElevatedButton(
                width: screenWidth * 0.28,
                height: averageScreenSize * 0.08,
                borderRadius: averageScreenSize * 0.035,
                color: const Color(0xffC4C4C4).withOpacity(0.5),
                suffixIcon: SvgPicture.asset(
                  'assets/icons/tick_icon.svg',
                  color: const Color(0xffF7F7F8),
                ),
                child: Text(
                  'Verified',
                  style: GoogleFonts.poppins(
                    color: const Color(0xffF7F7F8),
                    fontSize: averageScreenSize * 0.025,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Image.asset(
            widget.image,
            fit: BoxFit.contain,
          ),
          DraggableScrollableSheet(
            minChildSize: 0.55,
            initialChildSize: 0.55,
            maxChildSize: 0.85,
            expand: true,
            controller: draggableScrollableController,
            builder: (context, scrollController) {
              return SingleChildScrollView(
                controller: scrollController,
                child: Container(
                  height: screenHeight * 0.85,
                  width: screenWidth,
                  padding: EdgeInsetsDirectional.symmetric(
                    horizontal: screenWidth * 0.05,
                    vertical: screenHeight * 0.03,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(averageScreenSize * 0.04),
                      topEnd: Radius.circular(averageScreenSize * 0.04),
                    ),
                  ),
                  child: SingleChildScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          widget.name,
                          style: GoogleFonts.poppins(
                              color: const Color(0xff2B2B2B),
                              fontSize: averageScreenSize * 0.045,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        IntrinsicHeight(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '5\$',
                                      style: GoogleFonts.poppins(
                                        color: const Color(0xff2B2B2B),
                                        fontWeight: FontWeight.w500,
                                        fontSize: averageScreenSize * 0.02,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '/hr',
                                      style: GoogleFonts.poppins(
                                        color: const Color(0xffA1A1A1),
                                        fontWeight: FontWeight.w500,
                                        fontSize: averageScreenSize * 0.02,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const VerticalDivider(
                                color: Color(0xffA1A1A1),
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '10 ',
                                      style: GoogleFonts.poppins(
                                        color: const Color(0xff2B2B2B),
                                        fontWeight: FontWeight.w500,
                                        fontSize: averageScreenSize * 0.02,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'km',
                                      style: GoogleFonts.poppins(
                                        color: const Color(0xffA1A1A1),
                                        fontWeight: FontWeight.w500,
                                        fontSize: averageScreenSize * 0.02,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const VerticalDivider(
                                color: Color(0xffA1A1A1),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Text(
                                    '4.4 ',
                                    style: GoogleFonts.poppins(
                                      color: const Color(0xff2B2B2B),
                                      fontWeight: FontWeight.w500,
                                      fontSize: averageScreenSize * 0.02,
                                    ),
                                  ),
                                  SvgPicture.asset(
                                    'assets/icons/star_icon.svg',
                                    color: const Color(0xffB0B0B0),
                                    height: averageScreenSize * 0.018,
                                    width: averageScreenSize * 0.018,
                                  ),
                                ],
                              ),
                              const VerticalDivider(
                                color: Color(0xffA1A1A1),
                              ),
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '450 ',
                                      style: GoogleFonts.poppins(
                                        color: const Color(0xff2B2B2B),
                                        fontWeight: FontWeight.w500,
                                        fontSize: averageScreenSize * 0.02,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'walks',
                                      style: GoogleFonts.poppins(
                                        color: const Color(0xffA1A1A1),
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
                        SizedBox(height: screenHeight * 0.02),
                        Divider(
                          color: const Color(0xffE8E8E8),
                          thickness: averageScreenSize * 0.002,
                          // indent: averageScreenSize * 0.03,
                          // endIndent: averageScreenSize * 0.03,
                        ),
                        SizedBox(height: screenHeight * 0.02),
                        StreamBuilder<int>(
                          stream: chatUserProfileBloc.getTabIndex,
                          builder: (context, snapshot) {
                            return TabBar(
                              controller: tabController,
                              dividerHeight: 0,
                              labelPadding:
                                  EdgeInsetsDirectional.symmetric(horizontal: averageScreenSize * 0.008),
                              indicator: const BoxDecoration(),
                              labelStyle: GoogleFonts.poppins(
                                color: const Color(0xffF7F7F8),
                                fontWeight: FontWeight.w700,
                                fontSize: averageScreenSize * 0.022,
                              ),
                              unselectedLabelStyle: GoogleFonts.poppins(
                                color: const Color(0xffB0B0B0),
                                fontWeight: FontWeight.w500,
                                fontSize: averageScreenSize * 0.022,
                              ),
                              onTap: (value) {
                                debugPrint('--------------->$value');
                                chatUserProfileBloc.setTabIndex(value);
                                draggableScrollableController.jumpTo(0.55);
                              },
                              tabs: [
                                Tab(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(averageScreenSize * 0.03),
                                      color: snapshot.data == 0
                                          ? const Color(0xff2B2B2B)
                                          : const Color(0xffF5F5F5),
                                    ),
                                    child: const Center(
                                      child: Text('About'),
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(averageScreenSize * 0.03),
                                      color: snapshot.data == 1
                                          ? const Color(0xff2B2B2B)
                                          : const Color(0xffF5F5F5),
                                    ),
                                    child: const Center(
                                      child: Text('Location'),
                                    ),
                                  ),
                                ),
                                Tab(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(averageScreenSize * 0.03),
                                      color: snapshot.data == 2
                                          ? const Color(0xff2B2B2B)
                                          : const Color(0xffF5F5F5),
                                    ),
                                    child: const Center(
                                      child: Text('Reviews'),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                        SizedBox(height: screenHeight * 0.025),
                        ConstrainedBox(
                          constraints: BoxConstraints(maxWidth: screenWidth, maxHeight: screenHeight * 0.5),
                          child: TabBarView(
                            controller: tabController,
                            physics: const NeverScrollableScrollPhysics(),
                            children: [
                              ChatUserAboutTab(
                                name: widget.name,
                                draggableScrollableController: draggableScrollableController,
                              ),
                              ChatUserLocationTab(
                                name: widget.name,
                                draggableScrollableController: draggableScrollableController,
                              ),
                              ChatUserReviewTab(
                                name: widget.name,
                                draggableScrollableController: draggableScrollableController,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
          Positioned(
            bottom: screenHeight * 0.02,
            width: screenWidth,
            child: Center(
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
                onPressed: () {},
                child: Text(
                  'Check schedule',
                  style: GoogleFonts.poppins(
                    color: const Color(0xffF7F7F8),
                    fontWeight: FontWeight.w700,
                    fontSize: averageScreenSize * 0.030,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

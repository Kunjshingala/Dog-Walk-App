import 'package:dog_walking_app/utils/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'chat_list_screen_data.dart';
import 'chat_screen/chat_screen.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFBFBFB),
      body: Container(
        padding: EdgeInsetsDirectional.symmetric(
          vertical: averageScreenSize * 0.035,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: averageScreenSize * 0.025),
              child: Text(
                'Chat',
                style: GoogleFonts.poppins(
                  color: const Color(0xff2B2B2B),
                  fontWeight: FontWeight.w700,
                  fontSize: averageScreenSize * 0.065,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: averageScreenSize * 0.025),
              child: TextFormField(
                style: TextStyle(
                  color: const Color(0xffA1A1A1),
                  fontWeight: FontWeight.w400,
                  fontSize: averageScreenSize * 0.03,
                ),
                decoration: InputDecoration(
                  isDense: true,
                  filled: true,
                  fillColor: const Color(0xffF0F0F0),
                  hintText: 'Search...',
                  hintStyle: GoogleFonts.poppins(
                    color: const Color(0xffA1A1A1),
                    fontWeight: FontWeight.w400,
                    fontSize: averageScreenSize * 0.03,
                  ),
                  contentPadding: EdgeInsetsDirectional.symmetric(
                      horizontal: averageScreenSize * 0.01, vertical: averageScreenSize * 0.005),
                  prefixIcon: Padding(
                    padding: EdgeInsetsDirectional.all(averageScreenSize * 0.025),
                    child: SvgPicture.asset(
                      'assets/icons/search_icon.svg',
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
            ),
            SizedBox(height: screenHeight * 0.02),
            Divider(color: const Color(0xffECEEF1), height: averageScreenSize * 0.03),
            Flexible(
              flex: 1,
              child: ListView.separated(
                shrinkWrap: true,
                itemCount: chatListScreenDataList.length,
                padding: EdgeInsetsDirectional.zero,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatScreen(
                            image: chatListScreenDataList[index].profilePic,
                            name: chatListScreenDataList[index].name,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      constraints: BoxConstraints.tightFor(height: screenHeight * 0.09),
                      margin: EdgeInsetsDirectional.symmetric(horizontal: averageScreenSize * 0.025),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            maxRadius: averageScreenSize * 0.05,
                            backgroundImage: AssetImage(chatListScreenDataList[index].profilePic),
                          ),
                          SizedBox(width: screenWidth * 0.04),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                chatListScreenDataList[index].name,
                                style: GoogleFonts.poppins(
                                  color: const Color(0xff2B2B2B),
                                  fontWeight: FontWeight.w700,
                                  fontSize: averageScreenSize * 0.032,
                                ),
                              ),
                              SizedBox(height: screenHeight * 0.001),
                              Text(
                                chatListScreenDataList[index].lastMessage,
                                style: GoogleFonts.poppins(
                                  color: const Color(0xff4F4F4F),
                                  fontWeight: FontWeight.w500,
                                  fontSize: averageScreenSize * 0.025,
                                ),
                              ),
                            ],
                          ),
                          chatListScreenDataList[index].isSeen != true
                              ? Expanded(
                                  child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SvgPicture.asset('assets/icons/chat_badge_icon.svg'),
                                  ],
                                ))
                              : Container(),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider(color: Color(0xffECEEF1));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

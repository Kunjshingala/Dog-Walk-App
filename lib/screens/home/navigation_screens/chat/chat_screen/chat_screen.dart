import 'package:bubble/bubble.dart';
import 'package:dog_walking_app/common_view/common_button/eleveted_button.dart';
import 'package:dog_walking_app/utils/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../chat_user_profile_screen/chat_user_profile_screen.dart';
import 'chat_screen_data.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    super.key,
    required this.image,
    required this.name,
  });

  final String image;
  final String name;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsetsDirectional.all(averageScreenSize * 0.03),
          child: SvgPicture.asset(
            'assets/icons/leftback_arrow.svg',
            color: const Color(0xff2B2B2B),
          ),
        ),
        title: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatUserProfileScreen(image: widget.image, name: widget.name),
              ),
            );
          },
          child: Row(
            children: [
              CircleAvatar(
                radius: averageScreenSize * 0.04,
                backgroundImage: AssetImage(widget.image),
              ),
              SizedBox(width: screenWidth * 0.02),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: GoogleFonts.poppins(
                      color: const Color(0xff2B2B2B),
                      fontWeight: FontWeight.w700,
                      fontSize: averageScreenSize * 0.035,
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/icons/online_icon.svg',
                        color: const Color(0xff5AD439),
                      ),
                      SizedBox(width: screenWidth * 0.01),
                      Text(
                        'Online',
                        style: GoogleFonts.poppins(
                          color: const Color(0xffAEAEB2),
                          fontWeight: FontWeight.w500,
                          fontSize: averageScreenSize * 0.025,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
        titleSpacing: 0,
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.all(averageScreenSize * 0.03),
            child: SvgPicture.asset(
              'assets/icons/call_icon.svg',
              color: const Color(0xff2B2B2B),
            ),
          ),
        ],
      ),
      backgroundColor: const Color(0xffFBFBFB),
      body: Container(
        padding:
            EdgeInsetsDirectional.symmetric(horizontal: screenWidth * 0.03, vertical: screenHeight * 0.01),
        constraints: BoxConstraints(minHeight: screenHeight),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: messagesDataList.length,
                itemBuilder: (context, index) {
                  return messagesDataList[index].isTime == false
                      ? Container(
                          margin: messagesDataList[index].sendByMe == true
                              ? EdgeInsetsDirectional.only(
                                  start: screenWidth * 0.3,
                                  top: screenHeight * 0.02,
                                )
                              : EdgeInsetsDirectional.only(
                                  end: screenWidth * 0.3,
                                  top: screenHeight * 0.02,
                                ),
                          child: Bubble(
                            radius: Radius.circular(averageScreenSize * 0.03),
                            padding: BubbleEdges.symmetric(
                              horizontal: averageScreenSize * 0.03,
                              vertical: averageScreenSize * 0.02,
                            ),
                            alignment: messagesDataList[index].sendByMe == true
                                ? Alignment.topRight
                                : Alignment.topLeft,
                            nip: messagesDataList[index].sendByMe == true
                                ? BubbleNip.rightBottom
                                : BubbleNip.leftBottom,
                            color: messagesDataList[index].sendByMe == true
                                ? const Color(0xffFB724C)
                                : const Color(0xffECEEF1),
                            nipHeight: averageScreenSize * 0.03,
                            child: Text(
                              messagesDataList[index].messageORTime,
                              textAlign:
                                  messagesDataList[index].sendByMe == true ? TextAlign.end : TextAlign.start,
                              style: GoogleFonts.poppins(
                                color: messagesDataList[index].sendByMe == true
                                    ? const Color(0xffF7F7F8)
                                    : const Color(0xff2B2B2B),
                                fontWeight: FontWeight.w500,
                                fontSize: averageScreenSize * 0.025,
                              ),
                            ),
                          ),
                        )
                      : Container(
                          margin: EdgeInsetsDirectional.only(top: screenHeight * 0.02),
                          constraints: BoxConstraints(maxWidth: screenWidth),
                          child: Center(
                            child: Text(
                              messagesDataList[index].messageORTime,
                              style: GoogleFonts.poppins(
                                color: const Color(0xffAEAEB2),
                                fontWeight: FontWeight.w500,
                                fontSize: averageScreenSize * 0.025,
                              ),
                            ),
                          ),
                        );
                },
              ),
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsetsDirectional.only(
                      end: screenWidth * 0.03, top: screenHeight * 0.01, bottom: screenHeight * 0.01),
                  child: CustomElevatedButton(
                    width: averageScreenSize * 0.08,
                    height: averageScreenSize * 0.08,
                    borderRadius: averageScreenSize * 0.02,
                    color: const Color(0xffF5F5F5),
                    child: SvgPicture.asset(
                      'assets/icons/plus_icon.svg',
                      color: const Color(0xffFB724C),
                      width: screenWidth * 0.02,
                      height: screenHeight * 0.018,
                    ),
                  ),
                ),
                Expanded(
                  child: TextFormField(
                    style: TextStyle(
                      color: const Color(0xffA1A1A1),
                      fontWeight: FontWeight.w400,
                      fontSize: averageScreenSize * 0.03,
                    ),
                    cursorColor: const Color(0xffFB724C),
                    decoration: InputDecoration(
                      isDense: true,
                      filled: true,
                      fillColor: const Color(0xffF5F5F5),
                      hintText: 'Aa',
                      hintStyle: GoogleFonts.poppins(
                        color: const Color(0xffA1A1A1),
                        fontWeight: FontWeight.w500,
                        fontSize: averageScreenSize * 0.03,
                      ),
                      contentPadding: EdgeInsetsDirectional.symmetric(
                          horizontal: averageScreenSize * 0.02, vertical: averageScreenSize * 0.005),
                      suffixIcon: Padding(
                        padding: EdgeInsetsDirectional.all(averageScreenSize * 0.025),
                        child: SvgPicture.asset(
                          'assets/icons/mic_icon.svg',
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
              ],
            )
          ],
        ),
      ),
    );
  }
}

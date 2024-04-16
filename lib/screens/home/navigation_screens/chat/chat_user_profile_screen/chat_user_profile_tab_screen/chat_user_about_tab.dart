import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

import '../../../../../../utils/dimens.dart';

class ChatUserAboutTab extends StatefulWidget {
  const ChatUserAboutTab({super.key, required this.name, required this.draggableScrollableController});

  final String name;
  final DraggableScrollableController draggableScrollableController;

  @override
  State<ChatUserAboutTab> createState() => _ChatUserAboutTabState();
}

class _ChatUserAboutTabState extends State<ChatUserAboutTab> {
  final isCollapsed = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    isCollapsed.addListener(() {
      if (!isCollapsed.value) {
        widget.draggableScrollableController.jumpTo(0.85);
      } else {
        widget.draggableScrollableController.jumpTo(0.55);
      }
    });

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Age',
                      style: GoogleFonts.poppins(
                        color: const Color(0xffB0B0B0),
                        fontWeight: FontWeight.w500,
                        fontSize: averageScreenSize * 0.025,
                      ),
                    ),
                    Text(
                      '30 Years',
                      style: GoogleFonts.poppins(
                        color: const Color(0xff2B2B2B),
                        fontWeight: FontWeight.w500,
                        fontSize: averageScreenSize * 0.028,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: screenWidth * 0.06),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Experience',
                    style: GoogleFonts.poppins(
                      color: const Color(0xffB0B0B0),
                      fontWeight: FontWeight.w500,
                      fontSize: averageScreenSize * 0.025,
                    ),
                  ),
                  Text(
                    '11 months',
                    style: GoogleFonts.poppins(
                      color: const Color(0xff2B2B2B),
                      fontWeight: FontWeight.w500,
                      fontSize: averageScreenSize * 0.028,
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: screenHeight * 0.02),
          SizedBox(
            width: screenWidth * 0.8,
            child: ReadMoreText(
              '${widget.name}\'s lifelong love for dogs has seamlessly intertwined with his current pursuit as a veterinary student. In his spare time, he frequents the local dog shelter, finding joy and purpose in caring for the furry residents awaiting forever homes. From administering vaccinations to providing much-needed affection, Alex\'s dedication to these shelter dogs reflects his unwavering commitment to their well-being. With each visit, he\'s reminded of the profound impact he can make in their lives, fueling his passion to become a compassionate and skilled veterinarian.',
              trimExpandedText: 'see less',
              trimCollapsedText: 'Read more',
              trimMode: TrimMode.Line,
              trimLines: 3,
              isCollapsed: isCollapsed,
              colorClickableText: const Color(0xffFB724C),
              style: GoogleFonts.poppins(
                color: const Color(0xffB0B0B0),
                fontWeight: FontWeight.w500,
                fontSize: averageScreenSize * 0.023,
              ),
              moreStyle: GoogleFonts.poppins(
                color: const Color(0xffFB724C),
                fontWeight: FontWeight.w500,
                fontSize: averageScreenSize * 0.023,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    isCollapsed.removeListener(() {});
    isCollapsed.dispose();
  }
}

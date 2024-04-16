import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

import '../../../../../../utils/dimens.dart';

class ChatUserReviewTab extends StatefulWidget {
  const ChatUserReviewTab({super.key, required this.name, required this.draggableScrollableController});

  final String name;
  final DraggableScrollableController draggableScrollableController;

  @override
  State<ChatUserReviewTab> createState() => _ChatUserReviewTabState();
}

class _ChatUserReviewTabState extends State<ChatUserReviewTab> {
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
                      'Ratings',
                      style: GoogleFonts.poppins(
                        color: const Color(0xffB0B0B0),
                        fontWeight: FontWeight.w500,
                        fontSize: averageScreenSize * 0.025,
                      ),
                    ),
                    Text(
                      '4.2',
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
                    'Completed Services',
                    style: GoogleFonts.poppins(
                      color: const Color(0xffB0B0B0),
                      fontWeight: FontWeight.w500,
                      fontSize: averageScreenSize * 0.025,
                    ),
                  ),
                  Text(
                    '315',
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
              '${widget.name}\'s volunteer work at London\'s animal shelter has garnered a mix of positive and constructive reviews, averaging a respectable 4.2-paw rating. Clients rave about his passion and knowledge, evident in his detailed assessments and ability to spot health concerns. One reviewer, Sarah M., gushes, \"He checked out my new pup so thoroughly, and even explained everything in a way I understood. You can tell he really cares about the animals!\"  However, some reviewers, like John D., felt the follow-up care could be improved. "While Alex was great during the initial assessment, I wish there was a clearer plan for addressing my dog\'s ear infection."  The shelter staff acknowledges this and is working on implementing a more streamlined communication system.  Overall, Alex\'s contributions are highly valued, and his dedication is undeniable. With a few tweaks to bridge the aftercare gap, his rating has the potential to climb even higher.',
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
          SizedBox(height: screenHeight * 0.03),
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

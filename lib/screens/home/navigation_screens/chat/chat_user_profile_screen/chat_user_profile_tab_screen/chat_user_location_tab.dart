import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

import '../../../../../../utils/dimens.dart';

class ChatUserLocationTab extends StatefulWidget {
  const ChatUserLocationTab({super.key, required this.name, required this.draggableScrollableController});

  final String name;
  final DraggableScrollableController draggableScrollableController;

  @override
  State<ChatUserLocationTab> createState() => _ChatUserLocationTabState();
}

class _ChatUserLocationTabState extends State<ChatUserLocationTab> {
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
                      'City',
                      style: GoogleFonts.poppins(
                        color: const Color(0xffB0B0B0),
                        fontWeight: FontWeight.w500,
                        fontSize: averageScreenSize * 0.025,
                      ),
                    ),
                    Text(
                      'London',
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
                    'Country',
                    style: GoogleFonts.poppins(
                      color: const Color(0xffB0B0B0),
                      fontWeight: FontWeight.w500,
                      fontSize: averageScreenSize * 0.025,
                    ),
                  ),
                  Text(
                    'UK',
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
              "In London's bustling animal shelter, ${widget.name} isn't just a volunteer, his vet student knowledge is crucial. He helps assess new arrivals, spot minor health issues, and even provide basic first aid. It's a hands-on experience that furthers his dream of running his own practice while giving these lost animals a much-needed chance at health. The shelter staff appreciates his expertise, relying on him to identify early signs of illness that might otherwise go unnoticed. Alex thrives in this environment, the barks and whimpers a comforting soundtrack to his days. Every wagging tail and grateful lick is a reminder of the impact he's making on these vulnerable creatures. ",
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

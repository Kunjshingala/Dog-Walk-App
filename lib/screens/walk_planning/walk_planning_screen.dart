import 'package:dog_walking_app/common_view/common_button/eleveted_button.dart';
import 'package:dog_walking_app/screens/walk_planning/walk_planning_bloc.dart';
import 'package:dog_walking_app/utils/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../payment/payment_screen.dart';

class WalkPlanningScreen extends StatefulWidget {
  const WalkPlanningScreen({super.key});

  @override
  State<WalkPlanningScreen> createState() => _WalkPlanningScreenState();
}

class _WalkPlanningScreenState extends State<WalkPlanningScreen> {
  late WalkPlanningBloc walkPlanningBloc;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    walkPlanningBloc = WalkPlanningBloc(context: context);

    debugPrint('--------------1------------->${walkPlanningBloc.initialSelectedRange}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        padding:
            // EdgeInsetsDirectional.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.05),
            EdgeInsetsDirectional.only(
          start: screenWidth * 0.05,
          end: screenWidth * 0.05,
          top: screenHeight * 0.05,
          bottom: screenHeight * 0.025,
        ),
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Walk planning',
                      style: GoogleFonts.poppins(
                        color: const Color(0xff2B2B2B),
                        fontWeight: FontWeight.w700,
                        fontSize: averageScreenSize * 0.055,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    Text(
                      'Fill in some details',
                      style: GoogleFonts.poppins(
                        color: const Color(0xffABABB5),
                        fontWeight: FontWeight.w500,
                        fontSize: averageScreenSize * 0.03,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.05),
                SfDateRangePicker(
                  toggleDaySelection: false,
                  controller: walkPlanningBloc.dateRangePickerController,
                  enablePastDates: false,
                  initialDisplayDate: DateTime.now(),
                  initialSelectedDate: DateTime.now(),
                  view: DateRangePickerView.month,
                  selectionMode: DateRangePickerSelectionMode.extendableRange,
                  initialSelectedRange: walkPlanningBloc.initialSelectedRange,
                  showActionButtons: false,
                  allowViewNavigation: true,
                  showTodayButton: false,
                  showNavigationArrow: false,
                  extendableRangeSelectionDirection: ExtendableRangeSelectionDirection.both,
                  navigationDirection: DateRangePickerNavigationDirection.horizontal,
                  backgroundColor: const Color(0xffFCFCFC),
                  selectionShape: DateRangePickerSelectionShape.rectangle,
                  selectionColor: const Color(0xffFB724C),
                  startRangeSelectionColor: const Color(0xffFB724C),
                  endRangeSelectionColor: const Color(0xffFB724C),
                  rangeSelectionColor: const Color(0xffFB724C).withOpacity(0.2),
                  todayHighlightColor: Colors.black.withOpacity(0.5),
                  maxDate: DateTime(DateTime.now().year + 1),
                  headerStyle: DateRangePickerHeaderStyle(
                    textStyle: GoogleFonts.poppins(
                      color: const Color(0xff2B2B2B),
                      fontWeight: FontWeight.w500,
                      fontSize: averageScreenSize * 0.03,
                    ),
                  ),
                  rangeTextStyle: GoogleFonts.poppins(
                    color: const Color(0xff333333),
                    fontSize: averageScreenSize * 0.025,
                    fontWeight: FontWeight.w500,
                  ),
                  onSelectionChanged: (dateRangePickerSelectionChangedArgs) {
                    debugPrint('--------------------------->${dateRangePickerSelectionChangedArgs.value}');
                    debugPrint(
                        '--------------------------->${walkPlanningBloc.dateRangePickerController.displayDate}');
                  },
                ),
                SizedBox(height: screenHeight * 0.01),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Numbers of walks',
                      style: GoogleFonts.poppins(
                        color: const Color(0xff2B2B2B),
                        fontWeight: FontWeight.w700,
                        fontSize: averageScreenSize * 0.03,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (walkPlanningBloc.walkNumberSubject.value > 1) {
                              walkPlanningBloc.setWalkNumber(walkPlanningBloc.walkNumberSubject.value - 1);
                            }
                          },
                          child: Container(
                            width: averageScreenSize * 0.05,
                            height: averageScreenSize * 0.05,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0xffFBE0D8),
                              borderRadius: BorderRadius.circular(averageScreenSize * 0.01),
                            ),
                            child: SvgPicture.asset('assets/icons/decrement_icon.svg',
                                color: const Color(0xffFB724C)),
                          ),
                        ),
                        SizedBox(width: averageScreenSize * 0.02),
                        StreamBuilder<int>(
                            stream: walkPlanningBloc.getWalkNumber,
                            builder: (context, snapshot) {
                              return Text(
                                snapshot.data.toString(),
                                style: GoogleFonts.poppins(
                                  color: const Color(0xff2B2B2B),
                                  fontWeight: FontWeight.w500,
                                  fontSize: averageScreenSize * 0.03,
                                ),
                              );
                            }),
                        SizedBox(width: averageScreenSize * 0.02),
                        GestureDetector(
                          onTap: () {
                            walkPlanningBloc.setWalkNumber(walkPlanningBloc.walkNumberSubject.value + 1);
                          },
                          child: Container(
                            width: averageScreenSize * 0.05,
                            height: averageScreenSize * 0.05,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0xffFB724C),
                              borderRadius: BorderRadius.circular(averageScreenSize * 0.01),
                            ),
                            child: SvgPicture.asset('assets/icons/incerement_icon.svg',
                                color: const Color(0xffF7F7F8)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.06),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Walking time',
                      style: GoogleFonts.poppins(
                        color: const Color(0xff2B2B2B),
                        fontWeight: FontWeight.w700,
                        fontSize: averageScreenSize * 0.03,
                      ),
                    ),
                    Text(
                      '7:30',
                      style: GoogleFonts.poppins(
                        color: const Color(0xff2B2B2B),
                        fontWeight: FontWeight.w500,
                        fontSize: averageScreenSize * 0.03,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.06),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Walk Duration',
                      style: GoogleFonts.poppins(
                        color: const Color(0xff2B2B2B),
                        fontWeight: FontWeight.w700,
                        fontSize: averageScreenSize * 0.03,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (walkPlanningBloc.walkDurationSubject.value > 15) {
                              walkPlanningBloc
                                  .setWalkDuration(walkPlanningBloc.walkDurationSubject.value - 15);
                            }
                          },
                          child: Container(
                            width: averageScreenSize * 0.05,
                            height: averageScreenSize * 0.05,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0xffFBE0D8),
                              borderRadius: BorderRadius.circular(averageScreenSize * 0.01),
                            ),
                            child: SvgPicture.asset('assets/icons/decrement_icon.svg',
                                color: const Color(0xffFB724C)),
                          ),
                        ),
                        SizedBox(width: averageScreenSize * 0.02),
                        StreamBuilder<int>(
                            stream: walkPlanningBloc.getWalkDuration,
                            builder: (context, snapshot) {
                              return Text(
                                '${snapshot.data} min',
                                style: GoogleFonts.poppins(
                                  color: const Color(0xff2B2B2B),
                                  fontWeight: FontWeight.w500,
                                  fontSize: averageScreenSize * 0.025,
                                ),
                              );
                            }),
                        SizedBox(width: averageScreenSize * 0.02),
                        GestureDetector(
                          onTap: () {
                            if (walkPlanningBloc.walkDurationSubject.value < 60) {
                              walkPlanningBloc
                                  .setWalkDuration(walkPlanningBloc.walkDurationSubject.value + 15);
                            }
                          },
                          child: Container(
                            width: averageScreenSize * 0.05,
                            height: averageScreenSize * 0.05,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0xffFB724C),
                              borderRadius: BorderRadius.circular(averageScreenSize * 0.01),
                            ),
                            child: SvgPicture.asset('assets/icons/incerement_icon.svg',
                                color: const Color(0xffF7F7F8)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Positioned(
              bottom: screenHeight * 0,
              width: screenWidth - (screenWidth * 0.1),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomElevatedButton(
                    width: screenWidth * 0.4,
                    height: screenHeight * 0.07,
                    borderRadius: averageScreenSize * 0.02,
                    color: const Color(0xffF2F2F2),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Cancel',
                      style: GoogleFonts.poppins(
                        color: const Color(0xffB0B0B0),
                        fontWeight: FontWeight.w500,
                        fontSize: averageScreenSize * 0.025,
                      ),
                    ),
                  ),
                  CustomElevatedButton(
                    width: screenWidth * 0.4,
                    height: screenHeight * 0.07,
                    borderRadius: averageScreenSize * 0.02,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PaymentScreen(),
                        ),
                      );
                    },
                    gradient: const LinearGradient(
                      begin: AlignmentDirectional.centerStart,
                      end: AlignmentDirectional.centerEnd,
                      colors: [
                        Color(0xffFB724C),
                        Color(0xffFE904B),
                      ],
                    ),
                    child: Text(
                      'Pay',
                      style: GoogleFonts.poppins(
                        color: const Color(0xffF7F7F8),
                        fontWeight: FontWeight.w700,
                        fontSize: averageScreenSize * 0.025,
                      ),
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

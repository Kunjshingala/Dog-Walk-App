import 'package:dog_walking_app/screens/payment/payment_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common_view/common_button/eleveted_button.dart';
import '../../utils/dimens.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late PaymentBloc paymentBloc;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    paymentBloc = PaymentBloc(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: screenHeight,
        width: screenWidth,
        padding: EdgeInsetsDirectional.only(
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
                      'Payment',
                      style: GoogleFonts.poppins(
                        color: const Color(0xff2B2B2B),
                        fontWeight: FontWeight.w700,
                        fontSize: averageScreenSize * 0.055,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.005),
                    Text(
                      'Just before your dog walk starts',
                      style: GoogleFonts.poppins(
                        color: const Color(0xffABABB5),
                        fontWeight: FontWeight.w500,
                        fontSize: averageScreenSize * 0.03,
                      ),
                    ),
                  ],
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: screenHeight * 0.3, maxWidth: screenWidth),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        flex: 6,
                        child: PageView.builder(
                          controller: paymentBloc.pageController,
                          itemCount: paymentBloc.cardList.length,
                          onPageChanged: (value) {
                            paymentBloc.setPageIndex(value);
                            debugPrint('---------------->$value');
                          },
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsetsDirectional.symmetric(
                                vertical: screenHeight * 0.02,
                                horizontal: screenWidth * 0.01,
                              ),
                              padding: EdgeInsetsDirectional.symmetric(
                                horizontal: screenWidth * 0.05,
                                vertical: screenHeight * 0.025,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(averageScreenSize * 0.05),
                                gradient: RadialGradient(
                                  center: Alignment.topRight,
                                  focal: Alignment.topRight,
                                  focalRadius: averageScreenSize * 0.0002,
                                  radius: averageScreenSize * 0.0035,
                                  colors: const [
                                    Color(0xffFB7A4B),
                                    Color(0xff9C2CF3),
                                  ],
                                ),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            paymentBloc.cardList[index].cardHolderName,
                                            style: GoogleFonts.poppins(
                                              letterSpacing: averageScreenSize * 0.003,
                                              color: const Color(0xffFFFFFF).withOpacity(0.65),
                                              fontWeight: FontWeight.w500,
                                              fontSize: averageScreenSize * 0.022,
                                              shadows: [
                                                Shadow(
                                                  color: const Color(0xff000000).withOpacity(0.25),
                                                  blurRadius: averageScreenSize * 0.01,
                                                  offset: const Offset(0, 4.3),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Text(
                                            '\$${paymentBloc.cardList[index].amount}',
                                            style: GoogleFonts.poppins(
                                              letterSpacing: averageScreenSize * 0.003,
                                              color: const Color(0xffFFFFFF),
                                              fontWeight: FontWeight.w800,
                                              fontSize: averageScreenSize * 0.042,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Expanded(child: SizedBox()),
                                      SvgPicture.asset(
                                        'assets/icons/master_card_icon.svg',
                                        color: const Color(0xffB92018),
                                        width: averageScreenSize * 0.045,
                                        height: averageScreenSize * 0.045,
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(
                                        paymentBloc.cardList[index].cardNumber,
                                        style: GoogleFonts.poppins(
                                          letterSpacing: averageScreenSize * 0.002,
                                          color: const Color(0xffFFFFFF),
                                          fontWeight: FontWeight.w500,
                                          fontSize: averageScreenSize * 0.025,
                                        ),
                                      ),
                                      const Expanded(child: SizedBox()),
                                      Text(
                                        paymentBloc.cardList[index].expirationDate,
                                        style: GoogleFonts.poppins(
                                          letterSpacing: averageScreenSize * 0.003,
                                          color: const Color(0xffFFFFFF),
                                          fontWeight: FontWeight.w500,
                                          fontSize: averageScreenSize * 0.025,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      StreamBuilder<int>(
                          stream: paymentBloc.getPageIndex,
                          builder: (context, snapshot) {
                            return Expanded(
                              flex: snapshot.data == paymentBloc.cardList.length - 1 ? 1 : 0,
                              child: snapshot.data == paymentBloc.cardList.length - 1
                                  ? Container(
                                      height: screenHeight * 0.25,
                                      margin: EdgeInsetsDirectional.only(start: screenWidth * 0.01),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(averageScreenSize * 0.03),
                                        gradient: const LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomLeft,
                                          colors: [
                                            Color(0xffFCD8CF),
                                            Color(0xffE9D0FB),
                                          ],
                                        ),
                                      ),
                                      child: SvgPicture.asset(
                                        'assets/icons/plus_icon.svg',
                                        color: const Color(0xffB92018),
                                        // height: averageScreenSize * 0.02,
                                        // width: averageScreenSize * 0.02,
                                        fit: BoxFit.scaleDown,
                                      ),
                                    )
                                  : Container(),
                            );
                          }),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Spend',
                      style: GoogleFonts.poppins(
                        color: const Color(0xff2B2B2B),
                        fontWeight: FontWeight.w700,
                        fontSize: averageScreenSize * 0.04,
                      ),
                    ),
                    Text(
                      '\$488',
                      style: GoogleFonts.poppins(
                        color: const Color(0xff2B2B2B),
                        fontWeight: FontWeight.w700,
                        fontSize: averageScreenSize * 0.04,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                const Divider(color: Color(0xffECEEF1)),
                Flexible(
                  fit: FlexFit.loose,
                  child: ListView.separated(
                    padding: EdgeInsetsDirectional.zero,
                    itemCount: paymentBloc.paymentHistoryList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            EdgeInsetsDirectional.symmetric(vertical: screenHeight * 0.025, horizontal: 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '${paymentBloc.paymentHistoryList[index].category} ${paymentBloc.paymentHistoryList[index].detail}',
                                  style: GoogleFonts.poppins(
                                    color: const Color(0xff6F7985),
                                    fontWeight: FontWeight.w500,
                                    fontSize: averageScreenSize * 0.025,
                                  ),
                                ),
                              ],
                            ),
                            paymentBloc.paymentHistoryList[index].isIn
                                ? Text(
                                    '+\$${paymentBloc.paymentHistoryList[index].amount}',
                                    style: GoogleFonts.poppins(
                                      color: const Color(0xff2B2B2B),
                                      fontWeight: FontWeight.w500,
                                      fontSize: averageScreenSize * 0.025,
                                    ),
                                  )
                                : Text(
                                    '-\$${paymentBloc.paymentHistoryList[index].amount}',
                                    style: GoogleFonts.poppins(
                                      color: const Color(0xffFB724C),
                                      fontWeight: FontWeight.w500,
                                      fontSize: averageScreenSize * 0.025,
                                    ),
                                  ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider(
                        color: Color(0xffECEEF1),
                      );
                    },
                  ),
                )
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
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => ,));
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

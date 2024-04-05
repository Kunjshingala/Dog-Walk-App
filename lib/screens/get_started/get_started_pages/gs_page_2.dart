import 'package:dog_walking_app/utils/dimens.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'get_started_data.dart';
import 'gs_page_2_bloc.dart';

class GSPageTwo extends StatefulWidget {
  const GSPageTwo({super.key});

  @override
  State<GSPageTwo> createState() => _GSPageTwoState();
}

class _GSPageTwoState extends State<GSPageTwo> {
  late GSPageTwoBloc gsPageTwoBloc;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    gsPageTwoBloc = GSPageTwoBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Bad habits',
          style: GoogleFonts.poppins(
            color: const Color(0xff2B2B2B),
            fontWeight: FontWeight.w700,
            fontSize: averageScreenSize * 0.04,
          ),
        ),
        SizedBox(height: screenHeight * 0.01),
        Flexible(
          fit: FlexFit.loose,
          child: StreamBuilder<int?>(
              stream: gsPageTwoBloc.getIndex,
              builder: (context, snapshot) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  itemCount: list.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      gsPageTwoBloc.setIndex(index);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadiusDirectional.circular(averageScreenSize * 0.01),
                      child: Container(
                        margin: EdgeInsetsDirectional.all(averageScreenSize * 0.02),
                        decoration: (snapshot.hasData && snapshot.data == index)
                            ? BoxDecoration(
                                color: const Color(0xffF7F7F7),
                                border: Border.all(
                                    color: const Color(0xffFB724C), width: averageScreenSize * 0.001),
                                borderRadius: BorderRadius.circular(averageScreenSize * 0.045),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xffFB724C).withOpacity(0.1),
                                    blurRadius: averageScreenSize * 0.006,
                                    spreadRadius: -(averageScreenSize * 0.005),
                                    offset: const Offset(0.0, 10.0),
                                  )
                                ],
                              )
                            : BoxDecoration(
                                color: const Color(0xffF7F7F7),
                                borderRadius: BorderRadius.circular(averageScreenSize * 0.045),
                              ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(list[index].icon.trim()),
                            SizedBox(height: screenHeight * 0.02),
                            Text(
                              list[index].name.trim(),
                              style: GoogleFonts.poppins(
                                color: const Color(0xff2B2B2B),
                                fontWeight: FontWeight.w500,
                                fontSize: averageScreenSize * 0.03,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ),
      ],
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    gsPageTwoBloc.dispose();
  }
}

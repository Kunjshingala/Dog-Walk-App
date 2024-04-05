import 'package:dog_walking_app/screens/home/navigation_bloc.dart';
import 'package:dog_walking_app/utils/dimens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'navigation_screens/chat/chat_list_screen.dart';
import 'navigation_screens/home/home_screen.dart';
import 'navigation_screens/moments/moments_screen.dart';
import 'navigation_screens/profile/profile_screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  late NavigationBloc navigationBloc;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    navigationBloc = NavigationBloc(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFCFCFC),
      body: StreamBuilder(
        stream: navigationBloc.getNavigationPage,
        builder: (context, snapshot) {
          return [
            const HomeScreen(),
            const MomentsScreen(),
            const ChatListScreen(),
            const ProfileScreen(),
          ][snapshot.data ?? 0];
        },
      ),
      bottomNavigationBar: StreamBuilder<int>(
        stream: navigationBloc.getNavigationPage,
        builder: (context, snapshot) {
          return NavigationBar(
            selectedIndex: snapshot.hasData ? snapshot.data! : 0,
            backgroundColor: const Color(0xffFCFCFC),
            indicatorColor: Colors.transparent,
            elevation: averageScreenSize * 0,
            onDestinationSelected: (value) {
              debugPrint('=================================$value');
              navigationBloc.setNavigationPage(value);
            },
            height: screenHeight * 0.07,
            destinations: [
              NavigationDestination(
                label: '',
                icon: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset('assets/icons/home_icon.svg', color: const Color(0xffAEAEB2)),
                    SizedBox(height: averageScreenSize * 0.005),
                    Text(
                      'Home',
                      style: GoogleFonts.poppins(
                          color: const Color(0xffAEAEB2),
                          fontWeight: FontWeight.w700,
                          fontSize: averageScreenSize * 0.02),
                    ),
                  ],
                ),
                selectedIcon: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset('assets/icons/home_icon.svg', color: const Color(0xff2B2B2B)),
                    SizedBox(height: averageScreenSize * 0.005),
                    Text(
                      'Home',
                      style: GoogleFonts.poppins(
                          color: const Color(0xff2B2B2B),
                          fontWeight: FontWeight.w700,
                          fontSize: averageScreenSize * 0.02),
                    ),
                  ],
                ),
              ),
              NavigationDestination(
                label: '',
                icon: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset('assets/icons/moments_icon.svg', color: const Color(0xffAEAEB2)),
                    SizedBox(height: averageScreenSize * 0.01),
                    Text(
                      'Moments',
                      style: GoogleFonts.poppins(
                          color: const Color(0xffAEAEB2),
                          fontWeight: FontWeight.w700,
                          fontSize: averageScreenSize * 0.02),
                    ),
                  ],
                ),
                selectedIcon: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset('assets/icons/moments_icon.svg', color: const Color(0xff2B2B2B)),
                    SizedBox(height: averageScreenSize * 0.01),
                    Text(
                      'Moments',
                      style: GoogleFonts.poppins(
                          color: const Color(0xff2B2B2B),
                          fontWeight: FontWeight.w700,
                          fontSize: averageScreenSize * 0.02),
                    ),
                  ],
                ),
              ),
              NavigationDestination(
                label: '',
                icon: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset('assets/icons/chat_icon.svg', color: const Color(0xffAEAEB2)),
                    Text(
                      'Chat',
                      style: GoogleFonts.poppins(
                          color: const Color(0xffAEAEB2),
                          fontWeight: FontWeight.w700,
                          fontSize: averageScreenSize * 0.02),
                    ),
                  ],
                ),
                selectedIcon: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset('assets/icons/chat_icon.svg', color: const Color(0xff2B2B2B)),
                    Text(
                      'Chat',
                      style: GoogleFonts.poppins(
                          color: const Color(0xff2B2B2B),
                          fontWeight: FontWeight.w700,
                          fontSize: averageScreenSize * 0.02),
                    ),
                  ],
                ),
              ),
              NavigationDestination(
                label: '',
                icon: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset('assets/icons/profile_icon.svg', color: const Color(0xffAEAEB2)),
                    Text(
                      'Profile',
                      style: GoogleFonts.poppins(
                          color: const Color(0xffAEAEB2),
                          fontWeight: FontWeight.w700,
                          fontSize: averageScreenSize * 0.02),
                    ),
                  ],
                ),
                selectedIcon: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset('assets/icons/profile_icon.svg', color: const Color(0xff2B2B2B)),
                    Text(
                      'Profile',
                      style: GoogleFonts.poppins(
                          color: const Color(0xff2B2B2B),
                          fontWeight: FontWeight.w700,
                          fontSize: averageScreenSize * 0.02),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

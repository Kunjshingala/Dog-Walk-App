import 'package:dog_walking_app/screens/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';

import 'utils/dimens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    screenWidth = mediaQueryData.size.width;
    screenHeight = mediaQueryData.size.height;
    averageScreenSize = (screenWidth + screenHeight) / 2;

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xffFB724C),
        ),
        useMaterial3: true,
      ),
      home: const OnboardingScreen(),
    );
  }
}

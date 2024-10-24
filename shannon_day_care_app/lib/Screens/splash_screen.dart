import 'dart:async';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shannon_day_care_app/Constants/colors.dart';
import 'package:shannon_day_care_app/Screens/landing_screen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void wait() async {
    await Future.delayed(
      const Duration(seconds: 3),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    wait();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LandingScreen(),
      ),
    );
    // wait();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            // Background with pink and blue circles
            Positioned(
              top: 46,
              left: -140,
              child: CircleAvatar(
                radius: 252,
                backgroundColor: KpinkColor,
              ),
            ),
            Positioned(
              bottom: -100,
              right: -100,
              child: CircleAvatar(
                radius: 180.r,
                backgroundColor: KblueColor,
              ),
            ),
            // Logo and text in the middle
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Add your logo here
                  SvgPicture.asset('assets/Vector.svg'),
                  10.horizontalSpace,
                  Text(
                    'Logoipsum', // Your logo name
                    style: GoogleFonts.pacifico(
                      fontSize: 35.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    
  }
}

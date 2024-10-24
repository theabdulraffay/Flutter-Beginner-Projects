import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shannon_day_care_app/Constants/buttons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shannon_day_care_app/Screens/login_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: ,
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 439.h,
            decoration: BoxDecoration(
              // color: Colors.blue,
              image: DecorationImage(
                image: AssetImage('assets/landing.png'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Container(
              child: Text(
                textAlign: TextAlign.center,
                'Find daycare around your location',
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          15.verticalSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Container(
              child: Text(
                textAlign: TextAlign.center,
                'Just turn on your location and you will find the nearest daycare you wish.',
                style: GoogleFonts.lato(
                  fontSize: 15,
                ),
              ),
            ),
          ),
          30.verticalSpace,
          Kbutton(
            text: 'Get Started',
            callBack: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
              // print('I am pressed');
            },
          ),
        ],
      ),
    );
  }
}

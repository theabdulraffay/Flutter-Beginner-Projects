import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shannon_day_care_app/Constants/buttons.dart';
import 'package:shannon_day_care_app/Constants/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shannon_day_care_app/Constants/textfields.dart';
import 'package:shannon_day_care_app/Screens/forgot_two.dart';

class ForgotFirst extends StatelessWidget {
  const ForgotFirst({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Forget Password'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                35.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    topBar(),
                  ],
                ),
                60.verticalSpace,
                Container(
                  child: Text(
                    'Don’t worry! It happens. Please enter the email address associated with your account.',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                24.verticalSpace,
                KtextField(text: 'Email', hintText: 'Loisbecket@gmail.com'),
              ],
            ),
          ),
          Kbutton(
              text: 'Get Code',
              callBack: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ForgotTwo(),
                  ),
                );
              }),
              
        ],
      ),
    );
  }

  Widget topBar() {
    return Row(
      children: [
        CircleAvatar(
          radius: 10.5,
          child: Text(
            '1',
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          backgroundColor: KpinkColor,
        ),
        Container(
          height: 1,
          width: 73.w,
          color: Colors.black,
        ),
        ClipOval(
          child: Container(
            height: 21,
            width: 21,
            color: ksecGreyColor,
            child: Center(
              child: Text(
                '2',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
        Container(
          height: 1,
          width: 73.w,
          color: Colors.black,
        ),
        CircleAvatar(
          radius: 10.5,
          backgroundColor: ksecGreyColor,
          child: Text(
            '3',
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: Colors.black,
              fontWeight: FontWeight.w700,
            ),
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shannon_day_care_app/Constants/buttons.dart';
import 'package:shannon_day_care_app/Constants/colors.dart';
import 'package:shannon_day_care_app/Constants/textfields.dart';

class ForgotThree extends StatelessWidget {
  const ForgotThree({super.key});

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
                Text(
                  'Set New Password',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    
                  ),
                ),
                36.verticalSpace,
                KtextField(text: 'New Password', hintText: '********'),
                16.verticalSpace,
                KtextField(text: 'Comfirm Password', hintText: '********'),
              ],
            ),
          ),
          Kbutton(text: 'Get Code', callBack: () {})
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
          color: KpinkColor,
        ),
        ClipOval(
          child: Container(
            height: 21,
            width: 21,
            color: KpinkColor,
            child: Center(
              child: Text(
                '2',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
        Container(
          height: 1,
          width: 73.w,
          color: KpinkColor,
        ),
        CircleAvatar(
          radius: 10.5,
          backgroundColor: KpinkColor,
          child: Text(
            '3',
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        )
      ],
    );
  }
}

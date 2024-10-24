import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shannon_day_care_app/Constants/colors.dart';

Widget Kbutton({required String text, required VoidCallback callBack}) {
  return InkWell(
    borderRadius: BorderRadius.circular(15),
    onTap: callBack,
    child: Ink(
      height: 54,
      width: .9.sw,
      decoration: BoxDecoration(
        color: KpinkColor,
      ),
      child: Center(
        child: Text(
          text,
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ),
    ),
  );
}

Widget KSignIn({bool isGoogle = true}) {
  return Container(
    height: 45.h,
    width: .43.sw,
    decoration: BoxDecoration(
      border: Border.all(
        color: KpinkColor,
      ),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          isGoogle
              ? 'https://cdn.pixabay.com/photo/2015/12/11/11/43/google-1088004_1280.png'
              : 'https://cdn.pixabay.com/photo/2017/06/22/06/22/facebook-2429746_1280.png',
          height: 20.h,
        ),
        7.horizontalSpace,
        Text(
          isGoogle ? 'Google' : 'Facebook',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    ),
  );
}

// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shannon_day_care_app/Constants/colors.dart';

Widget Kdivider({String text = ''}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Expanded(
        child: Container(
          height: 1,
          color: KgreyColor,
        ),
      ),
      16.horizontalSpace,
      Text(
        text,
        style: GoogleFonts.lato(
          color: Colors.grey,
        ),
      ),
      16.horizontalSpace,
      Expanded(
        child: Container(
          height: 1,
          color: const Color(0xFFEDF1F3),
        ),
      ),
      // Divider(),
    ],
  );
}

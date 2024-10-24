import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:shannon_day_care_app/Constants/buttons.dart';
import 'package:shannon_day_care_app/Constants/colors.dart';
import 'package:shannon_day_care_app/Screens/forgot_three.dart';

class ForgotTwo extends StatelessWidget {
  const ForgotTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forget Password'),
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
                    'Enter the 4 digit code sent to your email address',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                8.verticalSpace,
                Row(
                  children: [
                    Text(
                      'user123@gmail.com',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                    9.horizontalSpace,
                    const Icon(
                      Icons.published_with_changes_rounded,
                      size: 12,
                    )
                  ],
                ),
                22.verticalSpace,
                Center(
                  child: OTPTextField(
                      // controller: otpController,
                      length: 4,
                      width: MediaQuery.of(context).size.width,
                      textFieldAlignment: MainAxisAlignment.spaceAround,
                      fieldWidth: 45,
                      fieldStyle: FieldStyle.box,
                      outlineBorderRadius: 22,
                      style: const TextStyle(fontSize: 17),
                      onChanged: (pin) {
                        print("Changed: " + pin);
                      },
                      onCompleted: (pin) {
                        print("Completed: " + pin);
                      }),
                ),
                32.verticalSpace,
                Container(
                  height: 50.h,
                  width: 89.w,
                  decoration: BoxDecoration(
                    color: ksecPinkColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.timer,
                      ),
                      8.horizontalSpace,
                      Text(
                        '00.21',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                32.verticalSpace,
                RichText(
                  text: TextSpan(
                    text: 'Didn’t receive the OTP?   ',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: 'Resend OTP',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700,
                            fontSize: 12,
                            color: KpinkColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Kbutton(
              text: 'Verify',
              callBack: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ForgotThree(),
                  ),
                );
              })
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

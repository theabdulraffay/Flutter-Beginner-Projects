import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shannon_day_care_app/Constants/buttons.dart';
import 'package:shannon_day_care_app/Constants/colors.dart';
import 'package:shannon_day_care_app/Constants/dividers.dart';
import 'package:shannon_day_care_app/Constants/textfields.dart';
import 'package:shannon_day_care_app/Screens/forgot_first.dart';
import 'package:shannon_day_care_app/Screens/sign_up_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {

        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            topBar(context),
            Padding(
              padding:  EdgeInsets.all(15.sp),
              child: Column(
                children: [
                  // 10.verticalSpace,
                  KtextField(text: 'Email: ', hintText: 'Loisbecket@gmail.com'),
                  15.verticalSpace,
                  KtextField(
                      text: 'Password', hintText: '********', obsecure: true),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(value: false, onChanged: (ans) {}),
                          Text(
                            'Remember me',
                            style: GoogleFonts.poppins(
                                color: Colors.black54,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ForgotFirst(),
                            ),
                          );
                        },
                        child: Text(
                          'Forgot Password ?',
                          style: GoogleFonts.poppins(
                            color: KblueColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                  Kbutton(text: 'Login', callBack: () {}),
                  15.verticalSpace,
                  Kdivider(text: 'Or login with'),
                  15.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      KSignIn(),
                      KSignIn(isGoogle: false),
                    ],
                  ),
                  10.verticalSpace,
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      text: 'By signing up, you agree to the ',
                      style: TextStyle(color: Colors.grey), // Default style
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Terms of Service',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black, // You can change color as needed
                          ),
                        ),
                        TextSpan(
                          text: ' and ',
                          style: TextStyle(color: Colors.grey),
                        ),
                        TextSpan(
                          text: 'Data Processing Agreement',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black, // You can change color as needed
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget topBar(BuildContext context) {
    return Container(
      width: 1.sw,
      height: .30.sh,
      color: KpinkColor,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Image.asset('assets/mainkid.png'),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 15,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/Vector.svg',
                        height: 15,
                      ),
                      10.horizontalSpace,
                      Text(
                        'Logoipsum', // Your logo name
                        style: GoogleFonts.pacifico(
                          fontSize: 15.w,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  30.verticalSpace,
                  Text(
                    'Sign in to your Account',
                    style: GoogleFonts.poppins(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  20.verticalSpace,
                  Row(
                    children: [
                      Text(
                        'Don\'t have an account?',
                      
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                        ),
                      ),
                      7.horizontalSpace,
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Sign Up',
                          style: GoogleFonts.poppins(
                            color: KblueColor,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

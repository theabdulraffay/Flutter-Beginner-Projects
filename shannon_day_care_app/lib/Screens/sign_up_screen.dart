import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shannon_day_care_app/Constants/buttons.dart';
import 'package:shannon_day_care_app/Constants/colors.dart';
import 'package:shannon_day_care_app/Constants/dividers.dart';
import 'package:shannon_day_care_app/Constants/textfields.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            topBar(context),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 16,
                // bottom: 53,
              ),
              child: Column(
                children: [
                  KtextField(text: 'Full Name', hintText: 'Lois becket'),
                  15.verticalSpace,
                  KtextField(text: 'Email', hintText: 'Loisbecket@gmail.com'),
                  15.verticalSpace,
                  KtextfieldwithFlags(
                      text: 'Phone Number', hintText: '123-456-7890'),
                  15.verticalSpace,
                  KtextField(text: 'Password', hintText: '******'),
                  15.verticalSpace,
                  Kbutton(text: 'Sign Up', callBack: () {}),
                  15.verticalSpace,
                  Kdivider(text: 'Or sign up with'),
                  15.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      KSignIn(),
                      KSignIn(isGoogle: false),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget topBar(BuildContext context) {
    return Container(
      width: 1.sw,
      height: .25.sh,
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
                  InkWell(
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  16.verticalSpace,
                  Text(
                    'Register',
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
                        'Already have an account?',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                        ),
                      ),
                      7.horizontalSpace,
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          'Login',
                          style: GoogleFonts.poppins(
                              color: KblueColor,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w600),
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

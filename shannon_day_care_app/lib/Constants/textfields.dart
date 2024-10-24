import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shannon_day_care_app/Constants/dropdown_items.dart';

// ignore: non_constant_identifier_names
Widget KtextField(
    {required String text, required String hintText, bool obsecure = false}) {

    FocusNode node1=FocusNode();

    

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        text,
        style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
      ),
      7.verticalSpace,
      TextField(
        focusNode: node1,
        obscureText: obsecure,
        maxLines: 1,
        decoration: InputDecoration(
          focusColor: Colors.grey,
          hoverColor: Colors.grey,
          hintText: hintText,
          hintStyle: GoogleFonts.poppins(
            color: Colors.grey,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.grey,
            ),
          ),
        ),
      ),
    ],
  );
}

// ignore: must_be_immutable
class KtextfieldwithFlags extends StatefulWidget {
  KtextfieldwithFlags({super.key, this.text = '', this.hintText = ''});
  String text;
  String hintText;

  @override
  State<KtextfieldwithFlags> createState() => _KtextfieldwithFlagsState();
}

class _KtextfieldwithFlagsState extends State<KtextfieldwithFlags> {
  String fir = emoji_list.first;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
        7.verticalSpace,
        TextField(
          maxLines: 1,
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: DropdownButton(
              value: fir, // Ensure the value is from emoji_list
              items: emoji_list.map((toElement) {
                return DropdownMenuItem(
                    value: toElement, child: Text(toElement));
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  // Update the value or perform some action
                  fir = newValue ?? '';
                });
              },
            ),
            focusColor: Colors.grey,
            hoverColor: Colors.grey,
            hintText: widget.hintText,
            hintStyle: GoogleFonts.poppins(
              color: Colors.grey,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

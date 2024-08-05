import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class ReUseAble extends StatelessWidget {
  final Color? colour;
  final Widget? cardChild;
  final void Function()? onPress;
  const ReUseAble(
      {this.colour = kActiveCardColor, this.cardChild, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10),
        ),
        child: cardChild,
      ),
    );
  }
}

// ------------------------------------------------------------------------------------------------------------

class IconContent extends StatelessWidget {
  final String? content;
  final IconData? newIcon;
  IconContent({this.content, this.newIcon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          newIcon,
          size: 80,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(content!, style: kTextStyle)
      ],
    );
  }
}



class BottomButton extends StatelessWidget {
  String? title;
  void Function()? onPress;
  BottomButton({super.key, this.title, this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        color: const Color(0xffeb1555),
        margin: const EdgeInsets.only(top: 10),
        width: double.infinity,
        height: kBottomContainerHeight,
        child: Center(
          child: Text(
            title!,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
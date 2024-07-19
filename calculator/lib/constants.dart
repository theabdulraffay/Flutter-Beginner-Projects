import'package:flutter/material.dart';

const Color blue = Colors.blue;

const headingText = TextStyle(fontSize: 20, color: Colors.white, );

class CusContainer extends StatelessWidget {
  String? title;

  CusContainer({ required this.title});
  CusContainer.another({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
      child: Center(
        child: Container(
          height: 50,
          // width: 80,
          decoration: BoxDecoration(
              color: Colors.pink,
              borderRadius: BorderRadius.circular(40)
          ),
          child: Center(child: Text(title!, style: headingText,)),
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  String title;
  Color color;
  final VoidCallback onPress;
  MyButton({super.key, required this.title,
    this.color = const Color(0xffa5a5a5),
    required this.onPress
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: InkWell(
          onTap: onPress,
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,

            ),
            child: Center(child: Text(title, style: const TextStyle(
              fontSize: 20,
              color: Colors.white
            ),)),
          ),
        ),
      ),
    );
  }
}


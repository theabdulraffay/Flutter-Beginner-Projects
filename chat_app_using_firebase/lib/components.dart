import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final void Function()? onTap;
  final Color color;
  final String text;
  const RoundedButton(
      {super.key,
      this.text = 'Register',
      required this.onTap,
      this.color = Colors.blueAccent});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: onTap,
          minWidth: 200.0,
          height: 42.0,
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

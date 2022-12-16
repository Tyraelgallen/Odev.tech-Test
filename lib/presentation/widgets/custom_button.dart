import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key,
      required this.wsize,
      required this.text,
      required this.color,
      required this.function,
      required this.radius,
      required this.fontsize});

  final double wsize;
  final String text;
  final Color color;
  final VoidCallback function;
  final double radius;
  final double fontsize;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * wsize,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius)),
        ),
        onPressed: function,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontsize,
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class BasicAppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final Widget ? content;
  final double ? height;
  final double ? width;
  const BasicAppButton({
    required this.onPressed,
    this.title = '',
    this.height,
    this.width,
    this.content,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        minimumSize: Size(
          width ?? MediaQuery.of(context).size.width,
          height ?? 60
        ),
      ),
      child: content ?? Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 20
        ),
      )
    );
  }
}
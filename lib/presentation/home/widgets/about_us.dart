import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text(
          'Contact us',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Row(
            children: [
              Icon(Icons.phone),
              SizedBox(width: 10),
              Text(
              "+48 22 230 2470",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Row(
            children: [
              Icon(Icons.email_outlined),
              SizedBox(width: 10),
              Text(
              "support@R-GOL.com",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
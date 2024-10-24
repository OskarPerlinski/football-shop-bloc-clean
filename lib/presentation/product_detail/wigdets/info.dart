import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  const Info({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
      ),
      child: Column(
        children: [
          Divider(),
          SizedBox(height: 10),
          Text(
            "Free delivery from €99",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10),
          Divider(),
          SizedBox(height: 10),
          Text(
            "10% Cashback",
             style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10),
          Divider(),
          SizedBox(height: 10),
          Text(
            "30 days to return",
             style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10),
          Divider(),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomHomeAppbar extends StatelessWidget {
  const CustomHomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Text(
          'Noman Note',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
        ),
        Divider(
          thickness: 3,
          height: 10,
          endIndent: 20,
          indent: 20,
        ),
        SizedBox(
          height: 5,
        ),
        // CustomTextFit(),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class TsFeilds extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscoreText;
  final TFIcons;

  TsFeilds(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscoreText,
      required this.TFIcons});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        controller: controller,
        obscureText: obscoreText,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blueGrey,
              ),
            ),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
            fillColor: Colors.grey.shade100,
            prefixIcon: TFIcons,
            hintText: hintText,
            filled: true),
      ),
    );
  }
}

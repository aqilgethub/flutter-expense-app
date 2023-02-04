import 'package:flutter/material.dart';

class TsButton extends StatelessWidget {
  final String txtButton;
  final Function() onTap;

  TsButton({super.key, required this.txtButton, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.symmetric(horizontal: 100),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        child: Center(
            child: Text(
          txtButton,
          style: TextStyle(color: Colors.blue, fontSize: 25),
        )),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.text, required this.onClick, required this.color});
  final String text;
  final VoidCallback onClick;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
        padding:const EdgeInsets.all(10),
        child: Text(text),
      ),
    );
  }
}

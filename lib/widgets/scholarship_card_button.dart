import 'package:flutter/material.dart';
import 'package:wemakescholars/utils/colors.dart';

class ScholarShipCardButton extends StatelessWidget {
  const ScholarShipCardButton(
      {super.key,
      required this.onClick,
      required this.icon,
      required this.color,
      required this.text});
  final VoidCallback onClick;
  final IconData icon;
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 5),
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 20, color: AppColors.whiteColor),
            const SizedBox(
              width: 5,
            ),
            Text(
              text,
              style: const TextStyle(color: AppColors.whiteColor),
            )
          ],
        ),
      ),
    );
  }
}

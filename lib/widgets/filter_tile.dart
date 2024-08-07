import 'package:flutter/material.dart';
import 'package:wemakescholars/utils/colors.dart';

class FilterTile extends StatelessWidget {
  const FilterTile({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        shape: RoundedRectangleBorder(
            side: const BorderSide(color: AppColors.greyColor),
            borderRadius: BorderRadius.circular(10)),
        title: Text(
          title,
          style: const TextStyle(color: AppColors.textColor),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: AppColors.greyColor,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class RequirementWidget extends StatelessWidget {
  const RequirementWidget(
      {super.key, required this.title, required this.description});
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(color: Color.fromARGB(255, 100, 100, 100)),
        ),
        Text(description)
      ],
    );
  }
}

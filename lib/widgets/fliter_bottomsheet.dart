import 'package:flutter/material.dart';
import 'package:wemakescholars/utils/colors.dart';
import 'package:wemakescholars/widgets/custom_buttton.dart';
import 'package:wemakescholars/widgets/filter_tile.dart';

class FilterBottomSheet extends StatelessWidget {
  final ScrollController scrollController;

  FilterBottomSheet({super.key, required this.scrollController});

  List<String> filters = [
    'Select Nationality',
    'Desired Level of Study',
    'Countries Looking into',
    'Fields interested in',
    'Scholarship Type',
    'Provider'
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            child: const Text(
              'Filter Scholarships',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              itemCount: filters.length,
              itemBuilder: (context, index) {
                return FilterTile(
                  title: filters[index],
                );
              },
            ),
          ),
          Container(
            color: const Color.fromARGB(255, 242, 241, 241),
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                    child: InkWell(
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.all(10),
                    child: Text('Reset'),
                  ),
                )),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: CustomButton(
                        text: 'Apply Filters',
                        onClick: () {},
                        color: AppColors.primaryColor)),
                // ElevatedButton(
                //   onPressed: () {},
                //   child: const Text('Reset'),
                // ),
                // ElevatedButton(
                //   onPressed: () {},
                //   child: const Text('Apply'),
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wemakescholars/models/scholarship_model.dart';
import 'package:wemakescholars/utils/colors.dart';
import 'package:wemakescholars/widgets/requirement_widget.dart';
import 'package:wemakescholars/widgets/scholarship_card_button.dart';

class ScholrarshipCard extends StatelessWidget {
  const ScholrarshipCard({super.key, required this.scholarshipModel});
  final ScholarshipModel scholarshipModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          scholarshipModel.isFeatured!
              ? Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                      color: AppColors.featuredColor,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(5),
                          topLeft: Radius.circular(5))),
                  child: const Text(
                    'Featured',
                    style: TextStyle(color: AppColors.whiteColor),
                  ),
                )
              : const SizedBox.shrink(),
          Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: scholarshipModel.isFeatured!
                        ? const Radius.circular(0)
                        : const Radius.circular(10),
                    topRight: const Radius.circular(10),
                    bottomLeft: const Radius.circular(10),
                    bottomRight: const Radius.circular(10))),
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor.withOpacity(0.1),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10))),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(scholarshipModel.title!),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppColors.primaryColor)),
                        child: Column(
                          children: [
                            const Text('Deadline'),
                            Text(scholarshipModel.deadline!)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        // width: MediaQuery.of(context).size.width * 0.15,
                        height: MediaQuery.of(context).size.height * 0.15,
                        width: MediaQuery.of(context).size.width * 0.3,

                        child: Image.asset(
                          'assets/pngs/${scholarshipModel.image}.png',
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RequirementWidget(
                                title: 'Eligible Degrees:',
                                description: scholarshipModel.degree!),
                            const SizedBox(
                              height: 5,
                            ),
                            RequirementWidget(
                                title: 'Eligible Courses:',
                                description:
                                    scholarshipModel.courses.toString()),
                            const SizedBox(
                              height: 5,
                            ),
                            RequirementWidget(
                                title: 'Eligible Nationalities:',
                                description: scholarshipModel.nationalities!),
                            const SizedBox(
                              height: 5,
                            ),
                            RequirementWidget(
                                title: 'Scholarship can be taken at:',
                                description: scholarshipModel.destination!),
                            RequirementWidget(
                                title: 'Funding Type',
                                description: scholarshipModel.fundingType!),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                          child: ScholarShipCardButton(
                        onClick: () {},
                        text: 'Shortlist',
                        color: AppColors.shortListButtonColor,
                        icon: Icons.star_border_outlined,
                      )),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: ScholarShipCardButton(
                        onClick: () {},
                        text: 'View & Apply',
                        color: AppColors.primaryColor,
                        icon: Icons.star_border_outlined,
                      ))
                    ],
                  ),
                ),
                const Divider(
                  indent: 10,
                  endIndent: 10,
                ),
                Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Text(
                              'Our Scholarship team will help you with any questions'),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(
                                color: AppColors.primaryColor,
                              )),
                          child: const Text(
                            'Ask now',
                            style: TextStyle(color: AppColors.primaryColor),
                          ),
                        )
                      ],
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

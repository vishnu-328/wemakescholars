import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wemakescholars/controllers/scholarships_controller.dart';
import 'package:wemakescholars/utils/colors.dart';
import 'package:wemakescholars/widgets/fliter_bottomsheet.dart';
import 'package:wemakescholars/widgets/scholarship_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController scrollController = ScrollController();

  final ScholarshipsController scholarshipsController =
      Get.put(ScholarshipsController());

  @override
  void initState() {
    super.initState();
    scholarshipsController.getScholarships();
  }

  @override
  Widget build(BuildContext context) {
    void _showFilterBottomSheet(BuildContext context) {
      showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          showDragHandle: true,
          enableDrag: true,
          useSafeArea: true,
          builder: (context) {
            return DraggableScrollableSheet(
              expand: false,
              builder: (context, scrollController) {
                return FilterBottomSheet(scrollController: scrollController);
              },
            );
          });
    }

    return Scaffold(
        appBar: AppBar(
          leading: Image.asset(
            'assets/pngs/logo.png',
            fit: BoxFit.fitWidth,
          ),
          leadingWidth: MediaQuery.of(context).size.width * 0.2,
          title: const Text('Home'),
        ),
        body: SafeArea(
            child: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: const SizedBox.shrink(),
              leadingWidth: 0,
              title: InkWell(
                onTap: () => _showFilterBottomSheet(context),
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.circular(10)),
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.filter_alt_outlined,
                        color: AppColors.whiteColor,
                      ),
                      Text(
                        'Filter Scholarships',
                        style: TextStyle(color: AppColors.whiteColor),
                      )
                    ],
                  ),
                ),
              ),
              floating: true,
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
              childCount: scholarshipsController.sholarshiplist.length,
              (context, index) => ScholrarshipCard(
                scholarshipModel: scholarshipsController.sholarshiplist[index],
              ),
            ))
          ],
        )));
  }
}

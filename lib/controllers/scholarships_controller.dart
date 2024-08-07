import 'package:get/get.dart';
import 'package:wemakescholars/models/scholarship_model.dart';
import 'package:wemakescholars/utils/constants.dart';

class ScholarshipsController extends GetxController {
  List<ScholarshipModel> sholarshiplist = [];

  getScholarships() {
    var l = <ScholarshipModel>[];
    for (var i = 0; i < Constants.Scholarships.length; i++) {
      ScholarshipModel scholarshipModel =
          ScholarshipModel.fromMap(Constants.Scholarships[i]);
      l.add(scholarshipModel);
    }
    sholarshiplist = l;
  }
}

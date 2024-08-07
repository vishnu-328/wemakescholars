class ScholarshipModel {
  String? title;
  String? image;
  String? degree;
  String? deadline;
  String? courses;
  String? nationalities;
  String? destination;
  String? fundingType;
  bool? isFeatured;
  bool? isExpired;

  ScholarshipModel(
      {this.courses,
      this.deadline,
      this.degree,
      this.destination,
      this.fundingType,
      this.image,
      this.isExpired,
      this.isFeatured,
      this.nationalities,
      this.title});

  factory ScholarshipModel.fromMap(Map<String, dynamic> data) =>
      ScholarshipModel(
        title: data['title'],
        image: data['image'],
        degree: data['degrees'],
        courses: data['courses'],
        nationalities: data['nationalities'],
        destination: data['destination'],
        fundingType: data['funding_type'],
        isFeatured: data['is_featured'],
        isExpired: data['is_expired'],
        deadline: data['deadline'],
      );
}

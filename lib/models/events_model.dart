class EventModel {
  String? id;
  String? titleAr;
  String? titleEn;
  String? detailsAr;
  String? detailsEn;
  bool? status;
  String? startDate;

  EventModel({
    required this.titleAr,
    required this.titleEn,
    required this.status,
    required this.id,
    required this.detailsAr,
    required this.detailsEn,
    required this.startDate,
  });

  EventModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    titleAr = json['titleAr'];
    titleEn = json['titleEn'];
    status = json['status'];
    detailsAr = json['detailsAr'];
    detailsEn = json['details'];
    startDate = json['startDate'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'titleAr': titleAr,
      'titleEn': titleEn,
      'status': status,
      'detailsAr': detailsAr,
      'detailsEn': detailsEn,
      'startDate': startDate,
    };
  }
}

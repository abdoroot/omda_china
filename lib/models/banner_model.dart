class BannerModel {
  String? id;
  bool? status;
  String? startDate;
  String? endDate;
  String? image;

  BannerModel({
    required this.status,
    required this.id,
    required this.endDate,
    this.image,
    required this.startDate,
  });

  BannerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    endDate = json['endDate'];
    image = json['image'];
    startDate = json['startDate'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'status': status,
      'endDate': endDate,
      'startDate': startDate,
    };
  }
}

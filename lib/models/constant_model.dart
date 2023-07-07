class ConstantModel {
  String? chinaGateUrl;
  String? knowUsAr;
  String? knowUsEn;
  String? termsAndConditionsAr;
  String? termsAndConditionsEn;
  String? knowHowWorkAr;
  String? knowHowWorkEn;
  

  ConstantModel({
    required this.chinaGateUrl,
    required this.knowUsAr,
    required this.knowUsEn,
    this.termsAndConditionsAr,
    this.termsAndConditionsEn,
    this.knowHowWorkAr,
    this.knowHowWorkEn,
  });

  ConstantModel.fromJson(Map<String, dynamic> json) {
    chinaGateUrl = json['chinaGateUrl'];
    knowUsAr = json['knowUsAr'];
    knowUsEn = json['knowUsEn'];
    termsAndConditionsAr = json['termsAndConditionsAr'];
    termsAndConditionsEn = json['termsAndConditionsEn'];
    knowHowWorkAr = json['knowHowWorkAr'];
    knowHowWorkEn = json['knowHowWorkEn'];
  }

  Map<String, dynamic> toMap() {
    return {
      'chinaGateUrl': chinaGateUrl,
      'knowUsAr': knowUsAr,
      'knowUsEn': knowUsEn,
      'termsAndConditionsAr': termsAndConditionsAr,
      'termsAndConditionsEn': termsAndConditionsEn,
      'knowHowWorkAr': knowHowWorkAr,
      'knowHowWorkEn': knowHowWorkEn,
    };
  }
}

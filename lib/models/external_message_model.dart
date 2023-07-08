class ExternalMessageModel {
  String? id;
  String? senderName;
  String? senderCompanyName;
  String? senderEmail;
  String? senderPhone;
  String? message; 
  String? messageTime; 
  String? status; 

  ExternalMessageModel({
    required this.id,
    required this.senderName,
    required this.senderCompanyName,
    required this.senderPhone,
    required this.message,
    required this.senderEmail,
    required this.messageTime,
    required this.status,

  });

  ExternalMessageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    senderName = json['senderName'];
    senderCompanyName = json['senderCompanyName'];
    senderEmail = json['senderEmail'];
    senderPhone = json['senderPhone'];
    message = json['message'];
    messageTime = json['messageTime'];
    status = json['status'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'senderName': senderName,
      'senderCompanyName': senderCompanyName,
      'senderEmail': senderEmail,
      'senderPhone': senderPhone,
      'message': message,
      'messageTime': messageTime,
      'status': status,
    };
  }
}

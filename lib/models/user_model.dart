class UserModel {
  String? uId;
  String? id;
  String? name;
  String? phone;
  String? email;
  String? accountType;
  String? country;
  String? password;
  bool? accountStatus;
  String? registerDate;
  String? lastMessage;

  UserModel({
    required this.uId,
    required this.name,
    required this.email,
    required this.id,
    required this.phone,
    this.password,
    required this.country,
    required this.accountStatus,
    required this.lastMessage,
    required this.registerDate,
    required this.accountType,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    uId = json['uId'];
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    country = json['country'];
    password = json['password'];
    accountStatus = json['accountStatus'];
    lastMessage = json['lastMessage'];
    registerDate = json['registerDate'];
    accountType = json['accountType'];
  }

  Map<String, dynamic> toMap() {
    return {
      'uId': uId,
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'password': password,
      'country': country,
      'accountStatus': accountStatus,
      'lastMessage': lastMessage,
      'registerDate': registerDate,
      'accountType': accountType,
    };
  }
}

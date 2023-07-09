import 'package:china_omda/presentation/presentation_managers/exports.dart';

class ProfitsAndLossesModel {
  String? id;
  DateTime? date;
  String? reason;
  String? type;
  String? amount;

  ProfitsAndLossesModel({
    required this.id,
    required this.date,
    required this.reason,
    required this.type,
    required this.amount,
  });

  ProfitsAndLossesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'] != null ? (json['date'] as Timestamp).toDate() : null;
    reason = json['reason'];
    type = json['type'];
    amount = json['amount'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date != null ? Timestamp.fromDate(date!) : null,
      'reason': reason,
      'type': type,
      'amount': amount,
    };
  }
}
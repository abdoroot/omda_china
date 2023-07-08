import 'dart:math';
import 'package:china_omda/presentation/presentation_managers/exports.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
//import 'package:get_ip_address/get_ip_address.dart';

Future<String> generateUniqueId() async {
  DateTime now = DateTime.now();
  int year = now.year;
  Random random = Random();
  String randomNumbers = '';

  for (int i = 0; i < 8; i++) {
    randomNumbers += random.nextInt(10).toString();
  }

  String uniqueId = '$year$randomNumbers';
  bool idExists = await checkIdExists(uniqueId);
  bool idExistsOrder = await checkIdExistsOrder(uniqueId);
  if (idExists && idExistsOrder) {
    return generateUniqueId();
  } else {
    return uniqueId;
  }
}

Future<bool> checkIdExists(String id) async {
  CollectionReference collection = FirebaseFirestore.instance.collection('users');
  QuerySnapshot querySnapshot = await collection.where('id', isEqualTo: id).get();
  return querySnapshot.docs.isNotEmpty;
}

Future<bool> checkIdExistsOrder(String id) async {
  CollectionReference collection =
      FirebaseFirestore.instance.collection('admin').doc('user_orders').collection('orders');
  QuerySnapshot querySnapshot = await collection.where('orederId', isEqualTo: id).get();
  return querySnapshot.docs.isNotEmpty;
}

void retrieveCountryForIP() async {
  try {
    final response = await http.get(Uri.parse('https://ipapi.co/json'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final country = data['country_code'];
      countryCode = country;
      debugPrint('Country: $countryCode');
    } else {
      debugPrint('Failed to retrieve country information. Status code: ${response.statusCode}');
    }
  } catch (e) {
    debugPrint('Failed to retrieve country information: $e');
  }
}

Future<void> launchUniversalLinkIos(Uri url) async {
  final bool nativeAppLaunchSucceeded = await launchUrl(
    url,
    mode: LaunchMode.externalApplication,
  );
  if (!nativeAppLaunchSucceeded) {
    await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
    );
  }
}

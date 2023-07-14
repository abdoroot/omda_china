import 'dart:convert';
import 'package:http/http.dart' as http;

class Whatsapp {
  static String accountSid = 'AC15b9a0775261d15b76fc5c0ae6822ccd';
  static String authToken = '8d4c0f9031ccd38825f3387c42b824d2';

  static String twilioNumber = '+16177447739';
  static String toNumber = '+972597701145';
  static String messageBody = 'Your Message Content Successfully';
  String mediaUrl = 'Your Media Url';

  static Future<void> sendWhatsAppMessage() async {
    String baseUrl = 'https://api.twilio.com/2010-04-01/Accounts/$accountSid/Messages.json';
    String creds = '$accountSid:$authToken';
    var bytes = utf8.encode(creds);
    var base64Str = base64.encode(bytes);
    var headers = {'Authorization': 'Basic $base64Str', 'Accept': 'application/json'};
    var body = {
      'From': 'whatsapp:$twilioNumber',
      'To': 'whatsapp:$toNumber',
      'Body': messageBody,
    };

    http.Response response = await http.post(Uri.parse(baseUrl), headers: headers, body: body);
    if (response.statusCode == 201) {
      print('Message Sent Successfully');
    } else {
      print(response.body);
    }
  }
}

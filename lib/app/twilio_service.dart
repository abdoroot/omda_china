import 'dart:math';
import 'package:twilio_flutter/twilio_flutter.dart';

class TwilioServices {
  TwilioFlutter twilioFlutter = TwilioFlutter(
      accountSid: "AC15b9a0775261d15b76fc5c0ae6822ccd", // found on console
      authToken: "8d4c0f9031ccd38825f3387c42b824d2", // found on console
      twilioNumber: "+19804463451" // trial phone number is the one from
      );

  var code;
  Future<void> sendSMS(String phoneNumber) async {
    var rand = Random();
    var verifyCode = rand.nextInt(9000) + 1000;
    code = verifyCode;

    print(code);
    twilioFlutter.sendWhatsApp(
      toNumber:  phoneNumber,
      messageBody: "The verify code $verifyCode",

    );
    // await twilioFlutter.sendSMS(
    //   toNumber: phoneNumber,
    //   messageBody: "The verify code $verifyCode",
    // );
  }
}

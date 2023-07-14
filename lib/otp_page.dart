import 'dart:async';

import 'package:china_omda/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPPage extends StatefulWidget {
  const OTPPage({super.key, required this.verificationId, required this.isTimeOut2});
  final String verificationId;
  final bool isTimeOut2;

  @override
  State<OTPPage> createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  final otpController = TextEditingController();
  bool showLoading = false;
  String verificationFailedMessage = "";
  final FirebaseAuth auth = FirebaseAuth.instance;

  String myVerificationId = "";
  bool isTimeOut = false;

  StreamController<ErrorAnimationType>? errorController;

  bool hasError = false;
  String currentText = "";
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    errorController = StreamController<ErrorAnimationType>();
    myVerificationId = widget.verificationId;
    isTimeOut = widget.isTimeOut2;
    super.initState();
  }

  @override
  void dispose() {
    errorController!.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: showLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                // height: 300,
                child: ListView(
                  children: <Widget>[
                    const SizedBox(height: 8),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Phone Number Verification',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
                      child: RichText(
                        text: const TextSpan(
                            text: "Enter the code sent to ",
                            children: [
                              TextSpan(
                                  text: "+9647501233211",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                            ],
                            style: TextStyle(color: Colors.black54, fontSize: 15)),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Form(
                      key: formKey,
                      child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 30),
                          child: PinCodeTextField(
                            appContext: context,
                            length: 6,
                            animationType: AnimationType.fade,
                            validator: (v) {
                              if (v!.length < 6) {
                                return "you should enter all SMS code";
                              } else {
                                return null;
                              }
                            },
                            pinTheme: PinTheme(
                              shape: PinCodeFieldShape.box,
                              borderRadius: BorderRadius.circular(5),
                              fieldHeight: 50,
                              fieldWidth: 40,
                              activeFillColor: Colors.white,
                              inactiveFillColor: Colors.white,
                            ),
                            cursorColor: Colors.black,
                            animationDuration: const Duration(milliseconds: 300),
                            errorAnimationController: errorController,
                            controller: otpController,
                            keyboardType: TextInputType.number,
                            boxShadows: const [
                              BoxShadow(
                                offset: Offset(0, 1),
                                color: Colors.white,
                                blurRadius: 10,
                              )
                            ],
                            onCompleted: (v) {
                              print("Completed");
                            },
                            onChanged: (value) {
                              print(value);
                              setState(() {
                                currentText = value;
                              });
                            },
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Text(
                        hasError ? "please resend the code!" : "",
                        style:
                            const TextStyle(color: Colors.red, fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Didn't receive the code? ",
                          style: TextStyle(color: Colors.black54, fontSize: 15),
                        ),
                        TextButton(
                            onPressed: isTimeOut
                                ? () async {
                                    setState(() {
                                      isTimeOut = false;
                                    });
                                    await FirebaseAuth.instance.verifyPhoneNumber(
                                      phoneNumber: '+9647501233211',
                                      verificationCompleted: (PhoneAuthCredential credential) {},
                                      verificationFailed: (FirebaseAuthException e) {
                                        setState(() {
                                          showLoading = false;
                                        });
                                        setState(() {
                                          verificationFailedMessage = e.message ?? "error!";
                                        });
                                      },
                                      codeSent: (String verificationId, int? resendToken) {
                                        setState(() {
                                          showLoading = false;
                                          myVerificationId = verificationId;
                                        });
                                      },
                                      timeout: const Duration(seconds: 10),
                                      codeAutoRetrievalTimeout: (String verificationId) {
                                        setState(() {
                                          isTimeOut = true;
                                        });
                                      },
                                    );
                                  }
                                : null,
                            child: const Text(
                              "RESEND",
                              style: TextStyle(
                                  color: Color(0xFF91D3B3),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 30),
                      decoration: BoxDecoration(
                          color: Colors.green.shade300,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.green.shade200, offset: const Offset(1, -2), blurRadius: 5),
                            BoxShadow(
                                color: Colors.green.shade200, offset: const Offset(-1, 2), blurRadius: 5)
                          ]),
                      child: ButtonTheme(
                        height: 50,
                        child: TextButton(
                          onPressed: isTimeOut
                              ? null
                              : () async {
                                  formKey.currentState!.validate();
                                  // conditions for validating
                                  if (currentText.length != 6 || currentText != "123456") {
                                    errorController!.add(ErrorAnimationType
                                        .shake); // Triggering error shake animation
                                    setState(() => hasError = true);
                                  } else {
                                    setState(
                                      () {
                                        hasError = false;
                                      },
                                    );
                                    setState(() {
                                      showLoading = true;
                                    });

                                    try {
                                      PhoneAuthCredential credential = PhoneAuthProvider.credential(
                                          verificationId: myVerificationId,
                                          smsCode: otpController.text);

                                      // Sign the user in (or link) with the credential
                                      await auth.signInWithCredential(credential);
                                    } on FirebaseAuthException catch (e) {
                                      setState(() {
                                        verificationFailedMessage = e.message ?? "error";
                                      });
                                    }

                                    setState(() {
                                      showLoading = false;
                                    });
                                    if (auth.currentUser != null) {
                                      Navigator.of(context).push(PageRouteBuilder(
                                          pageBuilder: (_, __, ___) => const HomePage()));
                                    }
                                  }
                                },
                          child: Center(
                            child: Text(
                              "VERIFY".toUpperCase(),
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      verificationFailedMessage,
                      style:
                          const TextStyle(color: Colors.red, fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
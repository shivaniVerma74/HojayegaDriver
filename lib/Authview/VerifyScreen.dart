import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hojayegadriverapp/Helper/api.path.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:http/http.dart' as http;
import 'package:pinput/pinput.dart';
import '../Helper/color.dart';
import 'Personalinformation.dart';
import 'loginscreen.dart';

class VerifyScreen extends StatefulWidget {
  final OTP;
  final MOBILE;
  const VerifyScreen({Key? key, this.OTP, this.MOBILE}) : super(key: key);

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
  veiftOtp() async {
    var headers = {
      'Cookie': 'ci_session=10873cb2999e1c54a849c86e08d065f53a4803f5'
    };
    var request =
        http.MultipartRequest('POST', Uri.parse(ApiServicves.veriftOtp));
    request.fields.addAll({
      'identity': widget.MOBILE,
      'otp': pin.text,
    });
   print("=======otp verify parameter${request.fields}===========");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      print("worikng#####");
      var finalResponse = await response.stream.bytesToString();
      final jsonresponse = json.decode(finalResponse);
      if (jsonresponse['error'] == false) {
        Fluttertoast.showToast(msg: '${jsonresponse['message']}');
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => PersonalInformation()));
      } else {
        Fluttertoast.showToast(msg: "${jsonresponse['message']}");
      }
    } else {
      print(response.reasonPhrase);
    }
  }

  OtpFieldController controller = OtpFieldController();
  FocusNode focusNode = FocusNode();
  String? enteredOtp;
  final _formKey = GlobalKey<FormState>();
  var pin = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(fontSize: 20, color:Colors.white, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        color:colors.primary,
        border: Border.all(color: colors.primary,),
        borderRadius: BorderRadius.circular(6),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color:  colors.primary,),
      borderRadius: BorderRadius.circular(6),
    );
    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color:  colors.primary,
      ),
    );
    return Scaffold(
      backgroundColor: colors.backgroundcolor,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height / 1.0,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/otpback.png"),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 50, left: 20),
                child: Text("OTP Verification",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: colors.white,
                        fontSize: 24)),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 15, left: 20, right: 10),
                child: Text(
                    "Please enter OTP received on your mobile number to continue.",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: colors.white,
                        fontSize: 15)),
              ),
              // const Padding(
              //   padding:EdgeInsets.only(top: 15, left: 20, right: 10),
              //   child: Text("Mobile Verification",
              //       style: TextStyle(fontWeight: FontWeight.bold, color: colors.white, fontSize: 24)),
              // ),
              const SizedBox(height: 20),
              Center(
                  child: Image.asset("assets/images/verification.png",
                      scale: 1.9)),
              const SizedBox(height: 25),
              Column(
                children: [
                  Text(
                    "OTP: ${widget.OTP}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 15),
                  ),
                  Center(
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 4,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30)),
                        height: 200,
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                              child: SizedBox(
                                width: 250,
                                child: Form(
                                  key: _formKey,
                                  child: Pinput(
                                    controller:pin ,
                                    defaultPinTheme: defaultPinTheme,
                                    focusedPinTheme: focusedPinTheme,
                                    submittedPinTheme: submittedPinTheme,
                                    validator: (s) {
                                      return s == '${widget.OTP}' ? null : 'Pin is incorrect';
                                    },
                                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                                    showCursor: true,
                                    onCompleted: (pin) => debugPrint('enter pin'),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 40),
                            Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width / 1.4,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: colors.secondary, // Background color
                                  onPrimary: Colors.amber, // Text Color (Foreground color)
                                ),
                                child: const Text("Verify",
                                    style: TextStyle(color: Colors.white, fontSize: 18)),
                                onPressed: () {
                                  veiftOtp();
                                },
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hojayegadriverapp/Authview/VerifyScreen.dart';
import 'package:hojayegadriverapp/Authview/loginscreen.dart';
import 'package:hojayegadriverapp/Helper/api.path.dart';
import 'package:http/http.dart' as http;
import '../Helper/color.dart';
import 'Changepassword.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {

  forgotPassword() async {
    print("workinggggggg");
    var headers = {
      'Cookie': 'ci_session=577a92dbca504d7843e9bb9ac3913ae0ec81d412'
    };
    var request = http.MultipartRequest('POST', Uri.parse(ApiServicves.forgetPassword));
    request.fields.addAll({
      'identity': emailCtr.text
    });
    print("parameterrrrrr ${request.fields}");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      print("hgggggggggg");
      var finalResponse = await response.stream.bytesToString();
      final jsonresponse = json.decode(finalResponse);
      print("wokinhgggggggg ${jsonresponse} $finalResponse");

      if (jsonresponse['status'] == 1) {
        int otp = jsonresponse['otp'];
        String mobile = jsonresponse['msg'];
        print('____otp___${otp}___');
        Fluttertoast.showToast(msg: '${jsonresponse['msg']}');
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => VerifyScreen(OTP: otp, MOBILE: mobile)));
      } else {
        Fluttertoast.showToast(msg: "${jsonresponse['msg']}");
      }
    }
    else {
      print(response.reasonPhrase);
    }
  }


  TextEditingController emailCtr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: colors.primary,
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height/1.0,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.cover,
              ),
            ),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                const Padding(
                  padding: EdgeInsets.only(top: 50, left: 20),
                  child: Text("Forgot Password", style: TextStyle(fontWeight: FontWeight.bold, color: colors.white, fontSize: 24)),
                ),
                const Padding(
                  padding:EdgeInsets.only(top: 15, left: 20, right: 10),
                  child: Text("Please enter mobile number you are registered with to receive OTP to reset password.",
                      style: TextStyle(fontWeight: FontWeight.bold, color: colors.white, fontSize: 15)),
                ),
                // const Padding(
                //   padding:EdgeInsets.only(top: 15, left: 20, right: 10),
                //   child: Text("Mobile Verification",
                //       style: TextStyle(fontWeight: FontWeight.bold, color: colors.white, fontSize: 24)),
                // ),
                SizedBox(height: 25),
                Center(
                    child: Image.asset("assets/images/forgetpassword.png", scale: 1.9)),
                const SizedBox(height: 30),
                Center(
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    elevation: 4,
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                      height: 200,
                      width: MediaQuery.of(context).size.width/1.2,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Material(
                                  elevation: 4,
                                  borderRadius: BorderRadius.circular(10),
                                  child: Container(
                                      width: 40,
                                      height: 40,
                                      child: Image.asset("assets/images/email.png", scale: 1.4,)
                                  ),
                                ),
                                const SizedBox(width: 18),
                                Expanded(
                                  child: Container(
                                    width: 80,
                                    height: 45,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(5),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(1.0, 1.0,),
                                          blurRadius: 0.2,
                                          spreadRadius: 0.5,
                                        ),
                                      ],
                                    ),
                                    child: TextFormField(
                                      // maxLength: 10,
                                      controller: emailCtr,
                                      keyboardType: TextInputType.text,
                                      decoration: const InputDecoration(
                                          counterText: "",
                                          // suffixIcon: suffixIcons,
                                          contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide.none
                                          ),
                                          hintText: "Email/phone Number"
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 40,),
                          Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width/1.4,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: colors.secondary, // Background color
                                onPrimary: Colors.amber, // Text Color (Foreground color)
                              ),
                              child: const Text("Send OTP", style: TextStyle(color: Colors.white, fontSize: 18)),
                              onPressed: () {

                                // if(emailCtr.text.isEmpty){
                                //   Fluttertoast.showToast(msg: "Please fill Field");
                                // } else {
                                //   forgotPassword();
                                //   //Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                                // }
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Changepassword()));
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
          ),
        ),
      );
  }
}

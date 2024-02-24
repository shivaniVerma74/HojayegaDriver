import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hojayegadriverapp/Authview/VerifyScreen.dart';
import 'package:hojayegadriverapp/Authview/loginscreen.dart';
import 'package:hojayegadriverapp/Helper/api.path.dart';
import 'package:http/http.dart' as http;
import '../Helper/color.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  sendOtp() async {
    var headers = {
      'Cookie': 'ci_session=10873cb2999e1c54a849c86e08d065f53a4803f5'
    };
    var request = http.MultipartRequest('POST', Uri.parse(ApiServicves.sendOtp));
    request.fields.addAll({
      'identity': emailCtr.text
    });
    print("parametyeet mnpww ${request.fields}");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      print("worikng#####");
      var finalResponse = await response.stream.bytesToString();
      final jsonresponse = json.decode(finalResponse);
      if (jsonresponse['error'] == false) {
        int otp = jsonresponse['otp'];
        String mobile = jsonresponse['mobile'];
        print('____otp___${otp}___');
        Fluttertoast.showToast(msg: '${jsonresponse['message']}');
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => VerifyScreen(OTP: otp, MOBILE: mobile)));
      } else {
        Fluttertoast.showToast(msg: "${jsonresponse['message']}");
      }
    }
  }

  bool isNumeric(String s) {
    if(s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  bool validateMobile(String value) {
    String pattern = r'^[0-9]{10}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }
  bool validateEmail(String value) {
    String pattern = r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  final _formKey = GlobalKey<FormState>();
  TextEditingController emailCtr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.backgroundcolor,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            height: MediaQuery.of(context).size.height/1.0,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.cover,
              ),
            ),
            child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                const Padding(
                  padding: EdgeInsets.only(top: 50, left: 20),
                  child: Text("Sign Up", style: TextStyle(fontWeight: FontWeight.bold, color: colors.white, fontSize: 24)),
                ),
                const Padding(
                  padding:EdgeInsets.only(top: 15, left: 20, right: 10),
                  child: Text("Please enter your valid mobile number to receive OTP for further registration process.",
                      style: TextStyle(fontWeight: FontWeight.bold, color: colors.white, fontSize: 15)),
                ),
                SizedBox(height: 35),
                Center(
                    child: Image.asset("assets/images/signup.png", scale: 1.9)),
                const SizedBox(height: 50),
                Center(
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    elevation: 4,
                    child:
                    Container(
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
                                  child:
                                  Container(
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
                                      validator: (value) {
                                        if (value == null || value.isEmpty || value == "") {
                                          return 'Mobile number or Email is required';
                                        }
                                        else if(isNumeric(value)){
                                          if (!validateMobile(value)) {
                                            return 'Invalid Mobile Number';
                                          }
                                        }else{
                                          if(!validateEmail(value)){
                                            return 'Invalid Email';
                                          }
                                        }
                                        return null;
                                      },
                                      decoration: const InputDecoration(
                                          counterText: "",
                                          // suffixIcon: suffixIcons,
                                          contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                                          border: OutlineInputBorder(borderSide: BorderSide.none),
                                          hintText: "Email/phone Number"
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 40),
                          Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width/1.4,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: colors.secondary, // Background color
                                onPrimary: Colors.amber, // Text Color (Foreground color)
                              ),
                              child: const Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 18)),
                              onPressed: () {
                                if(_formKey.currentState!.validate()){
                                 sendOtp();
                                }
                                // Navigator.push(context, MaterialPageRoute(builder: (context) => VerifyScreen()));
                              },
                            ),
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already registered ?", style: TextStyle(fontSize: 16, color: Colors.black),),
                    const SizedBox(width: 5),
                    InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginScreen()));
                        },
                        child: const Text("Login", style: TextStyle(color: colors.secondary, fontWeight:  FontWeight.w500),))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

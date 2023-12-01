import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hojayegadriverapp/Authview/signupscreen.dart';
import 'package:hojayegadriverapp/Helper/api.path.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Helper/color.dart';
import '../Screen/Forgotpassword.dart';
import '../Screen/HomeScreen.dart';
import 'VerifyScreen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailCtr = TextEditingController();
  TextEditingController passCtr = TextEditingController();

  bool showPassword = false;
  bool _isChecked = false;

  login() async {
    String? driver_id;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var headers = {
      'Cookie': 'ci_session=6c66ecfba95b6018edecd10919c32153c4e7d4e6'
    };
    var request = http.MultipartRequest('POST', Uri.parse(ApiServicves.driveLogin));
    request.fields.addAll({
      'identity': emailCtr.text,
      'password': passCtr.text,
      'fcm_id': 'fasdf'
    });
    print("pararararararar ${request.fields}");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      print("workinggg");
      var finalResponse = await response.stream.bytesToString();
      final jsonresponse = json.decode(finalResponse);
      if (jsonresponse['error'] == false) {
        print("jhggggghhghhhgghghgh");
        setState(() {
          driver_id = jsonresponse['data']['id'];
        });
        preferences.setString("driver_id", driver_id ?? "");
        print("driver idddd issss $driver_id");
        Fluttertoast.showToast(msg: '${jsonresponse['message']}');
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
      } else {
        Fluttertoast.showToast(msg: "${jsonresponse['message']}");
      }
    }
    else {
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
      backgroundColor: colors.backgroundcolor,
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  [
              const Padding(
                padding: EdgeInsets.only(top: 50, left: 20),
                child: Text("Login", style: TextStyle(fontWeight: FontWeight.bold, color: colors.white, fontSize: 24)),
              ),
              const Padding(
                padding:EdgeInsets.only(top: 15, left: 20, right: 10),
                child: Text("Please enter email address or mobile number and password if you are already registered ,if not then signup for new account.",
                    style: TextStyle(fontWeight: FontWeight.bold, color: colors.white, fontSize: 15)),
              ),
              SizedBox(height: 15),
              Center(
                  child: Image.asset("assets/images/login.png", scale: 1.9,)),
              SizedBox(height: 20,),
              Center(
                child: Card(
                  elevation: 4,
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
                    height: 270,
                    width: MediaQuery.of(context).size.width/1.1,
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
                                  width: 100,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.grey,
                                        offset:  Offset(
                                          1.0,
                                          1.0,
                                        ),
                                        blurRadius: 0.5,
                                        spreadRadius: 0.5,
                                      ),
                                    ],
                                  ),
                                  child: TextFormField(
                                    // maxLength: 10,
                                    controller: emailCtr,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: const InputDecoration(
                                        counterText: "",
                                        // suffixIcon: suffixIcons,
                                        contentPadding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
                                        border: OutlineInputBorder(borderSide: BorderSide.none),
                                        hintText: "Email/Mobile Number"
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
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
                                    child: Image.asset("assets/images/lock.png", scale: 1.4,)
                                ),
                              ),
                              const SizedBox(width: 18),
                              Expanded(
                                child:
                                Container(
                                  width: 100,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.grey,
                                        offset:  Offset(1.0, 1.0),
                                        blurRadius: 0.5,
                                        spreadRadius: 0.5,
                                      ),
                                    ],
                                  ),
                                  child: TextFormField(
                                    // validator: validatior,
                                    obscureText: showPassword == true ? false : true,
                                    // obscuringCharacter: '*',
                                    controller: passCtr,
                                    // maxLength: length,
                                    keyboardType: TextInputType.number,
                                    decoration:  InputDecoration(
                                        counterText: "",
                                        suffixIcon: InkWell(
                                            onTap: () {
                                              setState(() {
                                                showPassword = !showPassword;
                                              });
                                            },
                                            child: Icon(showPassword == true ? Icons.visibility : Icons.visibility_off, color: colors.secondary),
                                        ),
                                        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                                        border: const OutlineInputBorder(borderSide: BorderSide.none),
                                        hintText: "Password"
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 2),
                              child: SizedBox(
                                height: 50,
                                child: Checkbox(
                                  side: const BorderSide(
                                    // set border color here
                                    color: colors.primary,
                                  ),
                                  value: _isChecked,
                                  onChanged: (newValue) {
                                    setState(() {
                                      _isChecked = newValue!;
                                    });
                                  },
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('Remeber Me' ,style: TextStyle(fontSize: 12, color:  Colors.black)),
                              ],
                            ),
                            const SizedBox(width: 70),
                            InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ForgotPassword()));
                              },
                                child: const Text("Forget Password ?", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: colors.secondary)))
                          ],
                        ),
                        SizedBox(height: 30),
                        Container(
                          height: 40,
                          width: MediaQuery.of(context).size.width/1.4,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: colors.secondary, // Background color
                              onPrimary: Colors.amber, // Text Color (Foreground color)
                            ),
                            child: const Text("Login", style: TextStyle(color: Colors.white, fontSize: 18)),
                            onPressed: () {
                              // login();
                              if(emailCtr.text.length == 0 || passCtr.text.length == 0) {
                                Fluttertoast.showToast(msg: "Please Fill All fields");
                              } else if(!_isChecked){
                                Fluttertoast.showToast(msg: "please check Remember");
                              }
                              else {
                                login();
                              }
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?", style: TextStyle(fontSize: 16, color: Colors.black),),
                  const SizedBox(width: 5),
                  InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const SignupScreen()));
                      },
                      child: const Text("Sign Up", style: TextStyle(color: colors.secondary, fontWeight:  FontWeight.w500),))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

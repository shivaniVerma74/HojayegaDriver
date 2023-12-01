import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hojayegadriverapp/Authview/loginscreen.dart';
import 'package:hojayegadriverapp/Helper/api.path.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Authview/signupscreen.dart';
import '../Helper/color.dart';

class Changepassword extends StatefulWidget {
  const Changepassword({Key? key}) : super(key: key);

  @override
  State<Changepassword> createState() => _ChangepasswordState();
}

class _ChangepasswordState extends State<Changepassword> {

  TextEditingController passwordCtr = TextEditingController();
  TextEditingController newPswctr = TextEditingController();
  bool showPassword = false;
  bool showPasswordTwo = false;
  bool _isChecked = false;

  changePassword() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? driverId = preferences.getString('driver_id');
    var headers = {
      'Cookie': 'ci_session=02898852216c3425723902e139b224c9aeab12b2'
    };
    var request = http.MultipartRequest('POST', Uri.parse(ApiServicves.changePaesword));
    request.fields.addAll({
      'driver_id': driverId.toString(),
      'password': passwordCtr.text,
      'cpassword': newPswctr.text
    });
    print("change pasword ${request.fields}");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final jsonresponse = json.decode(finalResponse);
      print("wokinhgggggggg $jsonresponse $finalResponse");
      if (jsonresponse['status'] == 1) {
        print("jhggggghhghhhgghghgh");
        Fluttertoast.showToast(msg: '${jsonresponse['msg']}');
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
      } else {
        Fluttertoast.showToast(msg: "${jsonresponse['msg']}");
      }
    }
    else {
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.backgroundcolor,
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
                child: Text("Login", style: TextStyle(fontWeight: FontWeight.bold, color: colors.white, fontSize: 24)),
              ),
              const Padding(
                padding:EdgeInsets.only(top: 15, left: 20, right: 10),
                child: Text("Please enter password if you don't have remeber his password then to enter the password and changed it",
                    style: TextStyle(fontWeight: FontWeight.bold, color: colors.white, fontSize: 15)),
              ),
              SizedBox(height: 15),
              Center(
                  child: Image.asset("assets/images/login.png", scale: 1.9,)),
              SizedBox(height: 20),
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
                                    child: Image.asset("assets/images/lock.png", scale: 1.4,)
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
                                    controller: passwordCtr,
                                    // maxLength: length,
                                    keyboardType: TextInputType.emailAddress,
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
                                        hintText: "Old Password"
                                    ),
                                  ),
                                ),
                              ),
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
                                child: Container(
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
                                    controller: newPswctr,
                                    // maxLength: length,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration:  InputDecoration(
                                        counterText: "",
                                        suffixIcon: InkWell(
                                          onTap: () {
                                            setState(() {
                                              showPasswordTwo = !showPasswordTwo;
                                            });
                                          },
                                          child: Icon(showPasswordTwo == true ? Icons.visibility : Icons.visibility_off, color: colors.secondary),
                                        ),
                                        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                                        border: const OutlineInputBorder(borderSide: BorderSide.none),
                                        hintText: "New Password"
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
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
                            child: const Text("Submit", style: TextStyle(color: Colors.white, fontSize: 18)),
                            onPressed: () {
                              // login();
                              if(passwordCtr.text.length == 0 || newPswctr.text.length == 0) {
                                Fluttertoast.showToast(msg: "Please Fill All fields");
                              } else {
                                changePassword();
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
            ],
          ),
        ),
      ),
    );
  }
}

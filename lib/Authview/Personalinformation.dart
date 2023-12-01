import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hojayegadriverapp/Screen/PrivacyPolicy.dart';
import 'package:hojayegadriverapp/Screen/SubmitScreen.dart';
import 'package:hojayegadriverapp/Authview/Vehicleinformation.dart';
import 'package:hojayegadriverapp/Screen/TermCondition.dart';
import 'package:intl/intl.dart';

import '../Helper/color.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({super.key});

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {

  List<String> PersonalInformationList = [
    "Personal Information",
    "Vehicle Information",
    "Account Details",
    " KYC Verification"
  ];

  bool selected = false;
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  TextEditingController cPasswordEditingController = TextEditingController();
  TextEditingController dobCtr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.backgroundcolor,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: Color(0xff112C48),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ListView(
              children: [
                const Text(
                  'Sign up',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Please enter required information to complete signup.',
                    style: TextStyle(fontWeight: FontWeight.bold, color: colors.white, fontSize: 15)
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    primary: false,
                    padding: const EdgeInsets.all(0),
                    itemCount: PersonalInformationList.length,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 0,
                      childAspectRatio: 5,
                      mainAxisSpacing: 0.0,
                    ),
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          const Icon(Icons.circle, color: Colors.white,),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(PersonalInformationList[index],
                              style:
                              TextStyle(fontSize: 13, color: Colors.white))
                        ],
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.circle,
                          color: colors.primary,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text("Personal Information",
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Material(
                            elevation: 4,
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                                width: 40,
                                height: 40,
                                child: Image.asset("assets/images/person.png",scale: 1.5,)
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 260,
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
                              controller: nameEditingController,
                              keyboardType: TextInputType.text,
                              decoration: const InputDecoration(
                                  counterText: "",
                                  // suffixIcon: suffixIcons,
                                  contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                                  border: OutlineInputBorder(borderSide: BorderSide.none),
                                  hintText: "Name"
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Material(
                            elevation: 4,
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                                width: 40,
                                height: 40,
                                child: Image.asset("assets/images/email.png",scale: 1.5,)
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 260,
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
                              controller: emailEditingController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: const InputDecoration(
                                  counterText: "",
                                  // suffixIcon: suffixIcons,
                                  contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                                  border: OutlineInputBorder(borderSide: BorderSide.none),
                                  hintText: "Email"
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Material(
                            elevation: 4,
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                                width: 40,
                                height: 40,
                                child: Image.asset("assets/images/lock.png",scale: 1.5,)
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 260,
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
                              controller: passwordEditingController,
                              // maxLength: length,
                              keyboardType: TextInputType.text,
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
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Material(
                            elevation: 4,
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                                width: 40,
                                height: 40,
                                child: Image.asset("assets/images/lock.png",scale: 1.5,)
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 260,
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
                              controller: cPasswordEditingController,
                              // maxLength: length,
                              keyboardType: TextInputType.text,
                              decoration:  InputDecoration(
                                  counterText: "",
                                  suffixIcon: InkWell(
                                    onTap: () {
                                      setState(() {
                                        showPasswordNew = !showPasswordNew;
                                      });
                                    },
                                    child: Icon(showPasswordNew == true ? Icons.visibility : Icons.visibility_off, color: colors.secondary),
                                  ),
                                  contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                                  border: const OutlineInputBorder(borderSide: BorderSide.none),
                                  hintText: "Confirm Password"
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Material(
                            elevation: 4,
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                                width: 40,
                                height: 40,
                                child: Image.asset("assets/images/daetofbirth.png",scale: 1.5,)
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 260,
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
                              onTap: () async {
                                DateTime? datePicked = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(2000),
                                    lastDate: DateTime(2024));
                                if (datePicked != null) {
                                  print(
                                      'Date Selected:${datePicked.day}-${datePicked.month}-${datePicked.year}');
                                  String formettedDate =
                                  DateFormat('dd-MM-yyyy').format(datePicked);
                                  setState(() {
                                    dobCtr.text = formettedDate;
                                  });
                                }
                              },
                              controller: dobCtr,
                              decoration: const InputDecoration(
                                  counterText: "",
                                  // suffixIcon: suffixIcons,
                                  contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                                  border: OutlineInputBorder(borderSide: BorderSide.none),
                                  hintText: "Date Of Birth"
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        children: [
                          InkWell(
                              onTap: () {
                                setState(() {
                                  selected = !selected;
                                });
                              },
                              child: Icon(
                                selected == true
                                    ? Icons.check_box
                                    : Icons.check_box_outline_blank_outlined,
                                color: colors.secondary,
                              ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          const Text(
                            'I agree to all',
                            style: TextStyle(fontSize: 11),
                          ),
                          SizedBox(width: 3,),
                          InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => TermCondition()));
                            },
                              child: const Text("term & condition", style: TextStyle(color: Colors.blue, fontSize: 11),)),
                          SizedBox(width: 3,),
                          Text("and", style: TextStyle( fontSize: 11),),
                          SizedBox(width: 3,),
                          InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacyPolicy()));
                              },
                              child: Text("Privacy Policy", style: TextStyle(color: Colors.blue, fontSize: 11),))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        if(nameEditingController.text.length == 0  ||
                            passwordEditingController.text.length == 0 ||
                            emailEditingController.text.length == 0 ||
                            dobCtr.text.length == 0 ||
                            cPasswordEditingController.text.length == 0 || selected == ""){
                          Fluttertoast.showToast(msg: "Please Fill All Fields");
                        } else if(!selected){
                          Fluttertoast.showToast(msg: "please check terms & condition");
                        }
                        else {
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>  VehicleInformation(
                              Name: nameEditingController.text, Email: emailEditingController.text,
                              Passowrd: passwordEditingController.text, ConfirmPassword: cPasswordEditingController.text,
                              Date: dobCtr.text)),
                          );
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width/1.4,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(5)),
                        child: const Center(
                          child: Text(
                            'Next',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration commonInputDecoration(
      {String labelText = '', String hintText = '', Color? color}) {
    return InputDecoration(
      border: InputBorder.none,
      filled: true,
      fillColor: Colors.grey.withOpacity(0.2),
      // labelText: labelText,
      hintText: hintText,
      // labelStyle: const TextStyle(
      //   color: Colors.black,
      //   fontSize: 14,
      // ),
      hintStyle: const TextStyle(
        color: Colors.grey,
        fontSize: 12,
      ),
    );
  }

  bool showPassword = false;
  bool showPasswordNew = false;

  InputDecoration passwordInputDecoration(
      {String labelText = '', String hintText = '', Color? color}) {
    return InputDecoration(
      suffixIcon: InkWell(
        onTap: () {
          setState(() {
            showPassword = !showPassword;
          });
        },
        child: Icon(showPassword == true ? Icons.visibility : Icons.visibility_off, color: colors.secondary),
      ),
      border: InputBorder.none,
      filled: true,
      fillColor: Colors.grey.withOpacity(0.2),
      // labelText: labelText,
      hintText: hintText,
      // labelStyle: const TextStyle(
      //   color: Colors.black,
      //   fontSize: 14,
      // ),
      hintStyle: const TextStyle(
        color: Colors.grey,
        fontSize: 12,
      ),
    );
  }
}

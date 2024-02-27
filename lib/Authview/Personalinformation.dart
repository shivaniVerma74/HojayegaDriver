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
  TextEditingController mobileCtr = TextEditingController();
  TextEditingController alternatemobileCtr = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();
  TextEditingController cPasswordEditingController = TextEditingController();
  TextEditingController dobCtr = TextEditingController();

  bool showPassword = false;
  bool showPasswordNew = false;

  bool isStrongPassword(String s){
    RegExp regex =
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$');
    return regex.hasMatch(s);
  }

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.backgroundcolor,
      body:
      Stack(
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
            child: Form(
              key:  _formKey,
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
                                const TextStyle(fontSize: 11, color: Colors.white))
                          ],
                        );
                      },
                    ),
                  ),
                  const SizedBox(
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
                              width: 240,
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
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter Name';
                                  }
                                  return null;
                                },
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
                              width: 240,
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
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter Email';
                                  }
                                  return null;
                                },
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
                                  child: Image.asset("assets/images/email.png",scale: 1.5,)
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 240,
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
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter Mobile Number';
                                  }
                                  return null;
                                },
                                maxLength: 10,
                                controller: mobileCtr,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                    counterText: "",
                                    // suffixIcon: suffixIcons,
                                    contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                                    border: OutlineInputBorder(borderSide: BorderSide.none),
                                    hintText: "Mobile Number"
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
                                  child: Image.asset("assets/images/email.png",scale: 1.5,)
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 240,
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
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter Alternate Mobile Number';
                                  }
                                  return null;
                                },
                                maxLength: 10,
                                controller: alternatemobileCtr,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                    counterText: "",
                                    // suffixIcon: suffixIcons,
                                    contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                                    border: OutlineInputBorder(borderSide: BorderSide.none),
                                    hintText: "Alternate Mobile Number"
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
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 240,
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
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'enter password';
                                  } else if (value.length < 6 || value.length >12) {
                                    return 'Minimum 6 and  Maximum 12 Character ';
                                  }
                                  return null;
                                },
                                maxLength: 12,
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
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 240,
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
                                maxLength: 12,
                                // validator: validatior,
                                obscureText: showPasswordNew == true ? false : true,
                                // obscuringCharacter: '*',
                                controller: cPasswordEditingController,
                                validator: (value) {
                                  if(value!=passwordEditingController.text)
                                    return "Password Not Match";
                                  return null;
                                },
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
                                  child: Image.asset("assets/images/daetofbirth.png",scale: 1.5,)
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Container(
                              width: 240,
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
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Enter Date Of Birth';
                                  }
                                  return null;
                                },
                                onTap: ()  {
                                  _selectDate1();
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
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
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
                            const SizedBox(width: 3,),
                            InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => TermCondition()));
                              },
                                child: const Text("term & condition", style: TextStyle(color: Colors.blue, fontSize: 11),)),
                            const SizedBox(width: 3,),
                            const Text("and", style: TextStyle( fontSize: 11),),
                            SizedBox(width: 3,),
                            InkWell(
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => PrivacyPolicy()));
                                },
                                child: const Text("Privacy Policy", style: TextStyle(color: Colors.blue, fontSize: 11),))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          print("personal information${nameEditingController.text}${passwordEditingController.text}${emailEditingController.text}${dobCtr.text}${cPasswordEditingController.text}===========");
                          if(_formKey.currentState!.validate() || selected == ""){
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>  VehicleInformation(
                              Name: nameEditingController.text, Email: emailEditingController.text,
                              Passowrd: passwordEditingController.text, ConfirmPassword: cPasswordEditingController.text,
                              Date: dobCtr.text,
                              mobile: mobileCtr.text,
                              alternatemobile: alternatemobileCtr.text,
                               ),
                              ),
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
          ),
        ],
      ),
    );
  }

  Future _selectDate1() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1960),
        lastDate: DateTime.now(),
        builder: (BuildContext context, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
                primaryColor: colors.primary,
                // accentColor: Colors.black,
                colorScheme: ColorScheme.light(primary: colors.primary),
                buttonTheme:
                ButtonThemeData(textTheme: ButtonTextTheme.accent)),
            child: child!,
          );
        });
    if (picked != null)
      setState(() {
        String yourDate = picked.toString();
        _dateValue = convertDateTimeDisplay(yourDate);
        dateFormate = DateFormat("dd/MM/yyyy").format(DateTime.parse(_dateValue ?? ""));
      });
    setState(() {
      dobCtr = TextEditingController(text: _dateValue);
    });
  }

  String _dateValue = '';
  var dateFormate;

  String convertDateTimeDisplay(String date) {
    final DateFormat displayFormater = DateFormat('yyyy-MM-dd HH:mm:ss.SSS');
    final DateFormat serverFormater = DateFormat('yyyy-MM-dd');
    final DateTime displayDate = displayFormater.parse(date);
    final String formatted = serverFormater.format(displayDate);
    return formatted;
  }

}

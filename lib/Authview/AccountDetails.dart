import 'dart:convert';
import 'dart:io';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hojayegadriverapp/Authview/KycDetails.dart';
import 'package:hojayegadriverapp/Authview/RegistrationFees.dart';
import 'package:hojayegadriverapp/Helper/api.path.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import '../Helper/color.dart';
import '../Model/CityModel.dart';
import '../Model/StateModel.dart';

class AccountDetails extends StatefulWidget {
  final Name;
  final Email;
  final Passowrd;
  final ConfirmPassword;
  final Date;
  final Vehicle;
  final Contact;
  final Address;
  final States;
  final City;
  final Region;
  final Zip;
  final lat;
  final long;
  final VehicleType;
  final Pincode;
  const AccountDetails({super.key, this.Date, this.ConfirmPassword,
    this.Passowrd, this.Email, this.Name, this.Address,
    this.City, this.Contact, this.Region, this.States,
    this.Vehicle, this.Zip, this.lat, this.long, this.VehicleType, this.Pincode});

  @override
  State<AccountDetails> createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {

  @override
  void initState() {
    super.initState();
    print("in this pagegge ${widget.Passowrd}");
    print("in this pagegge ${widget.Name}");
    print("in this pagegge ${widget.Email}");
    print("in this pagegge ${widget.ConfirmPassword}");
    print("in this pagegge ${widget.Date}");
    getstate();
  }

  List<String> signUpList = [
    "Personal Information",
    "Vehicle Information",
    "Account Details",
    " KYC Verification"
  ];

  List<String> imagesList = [
    "assets/images/car.png",
    "assets/images/bike.png",
    "assets/images/auto.png",
    "assets/images/truck.png"
  ];

  bool selected = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController banknamectr = TextEditingController();
  TextEditingController acoountCtr = TextEditingController();
  TextEditingController ifscCtr = TextEditingController();
  TextEditingController upiCtr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors.primary,
        elevation: 0,
        leading: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.all(10),
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.blue,
            ),
          ),
        ),
      ),
      backgroundColor: Colors.blue.shade50,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              color: colors.primary,
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
                  'Please enter required information to complete signup',
                  style: TextStyle(fontSize: 12, color: Colors.white),
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
                    itemCount: signUpList.length,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 0,
                      childAspectRatio: 5,
                      mainAxisSpacing: 0.0,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {},
                        child: Row(
                          children: [
                            const Icon(
                              Icons.circle,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(signUpList[index], style: const TextStyle(fontSize: 13, color: Colors.white))
                          ],
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 260,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: accountInformatin()),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    height: 235,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: accountInformatin2()),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 600),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (contextn) => KycInformationScreen()));
                if(banknamectr.text.length == 0 ||
                    acoountCtr.text.length == 0
                    || ifscCtr.text.length == 0 ||
                    upiCtr.text.length == 0 || qrImage!.length == 0
                ) {
                  Fluttertoast.showToast(msg: "Please Fill All Fields");
                } else {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => KycInformationScreen(
                      Name: widget.Name, Email: widget.Email, Passowrd: widget.Passowrd, ConfirmPassword: widget.ConfirmPassword,
                      Date: widget.Date, Vehicle: widget.VehicleType, Contact: widget.Contact, Address: widget.Address,
                      States: stateValue.toString(), City: cityValue.toString(), Region: widget.Region, Zip: widget.Zip,
                      lat: widget.lat, long: widget.long, VehicleType: selectedVehicle.toString(), Pincode: widget.Pincode,
                    BankName: banknamectr.text, AccountNumber: acoountCtr.text, Ifsc: ifscCtr.text, UpiId: upiCtr.text, QrImage: qrImage.toString(),),
                  ),
                  );
                }
              },
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.green, borderRadius: BorderRadius.circular(5)),
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
            ),
          ),
          SizedBox(height: 10,)
        ],
      ),
    );
  }

  int selectedVehicle = 0;
  String dropdownvalue = 'Mp';

  // List of items in our dropdown menu
  var itemsState = [
    'Mp',
    'RJ',
    'HP',
    'UP',
  ];
  String dropdowncity = 'Indore';

  // List of items in our dropdown menu
  var itemsCity = [
    'Indore',
    'Bhopal',
    'Ratlam',
  ];

  List<CityData> cityList = [];
  List<StataData> stateList = [];
  CityData? cityValue;
  StataData? stateValue;
  String? stateName;
  String? cityName;

  getstate() async {
    print("state apiii isss");
    var headers = {
      'Cookie': 'ci_session=95bbd5f6f543e31f65185f824755bcb57842c775'
    };
    var request = http.MultipartRequest('POST', Uri.parse(ApiServicves.getStates));
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      String responseData = await response.stream.transform(utf8.decoder).join();
      var userData = json.decode(responseData);
      if (mounted) {
        setState(() {
          stateList = StateModel.fromJson(userData).data!;
        });
      }
    }
    else {
      print(response.reasonPhrase);
    }
  }

  getCity(String? sId) async{
    var headers = {
      'Cookie': 'ci_session=95bbd5f6f543e31f65185f824755bcb57842c775'
    };
    var request = http.MultipartRequest('POST', Uri.parse(ApiServicves.getCitys));
    request.fields.addAll({
      'state_id': sId.toString()
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      String responseData = await response.stream.transform(utf8.decoder).join();
      var userData = json.decode(responseData);
      if (mounted) {
        setState(() {
          cityList = CityModel.fromJson(userData).data!;
        });
      }
    }
    else {
      print(response.reasonPhrase);
    }
  }

  Widget accountInformatin() {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: const [
              Icon(
                Icons.circle,
                color: colors.primary,
              ),
              SizedBox(
                width: 5,
              ),
              Text("Account Details",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))
            ],
          ),
          const SizedBox(
            height: 5,
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
                      child: Image.asset("assets/images/bankname.png",scale: 1.5,)
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
                    controller: banknamectr,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        counterText: "",
                        // suffixIcon: suffixIcons,
                        contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        hintText: "Bank Name"
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
                      child: Image.asset("assets/images/accountnumber.png",scale: 1.5,)
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
                    controller: acoountCtr,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        counterText: "",
                        // suffixIcon: suffixIcons,
                        contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        hintText: "Account Number"
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
                      child: Image.asset("assets/images/IFSCcode.png",scale: 1.5,)
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
                    controller: ifscCtr,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        counterText: "",
                        // suffixIcon: suffixIcons,
                        contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        hintText: "IFSC Code"
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          // Container(
          //   width: MediaQuery.of(context).size.width,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Material(
          //         elevation: 4,
          //         borderRadius: BorderRadius.circular(10),
          //         child: Container(
          //             width: 40,
          //             height: 40,
          //             child: Image.asset("assets/images/person.png",scale: 1.5,)
          //         ),
          //       ),
          //       const SizedBox(
          //         width: 10,
          //       ),
          //       Container(
          //         width: 260,
          //         height: 45,
          //         decoration: BoxDecoration(
          //           color: Colors.white,
          //           borderRadius: BorderRadius.circular(5),
          //           boxShadow: const [
          //             BoxShadow(
          //               color: Colors.grey,
          //               offset: Offset(1.0, 1.0,),
          //               blurRadius: 0.2,
          //               spreadRadius: 0.5,
          //             ),
          //           ],
          //         ),
          //         child: TextFormField(
          //           maxLength: 6,
          //           controller: pincodeCtr,
          //           keyboardType: TextInputType.number,
          //           decoration: const InputDecoration(
          //               counterText: "",
          //               // suffixIcon: suffixIcons,
          //               contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          //               border: OutlineInputBorder(borderSide: BorderSide.none),
          //               hintText: "Pincode"
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          const SizedBox(
            height: 10,
          ),
          // Container(
          //   width: MediaQuery.of(context).size.width,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Material(
          //         elevation: 4,
          //         borderRadius: BorderRadius.circular(10),
          //         child: Container(
          //             width: 40,
          //             height: 40,
          //             child: Image.asset("assets/images/person.png",scale: 1.5,)
          //         ),
          //       ),
          //       const SizedBox(
          //         width: 10,
          //       ),
          //       Container(
          //         width: 260,
          //         height: 45,
          //         decoration: BoxDecoration(
          //           color: Colors.white,
          //           borderRadius: BorderRadius.circular(5),
          //           boxShadow: const [
          //             BoxShadow(
          //               color: Colors.grey,
          //               offset: Offset(1.0, 1.0,),
          //               blurRadius: 0.2,
          //               spreadRadius: 0.5,
          //             ),
          //           ],
          //         ),
          //         child: TextFormField(
          //           controller: zipCtr,
          //           keyboardType: TextInputType.number,
          //           decoration: const InputDecoration(
          //               counterText: "",
          //               // suffixIcon: suffixIcons,
          //               contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          //               border: OutlineInputBorder(borderSide: BorderSide.none),
          //               hintText: "Zipcode"
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // const SizedBox(
          //   height: 30,
          // ),
          // InkWell(
          //   onTap: () {
          //     // Navigator.push(context, MaterialPageRoute(builder: (contextn) => KycInformationScreen()));
          //     // if(vehiclectr.text.length == 0 ||
          //     //     contachCtr.text.length == 0
          //     //     || addressCtr.text.length == 0 ||
          //     //     regionCtr.text.length == 0 || zipCtr.text.length == 0
          //     // ) {
          //     //   Fluttertoast.showToast(msg: "Please Fill All Fields");
          //     // } else {
          //     //   Navigator.push(context, MaterialPageRoute(builder: (context) => KycInformationScreen(
          //     //       Name: widget.Name, Email: widget.Email, Passowrd: widget.Passowrd, ConfirmPassword: widget.ConfirmPassword,
          //     //       Date: widget.Date, Vehicle: vehiclectr.text, Contact: contachCtr.text, Address: addressCtr.text,
          //     //       States: stateValue.toString(), City: cityValue.toString(), Region: regionCtr.text, Zip: zipCtr.text,
          //     //       lat: latitude.toString(), long: longitudes.toString(), VehicleType: selectedVehicle.toString(), Pincode: pincodeCtr.text
          //     //   ),
          //     //   ),
          //     //   );
          //     // }
          //   },
          //   child: Center(
          //     child: Container(
          //       width: MediaQuery.of(context).size.width * 0.7,
          //       height: 40,
          //       decoration: BoxDecoration(
          //           color: Colors.green, borderRadius: BorderRadius.circular(5)),
          //       child: const Center(
          //         child: Text(
          //           'Submit',
          //           style: TextStyle(
          //               color: Colors.white,
          //               fontSize: 15,
          //               fontWeight: FontWeight.bold),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget accountInformatin2() {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                      child: Image.asset("assets/images/bankname.png",scale: 1.5,)
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
                    controller: upiCtr,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        counterText: "",
                        // suffixIcon: suffixIcons,
                        contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        hintText: "UPI ID"
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
              onTap: () {
                showAlertDialog(context, "qrcode");
              },
              child: qr()),
          const SizedBox(height: 10),
        ],
      ),
    );
  }


  Widget qr() {
    return Center(
      child: Card(
        elevation: 1,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          //margin: EdgeInsets.symmetric(horizontal: 20),
          height: MediaQuery.of(context).size.height/7.4,
          width: MediaQuery.of(context).size.width * 0.7,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.grey.withOpacity(0.2)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: qrImage != null
                ? Image.file(qrImage!, fit: BoxFit.cover)
                : Column(
              children: const [
                Center(
                    child: Icon(Icons.upload_file_outlined, size: 60)),
                Text("Upload Qr Code")
              ],
            ),
          ),
        ),
      ),
    );
  }


  Future showAlertDialog(BuildContext context, String type) async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select Image'),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {
                pickImage(ImageSource.gallery, type);
                // getImage(ImageSource.camera, context, 1);
              },
              child: Text('Gallery'),
            ),
            const SizedBox(
              width: 15,
            ),
            ElevatedButton(
              onPressed: () {
                pickImage(ImageSource.camera, type);
              },
              child: Text('Camera'),
            ),
          ],
        ),
      ),
    ) ??
        false;
  }

  File? qrImage;

  Future<void> pickImage(ImageSource source, String type) async {
    final pickedFile = await ImagePicker().pickImage(
      source: source,
      maxHeight: 100,
      maxWidth: 100,
      imageQuality: 50,
    );
    if (pickedFile != null) {
      setState(() {
        if (type == 'qrcode') {
          qrImage = File(pickedFile.path);
        }
      });
    }
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

  InputDecoration passwordInputDecoration(
      {String labelText = '', String hintText = '', Color? color}) {
    return InputDecoration(
      suffixIcon: Icon(
        Icons.visibility_off,
        size: 16,
        color: Colors.green,
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
// String? validatePassword(String? value) {
//   if (value == null || value.isEmpty) {
//     return 'Please enter a password.';
//   }
//   if (value.length < 8) {
//     return 'Password must be at least 8 characters.';
//   }
//   if (!value.contains(RegExp(r'[a-z]'))) {
//     return 'Password must contain at least one lowercase letter.';
//   }
//   if (!value.contains(RegExp(r'[A-Z]'))) {
//     return 'Password must contain at least one uppercase letter.';
//   }
//   if (!value.contains(RegExp(r'[0-9]'))) {
//     return 'Password must contain at least one number.';
//   }
//   if (!value.contains(RegExp(r'[!@#\$%^&*()_+{}|:<>?~]'))) {
//     return 'Password must contain at least one special character.';
//   }
//   return null;
// }

// String? validateEmail(String? value) {
//   if (value == null || value.isEmpty) {
//     return 'Please enter a email.';
//   }
//   if (int.tryParse(value) == null) {
//     if (!value.contains('@') || !value.contains('.com')) {
//       return 'Invalid email format.';
//     }
//   }
//   return null; // Validation passed
// }

// String? validateName(String? value) {
//   if (value == null || value.isEmpty) {
//     return 'Please enter Something';
//   }
//   return null;
// }
}

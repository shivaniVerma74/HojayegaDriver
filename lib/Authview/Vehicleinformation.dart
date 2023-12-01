import 'dart:convert';
import 'dart:io';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker_mb/google_maps_place_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hojayegadriverapp/Authview/AccountDetails.dart';
import 'package:hojayegadriverapp/Authview/KycDetails.dart';
import 'package:hojayegadriverapp/Authview/RegistrationFees.dart';
import 'package:hojayegadriverapp/Helper/api.path.dart';
import 'package:http/http.dart' as http;
import '../Helper/color.dart';
import '../Model/CityModel.dart';
import '../Model/StateModel.dart';

class VehicleInformation extends StatefulWidget {
  final Name;
  final Email;
  final Passowrd;
  final ConfirmPassword;
  final Date;
  const VehicleInformation({super.key, this.Date, this.Email, this.ConfirmPassword, this.Name, this.Passowrd});

  @override
  State<VehicleInformation> createState() => _VehicleInformationState();
}

class _VehicleInformationState extends State<VehicleInformation> {

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

  TextEditingController vehiclectr = TextEditingController();
  TextEditingController contachCtr = TextEditingController();
  TextEditingController addressCtr = TextEditingController();
  TextEditingController regionCtr = TextEditingController();
  TextEditingController zipCtr = TextEditingController();
  TextEditingController pincodeCtr = TextEditingController();

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
            height: MediaQuery.of(context).size.height * 0.4,
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
                            SizedBox(
                              width: 5,
                            ),
                            Text(signUpList[index], style: TextStyle(fontSize: 13, color: Colors.white))
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
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: vehicalInformatin()),
                SizedBox(
                  height: 50,
                )
              ],
            ),
          )
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

  Widget vehicalInformatin() {
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
              Text("Vehicle Information",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            padding: const EdgeInsets.only(left: 5),
            child: const Text("Select Vehicle Type",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: 40,
            width: MediaQuery.of(context).size.width,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          selectedVehicle = index;
                        });
                      },
                      child: Icon(
                        selectedVehicle == index
                            ? Icons.radio_button_checked_outlined
                            : Icons.radio_button_off,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Image.asset(imagesList[index], scale: 2,),
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 18,
                );
              },
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
                    controller: vehiclectr,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        counterText: "",
                        // suffixIcon: suffixIcons,
                        contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        hintText: "Vehicle Number"
                    ),
                  ),
                ),
              ],
            ),
          ),
          // textField(
          //     hint: 'Vehicle Number',
          //     icon: Icons.nine_mp_rounded,
          //     textEditingController: vehiclectr),
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
                    controller: contachCtr,
                    maxLength: 10,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        counterText: "",
                        // suffixIcon: suffixIcons,
                        contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        hintText: "Contact Number"
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
                      child: Image.asset("assets/images/location.png",scale: 1.5,)
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
                    onTap: () {
                      getLocation();
                    },
                    controller: addressCtr,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        counterText: "",
                        // suffixIcon: suffixIcons,
                        contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        hintText: "Address"
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
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
                  child: DropdownButton(
                    isExpanded: true,
                    value: stateValue,
                    hint: const Text('State'),
                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),
                    // Array list of items
                    items: stateList.map((items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Container(
                            child: Text(items.name.toString())),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (StataData? value) {
                      setState(() {
                        stateValue = value!;
                        getCity("${stateValue!.id}");
                        stateName = stateValue!.name;
                        print("name herererb $stateName");
                      });
                    },
                    underline: Container(),
                  ),
                ),
              ],
            ),
          ),
          // Container(
          //   width: MediaQuery.of(context).size.width,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Container(
          //         padding: EdgeInsets.all(10),
          //         decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(5),
          //             color: Colors.grey.withOpacity(0.2)),
          //         child: const Icon(
          //           Icons.home,
          //           color: Colors.green,
          //         ),
          //       ),
          //       const SizedBox(
          //         width: 10,
          //       ),
          //       Container(
          //         height: 44,
          //         padding: EdgeInsets.symmetric(horizontal: 10),
          //         color: Colors.grey.withOpacity(0.1),
          //         width: MediaQuery.of(context).size.width * 0.64,
          //         child:
          //         DropdownButton(
          //           isExpanded: true,
          //           value: stateValue,
          //           hint: const Text('State'),
          //           // Down Arrow Icon
          //           icon: const Icon(Icons.keyboard_arrow_down),
          //           // Array list of items
          //           items: stateList.map((items) {
          //             return DropdownMenuItem(
          //               value: items,
          //               child: Container(
          //                   child: Text(items.name.toString())),
          //             );
          //           }).toList(),
          //           // After selecting the desired option,it will
          //           // change button value to selected value
          //           onChanged: (StataData? value) {
          //             setState(() {
          //               stateValue = value!;
          //               getCity("${stateValue!.id}");
          //               stateName = stateValue!.name;
          //               print("name herererb $stateName");
          //             });
          //           },
          //           underline: Container(),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
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
                  child:
                  DropdownButton(
                    isExpanded: true,
                    value: cityValue,
                    hint: Text('City'),
                    // Down Arrow Icon
                    icon: const Icon(Icons.keyboard_arrow_down),
                    // Array list of items
                    items: cityList.map((items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Container(
                            child: Text(items.name.toString())),
                      );
                    }).toList(),
                    // After selecting the desired option,it will
                    // change button value to selected value
                    onChanged: (CityData? value) {
                      setState(() {
                        cityValue = value!;
                        cityName = cityValue!.name;
                        print("name herererb cityytyty $cityName");
                      });
                    },
                    underline: Container(),
                  ),
                ),
              ],
            ),
          ),
          // Container(
          //   width: MediaQuery.of(context).size.width,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Container(
          //         padding: EdgeInsets.all(10),
          //         decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(5),
          //             color: Colors.grey.withOpacity(0.2)),
          //         child: const Icon(
          //           Icons.home,
          //           color: Colors.green,
          //         ),
          //       ),
          //       const SizedBox(
          //         width: 10,
          //       ),
          //       Container(
          //         height: 44,
          //         padding: EdgeInsets.symmetric(horizontal: 10),
          //         color: Colors.grey.withOpacity(0.1),
          //         width: MediaQuery.of(context).size.width * 0.64,
          //         child:
          //         DropdownButton(
          //           isExpanded: true,
          //           value: cityValue,
          //           hint: Text('City'),
          //           // Down Arrow Icon
          //           icon: const Icon(Icons.keyboard_arrow_down),
          //           // Array list of items
          //           items: cityList.map((items) {
          //             return DropdownMenuItem(
          //               value: items,
          //               child: Container(
          //                   child: Text(items.name.toString())),
          //             );
          //           }).toList(),
          //           // After selecting the desired option,it will
          //           // change button value to selected value
          //           onChanged: (CityData? value) {
          //             setState(() {
          //               cityValue = value!;
          //               cityName = cityValue!.name;
          //               print("name herererb cityytyty $cityName");
          //             });
          //           },
          //           underline: Container(),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
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
                    controller: regionCtr,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                        counterText: "",
                        // suffixIcon: suffixIcons,
                        contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        hintText: "Region"
                    ),
                  ),
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
                    maxLength: 6,
                    controller: pincodeCtr,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        counterText: "",
                        // suffixIcon: suffixIcons,
                        contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        hintText: "Pincode"
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
                    controller: zipCtr,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        counterText: "",
                        // suffixIcon: suffixIcons,
                        contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                        border: OutlineInputBorder(borderSide: BorderSide.none),
                        hintText: "Zipcode"
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          InkWell(
            onTap: () {
              // Navigator.push(context, MaterialPageRoute(builder: (contextn) => KycInformationScreen()));
              if(vehiclectr.text.length == 0 ||
              contachCtr.text.length == 0
              || addressCtr.text.length == 0 ||
              regionCtr.text.length == 0 || zipCtr.text.length == 0
               ) {
               Fluttertoast.showToast(msg: "Please Fill All Fields");
              } else {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AccountDetails(
                    Name: widget.Name, Email: widget.Email, Passowrd: widget.Passowrd, ConfirmPassword: widget.ConfirmPassword,
                    Date: widget.Date, Vehicle: vehiclectr.text, Contact: contachCtr.text, Address: addressCtr.text,
                    States: stateValue.toString(), City: cityValue.toString(), Region: regionCtr.text, Zip: zipCtr.text,
                    lat: latitude.toString(), long: longitudes.toString(), VehicleType: selectedVehicle.toString(), Pincode: pincodeCtr.text
                ),
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
                    'Submit',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  String? latitude, longitudes;

  late String myLoction = "";

  getLocation() async {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlacePicker(
          apiKey: Platform.isAndroid
              ? "AIzaSyCKLIBoAca5ptn9A_1UCHNNrtzI81w2KRk"
              : "AIzaSyCKLIBoAca5ptn9A_1UCHNNrtzI81w2KRk",
          onPlacePicked: (result) {
            print(result.formattedAddress);
            setState(() {
              addressCtr.text = result.formattedAddress.toString();
              latitude = result.geometry!.location.lat.toString();
              longitudes = result.geometry!.location.lng.toString();
              myLoction = result.formattedAddress.toString();
            });
            Navigator.of(context).pop();
          },
          initialPosition: LatLng(22.719568, 75.857727),
          useCurrentLocation: true,
        ),
      ),
    );
  }

  Widget textField(
      {required TextEditingController textEditingController,
        // Keyb keyboard,
        required String hint,
        required IconData icon}) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.grey.withOpacity(0.2)),
            child: Icon(
              icon,
              color: Colors.green,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            height: 44,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            width: MediaQuery.of(context).size.width * 0.64,
            child: TextFormField(
              // keyboardType: keyboard,
              controller: textEditingController,
              //  validator: validateMobileOrEmail,
              decoration: commonInputDecoration(hintText: hint),
              //   validator: validateEmail,
              style: const TextStyle(color: Colors.black),
            ),
          ),
          SizedBox(
            height: 20,
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

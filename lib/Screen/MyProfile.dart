import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../Helper/Color.dart';
import '../Helper/api.path.dart';
import '../Model/GetProfileModel.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<MyProfile> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController vehicleNumController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController stateNameController = TextEditingController();
  final TextEditingController cityNameController = TextEditingController();
  final TextEditingController regionNameController = TextEditingController();
  final TextEditingController postalCodeController = TextEditingController();
  final TextEditingController bankNameController = TextEditingController();
  final TextEditingController accountNumController = TextEditingController();
  final TextEditingController ifscCodeController = TextEditingController();
  final TextEditingController upiIdController = TextEditingController();
  File? image;
  bool value = false;
  bool groupValue = false;

  Future getFromCamera() async {
    final pickedFile = await ImagePicker()
        .pickImage(source: ImageSource.camera, imageQuality: 80);
    cropImage(pickedFile!.path);
  }

  Future getFromGallery() async {
    final pickedFile =
    await ImagePicker().pickImage(source: ImageSource.gallery);
    cropImage(pickedFile!.path);
  }

  Future cropImage(filePath) async {
    CroppedFile? croppedImage = await ImageCropper().cropImage(
        sourcePath: filePath,
        compressQuality: 60,
        maxHeight: 1080,
        maxWidth: 1080,
        cropStyle: CropStyle.circle);
    setState(() {
      if (croppedImage != null) {
        image = File(croppedImage.path);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getDriverProfile();
  }

  showImageDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Choose an Option"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      getFromCamera();
                      Navigator.pop(context);
                    },
                    child:  Row(
                      children: [
                        Icon(
                          Icons.camera,
                          color: Colors.red,
                        ),
                        SizedBox(width: 8),
                        Text("Camera")
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      getFromGallery();
                      Navigator.pop(context);
                    },
                    child:  Row(
                      children: const [
                        Icon(
                          Icons.image,
                          color: Colors.red,
                        ),
                        SizedBox(width: 8),
                        Text("Gallery")
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        });
  }

  String? driver_id;
  GetProfileModel? getProfileModel;

  getDriverProfile() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    driver_id = prefs.getString('driver_id');
    var headers = {
      'Cookie': 'ci_session=e1247dd15fd8ad3d83555181acbb2f9348d054bb'
    };
    var request = http.MultipartRequest('POST', Uri.parse(ApiServicves.getProfile));
    request.fields.addAll({
      'driver_id': driver_id.toString()
    });
    print("prarameter profile ${request.fields}");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final finalResult = GetProfileModel.fromJson(json.decode(finalResponse));
      print("responseeee $finalResult");
      setState(() {
        getProfileModel = finalResult;
      });
    }
    else {
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.backgroundcolor,
      appBar: AppBar(
        backgroundColor: const Color(0xFF112c48),
        title: const Text("My Profile", style: TextStyle(color:  Colors.white),),
        centerTitle: true,
        toolbarHeight: 60,
        elevation: 6,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16))),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.white,
              ),
              child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back, color: colors.primary))
          ),
        ),
      ),
      body: Padding(
        padding:
         EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(alignment: Alignment.bottomRight, children: [
                  // CircleAvatar(
                  //   backgroundColor: Colors.white,
                  //   backgroundImage: image == null
                  //       ?  Image.file("${getProfileModel?.data?.first.proPic}")
                  //       : Image.file(image!).image, radius: 56,
                  // ),
                  GestureDetector(
                    onTap: showImageDialog,
                    child: Container(
                        height: 30,
                        width: 30,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                        ),
                        child: const Icon(
                          Icons.edit,
                        ),
                    ),
                  ),
                ]),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 2,
                              offset: Offset(0, 1))
                        ]),
                    child: const Icon(
                      Icons.person,
                      color: Colors.green,
                      size: 32,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2,
                                  offset: Offset(0, 1))
                            ]),
                        child: TextFormField(
                          controller: nameController,
                          decoration:  InputDecoration(
                              hintText: "${getProfileModel?.data?.first.name}",
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              border: InputBorder.none),
                        ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 2,
                              offset: Offset(0, 1))
                        ]),
                    child: const Icon(
                      Icons.email,
                      color: Colors.green,
                      size: 32,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2,
                                  offset: Offset(0, 1))
                            ]),
                        child: TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                              hintText: "${getProfileModel?.data?.first.email}",
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              border: InputBorder.none),
                        )),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 2,
                              offset: Offset(0, 1))
                        ]),
                    child: const Icon(
                      Icons.calendar_month,
                      color: Colors.green,
                      size: 32,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2,
                                  offset: Offset(0, 1))
                            ]),
                        child: TextFormField(
                          controller: dobController,
                          keyboardType: TextInputType.none,
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1990, 01, 01),
                                lastDate: DateTime(2023, 12, 31));
                            if (pickedDate != null) {
                              setState(() {
                                dobController.text =
                                    DateFormat("dd/MM/YYYY").format(pickedDate);
                              });
                            }
                          },
                          decoration: const InputDecoration(
                              hintText: "Date of Birth",
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              border: InputBorder.none),
                        )),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 2,
                              offset: Offset(0, 1))
                        ]),
                    child: const Icon(
                      Icons.phone,
                      color: Colors.green,
                      size: 32,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2,
                                  offset: Offset(0, 1))
                            ]),
                        child: TextFormField(
                          controller: phoneController,
                          decoration:  InputDecoration(
                              hintText: "${getProfileModel?.data?.first.mobile}",
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              border: InputBorder.none),
                        )),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Select Vehicle Type",
                style: TextStyle(
                    color: Color(0xFF112c48),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Radio(value: false, groupValue: true, onChanged: (val) {}),
                  const Icon(
                    Icons.car_crash,
                    color: Color(0xFF112c48),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Radio(value: false, groupValue: true, onChanged: (val) {}),
                  const Icon(
                    Icons.electric_rickshaw,
                    color: Color(0xFF112c48),
                  ),
                  Radio(value: false, groupValue: true, onChanged: (val) {}),
                  const Icon(
                    Icons.electric_bike,
                    color: Color(0xFF112c48),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Radio(value: false, groupValue: true, onChanged: (val) {}),
                  const Icon(
                    Icons.fire_truck,
                    color: Color(0xFF112c48),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 2,
                              offset: Offset(0, 1))
                        ]),
                    child: const Icon(
                      Icons.confirmation_number,
                      color: Colors.green,
                      size: 32,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2,
                                  offset: Offset(0, 1))
                            ]),
                        child: TextFormField(
                          controller: vehicleNumController,
                          decoration:  InputDecoration(
                              hintText: "${getProfileModel?.data?.first.vehicleNumber}",
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              border: InputBorder.none),
                        )),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),

              Row(
                children: [
                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 2,
                              offset: Offset(0, 1))
                        ]),
                    child: const Icon(
                      Icons.pin_drop,
                      color: Colors.green,
                      size: 32,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2,
                                  offset: Offset(0, 1))
                            ]),
                        child: TextFormField(
                          controller: addressController,
                          decoration:  InputDecoration(
                              hintText: "${getProfileModel?.data?.first.address}",
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              border: InputBorder.none),
                        )),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 2,
                              offset: Offset(0, 1))
                        ]),
                    child: const Icon(
                      Icons.location_city,
                      color: Colors.green,
                      size: 32,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2,
                                  offset: Offset(0, 1))
                            ]),
                        child: TextFormField(
                          controller: stateNameController,
                          decoration: InputDecoration(
                              hintText: "${getProfileModel?.data?.first.state}",
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              border: InputBorder.none),
                        )),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 2,
                              offset: Offset(0, 1))
                        ]),
                    child: const Icon(
                      Icons.location_city,
                      color: Colors.green,
                      size: 32,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2,
                                  offset: Offset(0, 1))
                            ]),
                        child: TextFormField(
                          controller: cityNameController,
                          decoration:  InputDecoration(
                              hintText: "${getProfileModel?.data?.first.city}",
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              border: InputBorder.none),
                        )),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 2,
                              offset: Offset(0, 1))
                        ]),
                    child: const Icon(
                      Icons.place,
                      color: Colors.green,
                      size: 32,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2,
                                  offset: Offset(0, 1))
                            ]),
                        child: TextFormField(
                          controller: regionNameController,
                          decoration: InputDecoration(
                              hintText: "${getProfileModel?.data?.first.region}",
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              border: InputBorder.none),
                        )),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 2,
                              offset: Offset(0, 1))
                        ]),
                    child: const Icon(
                      Icons.confirmation_number_outlined,
                      color: Colors.green,
                      size: 32,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2,
                                  offset: Offset(0, 1))
                            ]),
                        child: TextFormField(
                          controller: postalCodeController,
                          decoration:  InputDecoration(
                              hintText: "${getProfileModel?.data?.first.qrCode}",
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              border: InputBorder.none),
                        )),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "  Account Details",
                style: TextStyle(
                    color: Color(0xFF112c48),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 2,
                              offset: Offset(0, 1))
                        ]),
                    child: const Icon(
                      Icons.home,
                      color: Colors.green,
                      size: 32,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2,
                                  offset: Offset(0, 1))
                            ]),
                        child: TextFormField(
                          controller: bankNameController,
                          decoration:  InputDecoration(
                              hintText: "${getProfileModel?.data?.first.bankName}",
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              border: InputBorder.none),
                        )),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 2,
                              offset: Offset(0, 1))
                        ]),
                    child: const Icon(
                      Icons.confirmation_number,
                      color: Colors.green,
                      size: 32,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2,
                                  offset: Offset(0, 1))
                            ]),
                        child: TextFormField(
                          controller: accountNumController,
                          decoration:  InputDecoration(
                              hintText: "${getProfileModel?.data?.first.accountNumber}",
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              border: InputBorder.none),
                        )),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 2,
                              offset: Offset(0, 1))
                        ]),
                    child: const Icon(
                      Icons.confirmation_number,
                      color: Colors.green,
                      size: 32,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2,
                                  offset: Offset(0, 1))
                            ]),
                        child: TextFormField(
                          controller: ifscCodeController,
                          decoration:  InputDecoration(
                              hintText: "${getProfileModel?.data?.first.ifscCode}",
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              border: InputBorder.none),
                        )),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 2,
                              offset: Offset(0, 1))
                        ]),
                    child: const Icon(
                      Icons.home,
                      color: Colors.green,
                      size: 32,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2,
                                  offset: Offset(0, 1))
                            ]),
                        child: TextFormField(
                          controller: upiIdController,
                          decoration:  InputDecoration(
                              hintText: "${getProfileModel?.data?.first.upiId}",
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              border: InputBorder.none),
                        )),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    height: 48,
                    width: 48,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 2,
                              offset: Offset(0, 1))
                        ]),
                    child: const Icon(
                      Icons.qr_code,
                      color: Colors.green,
                      size: 32,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Container(
                        height: 48,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 2,
                                  offset: Offset(0, 1))
                            ]),
                        child: TextFormField(
                          decoration:  InputDecoration(
                              hintText: "${getProfileModel?.data?.first.qrCode}",
                              suffixIcon: Icon(
                                Icons.file_upload_outlined,
                                color: Colors.green,
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 8),
                              border: InputBorder.none),
                        )),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "  Upload Documents",
                style: TextStyle(
                    color: Color(0xFF112c48),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "  Click Selfie",
                style: TextStyle(
                    color: Color(0xFF112c48),
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                  padding: const EdgeInsets.all(8),
                  height: 48,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 2,
                            offset: Offset(0, 1))
                      ]),
                  child:  Row(
                    children: const [
                      Icon(
                        Icons.camera_alt,
                        color: Colors.green,
                        size: 32,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Click Photo")
                    ],
                  )),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "  Upload Driving Licence Image",
                style: TextStyle(
                    color: Color(0xFF112c48),
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                  padding: const EdgeInsets.all(8),
                  height: 48,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 2,
                            offset: Offset(0, 1))
                      ]),
                  child:  Row(
                    children: const [
                      Icon(
                        Icons.camera_alt,
                        color: Colors.green,
                        size: 32,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Click Photo")
                    ],
                  )),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "  Upload Electricity Bill",
                style: TextStyle(
                    color: Color(0xFF112c48),
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                  padding: const EdgeInsets.all(8),
                  height: 48,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 2,
                            offset: Offset(0, 1))
                      ]),
                  child:  Row(
                    children: const [
                      Icon(
                        Icons.camera_alt,
                        color: Colors.green,
                        size: 32,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Click Photo")
                    ],
                  )),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "  Upload Police Verification",
                style: TextStyle(
                    color: Color(0xFF112c48),
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                  padding: const EdgeInsets.all(8),
                  height: 48,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 2,
                            offset: Offset(0, 1))
                      ]),
                  child:  Row(
                    children: const [
                      Icon(
                        Icons.camera_alt,
                        color: Colors.green,
                        size: 32,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Click Photo")
                    ],
                  )),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "  Aadhar Card Front Image",
                style: TextStyle(
                    color: Color(0xFF112c48),
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                  padding: const EdgeInsets.all(8),
                  height: 48,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 2,
                            offset: Offset(0, 1))
                      ]),
                  child:  Row(
                    children: const [
                      Icon(
                        Icons.camera_alt,
                        color: Colors.green,
                        size: 32,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Click Photo")
                    ],
                  )),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Aadhar Card Back Image",
                style: TextStyle(
                    color: Color(0xFF112c48),
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                  padding: const EdgeInsets.all(8),
                  height: 48,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 2,
                            offset: Offset(0, 1))
                      ]),
                  child:  Row(
                    children: const [
                      Icon(
                        Icons.camera_alt,
                        color: Colors.green,
                        size: 32,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Click Photo")
                    ],
                  )),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 240,
                    height: 48,
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 2,
                              offset: Offset(0, 1))
                        ]),
                    child: const Center(
                      child: Text(
                        'Update',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

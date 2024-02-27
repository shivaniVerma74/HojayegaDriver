// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:hojayegadriverapp/Helper/api.path.dart';
// import 'package:http/http.dart' as http;
// import 'package:razorpay_flutter/razorpay_flutter.dart';
// class KycDetails extends StatefulWidget {
//   final Name;
//   final Email;
//   final Passowrd;
//   final ConfirmPassword;
//   final Date;
//   final Vehicle;
//   final Contact;
//   final Address;
//   final States;
//   final City;
//   final Region;
//   final Zip;
//   final lat;
//   final long;
//   final VehicleType;
//   final Pincode;
//
//   KycDetails({Key? key, this.Date, this.ConfirmPassword,
//     this.Passowrd, this.Email, this.Name, this.Address,
//     this.City, this.Contact, this.Region, this.States,
//     this.Vehicle, this.Zip, this.lat, this.long, this.VehicleType, this.Pincode}) : super(key: key);
//
//   @override
//   State<KycDetails> createState() => _KycDetailsState();
// }
//
// class _KycDetailsState extends State<KycDetails> {
//
//
//   registration() async {
//     var headers = {
//       'Cookie': 'ci_session=1da543dfc4fb7f855a96b643984091c7838e79e2'
//     };
//     var request = http.MultipartRequest('POST', Uri.parse(ApiServicves.userRegister));
//     request.fields.addAll({
//       'name': widget.Name,
//       'email': widget.Email,
//       'password': widget.Passowrd,
//       'dob': widget.Date,
//       'vehicle_type': widget.VehicleType,
//       'vehicle_number': widget.Vehicle,
//       'mobile': widget.Contact,
//       'address': widget.Address,
//       'state':widget.States,
//       'city': widget.City,
//       'region': widget.Region,
//       'pincode': widget.Pincode,
//       'accessories': '1',
//       'longitude': widget.lat,
//       'latitude': widget.long,
//          'transaction_id': "",
//          'amount'
//     });
//     request.files.add(await http.MultipartFile.fromPath('pro_pic', '/C:/Users/INDIAN 5/Downloads/HOJAYEGA LOGO.png'));
//     request.files.add(await http.MultipartFile.fromPath('licence', '/C:/Users/INDIAN 5/Downloads/HOJAYEGA LOGO.png'));
//     request.files.add(await http.MultipartFile.fromPath('electricity_bill', '/C:/Users/INDIAN 5/Downloads/HOJAYEGA LOGO.png'));
//     request.files.add(await http.MultipartFile.fromPath('policy_verification', '/C:/Users/INDIAN 5/Downloads/HOJAYEGA LOGO.png'));
//     request.files.add(await http.MultipartFile.fromPath('adhar_car_front', '/C:/Users/INDIAN 5/Downloads/HOJAYEGA LOGO.png'));
//     request.files.add(await http.MultipartFile.fromPath('adhar_car_back', '/C:/Users/INDIAN 5/Downloads/HOJAYEGA LOGO.png'));
//     request.headers.addAll(headers);
//
//     http.StreamedResponse response = await request.send();
//     if (response.statusCode == 200) {
//       print(await response.stream.bytesToString());
//     }
//     else {
//       print(response.reasonPhrase);
//     }
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold();
//   }


import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import '../Helper/color.dart';
import '../Screen/SubmitScreen.dart';
import 'RegistrationFees.dart';

class KycInformationScreen extends StatefulWidget {
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
  final BankName;
  final AccountNumber;
  final Ifsc;
  final UpiId;
  final QrImage;
  final alternatemobile;
  final addressTypeCtr;
  const KycInformationScreen({Key? key, this.Date, this.ConfirmPassword,
    this.Passowrd, this.Email, this.Name, this.Address,
    this.City, this.Contact, this.Region, this.States,
    this.Vehicle, this.Zip, this.lat, this.long, this.VehicleType, this.Pincode, this.AccountNumber, this.BankName, this.Ifsc, this.QrImage, this.UpiId, this.alternatemobile, this.addressTypeCtr});

  @override
  State<KycInformationScreen> createState() => _KycInformationScreenState();
}

class _KycInformationScreenState extends State<KycInformationScreen> {
  List<String> signUpList = [
    "Personal Information",
    "Vehicle Information",
    "Account Details",
    " KYC Verification"
  ];
  bool selected = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:colors.primary,
        elevation: 0,
        leading: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          margin: const EdgeInsets.all(10),
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
                  'Complete Your KYC',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry',
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
                            Text(signUpList[index],
                                style: const TextStyle(
                                    fontSize: 13, color: Colors.white))
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
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  File? image;
  // Future pickImage() async {
  //   try {
  //     final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //     if (image == null) return;
  //     final imageTemp = File(image.path);
  //     setState(() => this.image = imageTemp);
  //   } on PlatformException catch (e) {
  //     print('Failed to pick image: $e');
  //   }
  // }

  // Future getImageFromCamera() async {
  //   var image = await ImagePicker().pickImage(source: ImageSource.camera);
  //   print(image);
  // }

  // Future getImageFromGallery() async {
  //   var image = await ImagePicker().pickImage(source: ImageSource.gallery);
  //   print(image);
  // }

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
            height: 10,
          ),
          const Text("Click Selfie",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 3,
          ),
          InkWell(
              onTap: () {
                pickImage(ImageSource.camera, 'selfieImage');
                // showAlertDialog(context, "selfieImage");
              },
              child: selfie()),
          const SizedBox(
            height: 10,
          ),
          const Text("Upload Driving Liceence Image",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 3,
          ),
          InkWell(
              onTap: () {
                showAlertDialog(context, "drivingImage");
              },
              child: drivingLicence()),
          const SizedBox(
            height: 10,
          ),
          const Text("Upload Electricity Bill",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 3,
          ),
          InkWell(
              onTap: () {
                showAlertDialog(context, "electricityImage");
              },
              child: electrityBill()),
          const SizedBox(
            height: 10,
          ),
          const Text("Upload Police Verification",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 3,
          ),
          InkWell(
              onTap: () {
                showAlertDialog(context, "policeImage");
              },
              child: police()),
          const SizedBox(
            height: 10,
          ),
          const Text("Aadhar Card Front Image",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 3,
          ),
          InkWell(
              onTap: () {
                showAlertDialog(context, "aadharImage");
              },
              child: aadharCard()),
          const SizedBox(
            height: 10,
          ),
          const Text("Aadhar Card Back Image",
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 3,
          ),
          InkWell(
              onTap: () {
                showAlertDialog(context, "aadharBackImage");
              },
              child: aadharCardBack()),
          const SizedBox(
            height: 30,
          ),
          // const Text("Qr Code",
          //     style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          // const SizedBox(
          //   height: 3,
          // ),
          // const Center(
          //   child: Icon(
          //     Icons.qr_code,
          //     size: 70,
          //   ),
          // ),
          // const SizedBox(
          //   height: 40,
          // ),
          InkWell(
            onTap: () {
              // print("kyc detailssss${electricityImage?.path ?? ""} ${policeImage!.path} ${aadharImage!.path} ${aadharBack!.path} ${selfieImage!.path}"
              //     "${widget.States} ${widget.City} ${widget.UpiId} ${widget.Ifsc} ${widget.BankName} ${widget.QrImage} ===========");
             if(selfieImage==null||drivingImage==null||electricityImage==null||policeImage==null||aadharImage==null||aadharBack==null)
            {
              Fluttertoast.showToast(msg: "Upload All Images");
            }
             else
               Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationFees(
                 Name: widget.Name, Email: widget.Email, Passowrd: widget.Passowrd, ConfirmPassword: widget.ConfirmPassword,
                 Date: widget.Date, Vehicle: widget.Vehicle, Contact: widget.Contact, Address: widget.Address,
                 States: widget.States, City: widget.City, Region: widget.Region, Zip: widget.Zip,
                 lat: widget.lat, long: widget.long, VehicleType: widget.VehicleType, Pincode: widget.Pincode,
                 Selfie: selfieImage!.path, Driving: drivingImage!.path,
                 Electricity: electricityImage!.path, Police: policeImage!.path,
                 AadharFront: aadharImage!.path,
                 AadharBack: aadharBack!.path,
                 BankName: widget.BankName,
                 AccountNumber: widget.AccountNumber,
                 Ifsc:widget.Ifsc, UpiId: widget.UpiId,
                 QrImage: widget.QrImage.toString(),
                 addressTypeCtr: widget.addressTypeCtr,
               ),

              ),
              );
            },
            child: Center(
              child: Container(
                width: 200,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.green, borderRadius: BorderRadius.circular(5)),
                child: const Center(
                  child: Text(
                    'Submit',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget selfie() {
    return Card(
      elevation: 1,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        //margin: EdgeInsets.symmetric(horizontal: 20),
        height: MediaQuery.of(context).size.height/7,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: Colors.grey.withOpacity(0.2),
          border: Border.all(color: colors.primary)
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: selfieImage != null
              ? Image.file(selfieImage!, fit: BoxFit.cover)
              : Column(
            children: const [
              Center(
                  child: Icon(Icons.upload_file_outlined, size: 60),
              ),
              Text("Click Selfie")
            ],
          ),
        ),
      ),
    );
  }

  Widget drivingLicence() {
    return Card(
      elevation: 1,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        //margin: EdgeInsets.symmetric(horizontal: 20),
        height: MediaQuery.of(context).size.height/6,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey.withOpacity(0.2),
            border: Border.all(color: colors.primary)
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: drivingImage != null
              ? Image.file(drivingImage!, fit: BoxFit.cover)
              : Column(
            children: const [
              Center(
                  child: Icon(Icons.upload_file_outlined, size: 60)),
              Text("Driving Licence")
            ],
          ),
        ),
      ),
    );
  }

  Widget electrityBill() {
    return Card(
      elevation: 1,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        //margin: EdgeInsets.symmetric(horizontal: 20),
        height: MediaQuery.of(context).size.height/6,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey.withOpacity(0.2),
            border: Border.all(color: colors.primary)
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: electricityImage != null
              ? Image.file(electricityImage!, fit: BoxFit.cover)
              : Column(
            children: const [
              Center(
                  child: Icon(Icons.upload_file_outlined, size: 60)),
              Text("Electricity Bill")
            ],
          ),
        ),
      ),
    );
  }

  Widget police() {
    return Card(
      elevation: 1,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        //margin: EdgeInsets.symmetric(horizontal: 20),
        height: MediaQuery.of(context).size.height/6,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey.withOpacity(0.2),
            border: Border.all(color: colors.primary)
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: policeImage != null
              ? Image.file(policeImage!, fit: BoxFit.cover)
              : Column(
            children: const [
              Center(
                  child: Icon(Icons.upload_file_outlined, size: 60),
              ),
              Text("Police Verification")
            ],
          ),
        ),
      ),
    );
  }

  Widget aadharCard() {
    return Card(
      elevation: 1,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        //margin: EdgeInsets.symmetric(horizontal: 20),
        height: MediaQuery.of(context).size.height/6,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey.withOpacity(0.2),
            border: Border.all(color: colors.primary)
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: aadharImage != null
              ? Image.file(aadharImage!, fit: BoxFit.cover)
              : Column(
            children: [
              Center(
                  child: Icon(Icons.upload_file_outlined, size: 60)),
              Text("Aadhar Card Front")
            ],
          ),
        ),
      ),
    );
  }

  Widget aadharCardBack() {
    return Card(
      elevation: 1,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        //margin: EdgeInsets.symmetric(horizontal: 20),
        height: MediaQuery.of(context).size.height/6,
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.grey.withOpacity(0.2),
            border: Border.all(color: colors.primary)
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: aadharBack != null
              ? Image.file(aadharBack!, fit: BoxFit.cover)
              : Column(
              children: const [
              Center(
                  child: Icon(Icons.upload_file_outlined, size: 60)),
              Text("Aadhar Card Back")
            ],
          ),
        ),
      ),
    );
  }

  Future showAlertDialog(BuildContext context, String type) async {
    return await showDialog(
      context: context,
      builder: (context) => AlertDialog(
          title: Text('Select Image'),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  pickImage(ImageSource.gallery, type);
                  Navigator.pop(context);
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
                  Navigator.pop(context);
                },
                child: Text('Camera'),
              ),
            ],
          ),
      ),
    ) ??
        false;
  }

  File? aadharImage;
  File? aadharBack;
  File? electricityImage;
  File? policeImage;
  File? selfieImage;
  File? drivingImage;


  Future<void> pickImage(ImageSource source, String type) async {
    final pickedFile = await ImagePicker().pickImage(
      source: source,
      maxHeight: 100,
      maxWidth: 100,
      imageQuality: 50,
    );
    if (pickedFile != null) {
      setState(() {
        if (type == 'selfieImage') {
          selfieImage = File(pickedFile.path);
        }
        else if (type == 'drivingImage') {
          drivingImage = File(pickedFile.path);
        }
        else if (type == 'electricityImage') {
          electricityImage = File(pickedFile.path);
        }
        else if (type == 'aadharBackImage') {
          aadharBack = File(pickedFile.path);
        }
        else if (type == 'aadharImage') {
          aadharImage = File(pickedFile.path);
        }
        else if (type == 'policeImage') {
          policeImage = File(pickedFile.path);
        }
      });
    }
  }

  var imageFile;
  void requestPermission(BuildContext context, int i) async {
    print("okay");
    Map statuses = await [
      Permission.photos,
      Permission.mediaLibrary,
      Permission.storage,
    ].request();
    if (statuses[Permission.photos] == PermissionStatus.granted &&
        statuses[Permission.mediaLibrary] == PermissionStatus.granted) {
      getImage(ImageSource.gallery, context, 1);
    } else {
      getImageCmera(ImageSource.camera, context, 1);
    }
  }

  Future getImage(ImageSource source, BuildContext context, int i) async {
    var image = await ImagePicker().pickImage(
      source: source,
    );

    Navigator.pop(context);
  }

  Future getImageCmera(ImageSource source, BuildContext context, int i) async {
    var image = await ImagePicker().pickImage(
      source: source,
    );
    Navigator.pop(context);
  }
  var imagePathList1;
  bool isImages = false;
}


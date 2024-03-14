import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hojayegadriverapp/Authview/loginscreen.dart';
import 'package:hojayegadriverapp/Helper/api.path.dart';
import 'package:hojayegadriverapp/Screen/HomeScreen.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:http/http.dart' as http;
import '../Helper/color.dart';
import '../Screen/SubmitScreen.dart';
class RegistrationFees extends StatefulWidget {
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
  final Selfie;
  final Driving;
  final Electricity;
  final Police;
  final AadharFront;
  final AadharBack;
  final BankName;
  final AccountNumber;
  final Ifsc;
  final UpiId;
  final QrImage;
  final addressTypeCtr;
  const RegistrationFees({Key? key, this.Date, this.ConfirmPassword,
    this.Passowrd, this.Email, this.Name, this.Address,
    this.City, this.Contact, this.Region, this.States,
    this.Vehicle, this.Zip, this.lat, this.long, this.VehicleType, this.Pincode, this.AadharBack,
    this.AadharFront, this.Driving, this.Electricity, this.Police, this.Selfie,
    this.QrImage, this.UpiId, this.Ifsc, this.AccountNumber, this.BankName, this.addressTypeCtr
  });

  @override
  State<RegistrationFees> createState() => _RegistrationFeesState();
}

class _RegistrationFeesState extends State<RegistrationFees> {

  @override
  void initState() {
    super.initState();
    print("hggggggggggg ${widget.Date} ${widget.Name} ${widget.AadharBack}");
    registrationFees();
    _razorpay = Razorpay();
    _razorpay?.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay?.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay?.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

String? registrationFee;
String? bagAmt;
String? jacketAmt;
String? mobileHolder;
bool loading=false;
bool isBag=false;
bool isJacket=false;
bool isMobileHolder=false;
  Future<void> registrationFees() async {
    var headers = {
      'Cookie': 'ci_session=0c7dbb3d5d78cf96fc13dbad8d93fb40c4294275'
    };
    var request = http.MultipartRequest('POST', Uri.parse(ApiServicves.getSettings));
    request.fields.addAll({});
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final jsonresponse = json.decode(finalResponse);
      if (jsonresponse['status'] == 1) {
          registrationFee =  jsonresponse['setting']['registration_fee'];
          bagAmt =  jsonresponse['setting']['bag_amount'];
          jacketAmt =  jsonresponse['setting']['jacket'];
          mobileHolder =  jsonresponse['setting']['mobile_holder'];
          isselected=int.parse(registrationFee ?? "0") ;
           addAmount.add(int.parse(bagAmt ?? '0'));
           addAmount.add(int.parse(jacketAmt ?? '0'));
           addAmount.add(int.parse(mobileHolder ?? '0'));
          print("registration feess $registrationFee");
          print("registration feess $bagAmt");
          print("registration feess $jacketAmt");
          print("registration feess $mobileHolder");
          loading=true;
          setState(() {

          });
      } else {
        Fluttertoast.showToast(msg: "${jsonresponse['message']}");
      }
    }
    else {
      print(response.reasonPhrase);
    }
  }

  registration() async {
    log("workinggggggg noowwwwww");
    var headers = {
      'Cookie': 'ci_session=1da543dfc4fb7f855a96b643984091c7838e79e2'
    };
    var request = http.MultipartRequest('POST', Uri.parse(ApiServicves.driverRegister));
    request.fields.addAll({
      'name': widget.Name.toString(),
      'email': widget.Email.toString(),
      'password': widget.Passowrd.toString(),
      'dob': widget.Date.toString(),
      'vehicle_type': widget.VehicleType.toString(),
      'vehicle_number': widget.Vehicle.toString(),
       'altername_number': widget.Contact.toString(),
      'mobile': widget.Contact.toString(),
      'address': widget.Address.toString(),
      'state':widget.States.toString(),
      'city': widget.City.toString(),
      'region': widget.Region.toString(),
      'pincode': widget.Pincode.toString(),
      'accessories': selected.toString(),
      'longitude': widget.lat.toString(),
      'latitude': widget.long.toString(),
      'transaction_id': "TXN1235455555",
      'amount': isselected.toString(),
      'bank_name': widget.BankName.toString(),
      'account_number': widget.AccountNumber.toString(),
      'ifsc_code': widget.Ifsc.toString(),
      'upi_id': widget.UpiId.toString(),
      'type_address':widget.addressTypeCtr

    });

    if (widget.AadharFront != null) {
      request.files.add(
          await http.MultipartFile.fromPath('adhar_car_front', widget.AadharFront!.toString()));
    }
    if (widget.AadharBack != null) {
      request.files.add(
          await http.MultipartFile.fromPath('adhar_car_back', widget.AadharBack!.toString()));
    }
    if (widget.Selfie != null) {
      request.files.add(
          await http.MultipartFile.fromPath('pro_pic', widget.Selfie!.toString()));
    }
    if (widget.Driving != null) {
      request.files.add(
          await http.MultipartFile.fromPath('licence', widget.Driving!.toString()));
    }if (widget.Electricity != null) {
      request.files.add(
          await http.MultipartFile.fromPath('electricity_bill', widget.Electricity!.toString()));
    }if (widget.Police != null) {
      request.files.add(
          await http.MultipartFile.fromPath('policy_verification', widget.Police!.toString()));
    } if (widget.QrImage != null) {
      request.files.add(
          await http.MultipartFile.fromPath('qr_code', widget.QrImage!.toString()));
    }

    log("registration parameter ${request.fields}");
    log("registration filessssss ${request.files}");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      log("kljkjkjjjjjljlk");
      log(await response.stream.bytesToString());
      // Submit
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Submit()));
    }
    else {
      log("register not success");
      log(response.reasonPhrase.toString());
    }
  }

  Future<void> _handlePaymentSuccess(PaymentSuccessResponse response) async {
    log("kkkkkkkkkkkk");
    // Fluttertoast.showToast(msg: "Payment successfully1111");
    // print("aaaaaaaaaaa");
    registration();

   // Navigator.push(context, MaterialPageRoute(builder: (context)=>));
    // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(msg: "Payment cancelled by user");}

  void _handleExternalWallet(ExternalWalletResponse response) {

  }


  Razorpay? _razorpay;
  int? pricerazorpayy;
  void openCheckout(amount) async {
    double res = double.parse(amount.toString());
    pricerazorpayy= int.parse(res.toStringAsFixed(0)) * 100;
    // Navigator.of(context).pop();
    var options = {
      'key': 'rzp_test_1DP5mmOlF5G5ag',
      'amount': "$pricerazorpayy",
      'name': 'Hojayega',
      'image':'assets/images/icon.png',
      'description': 'Hojayega',
    };
    try {
      _razorpay?.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  List<String> list = ['Bag', 'Jacket', 'Mobile Holder'];

  int selected = 0;
  List<int> selectedIndices = [];
  List<int> addAmount = [];



  int isselected=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.backgroundcolor,
      appBar: AppBar(
        backgroundColor: colors.backgroundcolor,
        elevation: 0,
        leading: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10),
          ),
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: Text(
                'Registration Fees',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),  Center(
              child: Text(
                registrationFee ?? "0",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30),
              child: const Text(
                'Would you like to buy?',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:10 ,right: 10),
              child: loading==true? Container(
                height: 40,
                width: MediaQuery.of(context).size.width,
                child:
                ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount:addAmount.length ,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              selected = index;
                              if (selectedIndices.contains(index)) {
                                isselected-=addAmount[index];
                                selectedIndices.remove(index);
                                if(index==0)
                                  isBag=false;
                                if(index==1)
                                  isJacket=false;
                                if(index==2)
                                  isMobileHolder=false;
        
        
                              } else {
                                isselected+=addAmount[index];
                                selectedIndices.add(index);
                                if(index==0)
                                  isBag=true;
                                if(index==1)
                                  isJacket=true;
                                if(index==2)
                                  isMobileHolder=true;
                              }
                            });
                            // if(index == 0){
                            //   setState(() {
                            //     isselected = bagAmt.toString();
                            //     print("bag amount in tapp $bagAmt");
                            //   });
                            // }
                            // else if(index == 1){
                            //   setState(() {
                            //     isselected = jacketAmt.toString();
                            //     print("jacket amount in tapp $jacketAmt");
                            //   });
                            // }
                            // else{
                            //   setState(() {
                            //     isselected = mobileHolder.toString();
                            //     print("mobileee amount in tapp $mobileHolder");
                            //   });
                            // }
                          },
                    child: Icon(
                    selectedIndices.contains(index)
                    ? Icons.check_box_outlined
                        : Icons.check_box_outline_blank,
                    color: Colors.black,
                    size: 25
                    ),
                    ),
                    Text(
                   ' ${list[index]} (Rs.${addAmount[index] ?? ""})',
                    style: TextStyle(fontSize: 18, color: Colors.black),)
        
                    ],
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      width: 18,
                    );
                  },
                )  ,
              ) : Container(
                width: 50,
                height: 50,
                child: CircularProgressIndicator()),
            ),
        
            Container(
                height: MediaQuery.of(context).size.height/3,
                child: const Image(
                  image: AssetImage("assets/images/jacket.png",
                  ),
                  fit: BoxFit.fitHeight,
                ),
            ),
            // Container(
            //   margin: const EdgeInsets.symmetric(horizontal: 40),
            //   child: const Text(
            //     'Would you like to buy?',
            //     textAlign: TextAlign.center,
            //     style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            //   ),
            // ),
        
             Container(
              // height: 40,
               width: 180,
               decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: colors.white),
               child: Center(
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                     children: [
                       Text("Registration Fees = ${registrationFee}"),
                       if(isBag==true)
                       Text("Bag Price = ${addAmount[0]}"),
                       if(isJacket==true)
                       Text("Jacket Price = ${addAmount[1]}"),
                       if(isMobileHolder==true)
                       Text("Mobile Holder Price = ${addAmount[2]}"),
                       Divider(
                       // height: 2,
                         thickness: 2,
                         color: Colors.black,
                       ),
        
                       Text(
                        'Total = ${isselected} Rs.',
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: colors.primary),
                                       ),
                     ],
                   ),
                 ),
              ),
             ),
            SizedBox(height: 20,),
        
            InkWell(
              onTap: () {
                print("jaaakkjaaaaa");
                openCheckout(isselected.toString());
                // Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.6,
                height: 40,
                decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(5)),
                child: const Center(
                  child: Text(
                    'Paynow',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

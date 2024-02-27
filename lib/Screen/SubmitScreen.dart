import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hojayegadriverapp/Authview/loginscreen.dart';

import '../Authview/RegistrationFees.dart';
import '../Helper/color.dart';

class Submit extends StatefulWidget {
/*  final Name;
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
  final QrImage;*/
   Submit({Key? key, /*this.Date, this.ConfirmPassword,
    this.Passowrd, this.Email, this.Name, this.Address,
    this.City, this.Contact, this.Region, this.States,
    this.Vehicle, this.Zip, this.lat, this.long, this.VehicleType, this.Pincode, this.AadharBack,
     this.AadharFront, this.Driving, this.Electricity, this.Police, this.Selfie,
     this.QrImage, this.UpiId, this.Ifsc, this.AccountNumber, this.BankName*/
   }) : super(key: key);

  @override
  State<Submit> createState() => _SubmitState();
}

class _SubmitState extends State<Submit> {
  @override
  Widget build(BuildContext context) {
    // log("kkkkkkkkkkk" as num);
    // log("kljkjkjjjjjljlk");


    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: colors.backgroundcolor,
        appBar: AppBar(
          backgroundColor: colors.backgroundcolor,
          elevation: 0,
          // leading: Container(
          //   decoration: BoxDecoration(
          //       color: Colors.white, borderRadius: BorderRadius.circular(10)),
          //   margin: const EdgeInsets.all(10),
          //   child: InkWell(
          //     onTap: () {
          //       Navigator.pop(context);
          //     },
          //     child: const Icon(
          //       Icons.arrow_back,
          //       color: Colors.blue,
          //     ),
          //   ),
          // ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // SizedBox(
                  //   height: MediaQuery.of(context).size.height * 0.1,
                  // ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.20,
                    width: MediaQuery.of(context).size.width,
                    child: const Image(image: AssetImage('assets/images/submit.png')),
                  ),
                  const SizedBox(
                    height: 19,
                  ),
                  const Text(
                    "Document Submit Successfully",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: colors.primary),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    "We Will Get Back To You For KYC Verification",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF100F0F),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                     // print("submitttttttttttttt ${widget.BankName}  ${widget.Ifsc}  ${widget.UpiId}  ${widget.City} ");
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => RegistrationFees(
                      //   Name: widget.Name, Email: widget.Email, Passowrd: widget.Passowrd, ConfirmPassword: widget.ConfirmPassword,
                      //   Date: widget.Date, Vehicle: widget.Vehicle, Contact: widget.Contact, Address: widget.Address,
                      //   States: widget.States, City: widget.City, Region: widget.Region, Zip: widget.Zip,
                      //   lat: widget.lat, long: widget.long, VehicleType: widget.VehicleType, Pincode: widget.Pincode,
                      //   Selfie: widget.Selfie, Driving: widget.Driving,
                      //   Electricity: widget.Electricity, Police: widget.Police,
                      //   AadharFront: widget.AadharFront,
                      //   AadharBack: widget.AadharBack,
                      //     BankName: widget.BankName,
                      //     AccountNumber: widget.AccountNumber,
                      //     Ifsc: widget.Ifsc,
                      //     UpiId: widget.UpiId,
                      //     QrImage: widget.QrImage.toString()
                      //      ),
                      //    ),
                      // );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width/1.3,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(5)),
                      child: const Center(
                        child: Text(
                          'Next',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
            ),
          ),
        ),
      ),
    );
  }
}
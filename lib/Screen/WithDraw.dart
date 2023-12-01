import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hojayegadriverapp/Helper/api.path.dart';
import 'package:http/http.dart' as http;
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Helper/Color.dart';
import '../Helper/session.dart';
import '../Model/GetProfileModel.dart';
import '../Model/TransactionModel.dart';

class WithDraw extends StatefulWidget {
  const WithDraw({Key? key}) : super(key: key);

  @override
  State<WithDraw> createState() => _WithDrawState();
}

class _WithDrawState extends State<WithDraw> {

  @override
  void initState() {
    super.initState();
    getDriverProfile();
    walletTransactions();
  }


  String? driver_id;
  String? wallet_balance;

  withdrawRequest() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    driver_id = prefs.getString('driver_id');
    var headers = {
      'Cookie': 'ci_session=61ff668e7ab13112e878d9d58762c1521c6082c8'
    };
    var request = http.MultipartRequest('POST', Uri.parse(ApiServicves.withdrawRequest));
    request.fields.addAll({
      'user_id': driver_id.toString(),
      'amount': amtC!.text,
      'ac_no': acountNumberC!.text,
      'ifsc_code': ifscC!.text,
      'ac_holder_name': holderC!.text,
      'bank_name': msgC!.text,
      'account_type': 'RazorPay'
    });
    print("withdwa reuest parameyer ${request.fields}");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final jsonresponse = json.decode(finalResponse);
      if(jsonresponse["response_code"] == "1"){
        Fluttertoast.showToast(msg: "Request send successfully");
        setState(() {});
      } else{
        Fluttertoast.showToast(msg: jsonresponse["message"]);
      }
    }
    else {
      print(response.reasonPhrase);
    }
  }

  GetProfileModel? getProfileModel;
  getDriverProfile() async {
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
      final jsonresponse = json.decode(finalResponse);
      if(jsonresponse["error"] == false){
        wallet_balance = jsonresponse['data'][0]['wallet'];
        print("wallletet balance is $wallet_balance");
        Fluttertoast.showToast(msg: "Request send successfully");
        setState(() {});
      } else{
        Fluttertoast.showToast(msg: jsonresponse["message"]);
      }
    }
    else {
      print(response.reasonPhrase);
    }
  }


  TransactionModel? transactionModel;
  walletTransactions() async {
    var headers = {
      'Cookie': 'ci_session=e3825b4be6db7ecb421f2db35bd0a2ab2c91e923'
    };
    var request = http.MultipartRequest('POST', Uri.parse(ApiServicves.withdrawList));
    request.fields.addAll({
      'user_id': '31'
    });
    print("newewewe ${request.fields}");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final jsonResponse = TransactionModel.fromJson(json.decode(finalResponse));
      setState(() {
        transactionModel = jsonResponse;
      });
    }
    else {
      print(response.reasonPhrase);
    }
  }



  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController? amtC, msgC, nameC, holderC, acountNumberC, ifscC;
  StateSetter? dialogState;

  _showDialog() async {
    await dialogAnimate(context,
        StatefulBuilder(builder: (BuildContext context, StateSetter setStater) {
          dialogState = setStater;
          return AlertDialog(
            contentPadding: const EdgeInsets.all(0.0),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Padding(
                  //   padding: EdgeInsets.fromLTRB(20.0, 20.0, 0, 2.0),
                  //   child: Text(
                  //     "WithDraw Request",
                  //     style: Theme.of(this.context).textTheme.subtitle1!.copyWith(color: colors.black),
                  //   ),
                  // ),
                  Form(
                    key: _formkey,
                    child: Flexible(
                      child: SingleChildScrollView(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                                  child: TextFormField(
                                    autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                    style: const TextStyle(
                                      color: colors.black,
                                    ),
                                    decoration:  InputDecoration(
                                      hintText: "Bank Name",
                                      hintStyle: Theme.of(this.context).textTheme.subtitle1!.copyWith(
                                          color: colors.black,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    controller: msgC,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                                  child: TextFormField(
                                    autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                    style: const TextStyle(
                                      color: colors.black,
                                    ),
                                    decoration:  InputDecoration(
                                      hintText: "Account Holder Name",
                                      hintStyle: Theme.of(this.context).textTheme.subtitle1!.copyWith(
                                          color: colors.black,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    controller: holderC,
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      validator: (val) => validateField(val!, "Field Required"),
                                      autovalidateMode: AutovalidateMode.onUserInteraction,
                                      style: const TextStyle(
                                        color: colors.black,
                                      ),
                                      decoration: InputDecoration(
                                        hintText: "Amount",
                                        hintStyle: Theme.of(this.context).textTheme.subtitle1!.copyWith(
                                            color: colors.black,
                                            fontWeight: FontWeight.normal),
                                      ),
                                      controller: amtC,
                                    ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                                  child: TextFormField(
                                    autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                    style: const TextStyle(
                                      color: colors.black,
                                    ),
                                    decoration:  InputDecoration(
                                      hintText: "Account Number",
                                      hintStyle: Theme.of(this.context).textTheme.subtitle1!.copyWith(
                                          color: colors.black,
                                          fontWeight: FontWeight.normal),
                                    ),
                                    controller: acountNumberC,
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
                                    child: TextFormField(
                                      autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                      style: const TextStyle(
                                        color: colors.black,
                                      ),
                                      decoration:  InputDecoration(
                                        hintText: "IFSC Code",
                                        hintStyle: Theme.of(this.context).textTheme.subtitle1!.copyWith(
                                            color: colors.black,
                                            fontWeight: FontWeight.normal),
                                      ),
                                      controller: ifscC,
                                    ),
                                ),
                                //Divider(),
                                Divider(),
                              ],
                          ),
                      ),
                    ),
                  )
                ]),
              actions: <Widget>[
               Container(
                 height: 30,
                 width: 70,
                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: colors.primary),
                 child: TextButton(
                    child: Text(
                     "Cancel",
                      style: Theme.of(this.context).textTheme.subtitle2!.copyWith(
                          color: colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
               ),
               Container(
                 height: 30,
                 width: 70,
                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: colors.primary),
                 child: TextButton(
                    child: Text(
                      "Send",
                      style: Theme.of(this.context).textTheme.subtitle2!.copyWith(
                          color: colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    onPressed: () {
                      final form = _formkey.currentState!;
                      if (form.validate() && amtC!.text != '0') {
                        withdrawRequest();
                        Navigator.pop(context);
                      }
                    }),
               )
            ],
          );
        }));
  }

  listItem(int index) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
            color: colors.white,
            border: Border.all(color: colors.primary, width: 2),
            borderRadius: BorderRadius.circular(15)
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.only(right: 10, top: 5, bottom: 5),
              decoration: const BoxDecoration(
                  color: colors.primary,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(13), topRight: Radius.circular(13))
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('${transactionModel?.data?[index].createdAt}',  style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14,),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Image.asset('assets/images/transactions.png', height: 50, width: 50,),
                  // SizedBox(width: 15,),
                  SizedBox(
                    width: 250,
                    child: Text(
                      "${transactionModel?.data?[index].updatedAt}",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: colors.black, fontWeight: FontWeight.normal, fontSize: 14),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "₹ ${transactionModel?.data?[index].amount}",
                    style: const TextStyle(color: colors.black, fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                ],
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.end,
            //   children: [
            //     Container(
            //       margin: EdgeInsets.only(right: 8, bottom: 8),
            //       padding: EdgeInsets.only(top: 4, bottom: 4, left: 8, right: 8),
            //       decoration: BoxDecoration(
            //         color: colors.black,
            //         borderRadius:  BorderRadius.all(
            //           const Radius.circular(4.0),
            //         ),
            //       ),
            //       child: walletTransactions[index].status == "1"
            //           ? Text("Completed",
            //         style: TextStyle(color: colors.white),
            //        )
            //           : Text(
            //         "Pending",
            //         style: TextStyle(color: colors.white),
            //       ),
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: colors.backgroundcolor,
      appBar: AppBar(
        backgroundColor: const Color(0xFF112c48),
        title: const Text("WithDraw", style: TextStyle(color:  Colors.white),),
        centerTitle: true,
        toolbarHeight: 60,
        elevation: 6,
        shape: const RoundedRectangleBorder(
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
      body: Column(
        children: [
           Container(
             height: 140,
             width: MediaQuery.of(context).size.width,
             decoration: BoxDecoration(borderRadius: BorderRadius.circular(1), color: colors.white),
             child: Column(
               children: [
                 const SizedBox(height: 10),
                 const Text("Current Balance", style: TextStyle(fontWeight: FontWeight.bold, color: colors.primary, fontSize: 19)),
                 const SizedBox(height: 5,),
                 wallet_balance == null || wallet_balance == "" ?
                 const Text("₹ 0.0", style: TextStyle(fontWeight: FontWeight.bold, color: colors.primary, fontSize: 17)):
                 Text("₹ $wallet_balance", style: TextStyle(fontWeight: FontWeight.bold, color: colors.primary, fontSize: 17)),
                 const SizedBox(height: 20),
                 InkWell(
                   onTap: () {
                     _showDialog();
                   },
                   child: Container(
                     height: 40,
                     width: 100,
                     decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: colors.primary),
                     child: Center(child: Text("WithDraw", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: colors.white),)),
                   ),
                 ),
               ],
             ),
           ),
          SizedBox(height: 10,),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text("Withdraw List", style: TextStyle(fontSize: 15, color: colors.black, fontWeight: FontWeight.w600),),
          ),
          SizedBox(height: 20,),
          transactionModel?.responseCode == "0"
              ? const Center(
            child: Text(
              "No Transaction", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
            ),
          ):
          ListView.builder(
            shrinkWrap: true,
            itemCount:  transactionModel?.data?.length ?? 0,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return listItem(index);
            },
          ),
        ],
      ),
    );
  }
}

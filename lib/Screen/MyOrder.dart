import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:hojayegadriverapp/Helper/api.path.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Helper/color.dart';
import '../Model/CurrentorderModel.dart';
import '../Model/GetOrdersModel.dart';
import 'Droup.dart';
import 'Pickup.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({super.key});

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  @override
  void initState() {
    super.initState();
    myOrder();
  }

  CurrentorderModel? currentData;
  myOrder() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? driverId = preferences.getString('driver_id');
    var headers = {
      'Cookie': 'ci_session=b79a69564b7d3c711ea432ec763e643c7c6edf90'
    };
    var request =
        http.MultipartRequest('POST', Uri.parse(ApiServicves.getMyOrder));
    request.fields.addAll({'driver_id': driverId.toString(), 'status': '1'});
    print("my order pararmeter ${request.fields}");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final finalResult =
          CurrentorderModel.fromJson(json.decode(finalResponse));
      print("responseeee $finalResponse");
      setState(() {
        currentData = finalResult;
      });
    } else {
      print(response.reasonPhrase);
    }
  }

  _callNumber(String? mobileNumber) async {
    var number = "${mobileNumber}";
    print("numberrrrr ${number}");
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
    print("mobileee ${res}");
  }

  List<String> statusOptions = [
    "driver_cancel",
    "pikcup",
    "delivered",
  ];

  // Variable to store the selected index
  String? dropdownValue;

  showStatus(String? id) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            content: SizedBox(
              height: 200,
              width: 300,
              child: Column(
                children: [
                  Container(
                    height: 150,
                    width: 250,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color(0xFF112c48), width: 2),
                        borderRadius: BorderRadius.circular(16)),
                    child: Column(
                      children: [
                        const SizedBox(height: 20,),
                        // const Text(
                        //   "Status",
                        //   style: TextStyle(
                        //       color: Color(0xFF112c48),
                        //       fontSize: 18,
                        //       fontWeight: FontWeight.bold),
                        // ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Update Status", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),),
                            DropdownButton<String>(
                              hint: const Text("Select Status", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15)),
                              value: dropdownValue,
                              // icon: Padding(
                              //   padding: const EdgeInsets.only(right: 20),
                              //   child: const Icon(Icons.arrow_downward),
                              // ),
                              elevation: 16,
                              style: const TextStyle(color: Colors.black),
                              underline: Container(
                                height: 1,
                                width: 50,
                                color: Colors.deepPurpleAccent,
                              ),
                              onChanged: (String? value) {
                                // This is called when the user selects an item.
                                setState(() {
                                  dropdownValue = value!;
                                  print("Statusuyys $dropdownValue");
                                });
                                // if(value == "Accept"){
                                //   myOrderController.mackDecisionApi(
                                //       orderID: oID, status: "1", reson: "n/a");
                                // }
                                // else if(value == "Unable to Delivered"){
                                //   myOrderController.mackDecisionApi(
                                //       orderID: oID, status: "8", reson: "n/a");
                                // }
                                // else if(value == "Door Locked"){
                                //   myOrderController.mackDecisionApi(
                                //       orderID: oID, status: "9", reson: "n/a");
                                // }
                                // else if(value == "Attempt Again") {
                                //   myOrderController.mackDecisionApi(
                                //       orderID: oID, status: "10", reson: "n/a");
                                // }
                                // else{
                                // }
                              },
                              items: statusOptions.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value, style: const TextStyle(fontSize: 13, color: colors.black),),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        // Row(
                        //   crossAxisAlignment: CrossAxisAlignment.end,
                        //   children: [
                        //     const Text("Reason:"),
                        //     const SizedBox(
                        //       width: 16,
                        //     ),
                        //     Expanded(child: TextFormField())
                        //   ],
                        // ),
                        // const SizedBox(
                        //   height: 10,
                        // ),
                        // Row(
                        //   crossAxisAlignment: CrossAxisAlignment.end,
                        //   children: [
                        //     const Text("1. Drop Client Paying:"),
                        //     const SizedBox(
                        //       width: 16,
                        //     ),
                        //     Expanded(child: TextFormField())
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        statusUpdate(id.toString(), dropdownValue.toString());
                      },
                      child: const Text(
                        "Submit",
                        // style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            ),
          );
        });
  }

  canceldialog(String? id) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            content: SizedBox(
              height: 200,
              width: 300,
              child: Column(
                children: [
                  Container(
                    height: 150,
                    width: 250,
                    padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color(0xFF112c48), width: 2),
                        borderRadius: BorderRadius.circular(16)),
                    child: Column(
                      children: [
                        const SizedBox(height: 20,),
                        const Text(
                          "Region",
                          style: TextStyle(
                              color: Color(0xFF112c48),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text("Reason:"),
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(child: TextFormField())
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text("1. Drop Client Paying:"),
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(child: TextFormField())
                          ],
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        cancelOrder(id.toString());
                      },
                      child: const Text(
                        "Submit",
                        // style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            ),
          );
        });
  }

  statusUpdate(String? id, status) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? driverId = preferences.getString('driver_id');
    var headers = {
      'Cookie': 'ci_session=a1211d3cd64fdbe2071846b6a5941d3e69836b7a'
    };
    var request =
        http.MultipartRequest('POST', Uri.parse(ApiServicves.statusUpdate));
    request.fields.addAll({
      'id': id.toString(),
      'status': status.toString(),
      'reason': 'testadfasdfsad',
      'driver_id': driverId.toString(),
    });
    print("status isssss ========${request.fields}===========");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  cancelOrder(String? id,) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? driverId = preferences.getString('driver_id');
    var headers = {
      'Cookie': 'ci_session=a1211d3cd64fdbe2071846b6a5941d3e69836b7a'
    };
    var request =
    http.MultipartRequest('POST', Uri.parse(ApiServicves.statusUpdate));
    request.fields.addAll({
      'id': id.toString(),
      'status': '',
      'reason': 'testadfasdfsad',
      'driver_id': driverId.toString(),
    });
    print("status isssss ========${request.fields}===========");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
    } else {
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:
            const EdgeInsets.only(bottom: 96, top: 20, left: 20, right: 20),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: colors.primary,
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 2,
                            offset: Offset(0, 1))
                      ]),
                  child: const Center(
                      child: Text(
                    "Current Orders",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: colors.primary,
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 2,
                            offset: Offset(0, 1))
                      ]),
                  child: const Center(
                      child: Text(
                    "Completed Orders",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: colors.primary,
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 2,
                            offset: Offset(0, 1))
                      ]),
                  child: const Center(
                      child: Text(
                    "Order History",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  )),
                )
              ],
            ),
            const SizedBox(height: 20),
            currentData?.orders?.length == null ||
                    currentData?.orders?.length == ""
                ? CircularProgressIndicator(
                    color: colors.primary,
                  )
                : Container(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        // shrinkWrap: true,
                        itemCount: currentData?.orders?.length,
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 10),
                            child: Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 2,
                                          offset: Offset(0, 1)),
                                    ]),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Single Pickup",
                                            style: TextStyle(
                                                color: colors.primary,
                                                fontWeight: FontWeight.bold)),
                                        Text(
                                            "Date - ${currentData?.orders?[i].date}",
                                            style: TextStyle(
                                                color: colors.primary,
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 230,
                                          width: 100,
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 90,
                                                width: 100,
                                                child: Image.network(
                                                    "https://developmentalphawizz.com/hojayega/uploads/profile_pics/${currentData?.orders?[i].orderItems?.first.productImage}"),
                                              ),
                                              //  Row(
                                              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              //   children: const [
                                              //     Text("Weight:",style: TextStyle(
                                              //       color:  colors.primary,
                                              //       fontWeight: FontWeight.bold,
                                              //       fontSize: 12,
                                              //     ),
                                              //     ),
                                              //     Text("3kg",style: TextStyle(color:  colors.primary,fontSize: 12,fontWeight: FontWeight.bold))
                                              //   ],
                                              // ),
                                              const SizedBox(height: 10),
                                              // Row(
                                              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              //   children:  [
                                              //     Text("Distance:",style: TextStyle(color:  colors.primary,fontSize: 12,fontWeight: FontWeight.bold)),
                                              //     Text("${currentData?.orders?[i].orderItems[i].}KM",style: TextStyle(color: colors.primary, fontSize: 12,fontWeight: FontWeight.bold))
                                              //   ],
                                              // ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("Amount:",
                                                      style: TextStyle(
                                                          color: colors.primary,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  Text(
                                                      "Rs.${currentData?.orders?[i].total}",
                                                      style: TextStyle(
                                                          color: colors.primary,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold))
                                                ],
                                              ),
                                              const SizedBox(height: 20),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text("Payment:",
                                                      style: TextStyle(
                                                          color: colors.primary,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  Text(
                                                      "${currentData?.orders?[i].paymentMode}",
                                                      style: TextStyle(
                                                          color: colors.primary,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold))
                                                ],
                                              ),
                                              const SizedBox(height: 10),
                                              Center(
                                                child: Column(
                                                  children: const [
                                                    Text(
                                                      "Bill",
                                                      style: TextStyle(
                                                        color: colors.primary,
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons.receipt,
                                                      color: colors.primary,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const VerticalDivider(
                                          color: colors.primary,
                                          width: 2,
                                          thickness: 2,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              const Text("Clothes",
                                                  style: TextStyle(
                                                      color: colors.primary,
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              const Text("Note...",
                                                  style: TextStyle(
                                                      color: colors.primary,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Column(
                                                    children: const [
                                                      SizedBox(
                                                        height: 16,
                                                      ),
                                                      DotWidget(),
                                                    ],
                                                  ),
                                                  Column(
                                                    children: [
                                                      const SizedBox(
                                                        height: 12,
                                                      ),
                                                      Indicator(
                                                          lineWidth: 16,
                                                          lineHeight: 2,
                                                          endWidget: Container(
                                                            height: 16,
                                                            width: 16,
                                                            decoration:
                                                                const BoxDecoration(
                                                                    color: Colors
                                                                        .green,
                                                                    shape: BoxShape
                                                                        .circle),
                                                          )),
                                                      const SizedBox(
                                                        height: 64,
                                                      ),
                                                      Indicator(
                                                          lineWidth: 16,
                                                          lineHeight: 2,
                                                          endWidget: Container(
                                                            height: 16,
                                                            width: 16,
                                                            decoration:
                                                                const BoxDecoration(
                                                                    color: Colors
                                                                        .red,
                                                                    shape: BoxShape
                                                                        .circle),
                                                          )),
                                                    ],
                                                  ),
                                                  const SizedBox(
                                                    width: 4,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Container(
                                                        width: 90,
                                                        child: Text(
                                                          '${currentData?.orders?[i].pickAddress}',
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: const TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 68,
                                                      ),
                                                      Container(
                                                        width: 90,
                                                        child: Text(
                                                          '${currentData?.orders?[i].address}',
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: const TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                      // Row(
                                                      //   children:  [
                                                      //     const Icon(Icons.phone, color: Colors.red,size: 16,),
                                                      //     Text("${currentData?.orders?[i].pickupName}", style: TextStyle(color: Colors.red),),
                                                      //   ],
                                                      // ),
                                                      // const SizedBox(height: 12),
                                                      //  Container(
                                                      //    width: 90,
                                                      //    child: Text(
                                                      //     '${currentData?.orders?[i].dropHistory?[i].dropLocation}', overflow: TextOverflow.ellipsis,
                                                      //     style: const TextStyle(fontWeight: FontWeight.bold)),
                                                      //  ),
                                                      // Row(
                                                      //   children: [
                                                      //     const Icon(Icons.phone, color: Colors.red,size: 16,),
                                                      //     Text("${currentData?.orders?[i].dropHistory?[i].dropNumber}", style: TextStyle(color: Colors.red),),
                                                      //   ],
                                                      // ),
                                                    ],
                                                  ),
                                                  const SizedBox(width: 16),
                                                  Column(
                                                    children: [
                                                      const SizedBox(
                                                        height: 8,
                                                      ),
                                                      InkWell(
                                                          onTap: () {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            PickUp()));
                                                          },
                                                          child: const Icon(
                                                              Icons
                                                                  .pin_drop_outlined,
                                                              color:
                                                                  Colors.red)),
                                                      const SizedBox(
                                                        height: 48,
                                                      ),
                                                      InkWell(
                                                          onTap: () {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            Droup()));
                                                          },
                                                          child: const Icon(
                                                              Icons
                                                                  .pin_drop_outlined,
                                                              color:
                                                                  Colors.red)),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      const Text("Pick up time",
                                                          style: TextStyle(
                                                              color: colors
                                                                  .primary,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                      Text(
                                                          "${currentData?.orders?[i].time}",
                                                          style: const TextStyle(
                                                              color: Colors.red,
                                                              fontSize: 12,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                    ],
                                                  ),
                                                  const SizedBox(width: 9),
                                                  // Column(
                                                  //   crossAxisAlignment: CrossAxisAlignment.start,
                                                  //   children: [
                                                  //     const Text("Drop time",style: TextStyle(color: colors.primary,fontSize: 14,fontWeight: FontWeight.bold)),
                                                  //     Text("${currentData?.orders?[i].toTime}",style: TextStyle(color: Colors.red,fontSize: 12,fontWeight: FontWeight.bold)),
                                                  //   ],
                                                  // ),
                                                ],
                                              ),
                                              const SizedBox(height: 5),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      showStatus(currentData?.orders?[i].orderId);
                                                    },
                                                    child: Container(
                                                        height: 40,
                                                        width: 80,
                                                        decoration: BoxDecoration(
                                                            color: Colors.green,
                                                            borderRadius: BorderRadius.circular(8)),
                                                        child: const Center(
                                                          child: Text(
                                                            "Done",
                                                            style: TextStyle(color: Colors.white),
                                                          ),
                                                        ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 8),
                                                  InkWell(
                                                    onTap: () {
                                                      print("neweeeeeee");
                                                      canceldialog(currentData?.orders?[i].orderId);
                                                    },
                                                    child: Container(
                                                        height: 40,
                                                        width: 80,
                                                        decoration: BoxDecoration(
                                                            color: Colors.red,
                                                            borderRadius:
                                                                BorderRadius.circular(8)),
                                                        child: const Center(
                                                          child: Text(
                                                            "Cancel",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        )),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                                // Row(
                                //   crossAxisAlignment: CrossAxisAlignment.start,
                                //   children: [
                                //     Expanded(
                                //       flex: 1,
                                //       child: Column(
                                //         crossAxisAlignment: CrossAxisAlignment.start,
                                //         children: [
                                //           const Text("Single Pick Up",style: TextStyle(color: colors.primary,fontWeight: FontWeight.bold)),
                                //           Container(
                                //             height: 100,
                                //             width: 100,
                                //             decoration: BoxDecoration(
                                //                 borderRadius: BorderRadius.circular(8),
                                //                 image: const DecorationImage(scale:0.5,image: AssetImage("assets/profile.png",))
                                //             ),
                                //           ),
                                //            Row(
                                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //             children: const [
                                //               Text("Weight:",style: TextStyle(
                                //                 color:  colors.primary,
                                //                 fontWeight: FontWeight.bold,
                                //                 fontSize: 12,
                                //               ),
                                //               ),
                                //               Text("3kg",style: TextStyle(color:  colors.primary,fontSize: 12,fontWeight: FontWeight.bold))
                                //             ],
                                //           ),
                                //           const SizedBox(height: 10,),
                                //            Row(
                                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //             children: const [
                                //               Text("Distance:",style: TextStyle(color:  colors.primary,fontSize: 12,fontWeight: FontWeight.bold)),
                                //               Text("1.38KM",style: TextStyle(color: colors.primary, fontSize: 12,fontWeight: FontWeight.bold))
                                //             ],
                                //           ),
                                //           const SizedBox(height: 10,),
                                //            Row(
                                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //             children: [
                                //               Text("Amount:",style: TextStyle(color:  Color(0xFF112c48),fontSize: 12,fontWeight: FontWeight.bold)),
                                //               Text("Rs. 180",style: TextStyle(color:  Color(0xFF112c48),fontSize: 12,fontWeight: FontWeight.bold))
                                //             ],
                                //           ),
                                //           const SizedBox(height: 10,),
                                //            Row(
                                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //             children: const [
                                //               Text("Payment:",style: TextStyle(color:  Color(0xFF112c48),fontSize: 12,fontWeight: FontWeight.bold)),
                                //               Text("COD",style: TextStyle(color:  Color(0xFF112c48),fontSize: 12,fontWeight: FontWeight.bold))
                                //             ],
                                //           ),
                                //            SizedBox(height: 10,),
                                //             Center(child: Column(
                                //             children: [
                                //               Text("Bill",style: TextStyle(color:  Color(0xFF112c48),),),
                                //               Icon(Icons.receipt,color:  Color(0xFF112c48),),
                                //             ],
                                //           ))
                                //
                                //         ],
                                //       ),
                                //     ),
                                //     const VerticalDivider(
                                //       color:  Color(0xFF112c48),
                                //       width: 2,
                                //       thickness: 2,
                                //     ),
                                //     Expanded(
                                //       flex: 2,
                                //       child: Padding(
                                //         padding: const EdgeInsets.only(left: 8),
                                //         child: Column(
                                //           crossAxisAlignment: CrossAxisAlignment.start,
                                //           children: [
                                //              Row(
                                //               mainAxisAlignment: MainAxisAlignment.end,
                                //               children: const [
                                //                 Text("Date - 12/09/2023",style: TextStyle(color: Color(0xFF112c48),fontWeight: FontWeight.bold)),
                                //               ],
                                //             ),
                                //             const Text("Clothes",style: TextStyle(color: Color(0xFF112c48),fontSize: 20,fontWeight: FontWeight.bold)),
                                //             const Text("Note.....",style: TextStyle(color: Color(0xFF112c48),fontSize: 14,fontWeight: FontWeight.bold)),
                                //             Row(
                                //               crossAxisAlignment: CrossAxisAlignment.start,
                                //               children: [
                                //                   Column(
                                //                   children: const [
                                //                     SizedBox(
                                //                       height: 16,
                                //                     ),
                                //                     DotWidget(),
                                //                   ],
                                //                 ),
                                //                 Column(
                                //                   children: [
                                //                     const SizedBox(
                                //                       height: 12,
                                //                     ),
                                //                     Indicator(
                                //                         lineWidth: 16,
                                //                         lineHeight: 2,
                                //                         endWidget: Container(
                                //                           height: 16,
                                //                           width: 16,
                                //                           decoration: const BoxDecoration(
                                //                               color: Colors.green,
                                //                               shape: BoxShape.circle
                                //                           ),
                                //                         )),
                                //                     const SizedBox(height: 64,),
                                //                     Indicator(
                                //                         lineWidth: 16,
                                //                         lineHeight: 2,
                                //                         endWidget:  Container(
                                //                           height: 16,
                                //                           width: 16,
                                //                           decoration:const BoxDecoration(
                                //                               color: Colors.red,
                                //                               shape: BoxShape.circle
                                //                           ),
                                //                         )),
                                //                   ],
                                //                 ),
                                //                  SizedBox(width: 4,),
                                //                   Column(
                                //                   crossAxisAlignment: CrossAxisAlignment.start ,
                                //                   children: [
                                //                     const Text(
                                //                       '372 Mclean Rd,\nMilner, GA, 30257',
                                //                       style: TextStyle(
                                //                           fontWeight: FontWeight.bold
                                //                       ),
                                //
                                //                     ),
                                //                     Row(
                                //                       children: const [
                                //                         Icon(Icons.phone, color: Colors.red,size: 16,),
                                //                         Text("8760969005", style: TextStyle(color: Colors.red),),
                                //                       ],
                                //                     ),
                                //                     SizedBox(height: 12,),
                                //                     const Text(
                                //                       '2580 Hebb Rd,\nWilsonville, AL,',
                                //                       style: TextStyle(
                                //                           fontWeight: FontWeight.bold
                                //                       ),
                                //                     ),
                                //                     Row(
                                //                       children: const [
                                //                         Icon(Icons.phone, color: Colors.red,size: 16,),
                                //                         Text("8760969005", style: TextStyle(color: Colors.red),),
                                //                       ],
                                //                     ),
                                //                   ],
                                //                 ),
                                //                 const SizedBox(width: 16,),
                                //                  Column(
                                //                   children: const [
                                //                     SizedBox(
                                //                       height: 8,
                                //                     ),
                                //                     Icon(Icons.pin_drop_outlined,color: Colors.red,),
                                //                     SizedBox(
                                //                       height: 48,
                                //                     ),
                                //                     Icon(Icons.pin_drop_outlined,color: Colors.red,),
                                //                   ],
                                //                 ),
                                //               ],
                                //             ),
                                //              Row(
                                //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                //               children: [
                                //                 Column(
                                //                   crossAxisAlignment: CrossAxisAlignment.start,
                                //                   children: const [
                                //                     Text("Pick up time",style: TextStyle(color: Color(0xFF112c48),fontSize: 14,fontWeight: FontWeight.bold)),
                                //                     Text("12: 30 PM",style: TextStyle(color: Colors.red,fontSize: 12,fontWeight: FontWeight.bold)),
                                //                   ],
                                //                 ),
                                //                 Column(
                                //                   crossAxisAlignment: CrossAxisAlignment.start,
                                //                   children: const [
                                //                     Text("Drop time",style: TextStyle(color: Color(0xFF112c48),fontSize: 14,fontWeight: FontWeight.bold)),
                                //                     Text("01: 30 PM",style: TextStyle(color: Colors.red,fontSize: 12,fontWeight: FontWeight.bold)),
                                //                   ],
                                //                 ),
                                //               ],
                                //             ),
                                //             const SizedBox(
                                //
                                //             ),
                                //             Row(
                                //               mainAxisAlignment: MainAxisAlignment.end,
                                //               children: [
                                //                 Container(
                                //                     height: 40,
                                //                     width: 80,
                                //                     decoration: BoxDecoration(
                                //                         color: Colors.red,
                                //                         borderRadius: BorderRadius.circular(8)
                                //                     ),
                                //                     child: const Center(child: Text("Cancel",style: TextStyle(color: Colors.white),),)
                                //                 ),
                                //               ],
                                //             ),
                                //           ],
                                //         ),
                                //       ),
                                //     ),
                                //   ],
                                // ),
                                ),
                          );
                        }),
                  ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.grey,
                        blurRadius: 2,
                        offset: Offset(0, 1)),
                  ]),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Multiple Pick Up",
                            style: TextStyle(
                                color: colors.primary,
                                fontWeight: FontWeight.bold)),
                        // Container(
                        //   height: 100,
                        //   width: 100,
                        //   decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(8),
                        //       image: const DecorationImage(
                        //           scale:0.5,
                        //           image: AssetImage("assets/profile.png",))
                        //   ),
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text("Weight:",
                                style: TextStyle(
                                  color: colors.primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                )),
                            Text("3kg",
                                style: TextStyle(
                                    color: colors.primary,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text("Distance:",
                                style: TextStyle(
                                    color: colors.primary,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold)),
                            Text("1.38KM",
                                style: TextStyle(
                                    color: colors.primary,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text("Amount:",
                                style: TextStyle(
                                    color: colors.primary,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold)),
                            Text("Rs. 180",
                                style: TextStyle(
                                    color: colors.primary,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text("Payment:",
                                style: TextStyle(
                                    color: colors.primary,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold)),
                            Text("COD",
                                style: TextStyle(
                                    color: colors.primary,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Column(
                            children: const [
                              Text(
                                "Bill",
                                style: TextStyle(
                                  color: colors.primary,
                                ),
                              ),
                              Icon(
                                Icons.receipt,
                                color: colors.primary,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const VerticalDivider(
                    color: colors.primary,
                    width: 2,
                    thickness: 2,
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text("Date - 12/09/2023",
                                style: TextStyle(
                                    color: colors.primary,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        const Text("Clothes",
                            style: TextStyle(
                                color: colors.primary,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        const Text("Note.....",
                            style: TextStyle(
                                color: colors.primary,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                const Text("Pick Up",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold)),
                                Container(
                                  height: 24,
                                  width: 24,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border:
                                          Border.all(color: colors.primary)),
                                  child: const Center(
                                      child: Text("A",
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold))),
                                ),
                                const DotWidget(),
                                const Text("Drop",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold)),
                                Container(
                                  height: 24,
                                  width: 24,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border:
                                          Border.all(color: colors.primary)),
                                  child: const Center(
                                      child: Text("B",
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold))),
                                ),
                                const DotWidget(),
                                const Text("Drop",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold)),
                                Container(
                                  height: 24,
                                  width: 24,
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border:
                                          Border.all(color: colors.primary)),
                                  child: const Center(
                                      child: Text("C",
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold))),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // SizedBox(height: 12,),
                                Row(
                                  children: const [
                                    Text(
                                      '372 Mclean Rd,\nMilner, GA, 30257',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Icon(
                                      Icons.pin_drop_outlined,
                                      color: Colors.red,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.phone,
                                      color: Colors.red,
                                      size: 16,
                                    ),
                                    Text(
                                      "8760969005",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.red),
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    Text(
                                      "12:30 PM",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.red),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 64,
                                ),
                                Row(
                                  children: const [
                                    Text(
                                      '372 Mclean Rd,\nMilner, GA, 30257',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Icon(
                                      Icons.pin_drop_outlined,
                                      color: Colors.red,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.phone,
                                      color: Colors.red,
                                      size: 16,
                                    ),
                                    Text(
                                      "8760969005",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.red),
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    Text(
                                      "01:30 PM",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.red),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 64,
                                ),
                                Row(
                                  children: const [
                                    Text(
                                      '372 Mclean Rd,\nMilner, GA, 30257',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Icon(
                                      Icons.pin_drop_outlined,
                                      color: Colors.red,
                                    ),
                                  ],
                                ),
                                Row(
                                  children: const [
                                    Icon(
                                      Icons.phone,
                                      color: Colors.red,
                                      size: 16,
                                    ),
                                    Text(
                                      "8760969005",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.red),
                                    ),
                                    SizedBox(
                                      width: 16,
                                    ),
                                    Text(
                                      "02:30 PM",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.red),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                // showStatus();
                              },
                              child: Container(
                                  height: 40,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: const Center(
                                    child: Text(
                                      "Done",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            InkWell(
                              onTap: () {
                                // showStatus();
                                print("neweeeeeee");
                                // showAlertDialog(context);
                              },
                              child: Container(
                                  height: 40,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(8)),
                                  child: const Center(
                                    child: Text(
                                      "Cancel",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

TextEditingController cashCtr = TextEditingController();
TextEditingController transctionCtr = TextEditingController();
TextEditingController clientCtr = TextEditingController();

void showAlertDialog(
  BuildContext context,
) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        actions: <Widget>[
          TextFormField(
            // maxLength: 6,
            onTap: () {
              // setState(() {
              //   // GetLeadsData();
              // });
            },
            controller: cashCtr,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                hintText: 'Enter Name',
                contentPadding: EdgeInsets.only(top: 5, left: 10),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5))),
          ),
          SizedBox(height: 10),
          TextFormField(
            maxLength: 10,
            onTap: () {
              // setState(() {
              //   // GetLeadsData();
              // });
            },
            controller: transctionCtr,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              hintText: 'Enter Number',
              contentPadding: const EdgeInsets.only(top: 5, left: 10),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.3,
            child: Center(
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    },
                  style: ElevatedButton.styleFrom(backgroundColor: colors.secondary),
                  child: const Text('Submit', style: TextStyle(color: colors.white))),
            ),
          )
        ],
      );
    },
  );
}

class DotWidget extends StatelessWidget {
  final double totalHeight, dashWidth, emptyHeight, dashHeight;

  final Color dashColor;

  const DotWidget({
    this.totalHeight = 42,
    this.dashWidth = 2,
    this.emptyHeight = 5,
    this.dashHeight = 10,
    this.dashColor = Colors.black,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        totalHeight ~/ (dashWidth + emptyHeight),
        (_) => Container(
          width: dashWidth,
          height: dashHeight,
          color: dashColor,
          margin:
              EdgeInsets.only(top: emptyHeight / 2, bottom: emptyHeight / 2),
        ),
      ),
    );
  }
}

class Indicator extends StatelessWidget {
  final double lineWidth, lineHeight;
  final Widget endWidget;

  const Indicator(
      {super.key,
      required this.lineWidth,
      required this.lineHeight,
      required this.endWidget});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: lineWidth,
          height: lineHeight,
          color: Colors.black,
          // margin: EdgeInsets.only(top: emptyHeight / 2, bottom: emptyHeight / 2),
        ),
        endWidget
      ],
    );
  }
}

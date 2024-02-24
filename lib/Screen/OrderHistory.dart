import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Helper/Color.dart';
import '../Helper/api.path.dart';
import '../Model/CurrentorderModel.dart';
import 'Droup.dart';
import 'MyOrder.dart';
import 'package:http/http.dart' as http;
import 'Pickup.dart';

class OrderHistory extends StatefulWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  State<OrderHistory> createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {


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
    request.fields.addAll({'driver_id': driverId.toString(), 'status':'6'});
    print("my order pararmeter ${request.fields}");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final finalResult = CurrentorderModel.fromJson(json.decode(finalResponse));
      print("responseeee $finalResponse");
      setState(() {
        currentData = finalResult;
      });
    } else {
      print(response.reasonPhrase);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.backgroundcolor,
      appBar: AppBar(
        backgroundColor: const Color(0xFF112c48),
        title: const Text("Order History", style: TextStyle(color:  Colors.white),),
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
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 0, top: 20, left: 10, right: 10),
          child: Column(
            children: [
              getCurrentOrder(),
            ],
          ),
        ),
      ),
    );
  }

  getCurrentOrder() {
    return currentData?.orders?.length == null || currentData?.orders?.length == ""
        ? const CircularProgressIndicator(
      color: colors.primary,
    ):
    Container(
      height: MediaQuery.of(context).size.height,
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
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
                            offset: Offset(0, 1),
                        ),
                      ]),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("Single Pickup",
                              style: TextStyle(
                                  color: colors.primary,
                                  fontWeight: FontWeight.bold)),
                          Text(
                              "Date - ${currentData?.orders?[i].date}",
                              style: const TextStyle(
                                  color: colors.primary,
                                  fontWeight: FontWeight.bold),
                          ),
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
                                      "${currentData?.orders?[i].orderItems?.first.productImage}"),
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
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Amount:",
                                        style: TextStyle(
                                            color: colors.primary,
                                            fontSize: 12,
                                            fontWeight:
                                            FontWeight.bold)),
                                    Text(
                                        "Rs.${currentData?.orders?[i].total}",
                                        style: const TextStyle(
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
                                    const Text("Payment:",
                                        style: TextStyle(
                                            color: colors.primary,
                                            fontSize: 12,
                                            fontWeight:
                                            FontWeight.bold)),
                                    Text(
                                      "${currentData?.orders?[i].paymentMode}",
                                      style: const TextStyle(
                                          color: colors.primary,
                                          fontSize: 12,
                                          fontWeight:
                                          FontWeight.bold),
                                    )
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
                                // const Text("Clothes",
                                //     style: TextStyle(
                                //         color: colors.primary,
                                //         fontSize: 20,
                                //         fontWeight:
                                //         FontWeight.bold)),
                                const Text("Note...",
                                  style: TextStyle(
                                      color: colors.primary,
                                      fontSize: 14,
                                      fontWeight:
                                      FontWeight.bold),
                                ),
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
                                // Row(
                                //   mainAxisAlignment:
                                //   MainAxisAlignment.end,
                                //   children: [
                                //     InkWell(
                                //       onTap: () {
                                //         showStatus(currentData?.orders?[i].orderId);
                                //       },
                                //       child: Container(
                                //         height: 40,
                                //         width: 80,
                                //         decoration: BoxDecoration(
                                //             color: Colors.green,
                                //             borderRadius: BorderRadius.circular(8)),
                                //         child: const Center(
                                //           child: Text(
                                //             "Done",
                                //             style: TextStyle(color: Colors.white),
                                //           ),
                                //         ),
                                //       ),
                                //     ),
                                //     SizedBox(width: 8),
                                //     InkWell(
                                //       onTap: () {
                                //         print("neweeeeeee");
                                //         canceldialog(currentData?.orders?[i].orderId);
                                //       },
                                //       child: Container(
                                //           height: 40,
                                //           width: 80,
                                //           decoration: BoxDecoration(
                                //               color: Colors.red,
                                //               borderRadius:
                                //               BorderRadius.circular(8)),
                                //           child: const Center(
                                //             child: Text(
                                //               "Cancel",
                                //               style: TextStyle(
                                //                   color: Colors
                                //                       .white),
                                //             ),
                                //           )),
                                //     ),
                                //   ],
                                // ),
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
    );
  }
}

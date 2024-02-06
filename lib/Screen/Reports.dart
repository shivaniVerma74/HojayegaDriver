import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hojayegadriverapp/Helper/api.path.dart';
import 'package:hojayegadriverapp/Screen/IncentiveReferal.dart';
import 'package:hojayegadriverapp/Screen/WithDraw.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/GetReportsModel.dart';

class Reports extends StatefulWidget {
  const Reports({super.key});

  @override
  State<Reports> createState() => _ReportsState();
}

class _ReportsState extends State<Reports> {
  String? date1;
  String? date2;
  DateTime initialDate = DateTime.now();
  bool showDate = true;

  @override
  void initState(){
    super.initState();
    getReport();
  }

  GetReportsModel? getReportsModel;
  String? driver_id;
  getReport() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    driver_id = prefs.getString('driver_id');
    var headers = {
      'Cookie': 'ci_session=c3e8a42d86e9c0459216229d970837e3d810ed55'
    };
    var request = http.MultipartRequest('POST', Uri.parse(ApiServicves.getReports));
    request.fields.addAll({
      'driver_id': driver_id.toString()
    });
    print("driver id is in report screen ${request.fields}");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final finalResult = GetReportsModel.fromJson(json.decode(finalResponse));
      print("responseeee $finalResult");
      setState(() {
        getReportsModel = finalResult;
      });
    }
    else {
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 20, right: 20, bottom: 96),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      color: const Color(0xFF112c48),
                      borderRadius: BorderRadius.circular(4),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            blurRadius: 2,
                            offset: Offset(0, 1))
                      ]),
                  child: const Center(
                    child: Text(
                      'Order Report',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 8.0,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Incentives()));
                },
                child: Expanded(

                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: const Color(0xFF112c48)),
                      // boxShadow: const [
                      //   BoxShadow(
                      //       color: Colors.grey,
                      //       blurRadius: 2,
                      //       offset: Offset(0, 1))
                      // ]
                    ),
                    child: const Center(
                      child: Text(
                        'Incentive & Referral',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF112c48),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Report',
            style: TextStyle(
                color: Color(0xFF112c48),
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
              height: 110,
              width: double.infinity,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(width: 2.0, color: const Color(0xFF112c48)),
                // boxShadow: const [
                //   BoxShadow(
                //       color: Colors.grey,
                //       blurRadius: 2,
                //       offset: Offset(0, 1))
                // ]
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 24,
                      ),
                      Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.topCenter,
                        children: [
                          Container(
                            height: 64,
                            width: 96,
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border:
                              Border.all(color: const Color(0xFF112c48)),
                              // boxShadow: const [
                              //   BoxShadow(
                              //       color: Colors.grey,
                              //       blurRadius: 2,
                              //       offset: Offset(0, 1))
                              // ]
                            ),
                            child: Center(
                              child: Column(
                                children: const [
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    'Total order',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF112c48),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: -20,
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: const BoxDecoration(
                                  color: Color(0xFF112c48),
                                  shape: BoxShape.circle),
                              child: Center(
                                child: Text(
                                  '${getReportsModel?.data?.totalOrders}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 24,
                      ),
                      Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.topCenter,
                        children: [
                          Container(
                            height: 64,
                            width: 96,
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border:
                              Border.all(color: const Color(0xFF112c48)),
                              // boxShadow: const [
                              //   BoxShadow(
                              //       color: Colors.grey,
                              //       blurRadius: 2,
                              //       offset: Offset(0, 1))
                              // ]
                            ),
                            child:  Center(
                              child: Column(
                                children: const [
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    'Total Canceled',
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF112c48),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: -20,
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: const BoxDecoration(
                                  color: Color(0xFF112c48),
                                  shape: BoxShape.circle),
                              child: Center(
                                child: Text(
                                  '${getReportsModel?.data?.totalCancel}',
                                  style: TextStyle(

                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 24,
                      ),
                      Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.topCenter,
                        children: [
                          Container(
                            height: 64,
                            width: 96,
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border:
                              Border.all(color: const Color(0xFF112c48)),
                              // boxShadow: const [
                              //   BoxShadow(
                              //       color: Colors.grey,
                              //       blurRadius: 2,
                              //       offset: Offset(0, 1))
                              // ]
                            ),
                            child: Center(
                              child: Column(
                                children: const [
                                  SizedBox(
                                    height: 16,
                                  ),
                                  Text(
                                    'Total Hours',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF112c48),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: -20,
                            child: Container(
                              height: 40,
                              width: 40,
                              decoration: const BoxDecoration(
                                  color: Color(0xFF112c48),
                                  shape: BoxShape.circle),
                              child:  Center(
                                child: Text(
                                  '${getReportsModel?.data?.totalHours}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              )

            // const Center(
            //   child: Text(
            //     'Incentive & Referral Earning',
            //     style: TextStyle(
            //       color: Color(0xFF112c48),
            //     ),
            //   ),
            // ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Text(
                'Date:',
                style: TextStyle(
                    color: Color(0xFF112c48),
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                date1 ?? " Select date",
                style: const TextStyle(
                    color: Color(0xFF112c48),
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              Text(
                date2 != null ? " to $date2 " : " to Select date",
                style: const TextStyle(
                    color: Color(0xFF112c48),
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              showDate
                  ? IconButton(
                  onPressed: () async {
                    DateTime? selectedDate1 = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2023, 12, 31));
                    if (selectedDate1 != null) {
                      setState(() {
                        initialDate = selectedDate1;
                        date1 =
                        "${selectedDate1.day}/${selectedDate1.month}/${selectedDate1.year}";
                        showDate = false;
                      });
                    }
                    // DateTime? selectedDate2 = await showDatePicker(
                    //     context: context,
                    //     initialDate: DateTime.now(),
                    //     firstDate: DateTime.now(),
                    //     lastDate: DateTime(2023, 12, 31));

                    // if (selectedDate != null) {
                    //   setState(() {
                    //     date2 =
                    //         "${selectedDate2.day}/${selectedDate2.month}/${selectedDate2.year}";
                    //     showDate2 = true;
                    //   });
                    // }
                  },
                  icon: const Icon(
                    Icons.calendar_month_outlined,
                    color: Color(0xFF112c48),
                  ))
                  : IconButton(
                  onPressed: () async {
                    DateTime? selectedDate = await showDatePicker(
                        context: context,
                        initialDate: initialDate,
                        firstDate: initialDate,
                        lastDate: DateTime(2023, 12, 31));

                    if (selectedDate != null) {
                      setState(() {
                        date2 =
                        "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
                        showDate = true;
                      });
                    }
                    // DateTime? selectedDate2 = await showDatePicker(
                    //     context: context,
                    //     initialDate: DateTime.now(),
                    //     firstDate: DateTime.now(),
                    //     lastDate: DateTime(2023, 12, 31));

                    // if (selectedDate != null) {
                    //   setState(() {
                    //     date2 =
                    //         "${selectedDate2.day}/${selectedDate2.month}/${selectedDate2.year}";
                    //     showDate2 = true;
                    //   });
                    // }
                  },
                  icon: const Icon(
                    Icons.calendar_month_outlined,
                    color: Color(0xFF112c48),
                  ))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
                height: 50,
                width: 150,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 2,
                          offset: Offset(0, 1))
                    ]),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        'Total Earning',
                        style: TextStyle(
                            color: Color(0xFF112c48),
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '₹ ${getReportsModel?.data?.totalSum}',
                        style: TextStyle(
                          color: Color(0xFF112c48),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                height: 50,
                width: 150,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                    boxShadow:  [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 2,
                          offset: Offset(0, 1))
                    ]),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        'COD',
                        style: TextStyle(
                            color: Color(0xFF112c48),
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '₹ ${getReportsModel?.data?.totalCod}',
                        style: TextStyle(
                          color: Color(0xFF112c48),
                        ),
                      ),
                    ],
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
                height: 50,
                width: 150,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 2,
                          offset: Offset(0, 1))
                    ]),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        'Incentive',
                        style: TextStyle(
                            color: Color(0xFF112c48),
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '₹ ${getReportsModel?.data?.totalIncentive}',
                        style: TextStyle(
                          color: Color(0xFF112c48),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                height: 50,
                width: 150,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          blurRadius: 2,
                          offset: Offset(0, 1))
                    ]),
                child:  Center(
                  child: Column(
                    children: [
                      Text(
                        'Settlement Amount',
                        style: TextStyle(
                            color: Color(0xFF112c48),
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '₹ ${getReportsModel?.data?.settlementAmount}',
                        style: TextStyle(
                          color: Color(0xFF112c48),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
              height: 100,
              width: double.infinity,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(width: 2.0, color: const Color(0xFF112c48)),
                // boxShadow: const [
                //   BoxShadow(
                //       color: Colors.grey,
                //       blurRadius: 2,
                //       offset: Offset(0, 1))
                // ]
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 24,
                        ),
                        Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.topCenter,
                          children: [
                            Container(
                              height: 50,
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                border:
                                Border.all(color: const Color(0xFF112c48)),
                                // boxShadow: const [
                                //   BoxShadow(
                                //       color: Colors.grey,
                                //       blurRadius: 2,
                                //       offset: Offset(0, 1))
                                // ]
                              ),
                              child:  Center(
                                child: Column(
                                  children: const [
                                    SizedBox(
                                      height: 16,
                                    ),
                                    Text(
                                      'Last Setteled Amount',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        color: Color(0xFF112c48),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: -20,
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: const BoxDecoration(
                                    color: Color(0xFF112c48),
                                    shape: BoxShape.circle),
                                child: const Center(
                                  child: Text(
                                    '0',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 24,
                        ),
                        Stack(
                          clipBehavior: Clip.none,
                          alignment: Alignment.topCenter,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => WithDraw()));
                              },
                              child: Container(
                                height: 50,
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  border:
                                  Border.all(color: const Color(0xFF112c48)),
                                ),
                                child:  Center(
                                  child: Column(
                                    children: const [
                                      SizedBox(
                                        height: 16,
                                      ),
                                      Text(
                                        'Request For Settlement',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                          color: Color(0xFF112c48),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: -20,
                              child: Container(
                                height: 40,
                                width: 40,
                                decoration: const BoxDecoration(
                                    color: Color(0xFF112c48),
                                    shape: BoxShape.circle),
                                child: const Center(
                                  child: Text(
                                    '0',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )

            // const Center(
            //   child: Text(
            //     'Incentive & Referral Earning',
            //     style: TextStyle(
            //       color: Color(0xFF112c48),
            //     ),
            //   ),
            // ),
          ),
        ],
      ),
    );
  }
}

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hojayegadriverapp/Model/OrderHistoryModel.dart';
import 'package:hojayegadriverapp/Screen/WithDraw.dart';
import 'package:intl/intl.dart';
import'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Helper/Color.dart';
import '../Helper/api.path.dart';
import '../Model/GetReportsModel.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  DateTime selectedDate = DateTime.now();
  bool isSelected = false;
  String? date1;
  String? date2;
  DateTime initialDate = DateTime.now();

  Map<String, dynamic> details = {
    "27": <String, String>{
      "Time": "12 PM",
      "Order No": "123",
      "From": "X",
      "To": "Y",
      "COD/Online": "COD",
      "Rs.": "250"
    },
    "28": <String, String>{
      "Time": "2 PM",
      "Order No": "126",
      "From": "P",
      "To": "Q",
      "COD/Online": "Online",
      "Rs.": "150"
    },
  };

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

  OrderHistoryModel? orderHistoryModel;
  getHistory() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    driver_id = prefs.getString('driver_id');
    var headers = {
      'Cookie': 'ci_session=61ff668e7ab13112e878d9d58762c1521c6082c8'
    };
    var request = http.MultipartRequest('POST', Uri.parse(ApiServicves.orderHistory));
    request.fields.addAll({
      'driver_id': driver_id.toString(),
      'date': ''
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final finalResult = OrderHistoryModel.fromJson(json.decode(finalResponse));
      print("responseeee $finalResult");
      setState(() {
        orderHistoryModel = finalResult;
      });
    }
    else {
      print(response.reasonPhrase);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
            child: Text(
              "November - December, 2023",
              style: TextStyle(
                  color: colors.primary,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
            child: DateContainer(),
          ),
          Row(
            children: [
              OrderTable(title: "Time ", description: details["27"]["Time"]),
              const OrderTable(title: "Order No.", description: "Order No."),
              const OrderTable(title: "From", description: "From"),
              const OrderTable(title: " To ", description: "To"),
              OrderTable(title: "COD/Online", description: "COD/Online"),
              const OrderTable(title: "Rs.", description: "Rs."),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
            child: Row(
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
                          initialDate =
                              selectedDate1.add(const Duration(days: 1));
                          date1 =
                          "${selectedDate1.day}/${selectedDate1
                              .month}/${selectedDate1.year}";
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
                          "${selectedDate.day}/${selectedDate
                              .month}/${selectedDate.year}";
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
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
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
                            'Total Earning',
                            style: TextStyle(
                                color: colors.primary,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '₹ ${getReportsModel?.data?.totalSum}',
                            style: TextStyle(
                              color: colors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
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
                            'COD',
                            style: TextStyle(
                                color: colors.primary,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '₹ ${getReportsModel?.data?.totalCod}',
                            style: TextStyle(
                              color: colors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
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
                            'Incentive',
                            style: TextStyle(
                                color: colors.primary,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '₹ ${getReportsModel?.data?.totalIncentive}',
                            style: TextStyle(
                              color: colors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => WithDraw()));
                  },
                  child: Expanded(
                    child: Container(
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
                          children: const [
                            Text(
                              'Settlement Amount',
                              style: TextStyle(
                                  color: colors.primary,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '₹ 200',
                              style: TextStyle(
                                color: colors.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 24.0),
          //   child: Row(
          //     children: [
          //       Expanded(
          //         child: Container(
          //           padding: const EdgeInsets.all(8.0),
          //           decoration: BoxDecoration(
          //               color: Colors.white,
          //               borderRadius: BorderRadius.circular(4),
          //               boxShadow: const [
          //                 BoxShadow(
          //                     color: Colors.grey,
          //                     blurRadius: 2,
          //                     offset: Offset(0, 1))
          //               ]),
          //           child:  Center(
          //             child: Column(
          //               children: [
          //                 Text(
          //                   'Total Earning',
          //                   style: TextStyle(
          //                       color: Color(0xFF112c48),
          //                       fontWeight: FontWeight.bold),
          //                 ),
          //                 Text(
          //                   '\$180',
          //                   style: TextStyle(
          //                     color: Color(0xFF112c48),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ),
          //       const SizedBox(
          //         width: 10,
          //       ),
          //       Expanded(
          //         child: Container(
          //           padding: const EdgeInsets.all(8.0),
          //           decoration: BoxDecoration(
          //               color: Colors.white,
          //               borderRadius: BorderRadius.circular(4),
          //               boxShadow: const [
          //                 BoxShadow(
          //                     color: Colors.grey,
          //                     blurRadius: 2,
          //                     offset: Offset(0, 1))
          //               ]),
          //           child:  Center(
          //             child: Column(
          //               children: [
          //                 Text(
          //                   'Total Orders',
          //                   style: TextStyle(
          //                       color: Color(0xFF112c48),
          //                       fontWeight: FontWeight.bold),
          //                 ),
          //                 Text(
          //                   '\$50',
          //                   style: TextStyle(
          //                     color: Color(0xFF112c48),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          const SizedBox(
            height: 96,
          )
        ],
      ),
    );
  }
}

class DateContainer extends StatefulWidget {
  const DateContainer({super.key});

  @override
  State<DateContainer> createState() => _DateContainerState();
}

class _DateContainerState extends State<DateContainer> {
  bool isSelected = false;
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final weekDays = <Widget>[];
    Widget selected(index) {
      DateTime selectedDay = DateTime.now().add(Duration(days: index));
      weekDays[index] = GestureDetector(
        onTap: () {
          setState(() {
            isSelected = false;
          });
        },
        child: Container(
          height: 68,
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 32,
                width: 32,
                decoration: const BoxDecoration(
                    color: colors.secondary, shape: BoxShape.circle),
                child: Center(
                  child: Text(
                    DateFormat('dd').format(selectedDay),
                    // DateTime.now().weekday.toString(),
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Text(
                DateFormat('EEE').format(selectedDay),
                // DateTime.now().weekday.toString(),
                style: const TextStyle(
                    color: colors.primary, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      );
      return weekDays[index];
    }
    for (int i = 0; i < 7; i++) {
      final weekDay = DateTime.now().add(Duration(days: i));
      weekDays.add(GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = i;
            isSelected = true;
            print("date time select is $selectedIndex $isSelected $weekDay" );
          });
        },
        child: Container(
          height: 68,
          width: 40,
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                DateFormat('dd').format(weekDay),
                // DateTime.now().weekday.toString(),
                style: const TextStyle(
                    color: colors.primary, fontWeight: FontWeight.bold),
              ),
              Text(
                DateFormat('EEE').format(weekDay),
                // DateTime.now().weekday.toString(),
                style: const TextStyle(
                    color: colors.primary, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ));
    }
    weekDays[selectedIndex] = selected(selectedIndex);
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, children: weekDays);
  }
}

class OrderTable extends StatelessWidget {
  const OrderTable({super.key, required this.title, required this.description});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: colors.primary,
              )),
          child: Text(title,
              style: const TextStyle(
                  color: colors.primary, fontWeight: FontWeight.bold)),
        ),
        Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: colors.primary,
              )),
          height: 250,
          child: Text(title,
              style: const TextStyle(
                  color: colors.primary, fontWeight: FontWeight.bold)),
        )
      ],
    );
  }
}

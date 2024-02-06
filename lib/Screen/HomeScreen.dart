// import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
// import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
// // import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// import 'package:flutter/material.dart';
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     final itemList = List.generate(50, (index) => ItemsModel.items[0]);
//     return  Scaffold(
//         appBar: AppBar(
//           backgroundColor: const Color(0xFF112c48),
//           title: const Text("Home", style: TextStyle(color:  Colors.white),),
//           centerTitle: true,
//           toolbarHeight: 60,
//           elevation: 6,
//           actions: const [Padding(
//             padding: EdgeInsets.all(8.0),
//             child: CircleAvatar(
//                 backgroundColor: Colors.white,
//                 child: Icon(Icons.person,color: Color(0xFF3a9f3e) ,)),
//           )],
//           // flexibleSpace: Container(
//           //   decoration: const BoxDecoration(
//           //     color: Colors.indigo,
//           //     borderRadius: BorderRadius.only(bottomLeft:Radius.circular(16),bottomRight:Radius.circular(16) )
//           //   ),
//           // ),
//           shape: const  RoundedRectangleBorder(
//               borderRadius: BorderRadius.only(bottomLeft:Radius.circular(16),bottomRight:Radius.circular(16))
//           ),
//           leading: Container(
//             margin: const EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(4),
//               color: Colors.white,
//             ),
//             child:  IconButton(
//               icon:const Icon(Icons.menu,color: Color(0xFF3a9f3e) ,),
//               onPressed: (){
//                 const Drawer();
//               },
//             ),
//           ),
//         ),
//         bottomNavigationBar: CurvedNavigationBar(
//           backgroundColor: Colors.transparent,
//           color: const Color(0xFF112c48),
//           items:const [
//             CurvedNavigationBarItem(label: "Home",labelStyle: TextStyle(color: Colors.white),child: Icon(Icons.home, color: Colors.white,),),
//             CurvedNavigationBarItem(label: "My Orders",labelStyle: TextStyle(color: Colors.white),child: Icon(Icons.list_alt, color: Colors.white,),),
//             CurvedNavigationBarItem(label: "Reports",labelStyle: TextStyle(color: Colors.white),child: Icon(Icons.receipt, color: Colors.white,),),
//             CurvedNavigationBarItem(label: "History",labelStyle: TextStyle(color: Colors.white),child: Icon(Icons.history, color: Colors.white,),),
//           ],
//           onTap: (index){
//           },
//         ),
//         backgroundColor:const  Color(0xFFe2ebfe),
//         body:   Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
//           child: SingleChildScrollView(
//             physics: const ScrollPhysics(),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Expanded(child: Container(
//                         padding: const EdgeInsets.all(10),
//                         height: 40,
//                         decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(4),
//                             boxShadow: const [
//                               BoxShadow(
//                                   color: Colors.grey,
//                                   blurRadius: 2,
//                                   offset: Offset(0, 1)
//                               )
//                             ]
//                         ),
//                         child: const TextField(
//                           maxLines: 1,
//                           decoration: InputDecoration(
//                             prefixIcon: Icon(Icons.pin_drop_outlined),
//                             hintText: "Search by Name",
//                             border: InputBorder.none,
//
//                           ),
//                         ))),
//                     const   SizedBox(width: 10,),
//                     Container(
//                       padding: const EdgeInsets.all(4.0),
//                       height: 40,width:40,
//                       decoration: BoxDecoration(
//                           color: Colors.white,
//                           borderRadius: BorderRadius.circular(4),
//                           boxShadow: const [
//                             BoxShadow(
//                                 color: Colors.grey,
//                                 blurRadius: 2,
//                                 offset: Offset(0, 1)
//                             )
//                           ]
//                       ),
//                       child: const Icon(Icons.search,size: 30,color:  Color(0xFF3a9f3e),) ,)
//                   ],
//                 ),
//                 const SizedBox(height: 10,),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: Container(
//
//                         height: 40,
//                         decoration: BoxDecoration(
//                             color:const Color(0xFF112c48),
//                             borderRadius: BorderRadius.circular(4),
//                             boxShadow: const [
//                               BoxShadow(
//                                   color: Colors.grey,
//                                   blurRadius: 2,
//                                   offset: Offset(0, 1)
//                               )
//                             ]
//                         ),
//                         child: Center(
//                           child: DropdownButton(
//                               iconEnabledColor: Colors.white,
//                               underline: const Text(""),
//                               items:const [
//                                 DropdownMenuItem(
//                                     child: Text("Under 10 Km",style: TextStyle(color: Colors.white)))
//                               ],
//                               onChanged: (val){}),
//                         ),
//
//                       ),
//                     ),
//                     const  SizedBox(width: 10,),
//                     Expanded(
//                       child: Container(
//                         height: 40,
//
//                         decoration: BoxDecoration(
//                             color: const Color(0xFF3a9f3e),
//                             borderRadius: BorderRadius.circular(4),
//                             boxShadow: const [
//                               BoxShadow(
//                                   color: Colors.grey,
//                                   blurRadius: 2,
//                                   offset: Offset(0, 1)
//                               )
//                             ]
//                         ),
//                         child:const Center(child:  Text("Accept Order", style: TextStyle(color: Colors.white,fontSize: 18),)),
//                       ),
//                     )
//
//                   ],
//                 ),
//                 const  SizedBox(height: 10,),
//                 const Text("Choose Your Order", style:  TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
//                 const  SizedBox(height: 10),
//                 ListView.builder(
//                     physics: const NeverScrollableScrollPhysics(),
//                     shrinkWrap: true,
//                     itemCount: ItemsModel.items.length,
//                     itemBuilder: (context, i){
//                       return ItemWidget(item: itemList[i]);
//                     }
//                 ),
//               ],
//             ),
//           ),
//         )
//     );
//   }
// }
//
//
// class Item {
//   final String productName;
//   final String time;
//   final String distance;
//   final String address1;
//   final String address2;
//   final num price;
//   final String image;
//   Item(
//       {
//         required this.productName,
//         required this.time,
//         required this.distance,
//         required this.address1,
//         required this.address2,
//         required this.price,
//         required this.image});
//
// }
//
// class ItemWidget extends StatefulWidget{
//   final Item item;
//   const ItemWidget({Key? key, required this.item}):
//         super(key: key);
//
//   @override
//   State<ItemWidget> createState() => _ItemWidgetState();
// }
//
// class _ItemWidgetState extends State<ItemWidget> {
//   bool isChecked = false;
//   @override
//   Widget build(BuildContext context) {
//
//     return Container(
//       // leading: Image.network(item.image),
//         decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(12),
//             boxShadow: const [BoxShadow(
//                 color:  Color(0xFF112c48),
//
//                 offset: Offset(6, 0)
//             )]
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             Container(),
//             Column(
//               children: [
//                 Row(
//                   children: [
//                     Text(widget.item.time, style:const TextStyle(color: Colors.red),),
//                     const SizedBox(width: 10,),
//                     Text(widget.item.distance)
//                   ],
//                 ),
//                 Text(widget.item.productName),
//                 Row(
//                   children: [
//                     const  Icon(Icons.pin_drop_outlined,color: Colors.red,size: 18,),
//                     Text(widget.item.address1),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     const  Icon(Icons.pin_drop_outlined,color: Colors.red,size: 18,),
//                     Text(widget.item.address2),
//                   ],
//                 ),
//
//               ],
//             ),
//             Column(
//               mainAxisSize:  MainAxisSize.min,
//               children: [
//                 Checkbox(value:isChecked,
//                     onChanged: (bool? val){
//
//                       setState(() {
//                         isChecked = val!;
//                       });
//
//                     }),
//                 const Icon(Icons.directions_bike,color: Colors.blue,),
//                 Text("\$${widget.item.price}")
//               ],
//             ),
//           ],
//         ),
//     );
//   }
// }
//
// class ItemsModel{
//   static final items =[
//     Item(
//         productName: "Pizza",
//         time: "12:00 PM",
//         distance: "3 KM",
//         address1: "Vijay Nagar Indore to",
//         address2: "Geeta Bhawan Indore",
//         price: 200,
//         image: "image")
//   ];
// }
//

import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hojayegadriverapp/Authview/loginscreen.dart';
import 'package:hojayegadriverapp/Helper/api.path.dart';
import 'package:hojayegadriverapp/Model/GetProfileModel.dart';
import 'package:hojayegadriverapp/Screen/Earnings.dart';
import 'package:hojayegadriverapp/Screen/Incentive.dart';
import 'package:hojayegadriverapp/Screen/MyProfile.dart';
import 'package:hojayegadriverapp/Screen/history.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Helper/color.dart';
import '../Model/GetOrdersModel.dart';
import 'CodReport.dart';
import 'CustomerSupport.dart';
import 'Help.dart';
import 'LoginDuration.dart';
import 'MyOrder.dart';
import 'NotificationScreen.dart';
import 'OrderHistory.dart';
import 'Reports.dart';


var homelat;
var homeLong;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    callApi();
    getDriverProfile();
    _startTimer();
    getUserCurrentLocation();
  }

  double lat = 0.0;
  double long = 0.0;
  Position? currentLocation;
  String? _currentAddress;

  getUserCurrentLocation() async {
    var status = await Permission.location.request();
    print("location status ${status}");
    if (status.isDenied) {
      Fluttertoast.showToast(msg: "Permision is requiresd");
    } else if (status == PermissionStatus.granted) {
      print("workingggggg");
      await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high).then((position) {
        print("current location isss ${position.latitude}");
        if (mounted) {
          setState(() {
            currentLocation = position;
            print("current location isss ${currentLocation!.latitude}");
            homelat = currentLocation!.latitude;
            homeLong = currentLocation!.longitude;
            print("home lat long is $homeLong &&& $homelat");
          });
          addData();
        }
      });
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }

  void getPermission() async {
    if (await Permission.location.isGranted) {
      setState(() {
        // getLocation();
      });
    } else {
      Permission.location.request();
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
    print("praramete profile ${request.fields}");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final finalResult = GetProfileModel.fromJson(json.decode(finalResponse));
      print("responseeee $finalResult");
      setState(() {
        getProfileModel = finalResult;
      });
      // await serachProduct();
    }
    else {
      print(response.reasonPhrase);
    }
  }

  acceptOrder() async {
   SharedPreferences preferences = await SharedPreferences.getInstance();
   String? driverId = preferences.getString('driver_id');
   var headers = {
     'Cookie': 'ci_session=2e7eb172de38df61b69bc15417d07d1200bf17f2'
   };
   var request = http.MultipartRequest('POST', Uri.parse(ApiServicves.acceptBookings));
   request.fields.addAll({
     'id': selectedString.toString(),
     'status': '1',
     'driver_id': driverId.toString()
   });
   print("accept order paremeter ${request.fields}");
   request.headers.addAll(headers);
   http.StreamedResponse response = await request.send();
   if (response.statusCode == 200) {
     var finalResponse = await response.stream.bytesToString();
     final jsonresponse = json.decode(finalResponse);
     if (jsonresponse['error'] == false) {
       print("jhggggghhghhhgghghgh$finalResponse");
       Fluttertoast.showToast(msg: '${jsonresponse['message']}');
     } else {
       Fluttertoast.showToast(msg: "${jsonresponse['message']}");
     }
     getorder('');
   }
   else {
     print(response.reasonPhrase);
   }
 }

  GetOrdersModel? getorders;

  getorder(String? pName) async {
    var headers = {
      'Cookie': 'ci_session=c7d2b39c49dc5b58162745cb0cd59306be7f8893'
    };
    var request = http.MultipartRequest('POST', Uri.parse(ApiServicves.getOrders));
    request.fields.addAll({
      'lat': "22.7549629",
      'lang': "75.8622462",
       // "product_name":pName == "Food" ? "1":  pName== "conton" ? "2" :pName== "flower" ? "3" : "4"
    });
    print("get order parameter ${request.fields}");
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final finalResult = GetOrdersModel.fromJson(json.decode(finalResponse));
      print("responseeee $finalResult");
      setState(() {
        getorders = finalResult;
      });
      // await serachProduct();
    }
    else {
      print(response.reasonPhrase);
    }
  }


  Future<Null> _refresh() {
    return callApi();
  }

  Future<Null> callApi() async {
    getorder('');
    getDriverProfile();
  }

  // serachProduct(String? pName) async {
  //   var headers = {
  //     'Cookie': 'ci_session=c7d2b39c49dc5b58162745cb0cd59306be7f8893'
  //   };
  //   var request = http.MultipartRequest('POST', Uri.parse(ApiServicves.getOrders));
  //   request.fields.addAll({
  //     'lat': homeLong.toString(),
  //     'lang': homeLong.toString(),
  //     "product_name": pName.toString()
  //   });
  //   print("get order parameter ${request.fields}");
  //   request.headers.addAll(headers);
  //   http.StreamedResponse response = await request.send();
  //   if (response.statusCode == 200) {
  //     var finalResponse = await response.stream.bytesToString();
  //     final finalResult = GetOrdersModel.fromJson(json.decode(finalResponse));
  //     print("responseeee $finalResult");
  //     setState(() {
  //       getorders = finalResult;
  //     });
  //   }
  //   else {
  //     print(response.reasonPhrase);
  //   }
  // }

  // searcProduct(String value) {
  //   if (value.isEmpty) {
  //     getorder();
  //     setState(() {});
  //   } else {
  //     final suggestions = ordeData.where((element) {
  //       final leadsTitle = element...toLowerCase();
  //       final input = value.toLowerCase();
  //       return leadsTitle.contains(input);
  //     }).toList();
  //     ordeData = suggestions;
  //     setState(() {
  //     });
  //   }
  // }

  String title (){
    switch(index) {
      case 1:
        return 'My Orders';
      case 2:
        return 'Reports';
      case 3:
        return 'History';
      default:
        return 'Home';
    }
    // if(index==0){return 'Home';}
    // if(index==1){return 'My Orders';}
    // if(index==2){return 'Reports';}
    // else{return 'History';}
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey();
  String? kilometers;
  String? productName;
  String? productId;

  List<String> items = <String>[
    '5Km', '10Km', '15Km', '20Km', '25Km',
    '30Km', '35Km', '40Km', '45Km', '50Km',
    '55Km', '60Km', '65Km', '70Km', '75Km',
    '80Km', '85Km', '90Km', '95Km', '100Km'];

  List<String> items1 = <String>[
    "Food",
    "Conton",
    "Flower",
    "K Frazile"
  ];

  int index = 0;

  @override
  Widget build(BuildContext context) {
    int selected = 0;
    final itemList = List.generate(50, (index) => ItemsModel.items[0]);
    return Scaffold(
      extendBody: true,
        key: _key,
        appBar: AppBar(
          backgroundColor: const Color(0xFF112c48),
          title: Text(title(), style: const TextStyle(color:  Colors.white),),
          centerTitle: true,
          toolbarHeight: 60,
          elevation: 6,
          actions:  [
            Row(
              children: [
                Container(
                  height:35,
                    width: 35,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.white,
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => notificationScr()));
                      },
                        child: Icon(Icons.notifications, color: colors.secondary, size: 30)),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 5),
                  child: Container(
                    width: 40,
                    height: 40,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(40),
                        child: Image.network("${getProfileModel?.data?.first.profilePic}", fit: BoxFit.fill,)),
                  ),
                ),
              ],
            ),
          ],
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16))),
          leading: InkWell(
            onTap: () {
              _key.currentState!.openDrawer();
            },
            child: Container(
              height: 35,
              width: 39,
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.white,
              ),
              child: Image.asset("assets/images/menu bar.png")
            ),
          ),
        ),
        drawer: getDrawer(context),
        bottomNavigationBar:  CurvedNavigationBar(
          index: index,
          onTap:(index){
            setState(() {
              this.index = index;
            });
          },
          backgroundColor: Colors.transparent,
          color: const Color(0xFF112c48),
          items:const [
            CurvedNavigationBarItem(label: "Home", labelStyle: TextStyle(color: Colors.white),child: Icon(Icons.home, color: colors.white,),),
            CurvedNavigationBarItem(label: "My Orders", labelStyle: TextStyle(color: Colors.white),child: Icon(Icons.list_alt, color: colors.white),),
            CurvedNavigationBarItem(label: "Reports", labelStyle: TextStyle(color: Colors.white),child: Icon(Icons.receipt, color: colors.white),),
            CurvedNavigationBarItem(label: "History", labelStyle: TextStyle(color: Colors.white),child: Icon(Icons.history, color: colors.white),),
          ],
        ),
        backgroundColor: const Color(0xFFe2ebfe),
        body: index == 0?
        RefreshIndicator(
          onRefresh: _refresh,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width/1.6,
                    decoration: BoxDecoration(
                        color: colors.white,
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 2,
                              offset: Offset(0, 1))
                        ]),
                     child: Center(
                      child: DropdownButtonFormField<String>(
                        value: productName,
                        // hint: Icon(Icons.arrow_drop_down_outlined),
                        onChanged: (String? newValue) {
                          setState(() {
                            productName = newValue!;
                            print("product name is $productName");
                            getorder(productName);
                          });
                        },
                        items: items1.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.only(bottom: 5, left: 5),
                          border: InputBorder.none,
                          hintText: 'Sort by "Product Name"',
                          hintStyle: TextStyle(color: colors.black, fontSize: 15, fontWeight: FontWeight.w500),
                          filled: true,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child:
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                              color: const Color(0xFF112c48),
                              borderRadius: BorderRadius.circular(4),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 2,
                                    offset: Offset(0, 1))
                              ]),
                          child: Center(
                            child: DropdownButtonFormField<String>(
                              value: kilometers,
                              // hint: Icon(Icons.arrow_drop_down_outlined),
                              onChanged: (String? newValue) {
                                setState(() {
                                  kilometers = newValue!;
                                });
                              },
                              items: items.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              decoration: const InputDecoration(
                                contentPadding: EdgeInsets.only(bottom: 5, left: 5),
                                border: InputBorder.none,
                                hintText: 'Sort by "under 10Km"',
                                hintStyle: TextStyle(color: colors.white, fontSize: 15, fontWeight: FontWeight.w500),
                                filled: true,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          acceptOrder();
                        },
                        child: Expanded(
                          child: Container(
                            height: 40,
                            width: 120,
                            decoration: BoxDecoration(
                                color: const Color(0xFF3a9f3e),
                                borderRadius: BorderRadius.circular(4),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 2,
                                      offset: Offset(0, 1),
                                  ),
                                ]),
                            child: const Center(
                                child: Text(
                                  "Accept Order",
                                  style: TextStyle(color: Colors.white, fontSize: 19),
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
                    "Choose Your Order",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  getorders?.error == true ? Text("Not Found", style: TextStyle(fontSize: 20, color: colors.primary),) :
                      getorders?.data?.length== null || getorders?.data?.length == "" ? Center(child: CircularProgressIndicator(color: colors.primary,)):
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: getorders?.data?.length ?? 0,
                      itemBuilder: (context, i) {
                        return getorders?.data?.length == null || getorders?.data?.length == "" ? const CircularProgressIndicator(color: colors.primary,):
                          orderdata(i);
                          // ItemWidget(item: itemList[i]);
                      }),
                ],
              ),
            ),
          ),
        ): index == 1? MyOrders() : index == 2 ?  Reports() : History()
    );
  }

  int selectedBox = 0;

  var isselected;

List selectNew = [];
var selectedString = "";

void listToString() {
  selectedString="";
  for(int i =0;i<selectNew.length;i++){
    if(i==0){
      selectedString = selectNew[i];
    }else{
      selectedString = "$selectedString,"+selectNew[i];
    }
  }
  print("tap is herer${selectedString}");
}

  bool _isChecked = false;
  orderdata(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 95,
        // leading: Image.network(item.image),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(color: Color(0xFF112c48), offset: Offset(6, 0))
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 90,
                width: 80,
                child: Image.network("https://developmentalphawizz.com/hojayega/uploads/profile_pics/${getorders?.data?[index].productImage}"),
              ),
              Column(
                children: [
                  const SizedBox(height: 4,),
                  Row(
                    children: [
                      Text(
                        "${getorders?.data?[index].time}".replaceAll('From', ""),
                        style: const TextStyle(color: colors.red),
                      ),
                      // Text(
                      //   "${getorders?.data?[index].toTime}",
                      //   style: const TextStyle(color: colors.red),
                      // ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        double.parse("${getorders?.data?[index].distance}").toStringAsFixed(2)+" KM", overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: colors.red),
                      ),
                    ],
                  ),
                  const SizedBox(height: 7,),
                   Text("${getorders?.data?[index].orderType}",style: TextStyle(fontWeight: FontWeight.w700)),
                  const SizedBox(height: 7),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("assets/images/location.png", color: colors.red, scale: 1.8),
                      Container(
                        width: 140,
                          child: Text("${getorders?.data?[index].deliveredAddress}", overflow: TextOverflow.ellipsis, maxLines: 1,)),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     Image.asset("assets/images/location.png", color: colors.red, scale: 1.8,),
                      Container(
                          width: 140,
                          child: Text("${getorders?.data?[index].pickupAddress}")),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          _isChecked= !_isChecked;
                      //  if(selectNew.contains(getorders?.data?[index].id.toString())) {
                      //  selectNew.remove(getorders?.data?[index].id.toString());
                      // print("true  ${selectNew[index]['id']}");
                      // }else {
                      // selectNew.add(getorders?.data?[index].id.toString());
                      // print("false  ${selectNew[index]['id'].toString()}");
                      // }
                          if(selectNew.contains(getorders!.data?[index].orderId.toString())){
                            selectNew.remove(getorders?.data?[index].orderId.toString());
                          }else{
                            selectNew.add(getorders?.data?[index].orderId.toString());
                          }
                        });
                        listToString();
                        setState(() {});
                      },
                      child: Icon(
                        selectNew.contains(getorders?.data?[index].orderId.toString())
                            ? Icons.check_box_outlined
                            : Icons.check_box_outline_blank,
                        color: colors.secondary,
                        size: 30,
                      ),
                    ),
                    // Checkbox(
                    //   side: const BorderSide(
                    //     // set border color here
                    //     color: colors.primary,
                    //   ),
                    //   activeColor: colors.secondary,
                    //   value: _isChecked,
                    //   onChanged: (newValue) {
                    //     setState(() {
                    //       _isChecked = newValue!;
                    //     });
                    //   },
                    // ),
                    getorders?.data?[index].vehicleType == "1" ?
                    Image.asset("assets/images/bike.png", scale: 1.7):
                    getorders?.data?[index].vehicleType == "2" ?
                    Image.asset("assets/images/electricbike.png",scale: 1.3):
                    getorders?.data?[index].vehicleType == "3" ?
                    Image.asset("assets/images/car.png", scale: 1.7):
                    getorders?.data?[index].vehicleType == "4" ?
                    Image.asset("assets/images/taxi.png",scale: 1.3):
                    getorders?.data?[index].vehicleType == "5" ?
                    Image.asset("assets/images/truck.png",scale: 1.7) : const SizedBox(height: 10,),
                    getorders?.data?[index].total == null || getorders?.data?[index].total == "" ? const Text('₹ 0.0'):
                    Text("₹ ${getorders?.data?[index].total}")
                  ],
                ),
              ),
            ],
          ),
      ),
    );
  }


  List<String> tList = [
    'Profile',
    'Earning',
    'Incentive',
    'COD Report',
    'Order History',
    'Login Duration/My Shift',
    'Invite a Friend',
    'Customer Support',
    'Help',
    'Setting',
    'Logout'
  ];


  List<IconData> IList = [
    Icons.home,
    Icons.shopping_bag_rounded,
    Icons.store,
    Icons.person_2_outlined,
    Icons.data_thresholding,
    Icons.wallet,
    Icons.person_add_alt_sharp,
    Icons.support_agent,
    Icons.help,
    Icons.settings,
    Icons.logout
  ];


  List<String> imagePath = [
    'assets/images/Profile.png',
    'assets/images/Earnings.png',
    'assets/images/Incentive.png',
    'assets/images/COD Report.png',
    'assets/images/Order History.png',
    'assets/images/Login Duration - My Shift.png',
    'assets/images/Invite a Friend.png',
    'assets/images/Customer Support.png',
    'assets/images/help.png',
    'assets/images/Settings.png',
    'assets/images/Logout.png',
  ];


  getDrawer(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Container(
          child: ListView(
            padding: EdgeInsets.all(0),
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
                child: DrawerHeader(
                    decoration: BoxDecoration(
                      color: Color(0xFF112c48),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                              child: Image.network("${getProfileModel?.data?.first.profilePic}", fit: BoxFit.fill,)),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Hello!',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                            getProfileModel?.data?.first.name == null || getProfileModel?.data?.first.name == "" ? const Text(
                              'Demo',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ):
                            Text(
                              '${getProfileModel?.data?.first.name}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                            const Text(
                              'Online',
                              style: TextStyle(fontSize: 12,color: Colors.white),
                            ),
                          ],
                        )
                      ],
                    )),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: tList.length,
                itemBuilder: (context, index) {
                  return
                    tileList(
                        icon: IList[index], title: tList[index], index: index);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> addData() async {
    try {
      await FirebaseFirestore.instance.collection("driverlocation").doc('$driver_id').set(
          {'lat': homelat, 'long': homeLong,  'id':'$driver_id'});
    } catch (e) {
      print('Error adding data: $e');
    }
  }

  String? driver_id;
  late Timer _timer;
  void _startTimer() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    driver_id = prefs.getString('driver_id');
    _timer = Timer.periodic(Duration(seconds: 10), (timer) async {
      await getUserCurrentLocation();
    });
  }

  CollectionReference collectionRef = FirebaseFirestore.instance.collection("driverlocation");

 int selected = 0;
  Widget tileList({required String title, required IconData icon, required int index}) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
      onTap: () {
        setState(() {
          selected = index;
        });
        if (selected==0) {
          Navigator.push(
            context, MaterialPageRoute(
                builder: (context) => MyProfile()
            ),
          );
        }
        else if(selected==1){
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Earning()
            ),
          );
        }
        else if(selected==2){
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Incentive()
            ),
          );
        }
        else if(selected==3){
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CodReport()
            ),
          );
        }
        else if(selected==4){
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => OrderHistory()
            ),
          );
        }else if(selected==5){
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => OrderHistory()
            ),
          );
        }else if(selected==6){
          share();
        }
        else if(selected==7){
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CustomerSupport()
            ),
          );
        }
        else if(selected==8){
          // logout(context);
        }
        else if(selected==9){
          logout(context);
        }
      },
      leading: Container(
          margin: EdgeInsets.all(12),
          padding: EdgeInsets.all(7),
          decoration: BoxDecoration(
              color: selected == index ? Colors.white : const Color(0xFF112c48),
              borderRadius: BorderRadius.circular(5),
          ),
          child: Image(image: AssetImage(imagePath[index])),
        // Icon(
        //   icon,
        //   color: selected == index ? Color(0xFF112c48) : Colors.white,
        //   size: 18,
        // ),
      ),
      tileColor: selected == index ? const Color(0xFF112c48) : Colors.white,
      minLeadingWidth: 20,
      title: Text(
        title, style: TextStyle(
            fontSize: 14,
            color: selected == index ? Colors.white : Colors.black),
      ),
    );
  }
}

 logout(context) async {
  return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Confirm Sign Out"),
            content: const Text("Are you sure to log out?"),
            actions: <Widget>[
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: colors.primary),
                child: Text("YES"),
                onPressed: () async {
                  // setState(() {
                  //   removesession();
                  // });
                  Navigator.pop(context);
                  // SystemNavigator.pop();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ));
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: colors.primary),
                child: const Text("NO"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
}

class Item {
  final String productName;
  final String time;
  final String distance;
  final String address1;
  final String address2;
  final num price;
  final String image;
  Item(
      {required this.productName,
        required this.time,
        required this.distance,
        required this.address1,
        required this.address2,
        required this.price,
        required this.image});
}

class ItemWidget extends StatefulWidget {
  final Item item;
  const ItemWidget({Key? key, required this.item}) : super(key: key);

  @override
  State<ItemWidget> createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      // leading: Image.network(item.image),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
              BoxShadow(color: Color(0xFF112c48), offset: Offset(6, 0))
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(),
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      widget.item.time,
                      style: const TextStyle(color: Colors.red),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(widget.item.distance)
                  ],
                ),
                Text(widget.item.productName),
                Row(
                  children: [
                    const Icon(
                      Icons.pin_drop_outlined,
                      color: Colors.red,
                      size: 18,
                    ),
                    Text(widget.item.address1),
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.pin_drop_outlined,
                      color: Colors.red,
                      size: 18,
                    ),
                    Text(widget.item.address2),
                  ],
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                    value: isChecked,
                    onChanged: (bool? val) {
                      setState(() {
                        isChecked = val!;
                      });
                    }),
                const Icon(
                  Icons.directions_bike,
                  color: Colors.blue,
                ),
                Text("\$${widget.item.price}")
              ],
            ),
          ],
        ));
  }
}


Future<void> share() async {
  await FlutterShare.share(
      title: 'HoJayega',
      // text: 'Example share text',
      linkUrl: 'https://developmentalphawizz.com/dr_booking/',
      chooserTitle: 'HoJayega');
}

class ItemsModel {
  static final items = [
    Item(
        productName: "Pizza",
        time: "12:00 PM",
        distance: "3 KM",
        address1: "Vijay Nagar Indore to",
        address2: "Geeta Bhawan Indore",
        price: 200,
        image: "image")
  ];
}

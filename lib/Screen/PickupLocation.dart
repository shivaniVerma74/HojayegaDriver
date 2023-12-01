import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hojayegadriverapp/Screen/PickupLocationNew.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../Helper/api.path.dart';
import '../Helper/color.dart';
import '../Model/GetPlaceOrdersModel.dart';

class PickupLocvation extends StatefulWidget {
  const PickupLocvation({Key? key}) : super(key: key);

  @override
  State<PickupLocvation> createState() => _PickupLocvationState();
}

class _PickupLocvationState extends State<PickupLocvation> {


  @override
  void initState() {
    /// add origin marker origin marker
    _addMarker(
      LatLng(_originLatitude, _originLongitude),
      "origin",
      BitmapDescriptor.defaultMarker,
    );

    // Add destination marker
    _addMarker(
      LatLng(_destLatitude, _destLongitude),
      "destination",
      BitmapDescriptor.defaultMarkerWithHue(90),
    );

    _getPolyline();
    super.initState();
  }

  // Starting point latitude
  double _originLatitude = 22.7500894;
// Starting point longitude
  double _originLongitude = 75.9001985;
// Destination latitude
  double _destLatitude = 22.6929493;
// Destination Longitude
  double _destLongitude = 75.862354;
// Markers to show points on the map
  Map<MarkerId, Marker> markers = {};

  PolylinePoints polylinePoints = PolylinePoints();
  Map<PolylineId, Polyline> polylines = {};

  // Google Maps controller
  Completer<GoogleMapController> _controller = Completer();
  // Configure map position and zoom
  static final CameraPosition _kGooglePlex = const CameraPosition(
    target: LatLng(22.7500894, 75.9001985),
    zoom: 12,
  );


  _addMarker(LatLng position, String id, BitmapDescriptor descriptor) {
    MarkerId markerId = MarkerId(id);
    Marker marker =
    Marker(markerId: markerId, icon: descriptor, position: position);
    markers[markerId] = marker;
  }

  _addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      points: polylineCoordinates,
      width: 8,
    );
    polylines[id] = polyline;
    setState(() {});
  }

  void _getPolyline() async {
    List<LatLng> polylineCoordinates = [];
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      "AIzaSyCKLIBoAca5ptn9A_1UCHNNrtzI81w2KRk",
      PointLatLng(_originLatitude, _originLongitude),
      PointLatLng(_destLatitude, _destLongitude),
      travelMode: TravelMode.driving,
    );
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }
    _addPolyLine(polylineCoordinates);
  }

  String? driver_id;
  GetPlaceOrdersModel? placeOrdersModel;
  placeOrder() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    driver_id = prefs.getString('driver_id');
    var headers = {
      'Cookie': 'ci_session=d8459342063575db9be8014dc1903802af731b37'
    };
    var request = http.MultipartRequest('POST', Uri.parse(ApiServicves.getPlaceOrder));
    request.fields.addAll({
      'id': driver_id.toString()
    });
    request.headers.addAll(headers);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var finalResponse = await response.stream.bytesToString();
      final finalResult = GetPlaceOrdersModel.fromJson(json.decode(finalResponse));
      print("responseeee in pickup location$finalResponse");
      setState(() {
        placeOrdersModel = finalResult;
      });
    }
    else {
      print(response.reasonPhrase);
    }
  }


  TextEditingController addressCtr = TextEditingController();
  TextEditingController monbileCtr = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF112c48),
        title: const Text("Pickup Location", style: TextStyle(color:  Colors.white),),
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
        body: SingleChildScrollView(
          child: Column(
          children: [
            Container(
              height: 400,
             child: GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            myLocationEnabled: true,
            tiltGesturesEnabled: true,
            compassEnabled: true,
            scrollGesturesEnabled: true,
            zoomGesturesEnabled: true,
            polylines: Set<Polyline>.of(polylines.values),
            markers: Set<Marker>.of(markers.values),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
           ),
          ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 10),
                  child: Row(
                      children:  [
                      Image.asset("assets/images/location.png", scale: 1.5,),
                       SizedBox(width: 10,),
                       const Center(
                         child: Text("Address:", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 19))
                       ),
                        SizedBox(width: 10,),
                       Container(
                         width: 150,
                         child: TextFormField(
                           controller: addressCtr,
                           decoration:  InputDecoration(
                             border: UnderlineInputBorder(),
                             hintText: '${placeOrdersModel?.data?.first.pickupLocation}',
                             hintStyle: TextStyle(fontWeight: FontWeight.bold, color: colors.black),
                             labelText: '',
                           ),
                         ),
                       ),
                    ],
                  ),
                ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children:  [
                    Icon(Icons.call, color: colors.secondary, size: 30,),
                    SizedBox(width: 10),
                    const Center(
                        child: Text("Mobile:", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 19))
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 150,
                      child: TextFormField(
                        controller: monbileCtr,
                        decoration:  InputDecoration(
                          border: const UnderlineInputBorder(),
                          hintText: '${placeOrdersModel?.data?.first.pickupNumber}',
                          hintStyle: const TextStyle(fontWeight: FontWeight.bold, color: colors.black),
                          labelText: '',
                        ),
                      ),
                    ),
                  ],
                 ),
                ),
               ],
              ),
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => PickUpLocationNew()));
              },
              child: Container(
                height: 40,
                width: 100,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: colors.yellow),
                child: Center(child: Text("Reached", style: TextStyle(fontWeight: FontWeight.bold, color: colors.white, fontSize: 19),)) ,),
             ),
             ],
           ),
        ),
    );
  }
}

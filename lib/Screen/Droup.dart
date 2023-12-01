import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../Helper/color.dart';

class Droup extends StatefulWidget {
  const Droup({Key? key}) : super(key: key);

  @override
  State<Droup> createState() => _DroupState();
}

class _DroupState extends State<Droup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF112c48),
          title: const Text("Drop Location", style: TextStyle(color:  Colors.white),),
          centerTitle: true,
          toolbarHeight: 60,
          elevation: 6,
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                    Icons.person,
                    color: Color(0xFF3a9f3e)),
              ),
            ),
          ],
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
                child: Icon(Icons.arrow_back, color: colors.primary,)
            ),
          ),
        ),
       body: Column(
        children: [
          _mapLocation(context),
      ],
      ),
    );
  }

  GoogleMapController? mapController; //contrller for Google map
  Set<Marker> markers = Set();
  LatLng showLocation = LatLng(26.9351975, 75.7915031);

  Widget _mapLocation(BuildContext context) {
    return Container(
      height: 380,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        zoomGesturesEnabled: true,
        initialCameraPosition: CameraPosition(
          target: showLocation,
          zoom: 10.0,
        ),
        markers: markers,
        mapType: MapType.normal,
        onMapCreated: (controller) {
          setState(() {
            mapController = controller;
          });
        },
      ),
    );
  }
}

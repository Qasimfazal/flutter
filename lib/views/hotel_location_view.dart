import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sould_food_guide/model/hotels/content/Hotels.dart';
import 'package:sould_food_guide/util/Util.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HotelLocationView extends StatefulWidget {
  final Hotels data;

  HotelLocationView(this.data);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<HotelLocationView> {
  GoogleMapController myMapController;
  final Set<Marker> _markers = new Set();
  LatLng _mainLocation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _mainLocation = LatLng(
        widget.data.coordinates.latitude, widget.data.coordinates.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _mainLocation,
              zoom: 10.0,
            ),
            markers: this.myMarker(),
            mapType: MapType.none,
            onMapCreated: (controller) {
              setState(() {
                myMapController = controller;
              });
            },
          ),
        ),
      ],
    ));
  }

  Set<Marker> myMarker() {
    setState(() {
      _markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(_mainLocation.toString()),
        position: _mainLocation,
        infoWindow: InfoWindow(),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });

    return _markers;
  }
}

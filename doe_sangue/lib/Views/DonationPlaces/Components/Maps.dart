import 'dart:async';

import 'package:doe_sangue/Views/DonationPlaces/DonationPlaces.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class Maps extends State<DonationPlaces> {
  Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center = const LatLng(-25.4290, -49.2671);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
        ),
      ),
    );
  }
}
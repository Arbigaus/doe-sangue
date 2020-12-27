import 'dart:async';
import 'dart:collection';

import 'package:doe_sangue/Models/BloodBank.dart';
import 'package:doe_sangue/Provider/BloodBanks.dart';
import 'package:doe_sangue/Views/DonationPlaces/DonationPlaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class Maps extends State<DonationPlaces> {
  List<BloodBank> bankList;

  // Maps
  Set<Marker> _markers = HashSet<Marker>();
  List<LatLng> polygonLatLngs = List<LatLng>();

  int _markerIdCounter = 1;

  Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center = const LatLng(-25.4290, -49.2671);

  setMarkers() async {
    bankList = Provider.of<BloodBanks>(context, listen: false).getBankList();

    bankList.forEach((bank) {
      LatLng latLng = LatLng(
          double.parse(bank.lat),
          double.parse(bank.long)
      );
      _setMarkers(latLng);
    });
  }

  void _setMarkers(LatLng point) {
    final String markerIdVal = 'marker_id_$_markerIdCounter';
    _markerIdCounter++;
    setState(() {
      _markers.add(
        Marker(markerId: MarkerId(markerIdVal),
        position: point
        ),
      );
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    setMarkers();

    return MaterialApp(
      home: Scaffold(
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          markers: _markers,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
        ),
      ),
    );
  }
}
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CityMap extends StatelessWidget {

  final Completer<GoogleMapController> _controller = Completer();

  static const LatLng _center = const LatLng(30.2672, -97.7431);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Austin City Limits'),
        backgroundColor: Colors.green[700],
      ),
      body: SafeArea(
        child: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
          markers: {
            Marker(
              markerId: MarkerId('testMarker'),
              position: LatLng(30.265433, -97.733376),
              infoWindow: InfoWindow(
                title: 'Info Window Title'
              ),
            )
          },
        ),
      ),
    );
  }
}
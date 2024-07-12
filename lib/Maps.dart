import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class GoogleMapScreen extends StatefulWidget {
  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {

  Set<Marker> _markers = Set<Marker>();
  Completer<GoogleMapController> mapController=Completer();

  @override
  Widget build(BuildContext context) {

    LatLng coordinates = LatLng(33.69242559349144, 73.03441333891286);
    Marker marker = Marker(
      markerId: MarkerId('sameLocationMarker'),
      position: coordinates,
    );
    _markers.add(marker);
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Map'),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(33.691101, 73.032949),// Coordinates of Pakistan
          zoom: 10.0,
        ),
        markers: _markers,
        compassEnabled: true,
        myLocationButtonEnabled: true,
        onMapCreated: (GoogleMapController controller)
        {
          mapController.complete(controller);

        },
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsView extends StatefulWidget {
  @override
  _GoogleMapsView createState() => _GoogleMapsView();
}

class _GoogleMapsView extends State<GoogleMapsView> {
  static const CameraPosition _kLake = CameraPosition(
      target: LatLng(40.43296265331129, 29.08832357078792),
      zoom: 19.151926040649414);
  GoogleMapController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        markers: _createMarker(),
        onMapCreated: (map) {
          controller = map;
          controller.animateCamera(
            CameraUpdate.newLatLng(
              const LatLng(30, 50),
            ),
          );
        },
        initialCameraPosition: const CameraPosition(
          target: LatLng(12, 13),
          zoom: 1,
        ),
      ),
    );
  }

  Set<Marker> _createMarker() {
    return <Marker>{
      Marker(
        markerId: const MarkerId('adsfsad'),
        position: _kLake.target,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      ),
    };
  }
}

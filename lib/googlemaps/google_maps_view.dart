import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsView extends StatefulWidget {
  @override
  _GoogleMapsView createState() => _GoogleMapsView();
}

class _GoogleMapsView extends State<GoogleMapsView> {
  static const CameraPosition _kLake =
      CameraPosition(target: LatLng(41.015137, 28.979530), zoom: 10);
  GoogleMapController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        //   markers: _createMarker(),
        onMapCreated: (map) {
          controller = map;
          // controller.animateCamera(
          //   CameraUpdate.newLatLng(
          //     const LatLng(30, 50),
          //   ),
          // );
        },
        initialCameraPosition: _kLake,
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

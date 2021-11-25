import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hey_istanbullum/controllers/map_controller.dart';

class GoogleMapsView extends StatefulWidget {
  @override
  _GoogleMapsView createState() => _GoogleMapsView();
}

class _GoogleMapsView extends State<GoogleMapsView> {
  static const CameraPosition _kLake =
      CameraPosition(target: LatLng(41.015137, 28.979530), zoom: 10);
  GoogleMapController controller;
  MapController mapController = Get.find();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        //onCameraMove: (map) {
        //  print(map.target);
        // print('object');
        //},
        mapType: MapType.normal,
        onMapCreated: (map) {
          controller = map;
        },
        initialCameraPosition: CameraPosition(
            target: LatLng(mapController.position.latitude,
                mapController.position.longitude),
            zoom: 10),
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hey_istanbullum/controllers/location_list_controller.dart';
import 'package:hey_istanbullum/controllers/map_controller.dart';

class GoogleMapsView extends StatefulWidget {
  @override
  _GoogleMapsView createState() => _GoogleMapsView();
}

class _GoogleMapsView extends State<GoogleMapsView> {
  static const CameraPosition _kLake =
      CameraPosition(target: LatLng(41.015137, 28.979530), zoom: 10);
  LocationListController locationListController = Get.find();
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
        markers: _createMarker(),
        initialCameraPosition: CameraPosition(
            target: LatLng(mapController.position.latitude,
                mapController.position.longitude),
            zoom: 10),
      ),
    );
  }

  Set<Marker> _createMarker() {
    print('object');
    return locationListController.isparkList
        .map(
          (e) => Marker(
              markerId: MarkerId(
                e.guid.toString(),
              ),
              position: LatLng(
                double.parse(e.lat),
                double.parse(e.lon),
              ),
              zIndex: 10,
              infoWindow: InfoWindow(title: e.adi)),
        )
        .toSet();
  }
}

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hey_istanbullum/controllers/main_controller.dart';

class GoogleMapsView extends StatefulWidget {
  @override
  _GoogleMapsView createState() => _GoogleMapsView();
}

class _GoogleMapsView extends State<GoogleMapsView> {
  static const CameraPosition _kLake =
      CameraPosition(target: LatLng(41.015137, 28.979530), zoom: 10);
  GoogleMapController controller;
  MapController mapController = Get.find();
  LatLng latLng = LatLng(10, 20);
  ScreenCoordinate screenCoordinate;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // floatingActionButton: FloatingActionButton(
      //     backgroundColor: Colors.transparent,
      //     focusColor: Colors.transparent,
      //     hoverColor: Colors.transparent,
      //     splashColor: Colors.transparent,
      //     foregroundColor: Colors.transparent,
      //     onPressed: () {
      //       controller.getLatLng(screenCoordinate);
      //       controller.getScreenCoordinate(latLng);
      //       print(latLng);
      //       print(screenCoordinate);
      //       controller.animateCamera(
      //         CameraUpdate.newLatLng(
      //           LatLng(
      //             mapController.position.latitude,
      //             mapController.position.longitude,
      //           ),
      //         ),
      //       );
      //     }),
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

import 'package:flutter/material.dart';
import 'package:hey_istanbullum/globals/widgets/app_bar.dart';
import 'package:hey_istanbullum/googlemaps/google_maps_view.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar('Hey Istanbul'),
      body: GoogleMapsView(),
    );
  }
}

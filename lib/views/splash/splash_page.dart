import 'package:flutter/material.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:hey_istanbullum/controllers/map_controller.dart';
import 'package:hey_istanbullum/services/fetch.dart';
import 'package:hey_istanbullum/views/login/login_view.dart';
import 'package:hey_istanbullum/views/mainPage/main_page.dart';

class SplashPage extends StatefulWidget {
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashPage> with TickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  final double _currentOpacity = 0.5;
  FetchData f = FetchData();
  double opacityLevel = 0;
  MapController mapController = Get.put(MapController());
  @override
  Widget build(BuildContext context) {
    return initScreen(context);
  }

  @override
  initState() {
    super.initState();
    startTimer();

    _controller = AnimationController(
        duration: const Duration(milliseconds: 5000), vsync: this, value: 0.1);
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);

    _controller.forward();
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  startTimer() async {
    mapController.determinePosition().then((value) {
      if (mapController.isUserInIstanbul) {
        Get.to(LoginView());
      }
    });
  }

  initScreen(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ScaleTransition(
              scale: _animation,
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/logo.png",
                  ),
                ],
              ),
            ),
            AnimatedOpacity(
              curve: Curves.linear,
              opacity: _currentOpacity,
              duration: const Duration(seconds: 5),
            ),
          ],
        ),
      ),
    );
  }
}

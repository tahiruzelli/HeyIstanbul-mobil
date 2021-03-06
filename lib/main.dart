import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hey_istanbullum/views/splash/splash_page.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hey Istanbul',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: SplashPage(),
    );
  }
}

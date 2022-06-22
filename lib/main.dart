import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Bindings/initialBinding.dart';
import 'View/HomePage/homePage.view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Desafio Compart',
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBinding(),
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.grey,
          primaryColor: Colors.black26,
          fontFamily: 'Bahnschrift',
          cardColor: Colors.black12),
      home: HomePage(),
    );
  }
}

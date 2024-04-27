import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:main_page/controllers/links_controller.dart';
import 'my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter page',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'My Home Page'),
      initialBinding: BindingsBuilder(() {
        Get.put(LinksController());
      }),
    );
  }
}

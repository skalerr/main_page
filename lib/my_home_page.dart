import 'package:flutter/material.dart';
import 'package:main_page/widgets/cards.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CardGrid(),
      ),
    );
  }
}

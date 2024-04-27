import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:main_page/controllers/links_controller.dart';
import 'package:url_launcher/url_launcher.dart';

import 'card_item.dart';

class CardGrid extends StatelessWidget {
  CardGrid({super.key});

  final LinksController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Align(
        alignment: Alignment.center,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: _calculateCrossAxisCount(context),
          ),
          itemBuilder: (context, index) {
            final item = controller.links[index];
            return GestureDetector(
              onTap: () => _launchURL(item.link),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: CardItem(
                  icon: item.icon,
                  title: item.name,
                  subtitle: item.link,
                ),
              ),
            );
          },
          itemCount: controller.links.length,
        ),
      ),
    );
  }

  int _calculateCrossAxisCount(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount = (screenWidth / 200).floor();
    return crossAxisCount > 1 ? crossAxisCount : 1;
  }

  // Функция для открытия ссылки
  void _launchURL(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Невозможно открыть ссылку: $url';
    }
  }
}

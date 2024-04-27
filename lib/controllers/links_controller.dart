import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LinksController extends GetxController {
  List<Link> links = [
    Link(
      link: "https://vault.letsbe.fun/",
      name: "Vault",
      icon: Icons.shield,
    ),
    Link(
        link: "https://port.letsbe.fun/",
        name: "Portainer",
        icon: Icons.settings_ethernet),
    Link(
        link: "https://jenkins.letsbe.fun/",
        name: "Jenkins",
        icon: Icons.home_repair_service),
  ].obs;
}

class Link {
  Link({
    required this.link,
    required this.name,
    required this.icon,
  });

  String name;

  String link;

  IconData icon;
}

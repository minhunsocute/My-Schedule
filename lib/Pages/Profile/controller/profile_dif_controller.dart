import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileDiffControlelr extends GetxController {
  final checkTab = 0.obs;
  List<Map<String, dynamic>> listBasicData = [
    {
      'title': 'Follower',
      'data': 100,
    },
    {
      'title': 'Following',
      'data': 140,
    },
    {
      'title': 'Projects',
      'data': 200,
    }
  ];
  List<Map<String, dynamic>> listPageIcon = [
    {
      'icon': Icons.bar_chart,
      'check': 0,
    },
    {
      'icon': Icons.file_copy,
      'check': 1,
    }
  ];
  PageController? pageController = PageController();
  // final controller = Get.put()
  void switchPage(int index) {
    pageController!.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.easeIn);
  }
}

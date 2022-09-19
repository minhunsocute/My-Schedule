import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../../Templates/Misc/color.dart';
import '../Controller/dashboard_controller.dart';
import 'home_screen.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen>
    with SingleTickerProviderStateMixin {
  final _dashBoardScreenC = Get.find<DashBoardC>();
  final Duration animDuration = const Duration(seconds: 2);
  bool isLoading = false;

  final List<Widget> listPage = [
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ];

  bool isPressButton = false;

  Future<Widget> refreshPage() async {
    final result =
        await Future<Widget>.value(listPage[_dashBoardScreenC.tabIndex.value]);
    return result;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.mainColor,
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              return snapshot.data as Widget;
            }
          }
          return const Center(child: CircularProgressIndicator());
        },
        future: refreshPage(),
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.withOpacity(0.3),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: GNav(
            onTabChange: (value) {
              setState(() {
                _dashBoardScreenC.tabIndex.value = value;
              });
            },
            color: Colors.black,
            activeColor: AppColors.primaryColor,
            gap: 8,
            padding: const EdgeInsets.all(10),
            tabBackgroundColor: Colors.grey.withOpacity(0.2),
            tabBorderRadius: 5,
            textStyle: const TextStyle(
                fontWeight: FontWeight.bold, color: AppColors.primaryColor),
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Home',
                iconColor: Colors.white,
              ),
              GButton(
                icon: Icons.calendar_month,
                text: 'Schedule',
                iconColor: Colors.white,
              ),
              GButton(
                icon: Icons.confirmation_num,
                text: 'Money',
                iconColor: Colors.white,
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
                iconColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

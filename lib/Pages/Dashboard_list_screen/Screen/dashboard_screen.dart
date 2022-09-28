import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:my_schedule/Pages/Messenger/screen/main_message_screen.dart';
import 'package:my_schedule/Pages/Task_project_manager/screen/task_project_screen.dart';

import '../../../Templates/Misc/color.dart';
import '../Controller/dashboard_controller.dart';
import 'calender_screen.dart';
import 'home_screen.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen>
    with SingleTickerProviderStateMixin {
  final _dashBoardScreenC = Get.find<DashBoardC>();
  // final Duration animDuration = const Duration(seconds: 2);
  bool isLoading = false;
  late PageController _pageController = PageController();

  final List<Widget> listPage = [
    const HomeScreen(),
    CalenderScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ];
  int _page = 0;

  bool isPressButton = false;

  // Future<Widget> refreshPage() async {
  //   final result =
  //       await Future<Widget>.value(listPage[_dashBoardScreenC.tabIndex.value]);
  //   return result;
  // }

  void NavigatorTapped(int val) {
    _pageController.jumpToPage(val);
    setState(() {
      _page = val;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
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
      body: PageView(
        controller: _pageController,
        children: [
          const HomeScreen(),
          CalenderScreen(),
          TaskProjectScreen(),
          MainMessageScreen(),
          const HomeScreen(),
        ],
      ),

      //  FutureBuilder(
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.done) {
      //       if (snapshot.hasData) {
      //         return snapshot.data as Widget;
      //       }
      //     }
      //     return const Center(child: CircularProgressIndicator());
      //   },
      //   // future: refreshPage(),
      // ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: Colors.grey),
          color: Colors.black,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child: GNav(
            onTabChange: (value) {
              NavigatorTapped(value);
            },
            color: Colors.black,
            activeColor: AppColors.primaryColor,
            gap: 8,
            padding: const EdgeInsets.all(10),
            tabBackgroundColor: Colors.grey.withOpacity(0.2),
            tabBorderRadius: 5,
            textStyle: const TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
              fontFamily: 'Montserrat',
            ),
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
                icon: Icons.task,
                text: 'Task',
                iconColor: Colors.white,
              ),
              GButton(
                icon: Icons.send,
                text: 'Message',
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

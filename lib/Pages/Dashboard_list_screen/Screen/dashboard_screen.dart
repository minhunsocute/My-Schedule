import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:my_schedule/Pages/Messenger/screen/main_message_screen.dart';
import 'package:my_schedule/Pages/Profile/screen/profile_screen.dart';
import 'package:my_schedule/Pages/Task_project_manager/screen/task_project_screen.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
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
  int _bottomNavIndex = 0;
  bool isLoading = false;
  int currentIndex = 0;
  late PageController _pageController = PageController();

  final List<Widget> listPage = [
    const HomeScreen(),
    CalenderScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ];
  int _page = 0;

  bool isPressButton = false;

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
    return Obx(
      () => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.blue[300],
          child: Image.asset('assets/images/app_icon.png', fit: BoxFit.fill),
        ),
        extendBody: true,
        backgroundColor: AppColors.greyBackground,
        body: IndexedStack(
          index: _dashBoardScreenC.tabIndex.value,
          children: [
            const HomeScreen(),
            CalenderScreen(),
            TaskProjectScreen(),
            ProfileScreen(),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar(
          backgroundColor: Colors.white,
          activeColor: AppColors.primaryColor,
          inactiveColor: Colors.grey,
          icons: const [
            Icons.home,
            Icons.calendar_month,
            Icons.book,
            Icons.person
          ],
          activeIndex: _dashBoardScreenC.tabIndex.value,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          onTap: (index) => _dashBoardScreenC.tabIndex.value = index,
        ),
      ),
    );
  }
}

class ButtonPages extends StatelessWidget {
  final IconData icon;
  final Function() press;
  final bool check;
  final bool checkMode;
  const ButtonPages({
    Key? key,
    required this.icon,
    required this.press,
    required this.check,
    required this.checkMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: AnimatedContainer(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
        height: 30,
        decoration: BoxDecoration(
          color: check ? AppColors.primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        duration: const Duration(milliseconds: 300),
        child: Icon(
          icon,
          color: check ? Colors.white : Colors.grey,
          size: 20,
        ),
      ),
    );
  }
}

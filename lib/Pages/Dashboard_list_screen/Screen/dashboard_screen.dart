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
    return Obx(() => Scaffold(
          extendBody: true,
          backgroundColor: AppColors.mainColor,
          body: IndexedStack(
            index: _dashBoardScreenC.tabIndex.value,
            children: [
              const HomeScreen(),
              CalenderScreen(),
              TaskProjectScreen(),
              MainMessageScreen(),
              ProfileScreen(),
            ],
          ),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              height: 53,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 1),
                    color: Colors.black.withOpacity(0.4),
                    blurRadius: 20,
                  )
                ],
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                children: [
                  ButtonPages(
                    icon: Icons.home,
                    press: () {
                      _dashBoardScreenC.tabIndex.value = 0;
                    },
                    check: _dashBoardScreenC.tabIndex.value == 0,
                    checkMode: false,
                  ),
                  const Spacer(),
                  ButtonPages(
                      icon: Icons.calendar_month,
                      press: () {
                        _dashBoardScreenC.tabIndex.value = 1;
                      },
                      checkMode: false,
                      check: _dashBoardScreenC.tabIndex.value == 1),
                  const Spacer(),
                  ButtonPages(
                      icon: Icons.task,
                      press: () {
                        _dashBoardScreenC.tabIndex.value = 2;
                      },
                      checkMode: false,
                      check: _dashBoardScreenC.tabIndex.value == 2),
                  const Spacer(),
                  ButtonPages(
                      icon: Icons.send,
                      press: () {
                        _dashBoardScreenC.tabIndex.value = 3;
                      },
                      checkMode: false,
                      check: _dashBoardScreenC.tabIndex.value == 3),
                  const Spacer(),
                  ButtonPages(
                      icon: Icons.person,
                      press: () {
                        _dashBoardScreenC.tabIndex.value = 4;
                      },
                      checkMode: false,
                      check: _dashBoardScreenC.tabIndex.value == 4),
                ],
              ),
            ),
          ),
        ));
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
// Container(
          //   margin: const EdgeInsets.all(10),
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(10),
          //     border: Border.all(width: 1, color: Colors.grey),
          //     color: Colors.white,
          //   ),
          //   child: Padding(
          //     padding:
          //         const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          //     child: GNav(
          //       onTabChange: (value) {
          //         // NavigatorTapped(value);
          //         _dashBoardScreenC.tabIndex.value = value;
          //       },
          //       color: Colors.white,
          //       activeColor: AppColors.primaryColor,
          //       gap: 8,
          //       padding: const EdgeInsets.all(10),
          //       tabBackgroundColor: Colors.grey.withOpacity(0.2),
          //       tabBorderRadius: 5,
          //       textStyle: const TextStyle(
          //         fontWeight: FontWeight.bold,
          //         color: AppColors.primaryColor,
          //         fontFamily: 'Montserrat',
          //       ),
          //       tabs: const [
          //         GButton(
          //           icon: Icons.home,
          //           text: 'Home',
          //           iconColor: Colors.white,
          //         ),
          //         GButton(
          //           icon: Icons.calendar_month,
          //           text: 'Schedule',
          //           iconColor: Colors.white,
          //         ),
          //         GButton(
          //           icon: Icons.task,
          //           text: 'Task',
          //           iconColor: Colors.white,
          //         ),
          //         GButton(
          //           icon: Icons.send,
          //           text: 'Message',
          //           iconColor: Colors.white,
          //         ),
          //         GButton(
          //           icon: Icons.person,
          //           text: 'Profile',
          //           iconColor: Colors.white,
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
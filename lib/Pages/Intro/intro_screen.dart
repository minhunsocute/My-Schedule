import 'package:flutter/material.dart';
import 'package:my_schedule/Templates/Misc/color.dart';
import 'package:my_schedule/Widgets/button_custom.dart';

//Function page controller
PageController pageController = PageController(initialPage: 0, keepPage: true);
void onButtonTape(int index) {
  pageController.animateToPage(index,
      duration: const Duration(seconds: 1), curve: Curves.fastOutSlowIn);
//  pageController.jumpToPage(index);
}

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
    var widthDevice = MediaQuery.of(context).size.width;
    List<Widget> listViewIntro = [
      MainPageViewIntro(
          heightDevice: heightDevice,
          gifPath: 'assets/images/intro1.png',
          mainTitle: 'Manage your team & everything with MSchedule',
          title:
              'When you ar e overwhelmed by the amount of work you have on yout plate, stop and rethink'),
      MainPageViewIntro(
        heightDevice: heightDevice,
        gifPath: 'assets/images/intro2.png',
        mainTitle: 'Increase Work Effectiveness',
        title:
            'Time management and the determination of more important tasks will give your job statictics better and always improve',
      ),
      MainPageViewIntro(
        heightDevice: heightDevice,
        gifPath: 'assets/images/intro3.png',
        mainTitle: 'Reminder Notification',
        title:
            'The advantage of this application is that it also provides reminders for you so you don\'t forget to keep doing your assignments well and according to the time you have set',
      ),
    ];
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 30,
                  height: 30,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Image.asset('assets/images/icon.png'),
                ),
                const SizedBox(width: 5),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                    children: [
                      TextSpan(
                          text: 'Hello, I am ',
                          style: TextStyle(color: AppColors.textColor)),
                      TextSpan(
                        text: 'MSchedule',
                        style: TextStyle(
                            color: AppColors.primaryColor,
                            decoration: TextDecoration.underline),
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 10,
                  width: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: listViewIntro.length,
                    itemBuilder: (context, index) => buildIndicator(
                        _currentIndex == index, MediaQuery.of(context).size),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const Text(
                    'Skip',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (value) {
                  setState(() {
                    _currentIndex = value;
                  });
                },
                itemBuilder: (context, index) {
                  return listViewIntro[index];
                },
                itemCount: listViewIntro.length,
              ),
            ),
            ButtonMain(
                title: (_currentIndex == 2) ? 'Let\'s Start' : 'Next',
                press: () {
                  setState(() {
                    if (_currentIndex == 0) {
                      onButtonTape(1);
                    } else if (_currentIndex == 1) {
                      onButtonTape(2);
                    } else {}
                  });
                }),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget buildIndicator(bool isActive, Size size) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 10,
      width: isActive ? 30 : 10,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        //container with border
        color: isActive
            ? AppColors.primaryColor
            : AppColors.primaryColor.withOpacity(0.2),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        boxShadow: const [
          BoxShadow(color: Colors.black38, offset: Offset(2, 3), blurRadius: 3)
        ],
      ),
    );
  }
}

class MainPageViewIntro extends StatelessWidget {
  final String gifPath;
  final String mainTitle;
  final String title;
  const MainPageViewIntro({
    Key? key,
    required this.heightDevice,
    required this.gifPath,
    required this.mainTitle,
    required this.title,
  }) : super(key: key);

  final double heightDevice;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(),
        Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(gifPath),
            ),
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                mainTitle,
                style: const TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                title,
                style: const TextStyle(
                  color: AppColors.textColor1,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: heightDevice / 20,
        ),
      ],
    );
  }
}

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
        gifPath: 'assets/gift/Workout2.gif',
        mainTitle: 'Track Your Goal',
        title:
            'Don\'t worry if you have trouble determining your goals. We can help you determine your goals and track your goals',
      ),
      MainPageViewIntro(
        heightDevice: heightDevice,
        gifPath: 'assets/gift/Workout3.gif',
        mainTitle: 'Get Burn',
        title:
            'Let\'s keep burning, to achive yours goals, it hurts only temporaily, if you give up now you will be in pain forever',
      ),
      MainPageViewIntro(
        heightDevice: heightDevice,
        gifPath: 'assets/gift/Workout1.gif',
        mainTitle: 'Eat Well',
        title:
            'Let\'t start a healthy lifestyle with us, we can determine your diet every day, healthy eating is fun',
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 10,
                  width: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3,
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
                title: 'Let\'s Start',
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
        SizedBox(child: Image.asset(gifPath)),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                mainTitle,
                style: TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                title,
                style: TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Templates/Misc/color.dart';
import '../../../Templates/fake_data.dart';

class CustomGradientDialog extends StatelessWidget {
  final Function(List<int> listColor) callback;
  CustomGradientDialog({
    Key? key,
    required this.callback,
  }) : super(key: key);

  RxList<int> listColor = <int>[].obs;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        width: double.infinity,
        height: Get.height / 3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Obx(
              () => Container(
                  margin: const EdgeInsets.all(10.0),
                  width: double.infinity,
                  height: Get.height / 4.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: const [
                      BoxShadow(color: AppColors.textColor, blurRadius: 5.0),
                    ],
                    gradient: LinearGradient(
                      colors: listColor.length >= 2
                          ? [
                              ...listColor
                                  .map((element) => listColorPicker[element])
                            ]
                          : [
                              Colors.yellow,
                              Colors.blue,
                            ],
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: const Icon(Icons.check_circle, color: Colors.white),
                      onPressed: () {
                        if (listColor.length >= 2) {
                          callback(listColor);
                        }
                        Get.back();
                      },
                    ),
                  )),
            ),
            const SizedBox(height: 20.0),
            Obx(
              () => SizedBox(
                width: double.infinity,
                height: 40.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  children: [
                    for (int i = 0; i < listColorPicker.length; i++)
                      InkWell(
                        onTap: () {
                          if (!listColor.contains(i)) {
                            listColor.add(i);
                          } else {
                            listColor.removeWhere((element) => element == i);
                          }
                          for (var item in listColor) {
                            print(item);
                          }
                        },
                        child: Container(
                          margin: const EdgeInsets.only(left: 10.0),
                          height: 30.0,
                          width: 30.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: listColorPicker[i],
                            border: Border.all(
                              width: 2,
                              color: (listColor.contains(i))
                                  ? AppColors.primaryColor
                                  : listColorPicker[i],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.textColor.withOpacity(0.4),
                                blurRadius: 5.0,
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 5.0),
          ],
        ),
      ),
    );
  }
}

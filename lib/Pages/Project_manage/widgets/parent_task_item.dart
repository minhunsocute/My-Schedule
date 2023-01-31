import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import '../../../Templates/Misc/color.dart';
import 'list_member_quick_view.dart';

class ParentTaskItem extends StatelessWidget {
  ParentTaskItem({
    Key? key,
  }) : super(key: key);

  @override
  RxDouble delete = 0.0.obs;
  Widget build(BuildContext context) {
    final widthDevice = MediaQuery.of(context).size.width;
    final heightDevice = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 10.0, top: 20),
          width: widthDevice / 1.45 - 60.0,
          height: widthDevice / 1.6,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: AppColors.primaryColor.withOpacity(0.1),
          ),
        ),
        Obx(() => Transform.rotate(
              angle: math.pi / 15 - delete.value,
              child: InkWell(
                onTap: () {
                  delete.value = (math.pi / 15 - delete.value);
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 35.0),
                  padding: const EdgeInsets.all(15.0),
                  width: widthDevice / 1.45 - 60.0,
                  height: widthDevice / 1.6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(color: Colors.black12, blurRadius: 5.0)
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Build Wirframge',
                                  style: TextStyle(
                                    color: AppColors.textColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ),
                                Text(
                                  'Due Date: Dec 24, 2022',
                                  style: TextStyle(
                                    color: AppColors.textColor,
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: const Icon(
                              Icons.more_horiz,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Container(
                        width: double.infinity,
                        height: widthDevice / 1.6 / 2.2,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: const [
                            BoxShadow(color: Colors.black26, blurRadius: 5.0)
                          ],
                          gradient: const LinearGradient(
                            colors: [Colors.red, Colors.blue],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ListMemberQuickView(
                            listImage: const [
                              'assets/images/hoang.png',
                              'assets/images/face.png',
                              'assets/images/google.png',
                              'assets/images/hoang.png',
                              'assets/images/hoang.png'
                            ],
                            length: 3,
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SvgPicture.asset('assets/icons/Message.svg'),
                                const Text(
                                  ' 8',
                                  style: TextStyle(
                                    color: AppColors.textColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0,
                                  ),
                                ),
                                const SizedBox(width: 5.0),
                                SvgPicture.asset(
                                    'assets/icons/Notification.svg'),
                                const Text(
                                  ' 4',
                                  style: TextStyle(
                                    color: AppColors.textColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ))
      ],
    );
  }
}

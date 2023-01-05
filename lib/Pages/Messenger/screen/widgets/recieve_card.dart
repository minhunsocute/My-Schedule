import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../Templates/Misc/color.dart';

class RecCard extends StatelessWidget {
  final String title;
  final String avt;
  final bool check;
  final int typeMess;
  final String imageMess;
  RecCard({
    Key? key,
    required this.title,
    required this.avt,
    required this.check,
    required this.typeMess,
    required this.imageMess,
  }) : super(key: key);
  String subString() {
    String result = "";
    for (int i = 0; i < title.length; i++) {
      if (i % 30 == 0 && i != 0) {
        result += '\n';
      }
      result += title[i];
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: 20.0,
            height: 20.0,
            margin: EdgeInsets.only(
                bottom: check ? 16.0 : 4.0, left: 10.0, right: 4.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 5.0,
                )
              ],
              image: DecorationImage(image: AssetImage(avt)),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 2.5, bottom: 2.5),
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: AppColors.mainColor,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: typeMess == 0
                    ? Text(
                        subString(),
                        style: const TextStyle(
                          color: AppColors.textColor1,
                          fontWeight: FontWeight.w500,
                          fontSize: 12.0,
                        ),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                width: 20.0,
                                height: 20.0,
                                margin: const EdgeInsets.only(right: 10.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(avt),
                                  ),
                                ),
                              ),
                              Text(
                                subString(),
                                style: const TextStyle(
                                  color: AppColors.textColor1,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12.0,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 10.0),
                          Container(
                            width: Get.width / 2,
                            height: Get.width / 2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15.0),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black12, blurRadius: 5.0),
                              ],
                              image: DecorationImage(
                                image: AssetImage(imageMess),
                              ),
                            ),
                          ),
                        ],
                      ),
              ),
              check
                  ? Text(
                      ' ${DateFormat().add_jm().format(DateTime.now())}',
                      style: const TextStyle(
                        color: AppColors.textColor1,
                        fontWeight: FontWeight.bold,
                        fontSize: 10.0,
                      ),
                    )
                  : const SizedBox()
            ],
          ),
        ],
      ),
    );
  }
}

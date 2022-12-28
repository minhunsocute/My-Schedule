import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../Templates/Misc/color.dart';

class ActivitiCard extends StatelessWidget {
  final String image;
  final String header;
  final String title;
  final DateTime time;
  const ActivitiCard({
    Key? key,
    required this.image,
    required this.header,
    required this.title,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 90.0,
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: AppColors.mainColor,
        boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 10.0)],
      ),
      child: Row(
        children: [
          SizedBox(
            height: 90.0,
            width: 70.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(image),
                    ),
                    color: AppColors.mainColor,
                    boxShadow: const [
                      BoxShadow(color: Colors.black26, blurRadius: 5.0)
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 0.5,
            height: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 10.0),
            color: Colors.grey,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  header,
                  style: const TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 5.0,
                      height: 5.0,
                      margin: const EdgeInsets.only(right: 5.0),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        title,
                        maxLines: 1,
                        style: const TextStyle(
                          color: AppColors.textColor1,
                          fontWeight: FontWeight.w400,
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 5.0,
                      height: 5.0,
                      margin: const EdgeInsets.only(right: 5.0),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        DateFormat().add_jm().format(DateTime.now()),
                        maxLines: 2,
                        style: const TextStyle(
                          color: AppColors.textColor1,
                          fontWeight: FontWeight.w400,
                          fontSize: 12.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

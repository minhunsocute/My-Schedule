import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../Templates/Misc/color.dart';

class AllProjectDifItem extends StatelessWidget {
  final String name;
  final DateTime time;
  final int counting;
  final Function() onPress;
  const AllProjectDifItem({
    Key? key,
    required this.name,
    required this.time,
    required this.counting,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Container(
        width: double.infinity,
        // padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: AppColors.mainColor,
          boxShadow: const [
            BoxShadow(color: Colors.black26, blurRadius: 10.0),
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 15.0, left: 15.0, bottom: 15.0),
              child: Image.asset(
                'assets/images/app_icon1.png',
                height: 50.0,
                width: 50.0,
              ),
            ),
            Container(
              width: 0.5,
              height: 50.0,
              color: Colors.black,
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      color: AppColors.textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 6.0,
                        width: 6.0,
                        margin: const EdgeInsets.only(right: 5.0),
                        decoration: const BoxDecoration(
                          color: AppColors.primaryColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Text(
                        DateFormat().add_yMEd().format(time),
                        style: const TextStyle(
                          color: AppColors.textColor1,
                          fontSize: 12.0,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: onPress,
              child: Container(
                width: 50,
                height: 80.0,
                margin: const EdgeInsets.all(2.0),
                decoration: BoxDecoration(
                  color: Colors.blue[300],
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                    topLeft: Radius.circular(5.0),
                    bottomLeft: Radius.circular(5.0),
                  ),
                ),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.star, color: Colors.yellow),
                      Text(
                        counting.toString(),
                        style: const TextStyle(
                          color: AppColors.mainColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

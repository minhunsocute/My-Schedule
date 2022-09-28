import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../Templates/Misc/color.dart';

class ReciveCard extends StatelessWidget {
  final String title;
  final DateTime time;
  final int typeMess;
  const ReciveCard({
    Key? key,
    required this.title,
    required this.typeMess,
    required this.time,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(width: 5),
          Container(
            height: 25,
            width: 25,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/hoang.png',
                ),
              ),
            ),
          ),
          const SizedBox(width: 5),
          Container(
            width: MediaQuery.of(context).size.width * 0.72,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            decoration: BoxDecoration(
              color: AppColors.textColor1.withOpacity(0.4),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(2),
                topRight: Radius.circular(25),
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.72 - 90,
                    child: (typeMess == 0)
                        ? Text(
                            title,
                            style: const TextStyle(
                              color: AppColors.textColor1,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        : Container(
                            width:
                                MediaQuery.of(context).size.width * 0.72 - 90,
                            height:
                                MediaQuery.of(context).size.width * 0.72 - 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage(
                                  title,
                                ),
                              ),
                            ),
                          ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Icon(
                        Icons.airplane_ticket,
                        size: 20,
                        color: Color.fromARGB(255, 3, 99, 177),
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          DateFormat().add_jm().format(time),
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

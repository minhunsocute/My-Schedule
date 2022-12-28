import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../Templates/Misc/color.dart';
import '../all_events_screen.dart';

class EventsExCard extends StatelessWidget {
  const EventsExCard({
    Key? key,
    required this.data,
  }) : super(key: key);
  final Event data;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Image.asset(
            'assets/images/app_icon2.png',
            height: 50.0,
            width: 50.0,
          ),
        ),
        Container(
          width: double.infinity,
          height: 120,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: AppColors.mainColor,
            boxShadow: const [
              BoxShadow(color: Colors.black26, blurRadius: 10.0)
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 80.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      fit: BoxFit.cover,
                      'assets/images/app_icon1.png',
                      height: 70,
                      width: 70,
                    ),
                    Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 3.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: AppColors.primaryColor,
                        ),
                        child: Text(
                          DateFormat().add_jm().format(data.time),
                          style: const TextStyle(
                            color: AppColors.mainColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 11.0,
                          ),
                        )),
                  ],
                ),
              ),
              Container(
                width: 0.5,
                height: double.infinity,
                color: Colors.black,
                margin: const EdgeInsets.symmetric(horizontal: 10.0),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.title,
                      style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        color: AppColors.textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 7.0,
                          height: 7.0,
                          margin: const EdgeInsets.only(right: 10.0),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.primaryColor,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            data.description,
                            maxLines: 3,
                            style: const TextStyle(
                              color: AppColors.textColor,
                              fontSize: 11.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 4.0),
                          decoration: BoxDecoration(
                            color: data.check
                                ? Colors.green[100]
                                : Colors.red[100],
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Text(
                            data.check ? 'Completed' : 'Un Completed',
                            style: TextStyle(
                              color: data.check ? Colors.green : Colors.red,
                              fontWeight: FontWeight.w600,
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: const Icon(
                            Icons.delete,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

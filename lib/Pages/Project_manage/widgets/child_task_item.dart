import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Templates/Misc/color.dart';
import 'list_member_quick_view.dart';

class ChildTaskItem extends StatelessWidget {
  const ChildTaskItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(15.0),
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.white,
        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5.0)],
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
                    SvgPicture.asset('assets/icons/Notification.svg'),
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
    );
  }
}

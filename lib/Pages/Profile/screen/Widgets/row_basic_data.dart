import 'package:flutter/material.dart';

import '../../../../Templates/Misc/color.dart';

class RowBasicData extends StatelessWidget {
  final String title;
  int? maxLines;
  RowBasicData({
    Key? key,
    required this.title,
    this.maxLines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/images/app_icon.png',
          height: 30.0,
          width: 30.0,
        ),
        Expanded(
          child: Text(
            title,
            maxLines: maxLines ?? 1,
            style: const TextStyle(color: AppColors.textColor, fontSize: 12.0),
          ),
        ),
      ],
    );
  }
}

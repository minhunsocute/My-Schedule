import 'package:flutter/material.dart';

import '../../../Templates/Misc/color.dart';
import '../../../Widgets/task_card.dart';

class BottomMytask extends StatelessWidget {
  BottomMytask({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'My Task',
          style: TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.close,
            color: AppColors.textColor,
          ),
        ),
        elevation: 0,
        backgroundColor: AppColors.greyBackground,
      ),
      backgroundColor: AppColors.greyBackground,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          children: [
            TaskCard(
              type: 2,
              title: 'Meeting UI/UX',
              date: DateTime.now(),
            ),
            TaskCard(
              type: 0,
              title: 'Meeting UI/UX',
              date: DateTime.now(),
            ),
            TaskCard(
              type: 1,
              title: 'Meeting UI/UX',
              date: DateTime.now(),
            ),
            TaskCard(
              type: 2,
              title: 'Meeting UI/UX',
              date: DateTime.now(),
            ),
          ],
        ),
      ),
    );
  }
}

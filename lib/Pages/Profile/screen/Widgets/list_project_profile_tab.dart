import 'package:flutter/material.dart';

import '../../../../Templates/Misc/color.dart';
import 'all_project_dif_item.dart';

class ListProjectProfileTab extends StatelessWidget {
  const ListProjectProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(
        parent: AlwaysScrollableScrollPhysics(),
      ),
      children: [
        const SizedBox(height: 20.0),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'All Projects',
                style: TextStyle(
                  color: AppColors.textColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.0,
                ),
              ),
              Text(
                '10 Projects',
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 15.0),
        AllProjectDifItem(
            name: 'Windows Project',
            time: DateTime.now(),
            counting: 100,
            onPress: () {}),
        AllProjectDifItem(
            name: 'Android Project',
            time: DateTime.now(),
            counting: 10,
            onPress: () {}),
        AllProjectDifItem(
            name: 'AI Project',
            time: DateTime.now(),
            counting: 120,
            onPress: () {}),
        const SizedBox(height: 40.0),
      ],
    );
  }
}

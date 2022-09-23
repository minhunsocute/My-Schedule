import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Templates/Misc/color.dart';

class ViewProjectScreen extends StatelessWidget {
  const ViewProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back_ios, color: AppColors.textColor),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        // actions: [
        //   InkWell(
        //     borderRadius: BorderRadius.circular(5),
        //     onTap: () {},
        //     child: Container(
        //       height: 20,
        //       width: 20,
        //       padding: const EdgeInsets.all(5),
        //       decoration: BoxDecoration(
        //         borderRadius: BorderRadius.circular(5),
        //         color: AppColors.primaryColor.withOpacity(0.8),
        //       ),
        //       child: const Icon(Icons.more_horiz, color: AppColors.textColor),
        //     ),
        //   ),
        // ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                const Text(
                  'Windows Development',
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor1.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Icon(
                    Icons.people,
                    color: AppColors.primaryColor1,
                    size: 18,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'My Schedule App',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(height: 10),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: SizedBox(child: Column(children: [])),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(child: Column(children: [])),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../Templates/Misc/color.dart';

class BuiltImageGroup extends StatelessWidget {
  final double size;
  final List<String> listImage;
  const BuiltImageGroup({
    super.key,
    required this.size,
    required this.listImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 1, color: AppColors.textColor1),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(100),
                  bottomLeft: Radius.circular(100),
                ),
                image: DecorationImage(
                  image: AssetImage(listImage[0]),
                ),
              ),
            ),
          ),
          (listImage.length == 2)
              ? Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: AppColors.textColor1),
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(100),
                        bottomRight: Radius.circular(100),
                      ),
                      image: DecorationImage(
                        image: AssetImage(listImage[1]),
                      ),
                    ),
                  ),
                )
              : Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: AppColors.textColor1),
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(100),
                        bottomRight: Radius.circular(100),
                      ),
                    ),
                    child: Column(
                      children: [
                        for (int i = 0; i < 2; i++)
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    width: 1, color: AppColors.textColor1),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(i == 0 ? 100 : 0),
                                    bottomRight:
                                        Radius.circular(i == 1 ? 100 : 0)),
                                image: DecorationImage(
                                  image: AssetImage(listImage[1 + i]),
                                ),
                              ),
                            ),
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

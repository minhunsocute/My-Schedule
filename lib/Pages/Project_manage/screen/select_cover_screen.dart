import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Templates/Misc/color.dart';
import '../../../Templates/fake_data.dart';
import '../../Profile/screen/Widgets/custom_button.dart';
import '../widgets/custom_gradient_dialog.dart';

class SelectCoverScreen extends StatelessWidget {
  final Function(int) callback;
  SelectCoverScreen({
    Key? key,
    required this.callback,
  }) : super(key: key);
  RxInt selectCover = 0.obs;
  RxList<Gradient> listColor = listGradinet.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: CustomButton(
            title: 'Select Cover',
            onPress: () {
              Get.back();
              callback(selectCover.value);
            }),
      ),
      appBar: AppBar(
        backgroundColor: AppColors.mainColor,
        elevation: 0,
        leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(
            Icons.arrow_back_ios,
            color: AppColors.textColor,
          ),
        ),
        title: const Text(
          'Select Cover',
          style: TextStyle(
            color: AppColors.textColor,
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Obx(
          () => GridView.count(
            crossAxisCount: 3,
            children: [
              for (int i = 0; i < listColor.length + 1; i++)
                i < listColor.length
                    ? InkWell(
                        borderRadius: BorderRadius.circular(20.0),
                        onTap: () => selectCover.value = i,
                        child: Container(
                          margin: const EdgeInsets.all(5.0),
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(color: Colors.black12, blurRadius: 5.0)
                            ],
                            borderRadius: BorderRadius.circular(20.0),
                            gradient: listColor[i],
                          ),
                          child: selectCover.value == i
                              ? const Align(
                                  alignment: Alignment.topRight,
                                  child: Icon(
                                    Icons.check_circle,
                                    color: AppColors.mainColor,
                                    size: 18.0,
                                  ),
                                )
                              : const SizedBox(),
                        ),
                      )
                    : InkWell(
                        borderRadius: BorderRadius.circular(20.0),
                        onTap: () => showDialog(
                          context: context,
                          builder: (context) => CustomGradientDialog(
                            callback: ((listColorResult) {
                              listColor.add(LinearGradient(colors: [
                                ...listColorResult
                                    .map((e) => listColorPicker[e])
                              ]));
                            }),
                          ),
                        ),
                        child: Container(
                          margin: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            color: AppColors.mainColor,
                            boxShadow: const [
                              BoxShadow(color: Colors.black12, blurRadius: 5.0)
                            ],
                            borderRadius: BorderRadius.circular(20.0),
                            border: Border.all(
                              width: 1,
                              color: Colors.grey,
                            ),
                          ),
                          child: const Center(
                            child: Icon(Icons.add, color: Colors.grey),
                          ),
                        ),
                      ),
            ],
          ),
        ),
      ),
    );
  }
}

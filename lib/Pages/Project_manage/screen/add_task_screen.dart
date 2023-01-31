import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:my_schedule/Pages/Profile/screen/Widgets/custom_button.dart';
import 'package:my_schedule/Pages/Project_manage/screen/select_cover_screen.dart';
import 'package:my_schedule/Pages/Project_manage/screen/select_member_for_task.dart';
import 'package:my_schedule/Templates/fake_data.dart';
import 'package:my_schedule/Widgets/button_custom.dart';

import '../../../Templates/Misc/color.dart';
import '../../../Widgets/text_filed_custom.dart';
import '../../Sign_up_in/screen/forgot_password_screen.dart';
import '../controller/project_manage_controller.dart';

List<Map<String, dynamic>> fakeDataMembers = [
  {
    'id': '1',
    'name': 'Duc Hoang',
    'imagePath': 'assets/images/face.png',
    'type': 'Backend Developer',
  },
  {
    'id': '2',
    'name': 'Minh Hung',
    'imagePath': 'assets/images/hoang.png',
    'type': 'Frontend Developer',
  },
  {
    'id': '3',
    'name': 'Trung Hieu',
    'imagePath': 'assets/images/google.png',
    'type': 'UI/UX Designer',
  }
];

@immutable
class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen>
    with TickerProviderStateMixin {
  final GlobalKey _draggableKey = GlobalKey();

  List<Item> listItem = [];
  void _itemDroppedOnCustomerCart({
    required Item item,
    // required Customer customer,
  }) {
    setState(() {
      listItem.add(item);
    });
  }

  int count = 0;
  RxInt checkCover = (-1).obs;
  final TextEditingController controller = TextEditingController();

  Future<int> selectCover() async {
    int result = 0;
    await showCupertinoModalBottomSheet(
      context: context,
      builder: (context) => SelectCoverScreen(
        callback: (value) {
          result = value;
        },
      ),
    );
    return result;
  }

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    var heightDevice = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: _buildAppBar(),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: CustomButton(title: 'Add new task', onPress: () {}),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          const SizedBox(height: 10.0),
          Obx(
            () => checkCover.value == -1
                ? InkWell(
                    onTap: () async {
                      checkCover.value = await selectCover();
                    },
                    child: Container(
                      width: widthDevice,
                      height: widthDevice / 2.5,
                      margin: const EdgeInsets.symmetric(horizontal: 15.0),
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: AppColors.mainColor,
                        border: Border.all(width: 1, color: Colors.grey),
                        boxShadow: const [
                          BoxShadow(color: Colors.black26, blurRadius: 5.0)
                        ],
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Icon(Icons.add, color: Colors.grey),
                            SizedBox(height: 10.0),
                            Text(
                              'Add Cover',
                              style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w600,
                                fontSize: 12.0,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                : Container(
                    width: widthDevice,
                    height: widthDevice / 2.5,
                    margin: const EdgeInsets.symmetric(horizontal: 15.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      gradient: listGradinet[checkCover.value],
                      boxShadow: const [
                        BoxShadow(color: Colors.black26, blurRadius: 10.0)
                      ],
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomRight,
                          child: IconButton(
                            onPressed: () async {
                              checkCover.value = await selectCover();
                            },
                            icon: const Icon(
                              Icons.edit,
                              color: AppColors.mainColor,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Image.asset(
                            'assets/images/app_icon.png',
                            height: 60.0,
                            width: 60.0,
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
          const SizedBox(height: 20.0),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: CustomTextFormField(
              hint: "Enter Task title",
              title: "Task title",
              // controller: controller.passwordController,
              isPasswordField: false,
              trailingIcon: Icon(Icons.task),
            ),
          ),
          const SizedBox(height: 15.0),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: CustomTextFormField(
              hint: "Enter Description",
              title: "Description",
              // controller: controller.passwordController,
              isPasswordField: false,
              trailingIcon: Icon(Icons.description),
            ),
          ),
          const SizedBox(height: 15.0),
          InkWell(
            onTap: () async => await showCupertinoModalBottomSheet(
              context: context,
              builder: (context) => SelectMemberFortask(),
            ),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15.0),
              padding: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(width: 1, color: Colors.grey),
              ),
              child: Text(
                'Select Team Member',
                style: TextStyle(
                    color: Colors.grey[350]!,
                    fontWeight: FontWeight.w500,
                    fontSize: 14),
              ),
            ),
          ),
          const SizedBox(height: 15.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: CustomTextFormField(
              hint: "Select Start Date",
              title: "Start Date",
              trailingIcon: const Icon(Icons.calendar_month),
              checkIconButton: true,
              onTap: () {},
            ),
          ),
          const SizedBox(height: 15.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: CustomTextFormField(
              hint: "Select Due Date",
              title: "Due Date",
              trailingIcon: const Icon(Icons.calendar_month),
              checkIconButton: true,
              onTap: () {},
            ),
          ),
          const SizedBox(height: 10.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Upload File',
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: const Text(
                    'Select',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15.0),
            padding: const EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(width: 1, color: Colors.grey),
            ),
            child: Text(
              'Select File',
              style: TextStyle(
                  color: Colors.grey[350]!,
                  fontWeight: FontWeight.w500,
                  fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  Padding inputField(
      {required String mainTitle,
      required String hintText,
      required TextEditingController control}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              mainTitle,
              style: const TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                width: 1,
                color: AppColors.textColor1,
              ),
            ),
            child: TextFormField(
              autofocus: true,
              controller: control,
              autocorrect: false,
              style: const TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: const TextStyle(color: AppColors.textColor1),
              ),
            ),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      iconTheme: const IconThemeData(color: Color(0xFFF64209)),
      centerTitle: true,
      leading: InkWell(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back_ios, color: AppColors.textColor)),
      title: const Text(
        'Add new Task',
        style: TextStyle(
          color: AppColors.textColor,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}

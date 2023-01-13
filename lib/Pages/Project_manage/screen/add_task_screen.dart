import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:my_schedule/Pages/Profile/screen/Widgets/custom_button.dart';
import 'package:my_schedule/Templates/fake_data.dart';
import 'package:my_schedule/Widgets/button_custom.dart';

import '../../../Templates/Misc/color.dart';
import '../../../Widgets/text_filed_custom.dart';
import '../../Sign_up_in/screen/forgot_password_screen.dart';

const List<Item> _items = [
  Item(
      id: '1',
      name: 'Duc Hoang',
      type: 'Backend Developer',
      image: 'assets/images/face.png'),
  Item(
      id: '2',
      name: 'Minh Hung',
      type: 'Frontend Developer',
      image: 'assets/images/hoang.png'),
  Item(
      id: '3',
      name: 'Trung Hieu',
      type: 'UI/UX Designer',
      image: 'assets/images/google.png'),
];

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
  RxInt checkCover = 10.obs;
  final TextEditingController controller = TextEditingController();
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
            () => checkCover.value == 0
                ? InkWell(
                    onTap: () async => await showCupertinoModalBottomSheet(
                      context: context,
                      builder: (context) => SelectCoverScreen(),
                    ),
                    child: Container(
                      width: widthDevice,
                      height: widthDevice / 2.5,
                      margin: const EdgeInsets.symmetric(horizontal: 15.0),
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        color: AppColors.mainColor,
                        border: Border.all(
                            width: 1,
                            strokeAlign: StrokeAlign.center,
                            color: Colors.grey),
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
                      gradient: const LinearGradient(
                        colors: [Colors.yellow, Colors.purple],
                      ),
                      boxShadow: const [
                        BoxShadow(color: Colors.black26, blurRadius: 10.0)
                      ],
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomRight,
                          child: IconButton(
                            onPressed: () async =>
                                await showCupertinoModalBottomSheet(
                              context: context,
                              builder: (context) => SelectCoverScreen(),
                            ),
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
              onTap: () {
                print(1);
              },
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
              onTap: () {
                print(1);
              },
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

class SelectCoverScreen extends StatelessWidget {
  SelectCoverScreen({
    Key? key,
  }) : super(key: key);
  RxInt selectCover = 0.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: CustomButton(title: 'Select Cover', onPress: () {}),
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
              for (int i = 0; i < listGradinet.length + 1; i++)
                i < listGradinet.length
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
                            gradient: listGradinet[i],
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
                        onTap: () {},
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

class SelectMemberFortask extends StatefulWidget {
  const SelectMemberFortask({
    Key? key,
  }) : super(key: key);

  @override
  State<SelectMemberFortask> createState() => _SelectMemberFortaskState();
}

class _SelectMemberFortaskState extends State<SelectMemberFortask> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: const Icon(
            Icons.close,
            color: Colors.black,
          ),
        ),
        title: const Text('Select Member',
            style: TextStyle(
                color: AppColors.textColor,
                fontWeight: FontWeight.bold,
                fontSize: 18.0)),
        elevation: 0,
        backgroundColor: AppColors.mainColor,
      ),
      backgroundColor: AppColors.mainColor,
      body: ListView(
        children: [
          const SizedBox(height: 10.0),
          DragTarget<Item>(
            builder: (context, candidateItems, rejectedItems) {
              return (listItem.isNotEmpty)
                  ? Container(
                      // padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.symmetric(horizontal: 15.0),
                      padding: const EdgeInsets.all(10.0),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: AppColors.mainColor,
                        boxShadow: const [
                          BoxShadow(color: Colors.black26, blurRadius: 5.0)
                        ],
                      ),
                      child: Wrap(
                        children: [
                          ...listItem.map(
                            (e) => Container(
                              width: 110,
                              padding: const EdgeInsets.all(10),
                              // height: 20,
                              margin: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: AppColors.mainColor,
                              ),
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 80,
                                    child: Text(
                                      e.name,
                                      style: const TextStyle(
                                        color: AppColors.textColor,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {},
                                      child: const Icon(
                                        Icons.close,
                                        color: AppColors.textColor,
                                        size: 12,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(
                      height: 80,
                      padding: const EdgeInsets.all(10.0),
                      margin: const EdgeInsets.symmetric(horizontal: 15.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: AppColors.mainColor,
                        boxShadow: const [
                          BoxShadow(color: Colors.black26, blurRadius: 5.0)
                        ],
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.download,
                              color: AppColors.primaryColor,
                            ),
                            Text(
                              'Drop Here',
                              style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    );
            },
            onAccept: (item) => _itemDroppedOnCustomerCart(item: item),
          ),
          const SizedBox(height: 10.0),
          ..._items.map(
            (e) => LongPressDraggable(
              data: e,
              dragAnchorStrategy: pointerDragAnchorStrategy,
              feedback: DraggingListItem(
                dragKey: _draggableKey,
                photoProvider: AssetImage(e.image),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Row(
                  children: [
                    Container(
                      width: 40.0,
                      height: 40.0,
                      margin: const EdgeInsets.only(
                          right: 10.0, top: 7.0, bottom: 7.0),
                      decoration: BoxDecoration(
                          color: AppColors.mainColor,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              e.image,
                            ),
                          ),
                          boxShadow: const [
                            BoxShadow(color: Colors.black12, blurRadius: 5.0),
                          ]),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(e.name,
                              style: const TextStyle(
                                  color: AppColors.textColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.0)),
                          Text(
                            e.type,
                            style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                                fontSize: 12.0),
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 50.0,
                        height: 25.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: AppColors.primaryColor,
                        ),
                        child: const Text(
                          'View',
                          style: TextStyle(
                            color: AppColors.mainColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 12.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  const ItemCard({
    Key? key,
    required this.e,
  }) : super(key: key);
  final Item e;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(left: 20),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColors.textColor1.withOpacity(0.2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(e.image),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            e.name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.textColor,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            e.type,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.textColor1,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}

class DraggingListItem extends StatelessWidget {
  const DraggingListItem({
    super.key,
    required this.dragKey,
    required this.photoProvider,
  });

  final GlobalKey dragKey;
  final ImageProvider photoProvider;

  @override
  Widget build(BuildContext context) {
    return FractionalTranslation(
      translation: const Offset(-0.5, -0.5),
      child: ClipRRect(
        key: dragKey,
        borderRadius: BorderRadius.circular(12.0),
        child: SizedBox(
          height: 100,
          width: 100,
          child: Opacity(
            opacity: 0.85,
            child: Image(
              image: photoProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

@immutable
class Item {
  const Item({
    required this.id,
    required this.name,
    required this.type,
    required this.image,
  });
  final String id;
  final String name;
  final String type;
  final String image;
  String get getID => id;
}

// inputField(
//           hintText: 'Enter your title',
//           mainTitle: 'Title',
//           control: controller,
//         ),
//         const SizedBox(height: 20),
//         inputField(
//           hintText: 'Enter your note',
//           mainTitle: 'Note',
//           control: controller,
//         ),
//         const SizedBox(height: 20),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Row(
//             children: [
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       'Start Date',
//                       style: TextStyle(
//                         color: AppColors.textColor,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16,
//                       ),
//                     ),
//                     const SizedBox(height: 5),
//                     Container(
//                       padding: const EdgeInsets.all(10),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5),
//                         border:
//                             Border.all(width: 1, color: AppColors.textColor1),
//                       ),
//                       child: Row(
//                         children: [
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 DateFormat()
//                                     .add_MMMEd()
//                                     .format(DateTime.now()),
//                                 style: const TextStyle(
//                                   color: AppColors.textColor,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               Text(
//                                 DateFormat().add_jm().format(DateTime.now()),
//                                 style: const TextStyle(
//                                   color: AppColors.textColor1,
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               )
//                             ],
//                           ),
//                           const Spacer(),
//                           const Icon(Icons.timelapse_outlined,
//                               color: AppColors.primaryColor),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(width: 5),
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text(
//                       'Due Date',
//                       style: TextStyle(
//                         color: AppColors.textColor,
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16,
//                       ),
//                     ),
//                     const SizedBox(height: 5),
//                     Container(
//                       padding: const EdgeInsets.all(10),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5),
//                         border:
//                             Border.all(width: 1, color: AppColors.textColor1),
//                       ),
//                       child: Row(
//                         children: [
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 DateFormat()
//                                     .add_MMMEd()
//                                     .format(DateTime.now()),
//                                 style: const TextStyle(
//                                   color: AppColors.textColor,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               Text(
//                                 DateFormat().add_jm().format(DateTime.now()),
//                                 style: const TextStyle(
//                                   color: AppColors.textColor1,
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               )
//                             ],
//                           ),
//                           const Spacer(),
//                           const Icon(Icons.timelapse_outlined,
//                               color: AppColors.primaryColor),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ), //
//         const SizedBox(height: 20),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 'Executor',
//                 style: TextStyle(
//                   color: AppColors.textColor,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16,
//                 ),
//               ),
//               const SizedBox(height: 10),

//         ),
//         const SizedBox(height: 20),
//         SizedBox(
//           height: 180,
//           width: double.infinity,
//           child: ListView(
//             scrollDirection: Axis.horizontal,
//             physics: const BouncingScrollPhysics(
//               parent: AlwaysScrollableScrollPhysics(),
//             ),
//             children: [
//               ..._items.map(
//                 (e) => LongPressDraggable(
//                   data: e,
//                   dragAnchorStrategy: pointerDragAnchorStrategy,
//                   feedback: DraggingListItem(
//                     dragKey: _draggableKey,
//                     photoProvider: AssetImage(e.image),
//                   ),
//                   child: ItemCard(e: e),
//                 ),
//               ),
//             ],
//           ),
//         ),
//         const SizedBox(height: 40),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20),
//           child: ButtonMain(title: 'Create Task', press: () => Get.back()),
//         ),

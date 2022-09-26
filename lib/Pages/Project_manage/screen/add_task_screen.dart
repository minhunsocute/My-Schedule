import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_schedule/Widgets/button_custom.dart';

import '../../../Templates/Misc/color.dart';

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
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      appBar: _buildAppBar(),
      body: ListView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        children: [
          inputField(
            hintText: 'Enter your title',
            mainTitle: 'Title',
            control: controller,
          ),
          const SizedBox(height: 20),
          inputField(
            hintText: 'Enter your note',
            mainTitle: 'Note',
            control: controller,
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Start Date',
                        style: TextStyle(
                          color: AppColors.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border:
                              Border.all(width: 1, color: AppColors.textColor1),
                        ),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  DateFormat()
                                      .add_MMMEd()
                                      .format(DateTime.now()),
                                  style: const TextStyle(
                                    color: AppColors.textColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  DateFormat().add_jm().format(DateTime.now()),
                                  style: const TextStyle(
                                    color: AppColors.textColor1,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            const Spacer(),
                            const Icon(Icons.timelapse_outlined,
                                color: AppColors.primaryColor),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 5),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Due Date',
                        style: TextStyle(
                          color: AppColors.textColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border:
                              Border.all(width: 1, color: AppColors.textColor1),
                        ),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  DateFormat()
                                      .add_MMMEd()
                                      .format(DateTime.now()),
                                  style: const TextStyle(
                                    color: AppColors.textColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  DateFormat().add_jm().format(DateTime.now()),
                                  style: const TextStyle(
                                    color: AppColors.textColor1,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                            const Spacer(),
                            const Icon(Icons.timelapse_outlined,
                                color: AppColors.primaryColor),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ), //
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Executor',
                  style: TextStyle(
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 10),
                DragTarget<Item>(
                  builder: (context, candidateItems, rejectedItems) {
                    return (listItem.isNotEmpty)
                        ? Container(
                            // padding: const EdgeInsets.all(5),

                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: AppColors.textColor1.withOpacity(0.4),
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
                                        ))
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(
                            height: 80,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.textColor1.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(5),
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
              ],
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 180,
            width: double.infinity,
            child: ListView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              children: [
                ..._items.map(
                  (e) => LongPressDraggable(
                    data: e,
                    dragAnchorStrategy: pointerDragAnchorStrategy,
                    feedback: DraggingListItem(
                      dragKey: _draggableKey,
                      photoProvider: AssetImage(e.image),
                    ),
                    child: ItemCard(e: e),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ButtonMain(title: 'Create Task', press: () => Get.back()),
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
              enableIMEPersonalizedLearning: false,
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
        'Add Task',
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

class MenuListItem extends StatelessWidget {
  const MenuListItem({
    super.key,
    this.name = '',
    this.price = '',
    required this.photoProvider,
    this.isDepressed = false,
  });

  final String name;
  final String price;
  final ImageProvider photoProvider;
  final bool isDepressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 12.0,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: SizedBox(
                width: 120,
                height: 120,
                child: Center(
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 100),
                    curve: Curves.easeInOut,
                    height: isDepressed ? 115 : 120,
                    width: isDepressed ? 115 : 120,
                    child: Image(
                      image: photoProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 30.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          fontSize: 18.0,
                        ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    price,
                    style: Theme.of(context).textTheme.subtitle1?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                  ),
                ],
              ),
            ),
          ],
        ),
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

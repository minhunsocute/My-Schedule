import 'package:flutter/material.dart';

import '../../../Templates/Misc/color.dart';
import '../controller/project_manage_controller.dart';
import '../widgets/dragging_list_item.dart';

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

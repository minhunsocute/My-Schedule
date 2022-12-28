import 'package:flutter/material.dart';

class CheckContainer extends StatelessWidget {
  const CheckContainer({
    Key? key,
    required this.type,
  }) : super(key: key);

  final int type;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: type == 0
            ? Colors.blue.withOpacity(0.2)
            : type == 1
                ? Colors.orange.withOpacity(0.2)
                : Colors.green.withOpacity(0.2),
      ),
      child: Text(
        type == 0
            ? 'To-do'
            : type == 1
                ? 'In Progress'
                : 'Done',
        style: TextStyle(
            color: type == 0
                ? Colors.blue
                : type == 1
                    ? Colors.orange
                    : Colors.green,
            fontSize: 12,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}

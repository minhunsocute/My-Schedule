import 'package:flutter/material.dart';

import '../Templates/Misc/color.dart';

class PasswordFieldCustom extends StatefulWidget {
  const PasswordFieldCustom({
    Key? key,
    required this.controller,
    required this.hintText,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;

  @override
  State<PasswordFieldCustom> createState() => _PasswordFieldCustomState();
}

class _PasswordFieldCustomState extends State<PasswordFieldCustom> {
  bool checkShow = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          width: 1,
          color: Colors.blue.withOpacity(0.5),
        ),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              setState(() {
                checkShow = !checkShow;
              });
            },
            child: Container(
              width: 60,
              height: 45,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.5),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                ),
              ),
              child: Icon(
                (checkShow) ? Icons.visibility : Icons.visibility_off,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              obscureText: checkShow,
              controller: widget.controller,
              style: const TextStyle(
                fontFamily: 'Montserrat',
                color: AppColors.textColor,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.hintText,
                hintStyle: const TextStyle(
                  fontFamily: 'Montserrat',
                  color: AppColors.textColor1,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class TextFieldCustom extends StatelessWidget {
  const TextFieldCustom({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.icon,
  }) : super(key: key);

  final TextEditingController controller;
  final String hintText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          width: 1,
          color: Colors.blue.withOpacity(0.5),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 45,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.blue.withOpacity(0.5),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(5),
                bottomLeft: Radius.circular(5),
              ),
            ),
            child: Icon(icon, color: Colors.white),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              controller: controller,
              style: const TextStyle(
                fontFamily: 'Montserrat',
                color: AppColors.textColor,
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: const TextStyle(
                  fontFamily: 'Montserrat',
                  color: AppColors.textColor1,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

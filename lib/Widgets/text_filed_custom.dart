import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../Templates/Misc/color.dart';
import 'app_decoration.dart';

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
      height: 55,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.grey[100]),
      child: Row(
        children: [
          const SizedBox(width: 10.0),
          Icon(icon, color: AppColors.textColor),
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

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    this.title,
    this.maxLine,
    this.trailingIcon,
    this.hint,
    this.prefixWidget,
    this.width,
    this.hintStyle,
    this.borderSide,
    this.isPasswordField,
    this.controller,
    this.validator,
    this.onTap,
    this.readOnly,
    this.checkFormat = true,
  });
  final String? title;
  final double? width;
  final int? maxLine;
  final BorderSide? borderSide;
  final String? hint;
  final Widget? trailingIcon;
  final Widget? prefixWidget;
  final TextStyle? hintStyle;
  final bool? isPasswordField;
  final Function()? onTap;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool? readOnly;
  final bool checkFormat;
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  RxBool isObscure = false.obs;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: widget.width ?? double.infinity,
        child: Obx(
          () => TextFormField(
            readOnly: widget.readOnly ?? false,
            validator: widget.validator,
            controller: widget.controller,
            obscureText: isObscure.value,
            maxLines: 1,
            inputFormatters: !widget.checkFormat
                ? [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'[0-9]+[,.]{0,1}[0-9]*'))
                  ]
                : [],
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              labelText: widget.title,
              labelStyle: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              hintText: widget.hint,
              hintStyle: widget.hintStyle ??
                  TextStyle(
                      color: Colors.grey[350]!,
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
              border: OutlineInputBorder(
                borderRadius: AppDecoration.primaryRadiusBorder,
                borderSide: widget.borderSide ??
                    BorderSide(color: Colors.grey[350]!, width: 0.4),
              ),
              suffixIcon: SizedBox(
                height: 50,
                width: 50,
                child: InkWell(
                  onTap: () {
                    if (widget.isPasswordField ?? false) {
                      // setState(() {
                      //   isObscure = !isObscure;
                      // });
                      isObscure.value = !isObscure.value;
                    }
                  },
                  child: widget.trailingIcon,
                ),
              ),
              prefixIcon: widget.prefixWidget,
            ),
          ),
        ));
  }
}

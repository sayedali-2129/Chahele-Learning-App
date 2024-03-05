import 'package:chahele_project/utils/constant_colors/constant_colors.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.buttonHeight,
    required this.buttonWidth,
    required this.buttonColor,
    required this.buttonText,
    this.onPressed,
  });
  final double buttonHeight;
  final double buttonWidth;
  final Color buttonColor;
  final String buttonText;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonHeight,
      width: buttonWidth,
      child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(buttonColor),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)))),
          child: Text(
            buttonText,
            style: const TextStyle(color: ConstantColors.white),
          )),
    );
  }
}

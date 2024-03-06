import 'package:chahele_project/utils/constant_colors/constant_colors.dart';
import 'package:flutter/material.dart';

class TextfieldWidget extends StatelessWidget {
  const TextfieldWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Container(
        height: 50,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            boxShadow: [
              BoxShadow(
                  blurRadius: 1,
                  spreadRadius: 0,
                  color: Colors.black26,
                  blurStyle: BlurStyle.outer)
            ]),
        child: TextFormField(
          cursorColor: ConstantColors.black,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 24),
            filled: true,
            fillColor: ConstantColors.white,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ),
    );
  }
}

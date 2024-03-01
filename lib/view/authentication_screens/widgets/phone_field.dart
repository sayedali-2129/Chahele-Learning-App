import 'dart:developer';

import 'package:chahele_project/controller/authentication_provider.dart';
import 'package:chahele_project/utils/constant_colors/constant_colors.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/country_picker_dialog.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';

class PhoneNumberField extends StatelessWidget {
  const PhoneNumberField({
    super.key,
    required this.phoneNumberController,
    this.condition,
    required this.message,
  });
  final dynamic condition;
  final String message;
  final TextEditingController phoneNumberController;

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthenticationProvider>(context);

    return IntlPhoneField(
      validator: (value) {
        if (value == null || value.completeNumber.isEmpty) {
          return message;
        } else {
          return null;
        }
      },
      showCountryFlag: false,
      pickerDialogStyle: PickerDialogStyle(
        backgroundColor: ConstantColors.white,
        countryNameStyle: const TextStyle(fontWeight: FontWeight.w500),
        searchFieldPadding: const EdgeInsets.all(8),
      ),
      // autovalidateMode: AutovalidateMode.onUserInteraction,
      disableLengthCheck: false,

      onChanged: (value) {
        log(value.countryCode);

        authProvider.countryCode(value);
      },
      controller: phoneNumberController,
      initialCountryCode: 'IN',
      keyboardType: TextInputType.number,
      style: const TextStyle(fontWeight: FontWeight.w400, fontSize: 14),
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 13),
        filled: true,
        fillColor: ConstantColors.white,
        hintText: "Number goes here",
        hintStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
    );
  }
}

import 'package:dataing_app/utils/constants/colors.dart';
import 'package:dataing_app/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
 // Update with actual path

class CustomPhoneInputField extends StatelessWidget {
  final Function(String)? onChanged;

  const CustomPhoneInputField({
    Key? key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      decoration: InputDecoration(
        labelText: 'Phone Number',
        labelStyle: TextStyle(color: TColors.primary), // label color
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
          borderSide: BorderSide(color: TColors.primary), // border on focus
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
          borderSide: BorderSide(color: TColors.primary), // default border
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(TSizes.inputFieldRadius),
        ),
      ),
      style: TextStyle(color: TColors.primary), // input text color
      dropdownTextStyle: TextStyle(color: TColors.primary), // country code text
      initialCountryCode: 'US',
      onChanged: (phone) {
        if (onChanged != null) {
          onChanged!(phone.completeNumber);
        }
      },
    );
  }
}

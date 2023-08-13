import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_text_styles.dart';
import '../constants/colors.dart';

class AppTextFieldUnderLine extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final TextInputType keyboardType;
  final FormFieldSetter<String>? onSaved;
  final bool? isRequire;
  final TextStyle? labelStyle;
  final AutovalidateMode? autoValidateMode;
  final String? initialValue;
  final bool? enable;

  const AppTextFieldUnderLine({
    Key? key,
    this.initialValue,
    this.labelText = '',
    this.hintText = '',
    this.controller,
    this.onChanged,
    this.keyboardType = TextInputType.number,
    this.autoValidateMode,
    this.validator,
    this.onSaved,
    this.isRequire,
    this.labelStyle,
    this.enable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 25,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: TextFormField(
            enabled: enable,
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              contentPadding:
              const EdgeInsets.only(left: 2, right: 2, bottom: 12),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF000000)),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF000000)),
              ),
              // hintStyle: AppTextStyle.greyS16,
            ),
            initialValue: initialValue,
            autovalidateMode: autoValidateMode,
            validator: validator,
            keyboardType: keyboardType,
            onChanged: onChanged,
            style: AppTextStyle.blackS14,
            onSaved: onSaved,
          ),
        ),
      ],
    );
  }
}

class AppTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final TextInputType keyboardType;
  final FormFieldSetter<String>? onSaved;
  final bool? isRequire;
  final bool? enable;
  final TextStyle? labelStyle;
  final AutovalidateMode? autoValidateMode;
  final String? initialValue;
  final bool? obscureText;
  final String? suffixText;
  final TextStyle? suffixTextStyle;
  final List<TextInputFormatter>? inputFormatters;
  final IconButton? suffixIcon;
  final Function()? onTap;
  final bool? readOnly;

  const AppTextField({
    Key? key,
    this.initialValue,
    this.labelText = '',
    this.hintText = '',
    this.controller,
    this.onChanged,
    this.keyboardType = TextInputType.text,
    this.autoValidateMode,
    this.validator,
    this.onSaved,
    this.isRequire,
    this.labelStyle,
    this.enable,
    this.onTap,
    this.obscureText = false,
    this.suffixText,
    this.suffixTextStyle,
    this.inputFormatters, this.suffixIcon, this.readOnly,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly ?? false,
      onTap: onTap,
      obscureText: obscureText!,
      obscuringCharacter: "*",
      enabled: enable,
      inputFormatters: inputFormatters,
      controller: controller,
      decoration: InputDecoration(
        suffixText: suffixText,
        suffixStyle: suffixTextStyle,
        suffixIcon: suffixIcon,
        hintText: hintText,
        contentPadding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 13,
          bottom: 13,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.purpleBorder),
        ),
        disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.purpleBorder),
            borderRadius: BorderRadius.circular(10)),
        // focusedBorder: UnderlineInputBorder(
        //   borderSide: BorderSide(color: AppColors.main),
        // ),
        // enabledBorder: UnderlineInputBorder(
        //   borderSide: BorderSide(color: AppColors.main),
        // ),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.purpleBorder),
            borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.purpleBorder),
            borderRadius: BorderRadius.circular(10)),
        // focusedErrorBorder: OutlineInputBorder(
        //   // borderRadius: BorderRadius.circular(10),
        //   borderSide: BorderSide(color: AppColors.lineGray),
        // ),
        hintStyle: GoogleFonts.play(
          textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: Color(0xFFC4BFEF)
          )
        ),
        isDense: true,
      ),
      initialValue: initialValue,
      autovalidateMode: autoValidateMode,
      validator: validator,
      keyboardType: keyboardType,
      onChanged: onChanged,
      style: GoogleFonts.play(
          textStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: Color(0xFF7632d6)
          )
      ),
      onSaved: onSaved,
    );
  }
}

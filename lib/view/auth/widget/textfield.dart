import 'package:flutter/material.dart';
import 'package:movie_nest/core/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final bool obscure;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixTap;

  const CustomTextField({
    super.key,
    required this.hint,
    required this.controller,
    this.validator,
    this.obscure = false,
    this.suffixIcon,
    this.onSuffixTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: controller,
            validator: validator,
            obscureText: obscure,
            cursorColor: AppColors.txtClr1,
            style: TextStyle(color: AppColors.txtClr, fontSize: 16),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: AppColors.txtClr1),
              suffixIcon: suffixIcon == null
                  ? null
                  : IconButton(
                      onPressed: onSuffixTap,
                      icon: Icon(suffixIcon, color: AppColors.txtClr1),
                    ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.txtClr1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

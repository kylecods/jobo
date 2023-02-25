import 'package:flutter/material.dart';
import '../theme/theme.dart';

class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String? placeholder;
  final void Function() onTap;
  final bool password;
  final Widget? leading;
  final Widget? trailing;

  const AppTextField({
    super.key,
    required this.controller,
    required this.onTap,
    this.placeholder,
    this.password = false,
    this.leading,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.of(context);
    return TextField(
      controller: controller,
      style: TextStyle(
        height: 1,
        color: theme.colors.white,
      ),
      obscureText: password,
      decoration: InputDecoration(
        hintText: placeholder,
        hintStyle: TextStyle(
          color: theme.colors.grey,
        ),
        contentPadding: const EdgeInsets.all(10),
        filled: true,
        fillColor: theme.colors.grey,
        prefixIcon: leading,
        suffixIcon: trailing,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 2,
            color: theme.colors.primary,
          ),
        ),
        focusColor: theme.colors.primary,
      ),
    );
  }
}

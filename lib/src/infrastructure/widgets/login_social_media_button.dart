import 'package:flutter/material.dart';

class LoginSocialMediaButton extends StatelessWidget {
  const LoginSocialMediaButton(
      {Key? key,
      this.onPressed,
      required this.icon,
      required this.label,
      this.colorButton})
      : super(key: key);
  final VoidCallback? onPressed;
  final IconData icon;
  final String label;
  final Color? colorButton;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        primary: colorButton,
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
    );
  }
}

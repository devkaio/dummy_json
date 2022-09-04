// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class SecondaryButton extends StatelessWidget {
  final ValueGetter<void>? onPressed;
  final String buttonText;

  const SecondaryButton({
    Key? key,
    this.onPressed,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(buttonText),
    );
  }
}

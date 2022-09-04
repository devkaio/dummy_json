import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final bool isExpanded;
  final ValueGetter<void>? onPressed;
  final String buttonText;

  ///This button is expanded by default. Change [isExpanded] to false to return a fixed size button.
  const PrimaryButton({
    Key? key,
    this.isExpanded = true,
    this.onPressed,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isExpanded
        ? Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: onPressed,
                  child: Text(buttonText),
                ),
              ),
            ],
          )
        : SizedBox(
            width: 150,
            child: ElevatedButton(
              onPressed: onPressed,
              child: Text(buttonText),
            ),
          );
  }
}

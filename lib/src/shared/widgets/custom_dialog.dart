import 'package:flutter/material.dart';

class BaseDialog extends StatelessWidget {
  ///If [leftButtonPressed] is null, default behavior is pop the dialog.
  final ValueGetter<void>? leftButtonPressed;

  ///If [rightButtonText] is null, default behavior is pop the dialog.
  final ValueGetter<void>? rightButtonPressed;
  final String? leftButtonText;
  final String? rightButtonText;

  /// Default message on screen after pop the dialog
  final String? errorMessage;
  final IconData? icon;
  final Color? iconColor;
  final String title;
  final String subtitle;

  ///Custom dialog for error and alert handling.
  const BaseDialog({
    Key? key,
    this.leftButtonPressed,
    this.rightButtonPressed,
    this.leftButtonText,
    this.rightButtonText,
    this.errorMessage,
    this.icon,
    this.iconColor,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<Widget?>.delayed(
      Duration.zero,
      () => showDialog<Widget?>(
        context: context,
        builder: (context) => AlertDialog(
          title: icon != null
              ? Row(
                  children: [
                    Icon(
                      icon,
                      color: iconColor,
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    Text(title),
                  ],
                )
              : Text(title),
          content: Text(subtitle),
          actions: [
            leftButtonText != null
                ? TextButton(
                    onPressed: leftButtonPressed,
                    child: Text(leftButtonText!),
                  )
                : TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Cancelar"),
                  ),
            rightButtonText != null
                ? TextButton(
                    onPressed: rightButtonPressed,
                    child: Text(rightButtonText!))
                : TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Ok"),
                  ),
          ],
        ),
      ),
    );
    return errorMessage != null
        ? Center(child: Text(errorMessage!))
        : Container();
  }
}

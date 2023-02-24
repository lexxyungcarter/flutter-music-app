import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  bool loading;
  String text = 'Click me';
  IconData? icon;
  VoidCallback? onPress;
  VoidCallback? onLongPress;

  Button({
    Key? key,
    this.loading = false,
    required this.text,
    this.icon,
    this.onPress,
    this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            Theme.of(context).colorScheme.primaryContainer,
          ),
          foregroundColor: MaterialStateProperty.all(
            Theme.of(context).colorScheme.onPrimaryContainer,
          ),
        ),
        onPressed: onPress,
        onLongPress: onLongPress,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Text(
                  text,
                ),
              ),
              icon != null
                  ? Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Icon(icon, size: 16),
                    )
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}

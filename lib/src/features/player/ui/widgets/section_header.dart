import 'package:flutter/material.dart';

import '../../../../utils/extensions.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    Key? key,
    required this.title,
    required this.action,
    this.actionIcon = Icons.chevron_right,
    this.onActionPressed,
  }) : super(key: key);

  final String title;
  final String action;
  final IconData actionIcon;
  final VoidCallback? onActionPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: context.titleLarge,
        ),
        InkWell(
          onTap: onActionPressed,
          child: Row(
            children: [
              Text(
                action,
                style: context.titleMedium!.copyWith(
                  fontWeight: FontWeight.w300,
                ),
              ),
              Icon(
                actionIcon,
                size: 22,
                color: Colors.white,
              )
            ],
          ),
        ),
      ],
    );
  }
}

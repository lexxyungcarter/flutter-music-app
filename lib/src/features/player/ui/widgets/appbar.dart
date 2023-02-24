import 'package:flutter/material.dart';

import '../../../../utils/constants.dart';
import '../../../../utils/extensions.dart';

class Appbar extends StatelessWidget with PreferredSizeWidget {
  const Appbar({
    super.key,
    this.title,
    this.showAvatar = false,
    this.icon = Icons.chevron_left_sharp,
    this.onIconPressed,
  });

  final String? title;
  final bool showAvatar;
  final IconData icon;
  final VoidCallback? onIconPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: onIconPressed,
        icon: Icon(
          icon,
          color: Colors.white,
          size: 30,
        ),
      ),
      centerTitle: title != null,
      title: title != null ? Text(title!, style: context.headlineSmall) : null,
      actions: [
        showAvatar
            ? Container(
                margin: const EdgeInsets.only(right: 20),
                child: const CircleAvatar(
                  backgroundImage: NetworkImage(Constants.defaultAvatar),
                ),
              )
            : Container(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}

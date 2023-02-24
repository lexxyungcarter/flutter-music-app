import 'package:flutter/material.dart';

import '../../../../utils/app_styling.dart';
import '../../../../utils/extensions.dart';

class DiscoverMusic extends StatelessWidget {
  const DiscoverMusic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppStyling.pageSidePadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome',
            style: context.bodyLarge,
          ),
          Text(
            'Enjoy your favourite music',
            style: context.headlineSmall!.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          AppStyling.spacer,
          TextFormField(
            decoration: InputDecoration(
                isDense: true,
                filled: true,
                fillColor: Colors.white,
                hintText: 'Search',
                hintStyle: context.bodyMedium!.copyWith(
                  color: Colors.grey.shade400,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey.shade400,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                )),
          )
        ],
      ),
    );
  }
}

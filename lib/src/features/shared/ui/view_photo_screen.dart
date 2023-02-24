import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

import '../../../utils/app_styling.dart';

class ViewPhotoScreen extends StatefulWidget {
  final String imageUrl;
  final String? tag;

  const ViewPhotoScreen({Key? key, required this.imageUrl, this.tag})
      : super(key: key);

  @override
  ViewPhotoScreenState createState() => ViewPhotoScreenState();
}

class ViewPhotoScreenState extends State<ViewPhotoScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: widget.tag ?? widget.imageUrl,
            child: Image.network(
              widget.imageUrl,
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
            ),
          ),
          Positioned(
            top: size.height * 0.07,
            left: 0,
            right: 0,
            child: Padding(
              padding: AppStyling.pagePadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () => Navigator.of(context).pop(),
                    child: const Icon(
                      Ionicons.arrow_back_outline,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      Ionicons.cloud_download_outline,
                      color: Colors.white,
                      size: 30,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

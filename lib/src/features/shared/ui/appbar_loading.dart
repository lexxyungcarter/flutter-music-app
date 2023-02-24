import 'package:flutter/material.dart';

PreferredSize createProgressIndicator({bool loading = false}) => PreferredSize(
      preferredSize: const Size(double.infinity, 3.0),
      child: loading
          ? const SizedBox(
              height: 4.0,
              child: LinearProgressIndicator(),
            )
          : Container(),
    );

import 'package:flutter/material.dart';

import '../../../utils/app_styling.dart';

class ErrorScreen extends StatelessWidget {
  final Exception? error;

  const ErrorScreen({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ERROR'),
        automaticallyImplyLeading: true,
        centerTitle: true,
      ),
      body: Center(
          child: Padding(
        padding: AppStyling.pagePadding,
        child: Column(
          children: [
            const Text('Seems you are lost!'),
            Card(
              color: Colors.redAccent,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  error.toString(),
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.red.shade900,
                      ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Go Back'),
            ),
          ],
        ),
      )),
    );
  }
}

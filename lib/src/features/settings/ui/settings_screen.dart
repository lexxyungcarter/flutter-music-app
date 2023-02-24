import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ionicons/ionicons.dart';

import '../../../utils/app_styling.dart';
import '../../../utils/extensions.dart';
import '../../shared/ui/appbar_loading.dart';
import '../data/providers/theme_provider.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);
  static const route = 'settings';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeProvider);

    // ref.listen<bool>(onboardingProvider.select((state) => state.loading),
    //     (prev, next) {
    //   setState(() {
    //     loading = next;
    //   });
    // });

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings', style: context.displaySmall),
        bottom: createProgressIndicator(loading: loading),
      ),
      body: Container(
        padding: AppStyling.pagePadding,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: Text('Dark Mode', style: context.bodyMedium),
                leading: const Icon(Ionicons.contrast_outline),
                trailing: Switch(
                  value: theme.isDarkMode,
                  onChanged: (value) {
                    ref.read(themeProvider.notifier).toggle();
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ListTile(
                leading: const Icon(Ionicons.refresh_circle_outline),
                title: Text('Reset App (Delete app data)',
                    style: context.bodyMedium),
                trailing: const Icon(Ionicons.chevron_forward_outline),
                onTap: () {
                  // ref.read(onboardingProvider.notifier).reset();
                  // Navigator.pushNamedAndRemoveUntil(
                  //   context,
                  //   HomeScreen.route,
                  //   (route) => false,
                  // );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

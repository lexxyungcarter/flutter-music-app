import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:overlay_support/overlay_support.dart';

import 'src/features/settings/data/providers/theme_provider.dart';
import 'src/router.dart';
import 'src/utils/app_theme.dart';
import 'src/utils/constants.dart';

void main() {
  doRunApp();
}

doRunApp() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Hive.initFlutter();
  await Hive.openBox(Constants.settingsStorageKey); // settings
  await Hive.openBox(Constants.authStorageKey); // auth

  // now hide splash screen
  FlutterNativeSplash.remove();

  runApp(
    const ProviderScope(
      child: OverlaySupport.global(
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: ThemeData.from(
        colorScheme: AppTheme.schemeLight,
        useMaterial3: true,
      ),
      darkTheme: ThemeData.from(
        colorScheme: AppTheme.schemeDark,
        useMaterial3: true,
      ),
      themeMode: theme.mode,
    );
  }
}

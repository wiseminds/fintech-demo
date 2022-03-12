import 'package:flutter/material.dart';

import 'core/theme/app_theme.dart';
import 'dependency_injection.dart';
import 'views/splash_screen.dart';

void main() async {
  await DependencyInjection.bootstrap();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: WidgetsBinding.instance?.focusManager.primaryFocus?.unfocus,
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: AppTheme().light,
          darkTheme: AppTheme().dark, // to be enabled soon
          home: const SplashScreen(),
        ));
  }
}

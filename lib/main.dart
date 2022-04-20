import 'package:flutter/material.dart';
import 'package:portfolio/config/app_config.dart';

import 'core/locator.dart';
import 'ui/page/main/main_page.dart';

void main() {
  setupDependencies();
  runApp(const Portfolio());
}

class Portfolio extends StatelessWidget {
  const Portfolio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConfig.appTitle,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        primarySwatch: AppConfig.color.primaryColor,
      ),
      darkTheme: ThemeData.dark().copyWith(
        primaryColor: AppConfig.color.primaryColor,
      ),
      home: const MainPage(),
    );
  }
}

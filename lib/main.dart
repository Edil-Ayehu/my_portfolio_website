import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_portfolio_website/firebase_options.dart';
import 'package:flutter_portfolio_website/responsive/responsive_layout.dart';
import 'package:flutter_portfolio_website/screens/mobile_screen_layout.dart';
import 'package:flutter_portfolio_website/screens/web_screen_layout.dart';
import 'package:flutter_portfolio_website/theme/my_theme.dart';
import 'package:flutter_portfolio_website/theme/theme_controller.dart';
import 'package:provider/provider.dart'; 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeController()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = context.watch<ThemeController>();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Edilayehu Tadesse',
      theme: MyTheme.lightTheme,
      darkTheme: MyTheme.darkTheme,
      themeMode: themeController.themeMode,
      // home: UxSampleProjects(),
      home: ResponsiveLayout(
        mobileScreenLayout: MobileScreenLayout(),
        webScreenLayout: WebScreenLayout(),
      ),
    );
  }
}

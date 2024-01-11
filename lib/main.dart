import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone_flutter/theme/themeing.dart';
import 'package:whatsapp_clone_flutter/firebase_options.dart';
import 'package:whatsapp_clone_flutter/responsive/mobile_screen_layout.dart';
import 'package:whatsapp_clone_flutter/responsive/responsive_layout.dart';
import 'package:whatsapp_clone_flutter/responsive/web_screen_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WhatsApp Clone',
      theme: Themeing().getLightTheme(),
      darkTheme: Themeing().getDarkTheme(),
      themeMode: ThemeMode.system, // default
      home: const ResponsiveLayout(
        mobileScreenLayout: MobileScreenLayout(),
        webScreenLayout: WebScreenLayout(),
      ),
    );
  }
}

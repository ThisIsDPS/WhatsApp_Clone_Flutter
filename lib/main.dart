import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone_flutter/features/landing/screens/landing_screen.dart';
import 'package:whatsapp_clone_flutter/router.dart';
import 'package:whatsapp_clone_flutter/theme/themeing.dart';
import 'package:whatsapp_clone_flutter/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
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
      onGenerateRoute: (settings) => generateRoute(settings),
      home: LandingScreen(),
      // home: const ResponsiveLayout(
      //   mobileScreenLayout: MobileScreenLayout(),
      //   webScreenLayout: WebScreenLayout(),
      // ),
    );
  }
}

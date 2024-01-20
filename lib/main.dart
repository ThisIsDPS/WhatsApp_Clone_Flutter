import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone_flutter/common/widgets/error.dart';
import 'package:whatsapp_clone_flutter/common/widgets/loader.dart';
import 'package:whatsapp_clone_flutter/features/auth/controller/auth_controller.dart';
import 'package:whatsapp_clone_flutter/features/landing/screens/landing_screen.dart';
import 'package:whatsapp_clone_flutter/responsive/mobile_screen_layout.dart';
import 'package:whatsapp_clone_flutter/responsive/responsive_layout.dart';
import 'package:whatsapp_clone_flutter/responsive/web_screen_layout.dart';
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

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WhatsApp Clone',
      theme: Themeing().getLightTheme(),
      darkTheme: Themeing().getDarkTheme(),
      themeMode: ThemeMode.system, // default
      onGenerateRoute: (settings) => generateRoute(settings),
      // Persisting the state
      home: ref.watch(userDataAuthProvider).when(
          data: (user) {
            if (user == null) {
              return const LandingScreen();
            }
            return const ResponsiveLayout(
              mobileScreenLayout: MobileScreenLayout(),
              webScreenLayout: WebScreenLayout(),
            );
          },
          error: (error, stackTrace) {
            return ErrorScreen(error: error.toString());
          },
          loading: () => const Loader()),
    );
  }
}

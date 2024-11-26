import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:scan_doc/data/services/shared_preferences_service.dart';
import 'package:scan_doc/ui/screens/bottom_tab_bar/bottom_tab_bar.dart';
import 'package:scan_doc/ui/screens/onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _navigateToNext();
  }

  void _navigateToNext() async {
    final status = await SharedPreferencesService.getStatusShowOnboarding();
    if (!status) SharedPreferencesService.switchStatusShowOnboarding();
    Navigator.of(context).pushAndRemoveUntil(
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => status ? const BottomTabBar() : const OnboardingScreen(),
      ),
      (Route<dynamic> route) => false,
    );
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}

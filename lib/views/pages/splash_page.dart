import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:notey_flutter/views/routing/application_router.dart';
import 'package:notey_flutter/views/ui/ui.dart';

// Page:
class SplashPage extends StatefulWidget {
  // Constructor:
  const SplashPage({Key? key}) : super(key: key);

  // Methods:
  @override
  State<SplashPage> createState() => _SplashPageState();
}

// State:
class _SplashPageState extends State<SplashPage> {
  // Methods:
  @override
  void initState() {
    // Super:
    super.initState();
    // After(800MS): we'll navigate from our splash screen.
    Timer(const Duration(milliseconds: 800), () async {
      // Navigating:
      await Navigator.pushReplacementNamed(context, ApplicationRouter.homePage);
    });
  }

  // Build:
  @override
  Widget build(BuildContext context) {
    // Returning:
    return Container(
      color: context.appTheme.colorScheme.background,
      child: Center(
        child: SvgPicture.asset(
          "assets/logo/ic_foreground_logo_${context.appTheme.brightness == Brightness.light ? "light" : "dark"}.svg",
        ),
      ),
    );
  }
}

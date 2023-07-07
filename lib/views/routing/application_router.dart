import 'package:flutter/material.dart';
import 'package:notey_flutter/models/note_model.dart';
import 'package:notey_flutter/views/pages/home_page.dart';
import 'package:notey_flutter/views/pages/note_page.dart';
import 'package:notey_flutter/views/pages/settings_page.dart';
import 'package:notey_flutter/views/pages/splash_page.dart';

// Router(Application):
class ApplicationRouter {
  // Routes:
  static const String splashPage = "splash_page";
  static const String homePage = "home_page";
  static const String notePage = "note_page";
  static const String settingsPage = "settings_page";

  // Methods:
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    // Catching:
    try {
      // Initializing:
      Map<String, dynamic> screens = {
        // Screens:
        splashPage: MaterialPageRoute(builder: (_) => const SplashPage()),
        homePage: MaterialPageRoute(builder: (_) => const HomePage()),
        notePage: MaterialPageRoute(
            builder: (_) => NotePage(
                  note: settings.arguments as Note?,
                )),
        settingsPage: MaterialPageRoute(builder: (_) => const SettingsPage()),
      };
      // Returning:
      return screens[settings.name];
    } catch (exception) {
      // Throwing:
      throw Exception("Page ${settings.name!} was not found!");
    }
  }
}

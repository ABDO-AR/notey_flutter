import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

/// Class [UI] it'll contain our themes as well as some utilities UI functions.
class UI {
  // Colors(Primaries):
  static const primaryGreen = Color(0xff43B8A5);
  static const primaryBlack = Color(0xff18191A);
  static const primaryWhite = Color(0xffffffff);
  static const primaryBlue = Color(0xff4894FD);

  // Colors(Secondaries):
  static const secondaryLight = Color(0xffffffff);
  static const secondaryDark = Color(0xff242526);

  // Colors(Backgrounds):
  static const backgroundLight = Color(0xffffffff);
  static const backgroundDark = Color(0xff18191A);

  // Themes:
  static final lightTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.light,
    primaryColor: primaryGreen,
    fontFamily: GoogleFonts.poppins().fontFamily,
    colorScheme: const ColorScheme.light(
      background: backgroundLight,
      primary: primaryGreen,
      secondary: secondaryLight,
    ),
  );

  static final darkTheme = ThemeData(
    visualDensity: VisualDensity.adaptivePlatformDensity,
    brightness: Brightness.dark,
    primaryColor: primaryBlue,
    fontFamily: GoogleFonts.poppins().fontFamily,
    colorScheme: const ColorScheme.dark(
      background: primaryBlack,
      primary: primaryBlue,
      secondary: UI.secondaryDark,
    ),
  );

  static void changeSystemBarsColor(Color color, Brightness brightness) {
    // Changing:
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: color,
      systemNavigationBarColor: color,
      statusBarIconBrightness: brightness,
      systemNavigationBarDividerColor: Colors.white,
    ));
  }
}

extension ThemeExtras on ThemeData {
  // Styles:
  Color get textColor => brightness == Brightness.light ? UI.primaryBlack : UI.primaryWhite;
  Color get textStyle1Header => brightness == Brightness.light ? const Color(0x801d1d1b) : const Color(0x6bffffff);
  Color get cardStyle2Color => brightness == Brightness.light ? const Color(0xffF6F6F6) : UI.secondaryDark;
}

/// We'll use this to access the [ThemeData] faster within contexts.
extension ThemeContext on BuildContext {
  // Getters:
  ThemeData get appTheme => Theme.of(this);
}

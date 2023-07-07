import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:notey_flutter/main.dart';
import 'package:notey_flutter/views/ui/ui.dart';
import 'package:variable_app_icon/variable_app_icon.dart';

/// [UIController] this is the base controller for controlling anything related to the UI.
class UIController extends GetxController {
  // Fields:
  bool isDarkModeActive = false;
  bool isDarkModeIconActive = false;

  // Methods:
  @override
  void onInit() {
    // Super:
    super.onInit();
    // Initializing:
    var lightStorage = GetStorage();
    var darkModeStatus = lightStorage.read<bool>("dark_mode_status");
    var darkModeIconStatus = lightStorage.read<bool>("dark_mode_icon_status");

    // Checking:
    if (darkModeStatus != null) toggleDarkMode(darkModeStatus);
    if (darkModeIconStatus != null) isDarkModeIconActive = darkModeIconStatus;
  }

  void toggleDarkMode(bool activate) {
    // Initializing: and saving the status.
    var lightStorage = GetStorage();
    lightStorage.write("dark_mode_status", activate).then((_) {
      // Toggling:
      isDarkModeActive = activate;
      // Checking:
      Get.changeThemeMode(isDarkModeActive ? ThemeMode.dark : ThemeMode.light);
      UI.changeSystemBarsColor(
        activate ? UI.primaryBlack : UI.primaryWhite,
        activate ? Brightness.light : Brightness.dark,
      );
      // Updating: the state.
      update();
    });
  }

  void toggleDarkModeIcon(bool activate) {
    // Initializing: and saving the status.
    var lightStorage = GetStorage();
    lightStorage.write("dark_mode_icon_status", activate).then((_) async {
      // Toggling:
      isDarkModeIconActive = activate;
      // Updating: the state.
      update();
      // Changing:
      await VariableAppIcon.changeAppIcon(
        androidIconId: activate ? androidIconIds[1] : androidIconIds[0],
      );
    });
  }
}

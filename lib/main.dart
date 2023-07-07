import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:notey_flutter/controllers/ui_controller.dart';
import 'package:notey_flutter/views/routing/application_router.dart';
import 'package:notey_flutter/views/ui/ui.dart';
import 'package:variable_app_icon/variable_app_icon.dart';

// Manifest: available logo styles.
List<String> androidIconIds = ["appicon.LIGHT", "appicon.DARK"];

// Main:
void main() async {
  // Initializing: our logo styles.
  VariableAppIcon.androidAppIconIds = androidIconIds;
  // Changing: status bar color - with default of light.
  UI.changeSystemBarsColor(
    UI.primaryWhite,
    Brightness.dark,
  );
  // Initializing:
  await Hive.initFlutter();
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  // Run: our application.
  runApp(Application());
}

// Application:
class Application extends StatelessWidget {
  // Fields:
  final UIController _uiController = Get.put(UIController());

  // Constructor:
  Application({super.key});

  // Building:
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notey',
      theme: UI.lightTheme,
      darkTheme: UI.darkTheme,
      themeMode: _uiController.isDarkModeActive ? ThemeMode.dark : ThemeMode.light,
      initialRoute: ApplicationRouter.splashPage,
      onGenerateRoute: ApplicationRouter.onGenerateRoute,
    );
  }
}

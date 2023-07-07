import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:notey_flutter/controllers/ui_controller.dart';
import 'package:notey_flutter/views/ui/ui.dart';
import 'package:notey_flutter/views/widgets/setting_item_widget.dart';
import 'package:notey_flutter/views/widgets/settings_section_widget.dart';

// Page:
class SettingsPage extends StatefulWidget {
  // Constructor:
  const SettingsPage({Key? key}) : super(key: key);

  // Methods:
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

// State:
class _SettingsPageState extends State<SettingsPage> {
  // Fields:
  late final UIController _uiController;

  // Methods:
  @override
  void initState() {
    // Super:
    super.initState();
    // Initializing:
    _uiController = Get.find();
  }

  // Build:
  @override
  Widget build(BuildContext context) {
    // Returning:
    return Scaffold(
      backgroundColor: context.appTheme.colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GetBuilder<UIController>(
                builder: (_) => SettingsSection(
                  settingName: "Appearance".toUpperCase(),
                  children: [
                    const SizedBox(height: 16),
                    SettingItem(
                      icon: Icons.light_mode_rounded,
                      iconColor: context.appTheme.primaryColor.withOpacity(.8),
                      title: "Dark Mode",
                      onCheckChange: (v) {
                        // Changing:
                        setState(() => _uiController.toggleDarkMode(v));
                      },
                      value: _uiController.isDarkModeActive,
                    ),
                    const SizedBox(height: 16),
                    SettingItem(
                      icon: Icons.satellite_rounded,
                      iconColor: context.appTheme.primaryColor.withOpacity(.8),
                      title: "Dark Mode Icon",
                      onCheckChange: (v) {
                        // Changing:
                        setState(() => _uiController.toggleDarkModeIcon(v));
                      },
                      value: _uiController.isDarkModeIconActive,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

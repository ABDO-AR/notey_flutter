import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notey_flutter/views/ui/ui.dart';
import '../fonts/google_fonts_weight.dart';

// Widget
class SettingsSection extends StatefulWidget {
  // Fields:
  final String settingName;
  final List<Widget> children;

  // Constructor:
  const SettingsSection({
    Key? key,
    required this.settingName,
    required this.children,
  }) : super(key: key);

  // Methods:
  @override
  State<SettingsSection> createState() => _SettingsSectionState();
}

// State:
class _SettingsSectionState extends State<SettingsSection> {
  // Fields:
  // Constructor:
  // Methods:
  // Build:
  @override
  Widget build(BuildContext context) {
    // Returning:
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          color: context.appTheme.cardStyle2Color,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
            child: Text(
              widget.settingName,
              style: GoogleFonts.poppins(
                fontSize: 18,
                color: context.appTheme.textStyle1Header,
                fontWeight: GoogleFontsWeight.MEDIUM.weight,
              ),
            ),
          ),
        ),
        ...widget.children,
      ],
    );
  }
}

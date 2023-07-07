import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notey_flutter/views/ui/ui.dart';
import 'package:flutter_switch/flutter_switch.dart';
import '../fonts/google_fonts_weight.dart';

// Widget
class SettingItem extends StatefulWidget {
  // Fields:
  final IconData icon;
  final Color? iconColor;
  final String title;
  bool? value;
  Function(bool value)? onCheckChange;

  SettingItem({
    super.key,
    required this.icon,
    required this.title,
    required this.onCheckChange,
    required this.value,
    this.iconColor,
  });

  // Methods:
  @override
  State<SettingItem> createState() => _SettingItemState();
}

// State:
class _SettingItemState extends State<SettingItem> {
  // Fields:
  // Constructor:
  // Methods:

  // Build:
  @override
  Widget build(BuildContext context) {
    // Returning:
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                widget.icon,
                size: 24,
                color: widget.iconColor,
              ),
              const SizedBox(width: 10),
              Text(
                widget.title,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: context.appTheme.textColor,
                  fontWeight: GoogleFontsWeight.REGULAR.weight,
                ),
              ),
            ],
          ),
          FlutterSwitch(
            onToggle: widget.onCheckChange!,
            value: widget.value!,
            activeColor: context.appTheme.primaryColor,
            height: 30,
            width: 60,
            inactiveColor: const Color(0xffF1F1F1),
          ),
        ],
      ),
    );
  }
}

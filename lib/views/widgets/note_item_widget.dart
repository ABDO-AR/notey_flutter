import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/note_model.dart';
import '../fonts/google_fonts_weight.dart';

// Widget
class NoteItemWidget extends StatefulWidget {
  // Fields:
  final Note note;
  final Function(Note note) onPressed;

  // Constructor:
  const NoteItemWidget({
    Key? key,
    required this.note,
    required this.onPressed,
  }) : super(key: key);

  // Methods:
  @override
  State<NoteItemWidget> createState() => _NoteItemWidgetState();
}

// State:
class _NoteItemWidgetState extends State<NoteItemWidget> {
  // Build:
  @override
  Widget build(BuildContext context) {
    // Returning:
    return GestureDetector(
      onTap: () => widget.onPressed(widget.note),
      child: Container(
        decoration: BoxDecoration(
          color: Color(widget.note.noteBackgroundColor),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.note.title,
                style: GoogleFonts.poppins(
                  fontSize: 22,
                  fontWeight: GoogleFontsWeight.REGULAR.weight,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.note.lastEditDate,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: GoogleFontsWeight.EXTRA_LIGHT.weight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

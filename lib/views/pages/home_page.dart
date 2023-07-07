import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notey_flutter/controllers/notes_controller.dart';
import 'package:notey_flutter/views/fonts/google_fonts_weight.dart';
import 'package:notey_flutter/views/routing/application_router.dart';
import 'package:notey_flutter/views/widgets/note_item_widget.dart';

// Page:
class HomePage extends StatefulWidget {
  // Constructor:
  const HomePage({Key? key}) : super(key: key);

  // Methods:
  @override
  State<HomePage> createState() => _HomePageState();
}

// State:
class _HomePageState extends State<HomePage> {
  // Fields:
  final NotesController notesController = Get.put(NotesController());

  // Build:
  @override
  Widget build(BuildContext context) {
    // Returning:
    return Scaffold(
      backgroundColor: context.theme.colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Notes",
                    style: GoogleFonts.poppins(
                      fontSize: 32,
                      fontWeight: GoogleFontsWeight.MEDIUM.weight,
                    ),
                  ),
                  IconButton(
                    onPressed: () async => await Navigator.pushNamed(context, ApplicationRouter.settingsPage),
                    icon: Icon(Icons.settings, color: context.theme.primaryColor),
                  )
                ],
              ),
              const SizedBox(height: 16),
              Expanded(
                child: GetBuilder<NotesController>(
                  builder: (_) => GridView.builder(
                    itemCount: notesController.notes.length,
                    itemBuilder: (_, index) => NoteItemWidget(
                      note: notesController.notes[index],
                      onPressed: (note) async => await Navigator.pushNamed(
                        context,
                        ApplicationRouter.notePage,
                        arguments: note,
                      ),
                    ),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      childAspectRatio: 2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        backgroundColor: context.theme.primaryColor,
        onPressed: () async => await Navigator.pushNamed(context, ApplicationRouter.notePage),
        child: const Icon(Icons.add, color: Colors.white, size: 32),
      ),
    );
  }
}

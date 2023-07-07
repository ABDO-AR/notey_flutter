import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notey_flutter/controllers/notes_controller.dart';
import 'package:notey_flutter/models/note_model.dart';
import 'package:notey_flutter/views/fonts/google_fonts_weight.dart';

// Page:
class NotePage extends StatefulWidget {
  // Fields:
  Note? note;
  bool isAlreadyExists = false;

  // Constructor:
  NotePage({Key? key, this.note}) : super(key: key) {
    // Initializing:
    isAlreadyExists = note != null;
    note ??= Note.create(title: "", content: "");
  }

  // Methods:
  @override
  State<NotePage> createState() => _NotePageState();
}

// State:
class _NotePageState extends State<NotePage> {
  // Fields:
  final NotesController _notesController = Get.find();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  @override
  void initState() {
    // Super:
    super.initState();
    // Initializing:
    if (widget.note!.title.isNotEmpty) setState(() => titleController.text = widget.note!.title);
    if (widget.note!.content.isNotEmpty) setState(() => contentController.text = widget.note!.content);
  }

  @override
  void dispose() {
    // Checking: if the title or the content are not empty.
    if (widget.note!.title.isNotEmpty || widget.note!.content.isNotEmpty) {
      // Checking: for the required operation.
      if (widget.isAlreadyExists) {
        // Updating: the existing note.
        _notesController.editExistingNote(widget.note!).then((_) => _notesController.update());
      } else {
        // Saving: as a new note
        _notesController.addNewNote(widget.note!).then((_) => _notesController.update());
      }
    }
    // Disposing:
    super.dispose();
  }

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
                  SizedBox(
                    width: 300,
                    child: TextField(
                      controller: titleController,
                      onChanged: (value) => setState(() => widget.note!.title = value),
                      maxLines: 1,
                      style: GoogleFonts.poppins(fontSize: 32, fontWeight: GoogleFontsWeight.MEDIUM.weight),
                      decoration: const InputDecoration(
                        hintText: "Title",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Visibility(
                    visible: widget.isAlreadyExists,
                    child: IconButton(
                      onPressed: () async {
                        showPlatformDialog(
                          context: context,
                          builder: (context) => BasicDialogAlert(
                            title: Text(
                              "Confirm delete operation!",
                              style: GoogleFonts.poppins(fontWeight: GoogleFontsWeight.MEDIUM.weight),
                            ),
                            content: const Text("Action cannot be undone, it'll be deleted forever."),
                            actions: <Widget>[
                              BasicDialogAction(
                                title: const Text("Cancel"),
                                onPressed: () => Navigator.pop(context),
                              ),
                              BasicDialogAction(
                                title: const Text("Delete"),
                                onPressed: () async {
                                  // Deleting:
                                  await _notesController.deleteExistingNote(widget.note!.id);
                                  _notesController.update();
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        );
                      },
                      icon: Icon(Icons.delete, color: context.theme.primaryColor),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 8),
              Text(
                widget.note!.lastEditDate,
                style: GoogleFonts.poppins(fontSize: 16, fontWeight: GoogleFontsWeight.EXTRA_LIGHT.weight),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: TextField(
                    controller: contentController,
                    onChanged: (value) => setState(() => widget.note!.content = value),
                    textInputAction: TextInputAction.newline,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    style: GoogleFonts.poppins(fontSize: 20, fontWeight: GoogleFontsWeight.REGULAR.weight),
                    decoration: const InputDecoration(
                      hintText: "Content",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

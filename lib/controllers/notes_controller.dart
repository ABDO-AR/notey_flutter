import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:notey_flutter/models/note_model.dart';

/// [NotesController] it's the base controller for all notes operations.
class NotesController extends GetxController {
  // Fields:
  late Box<Note> notesBox;
  var notes = <Note>[].obs;

  // Methods:
  @override
  void onInit() {
    try {
      // Registering: our adapters:
      Hive.registerAdapter(NoteAdapter());
    } catch (e) {
      // Logging: if there any exceptions.
      if (kDebugMode) print(e);
    }
    // Getting: all the saved notes.
    requestAllSavedNotes().then((_) => update());
    // Super:
    super.onInit();
  }

  @override
  void dispose() {
    // Super:
    super.dispose();
    // Disposing:
    notesBox.close();
  }

  Future<void> requestAllSavedNotes() async {
    // Trying: to access the box, but sometimes we'll need to open it.
    try {
      // Initializing:
      notesBox = Hive.box("NotesDB");
    } catch (e) {
      // Initializing:
      notesBox = await Hive.openBox("NotesDB");
    }

    // Initializing:
    notes = notesBox.values.toList().obs;
  }

  Future<void> addNewNote(Note note) async {
    // Adding:
    notesBox.add(note);
    await requestAllSavedNotes();
  }

  Future<void> editExistingNote(Note note) async {
    // Adding:
    notesBox.values.toList().asMap().forEach((index, value) async {
      // Checking:
      if (value.id == note.id) {
        // Updating:
        await notesBox.putAt(index, note);
      }
    });
    await requestAllSavedNotes();
  }

  Future<void> deleteExistingNote(String id) async {
    // Adding:
    notesBox.values.toList().asMap().forEach((index, value) async {
      // Checking:
      if (value.id == id) {
        // Updating:
        await notesBox.deleteAt(index);
      }
    });
    await requestAllSavedNotes();
  }
}

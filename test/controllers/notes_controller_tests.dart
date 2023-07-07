import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:notey_flutter/controllers/notes_controller.dart';
import 'package:notey_flutter/models/note_model.dart';

import 'notes_controller_tests.mocks.dart';

@GenerateMocks([NotesController])
void main() {
  // Initialization:
  var mockedController = MockNotesController();
  // Grouping:
  group("Notes Operations", () {
    // Tests:
    test("Notes list | should | be empty | when request them first time", () {
      // Arrange:
      when(mockedController.notes).thenReturn(<Note>[].obs);
      when(mockedController.requestAllSavedNotes()).thenAnswer((_) async => true);
      // Act:
      mockedController.requestAllSavedNotes();
      // Assert:
      verify(mockedController.requestAllSavedNotes());
      expect(mockedController.notes, equals(<Note>[].obs));
    });

    test("Notes list | should | not be empty | when adding a new note", () {
      // Arrange:
      var note = Note.create(title: "New Note", content: "Fake Content");
      when(mockedController.notes).thenReturn(<Note>[note].obs);
      when(mockedController.addNewNote(note)).thenAnswer((_) async => true);
      // Act:
      mockedController.addNewNote(note);
      // Assert:
      verify(mockedController.addNewNote(note));
      expect(mockedController.notes, equals([note]));
    });

    test("Note | should | be edited | when editing it", () {
      // Arrange:
      var note = Note.create(title: "New Note", content: "Fake Content");
      when(mockedController.notes).thenReturn(<Note>[note].obs);
      when(mockedController.editExistingNote(note)).thenAnswer((_) async => true);
      // Act:
      mockedController.editExistingNote(note);
      // Assert:
      verify(mockedController.editExistingNote(note));
      expect(mockedController.notes, equals([note]));
    });

    test("Notes list | should | be empty | when deleting the last note", () {
      // Arrange:
      var note = Note.create(title: "New Note", content: "Fake Content");
      when(mockedController.notes).thenReturn(<Note>[].obs);
      when(mockedController.deleteExistingNote(note.id)).thenAnswer((_) async => true);
      // Act:
      mockedController.deleteExistingNote(note.id);
      // Assert:
      verify(mockedController.deleteExistingNote(note.id));
      expect(mockedController.notes, equals(<Note>[].obs));
    });
  });
}

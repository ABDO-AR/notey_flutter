import "dart:io";

import "package:flutter/material.dart";
import "package:flutter_test/flutter_test.dart";
import "package:integration_test/integration_test.dart";
import "package:mockito/mockito.dart";
import "package:notey_flutter/main.dart" as app;
import "package:notey_flutter/views/widgets/note_item_widget.dart";

main() {
  // Initializing:
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // Grouping:
  group("Notes Operations", () {
    // Testing:
    testWidgets(
      "Notes list | should | be contain note with title of Tasks | when adding a new note from the notes page",
      (tester) async {
        // Arrange:
        app.main();

        await tester.pumpAndSettle(const Duration(seconds: 3));
        final Finder newNoteFAB = find.byIcon(Icons.add);

        // Act:
        await tester.tap(newNoteFAB);
        await tester.pumpAndSettle();

        final Finder titleField = find.byType(TextField).first;
        await tester.enterText(titleField, "Tasks");
        await tester.pumpAndSettle();

        final NavigatorState navigator = tester.state(find.byType(Navigator));
        navigator.pop();
        await tester.pumpAndSettle();

        // Assert:
        expect(find.widgetWithText(NoteItemWidget, "Tasks"), findsOneWidget);
      },
    );

    testWidgets(
      "Notes list | should | be contain note with title of TasksU | when update the existing note from the notes page",
      (tester) async {
        // Arrange:
        app.main();

        await tester.pumpAndSettle(const Duration(seconds: 3));
        final Finder newNoteFAB = find.byIcon(Icons.add);

        // Act:
        await tester.tap(newNoteFAB);
        await tester.pumpAndSettle();

        final Finder titleField = find.byType(TextField).first;
        await tester.enterText(titleField, "Tasks");
        await tester.pumpAndSettle();

        final NavigatorState navigator = tester.state(find.byType(Navigator));
        navigator.pop();
        await tester.pumpAndSettle();

        final Finder note = find.byType(NoteItemWidget).first;
        await tester.tap(note);
        await tester.pumpAndSettle();

        await tester.enterText(titleField, "TasksU");
        await tester.pumpAndSettle();

        navigator.pop();
        await tester.pumpAndSettle();

        // Assert:
        expect(find.widgetWithText(NoteItemWidget, "TasksU"), findsOneWidget);
      },
    );

    testWidgets(
      "Notes list | should | be empty | when deleting the added note",
      (tester) async {
        // Arrange:
        app.main();

        await tester.pumpAndSettle(const Duration(seconds: 3));
        final Finder newNoteFAB = find.byIcon(Icons.add);

        // Act:
        await tester.tap(newNoteFAB);
        await tester.pumpAndSettle();

        final Finder titleField = find.byType(TextField).first;
        await tester.enterText(titleField, "Tasks");
        await tester.pumpAndSettle();

        final NavigatorState navigator = tester.state(find.byType(Navigator));
        navigator.pop();
        await tester.pumpAndSettle();

        final Finder note = find.byType(NoteItemWidget).first;
        await tester.tap(note);
        await tester.pumpAndSettle();

        final Finder deleteButton = find.byIcon(Icons.delete);
        await tester.tap(deleteButton);

        await tester.pumpAndSettle();
        final Finder deleteText = find.text("Delete");
        await tester.tap(deleteText);
        await tester.pumpAndSettle();

        navigator.pop();
        await tester.pumpAndSettle();

        // Assert:
        expect(find.widgetWithText(NoteItemWidget, "Tasks"), findsNothing);
      },
    );
  });
}

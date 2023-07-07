import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:notey_flutter/controllers/ui_controller.dart';

import 'ui_controller_tests.mocks.dart';

@GenerateMocks([UIController])
void main() {
  // Initializing:
  var mockedController = MockUIController();
  // Grouping:
  group("Testing dark mode toggling", () {
    // Tests:
    test("Dark mode value | should | be false | when toggle it with false value", () {
      // Arrange:
      when(mockedController.isDarkModeActive).thenReturn(false);
      when(mockedController.toggleDarkMode(false)).thenAnswer((_) {});
      // Act:
      mockedController.toggleDarkMode(false);
      // Assert
      verify(mockedController.toggleDarkMode(false));
      expect(mockedController.isDarkModeActive, equals(false));
    });

    test("Dark mode value | should | be true | when toggle it with true value", () {
      // Arrange:
      when(mockedController.isDarkModeActive).thenReturn(true);
      when(mockedController.toggleDarkMode(true)).thenAnswer((_) {});
      // Act:
      mockedController.toggleDarkMode(true);
      // Assert
      verify(mockedController.toggleDarkMode(true));
      expect(mockedController.isDarkModeActive, equals(true));
    });
  });
}

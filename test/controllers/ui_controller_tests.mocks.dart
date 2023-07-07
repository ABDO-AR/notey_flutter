// Mocks generated by Mockito 5.4.2 from annotations
// in notey_flutter/test/unit/controllers/ui_controller_tests.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:ui' as _i5;

import 'package:get/get.dart' as _i2;
import 'package:get/get_state_manager/src/simple/list_notifier.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:notey_flutter/controllers/ui_controller.dart' as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeInternalFinalCallback_0<T> extends _i1.SmartFake
    implements _i2.InternalFinalCallback<T> {
  _FakeInternalFinalCallback_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [UIController].
///
/// See the documentation for Mockito's code generation for more information.
class MockUIController extends _i1.Mock implements _i3.UIController {
  MockUIController() {
    _i1.throwOnMissingStub(this);
  }

  @override
  bool get isDarkModeActive => (super.noSuchMethod(
        Invocation.getter(#isDarkModeActive),
        returnValue: false,
      ) as bool);
  @override
  set isDarkModeActive(bool? _isDarkModeActive) => super.noSuchMethod(
        Invocation.setter(
          #isDarkModeActive,
          _isDarkModeActive,
        ),
        returnValueForMissingStub: null,
      );
  @override
  bool get isDarkModeIconActive => (super.noSuchMethod(
        Invocation.getter(#isDarkModeIconActive),
        returnValue: false,
      ) as bool);
  @override
  set isDarkModeIconActive(bool? _isDarkModeIconActive) => super.noSuchMethod(
        Invocation.setter(
          #isDarkModeIconActive,
          _isDarkModeIconActive,
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i2.InternalFinalCallback<void> get onStart => (super.noSuchMethod(
        Invocation.getter(#onStart),
        returnValue: _FakeInternalFinalCallback_0<void>(
          this,
          Invocation.getter(#onStart),
        ),
      ) as _i2.InternalFinalCallback<void>);
  @override
  _i2.InternalFinalCallback<void> get onDelete => (super.noSuchMethod(
        Invocation.getter(#onDelete),
        returnValue: _FakeInternalFinalCallback_0<void>(
          this,
          Invocation.getter(#onDelete),
        ),
      ) as _i2.InternalFinalCallback<void>);
  @override
  bool get initialized => (super.noSuchMethod(
        Invocation.getter(#initialized),
        returnValue: false,
      ) as bool);
  @override
  bool get isClosed => (super.noSuchMethod(
        Invocation.getter(#isClosed),
        returnValue: false,
      ) as bool);
  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);
  @override
  int get listeners => (super.noSuchMethod(
        Invocation.getter(#listeners),
        returnValue: 0,
      ) as int);
  @override
  void onInit() => super.noSuchMethod(
        Invocation.method(
          #onInit,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void toggleDarkMode(bool? activate) => super.noSuchMethod(
        Invocation.method(
          #toggleDarkMode,
          [activate],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void toggleDarkModeIcon(bool? activate) => super.noSuchMethod(
        Invocation.method(
          #toggleDarkModeIcon,
          [activate],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void update([
    List<Object>? ids,
    bool? condition = true,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #update,
          [
            ids,
            condition,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onReady() => super.noSuchMethod(
        Invocation.method(
          #onReady,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void onClose() => super.noSuchMethod(
        Invocation.method(
          #onClose,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void $configureLifeCycle() => super.noSuchMethod(
        Invocation.method(
          #$configureLifeCycle,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i4.Disposer addListener(_i4.GetStateUpdate? listener) => (super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValue: () {},
      ) as _i4.Disposer);
  @override
  void removeListener(_i5.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void refresh() => super.noSuchMethod(
        Invocation.method(
          #refresh,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void refreshGroup(Object? id) => super.noSuchMethod(
        Invocation.method(
          #refreshGroup,
          [id],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void notifyChildrens() => super.noSuchMethod(
        Invocation.method(
          #notifyChildrens,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void removeListenerId(
    Object? id,
    _i5.VoidCallback? listener,
  ) =>
      super.noSuchMethod(
        Invocation.method(
          #removeListenerId,
          [
            id,
            listener,
          ],
        ),
        returnValueForMissingStub: null,
      );
  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );
  @override
  _i4.Disposer addListenerId(
    Object? key,
    _i4.GetStateUpdate? listener,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #addListenerId,
          [
            key,
            listener,
          ],
        ),
        returnValue: () {},
      ) as _i4.Disposer);
  @override
  void disposeId(Object? id) => super.noSuchMethod(
        Invocation.method(
          #disposeId,
          [id],
        ),
        returnValueForMissingStub: null,
      );
}
import 'dart:developer';

import 'package:example/ComplexState.dart';
import 'package:view_model_binder/view_model_binder.dart';

class AppState extends StreamState {
  // 1. we create a data store (it's just a stream underneath)
  // Managers are immutable, thus stores must be `final`
  // final title = "NO TITLE".toBehaviorSubject;

  final complexState = ComplexState().toBehaviorSubject;

  // 2. we define some actions
  void setTitle(String value) {
    complexState.value = ComplexState(
        title: value,
        counterInitialValue: complexState.value.counterInitialValue);
  }

  void toggleTheme() {
    complexState.value = ComplexState(
      title: complexState.value.title,
      counterInitialValue: complexState.value.counterInitialValue,
      isDarkTheme: !complexState.value.isDarkTheme,
    );
  }

  void setTheme(bool isDarkMode) {
    complexState.value = ComplexState(
      title: complexState.value.title,
      counterInitialValue: complexState.value.counterInitialValue,
      isDarkTheme: isDarkMode,
    );
  }

  @override
  void dispose() {
    // Close the stream to release resources
    complexState.close();
    // title.close();
  }
}

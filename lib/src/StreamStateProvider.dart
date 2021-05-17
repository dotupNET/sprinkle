import 'package:flutter/material.dart';

import 'StreamStateRegistry.dart';


class StreamStateProvider extends InheritedWidget {
  final StreamStateRegistry streamStateRegistry;

  StreamStateProvider({
    Key? key,
    required Widget child,
    required this.streamStateRegistry,
  }) : super(key: key, child: child);

  static StreamStateRegistry? of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<StreamStateProvider>())?.streamStateRegistry;
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }
}

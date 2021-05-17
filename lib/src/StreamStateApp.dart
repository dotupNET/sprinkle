import 'package:flutter/material.dart';

import 'StreamStateProvider.dart';
import 'StreamStateRegistry.dart';

class StreamStateApp extends StatelessWidget {
  final Widget child;
  final StreamStateRegistry streamStateRegistry;

  StreamStateApp({required this.child, required this.streamStateRegistry});

  Widget build(BuildContext context) {
    return StreamStateProvider(
      streamStateRegistry: streamStateRegistry,
      child: child,
    );
  }
}

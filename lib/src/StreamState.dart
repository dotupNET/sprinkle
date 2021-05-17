import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

// typedef UseFunction = T Function<T>();

@immutable
abstract class StreamState {
  void dispose();
}

extension ViewModelBinderInt on int {
  BehaviorSubject<int> get toBehaviorSubject => BehaviorSubject<int>.seeded(this);
}

extension ViewModelBinderString on String {
  BehaviorSubject<String> get toBehaviorSubject => BehaviorSubject<String>.seeded(this);
}

extension ViewModelBinderDouble on double {
  BehaviorSubject<double> get toBehaviorSubject => BehaviorSubject<double>.seeded(this);
}

extension ViewModelBinderBool on bool {
  BehaviorSubject<bool> get toBehaviorSubject => BehaviorSubject<bool>.seeded(this);
}

extension ViewModelBinderList<T> on List<T> {
  BehaviorSubject<List<T>> get toBehaviorSubject =>
      BehaviorSubject<List<T>>.seeded(this);
}

extension ViewModelBinderObject<T> on T {
  BehaviorSubject<T> get toBehaviorSubject => BehaviorSubject<T>.seeded(this);
}

import 'package:rxdart/rxdart.dart';
import 'package:view_model_binder/view_model_binder.dart';

class CounterState extends StreamState {
  // 1. we create a data store (it's just a stream underneath)
  // Managers are immutable, thus stores must be `final`
  late final BehaviorSubject<int> counter;

  CounterState({int initialValue = 0}) {
    counter = initialValue.toBehaviorSubject;

  }

  // 2. we define some actions
  void increment() => counter.value++;
  void decrement() => counter.value--;
  void add(int number) => counter.value += number;

  @override
  void dispose() {
    // Close the stream to release resources
    counter.close();
  }
}

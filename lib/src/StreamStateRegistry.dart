import 'StreamState.dart';

typedef FactoryMethod = StreamState Function();

class StreamStateRegistry {
  Map<dynamic, StreamState> streamStates = {};
  Map<dynamic, FactoryMethod> factoryMethods = {};

  StreamStateRegistry register<T extends StreamState>(
      FactoryMethod factoryMethod) {
    factoryMethods[T] = factoryMethod;
    return this;
  }

  T getStreamState<T>() {
    if (!streamStates.containsKey(T)) {
      if (factoryMethods[T] != null) {
        streamStates[T] = factoryMethods[T]!();
      }
    }
    return streamStates[T] as T;
  }

  // _createInstance<T>() => streamStates[T] = factoryMethods[T]();

  // T getStreamState<T>() =>
  //     streamStates.containsKey(T) ? streamStates[T] : _createInstance<T>();

  release<T>() {
    StreamState state = getStreamState<T>() as StreamState;
    state.dispose();
    streamStates.remove(T);
  }
}

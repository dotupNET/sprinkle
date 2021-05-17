import 'package:example/ComplexState.dart';
import 'package:example/CounterState.dart';
import 'package:example/theme/AppTheme.dart';
import 'package:flutter/material.dart';
import 'package:view_model_binder/view_model_binder.dart';

import 'AppState.dart';

void main() {
  final registry = StreamStateRegistry();
  registry.register<CounterState>(() => CounterState());
  registry.register<AppState>(() => AppState());

  runApp(
    StreamStateApp(
      streamStateRegistry: registry,
      child: App(),
    ),
  );
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = context.use<AppState>();
    return StreamStateBuilder<ComplexState>(
      stream: appState.complexState,
      builder: (context, state) {
            print("App build");
        return MaterialApp(
          title: 'ViewModelBinder Exemple',
          theme: AppTheme.getTheme(state.isDarkTheme),
          // theme: ThemeData(
          //   primarySwatch: Colors.blue,
          //   visualDensity: VisualDensity.adaptivePlatformDensity,
          // ),
          home: HomePage(),
        );
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appState = context.use<AppState>();
    final counterState = context.use<CounterState>();

    counterState.counter.value =
        appState.complexState.value.counterInitialValue;

    final _textController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: StreamStateBuilder<ComplexState>(
          stream: appState.complexState,
          builder: (context, state) {
            print("AppBar build");
            return Text(state.title);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Flexible(
            child: TextField(
              controller: _textController,
              onChanged: (value) {},
              onSubmitted: (value) => appState.setTitle(value),
              decoration: InputDecoration.collapsed(
                hintText: "Zieh dich aus",
              ),
            ),
          ),
          Text(
            'You have pushed the button this many times:',
          ),
          // 4. we observe a part of widget tree
          StreamStateBuilder<int>(
            // 5. we listen to a specific stream from the manager
            stream: counterState.counter,
            // 6. we rebuild once the stream changes
            builder: (_, state) {
              print("Counter text build");
              return Text(
                '$state',
                style: Theme.of(context).textTheme.headline4,
              );
            },
          ),
        ],
        // ViewModelBinder has some cool extension like center()
      ).center(),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FloatingActionButton(
            onPressed: counterState.increment,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
          SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () {
              appState.toggleTheme();
              counterState.decrement;
            },
            tooltip: 'Decrement',
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}

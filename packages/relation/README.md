# Relation

[![Pub Version](https://img.shields.io/pub/v/relation)](https://pub.dev/packages/relation)
[![Pub Version (including pre-releases)](https://img.shields.io/pub/v/relation?include_prereleases)](https://pub.dev/packages/relation)
[![Pub Likes](https://badgen.net/pub/likes/relation)](https://pub.dev/packages/relation)

This package is part of the [SurfGear](https://github.com/surfstudio/SurfGear) toolset made by [Surf](https://surf.ru/).

![Relation Cover](https://i.ibb.co/f1yC8d5/relation-logo.png)

## About

Two-way communication channels for transferring data between different architectural layers of a Flutter application.

## Currently supported features

- Notify your app's presentation layer about every user input or UI event (button tap, focus change, gesture detection, etc.) using `Action` and implement a reaction to them;
- Write less code with *Actions* that are customized for specific use cases (scrolling, text changing, `ValueNotifier` value changing).
- React to the data state changes and redraw UI using `StreamedState` together with `StreamedStateBuilder` and its variations;
- Manage the screen state in an easy way with a special stream that handles three predefined states: data, loading, error.

## Usage

### Initialization
First you need to initialize Action and StreamedState
```dart 
 final incrementAction = Action();
 final incrementState = StreamedState<int>();
 
 final reloadAction = Action();
 final loadDataState = EntityStreamedState<int>();
```
During initialization, for StreamedState and EntityStreamedState, you can set initial values that will be displayed when the widget is initialized.
```dart
final incrementState = r.StreamedState<int>(0);
final loadDataState = r.EntityStreamedState<int>(r.EntityState(isLoading: true));
```
### Action binding
After initialization, you should bind the methods that will be executed upon performing any actions

```dart
    incrementAction.stream.listen(
      (_) => increment()
    );

    reloadAction.stream.listen((_) => _load());
```
### State management
When a user performs an action, it entails a change in the state of the program.
```dart
Future increment() async {
    return incrementState.accept(incrementState.value + 1);
}

Future _load() async {
    await loadDataState.loading();
    var result = Future.delayed(Duration(seconds: 2),() =>DateTime.now().second,);
await loadDataState.content(await result);
}
```
- StreamedState contain any data type.
- EntityStreamedState, in addition to storing data, also contains 3 standard states
    - loading - load data 
    - error - error of load
    - data - data load success

These states can help you design your implementation of a responsive interface.

### Update UI
To listen for changes happening in StreamedState and EntityStreamedState use the EntityStateBuilder:

```dart
StreamedStateBuilder(
streamedState: incrementState,
builder: (ctx, count) => Text('number of count: $count'),
)
```
StreamedStateBuilder also supports receiving states _loading_, _error_ and _data_
```dart
EntityStateBuilder<int>(
streamedState: loadDataState,
child: (ctx, data) => Text('success load: $data'),
loadingChild: CircularProgressIndicator(),
errorChild: Text('sorry - error, try again'),
),
```
## Additional States
To listen for text actions use TextEditingAction
```dart
final textAction = r.TextEditingAction();
...
textAction.stream.listen((event) {
    print("typed $event");
});
...
TextField(
    controller: textAction.controller,
    onChanged: textAction,
),
```
Use TextFieldStateBuilder to update ui
```dart
TextFieldStateBuilder(
        state: testData,
        stateBuilder: (context, data) {
        return Text('test');
}),  
```
To track the scroll offset use ScrollOffsetAction
```dart
final scrollAction = r.ScrollOffsetAction();
...
scrollAction.stream.listen((event) {
      print("scroll offset $event");
});
...
TextField(
    controller: textAction.controller,
    onChanged: textAction,
),
...
SingleChildScrollView(
    controller: scrollAction.controller,
)
```
## Installation
```
dependencies:
  relation: ^0.0.2
```
## Changelog
All notable changes to this project will be documented in [this file](./CHANGELOG.md).
## Issues
For issues, file directly in the [main SurfGear repo](https://github.com/surfstudio/SurfGear).
## Contribute
If you would like to contribute to the package (e.g. by improving the documentation, solving a bug or adding a cool new feature), please review our [contribution guide](../../CONTRIBUTING.md) first and send us your pull request.

You PR's are always welcome.
## How to reach us

Please, feel free to ask any questions about this package. Join our community chat on Telegram. We speak English and Russian.

[![Telegram](https://img.shields.io/badge/chat-on%20Telegram-blue.svg)](https://t.me/SurfGear)

## License

[Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0)

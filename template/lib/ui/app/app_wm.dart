

import 'package:flutter/widgets.dart';
import 'package:flutter_template/ui/app/app.dart';
import 'package:mwwm/mwwm.dart';
import 'package:rxdart/rxdart.dart';

class AppWidgetModel extends WidgetModel {
  final GlobalKey<NavigatorState> _navigator;

  // ignore: unused_field
  final MessageController _msgController;

  AppWidgetModel(
    WidgetModelDependencies dependencies,
    this._msgController,
    this._navigator,
  ) : super(dependencies);

  @override
  void onLoad() {
    super.onLoad();
    _loadApp();
  }

  void _loadApp() async {
    subscribeHandleError(
      initApp(),
      (isAuth) {
        _openScreen(Router.ROOT);
      },
    );
  }

  void _openScreen(String routeName) {
    _navigator.currentState.pushReplacementNamed(routeName);
  }

  Observable<bool> initApp() {
    return Observable.just(true).delay(Duration(seconds: 2));
  }
}

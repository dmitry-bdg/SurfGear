// Copyright (c) 2019-present,  SurfStudio LLC
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/widgets.dart';
import 'package:injector/injector.dart';
import 'package:mwwm/src/di/base_wm_component.dart';
import 'package:mwwm/src/mwwm_widget.dart';
import 'package:mwwm/src/widget_model.dart';

abstract class WidgetState<T extends StatefulWidget, WM extends WidgetModel,
        C extends BaseWidgetModelComponent<WM>> extends State<T>
    with AutomaticKeepAliveClientMixin<T> {
  @protected
  WM wm;

  C _component;

  @override
  bool get wantKeepAlive => true;

  Widget buildState(BuildContext context);

  @override
  void initState() {
    super.initState();
    print("DEV_INFO init State $this");
    _attachWidgetModel(context);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("DEV_INFO didChangeDependencies State $this");
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    print("DEV_INFO $this rebuild");
    return buildState(context);
  }

  void _attachWidgetModel(BuildContext context) {
    var debugWm = (context
            .ancestorStateOfType(
              TypeMatcher<MWWMWidget>(),
            )
            .widget as MWWMWidget)
        .wmBuilder(context, _component);
    print("DEV_INFO identical wm ${wm == debugWm}");
    wm ??= debugWm;
  }

  @override
  void dispose() {
    wm.dispose();
    super.dispose();
  }
}

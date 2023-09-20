import 'package:flutter/material.dart';

class AppLifecycle {
  late final AppLifecycleListener appLifecycle;
  late final NotifyLifeCycle listener;

  AppLifecycle() {
    // AppLifecycle({required NotifyLifeCycle listener}) {
    appLifecycle = AppLifecycleListener(
      onShow: () => _handleTransition('AppLifecycleListener:show'),
      onResume: () => _handleTransition('AppLifecycleListener:resume'),
      onHide: () => _handleTransition('AppLifecycleListener:hide'),
      onInactive: () => _handleTransition('AppLifecycleListener:inactive'),
      onPause: () => _handleTransition('AppLifecycleListener:pause'),
      onDetach: () => _handleTransition('AppLifecycleListener:detach'),
      onRestart: () => _handleTransition('AppLifecycleListener:restart'),
      // This fires for each state change. Callbacks above fire only for
      // specific state transitions.
      onStateChange: (sate) => _handleTransition('State:  ${sate.name}'),
    );
  }

  void dispose() => appLifecycle.dispose();

  _handleTransition(String s) {
    debugPrint(s);
  }
}

interface class NotifyLifeCycle {
  void onShow() {}
}

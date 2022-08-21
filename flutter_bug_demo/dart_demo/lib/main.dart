import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'dart:async';
import 'container.dart';

void main() {
  // Release Mode
  if (kReleaseMode) {
    ErrorWidget.builder = (FlutterErrorDetails details) => Container();

    FlutterError.onError = (FlutterErrorDetails details) {
      Zone.current.handleUncaughtError(
          details.exception, details.stack ?? StackTrace.fromString(""));
    };
  }
  runZonedGuarded<Future<Null>>(() async {
    runApp(ContainerMain(inApp: true));

  }, (dynamic error, StackTrace stackTrace) async {

  });
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'src/app.dart';
import 'src/exception/async_error_logger.dart';
import 'src/exception/error_logger.dart';
import 'src/features/cart/data/local_cart_repository.dart';
import 'src/features/cart/data/sembast_cart_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final localCartRepository = await SembastCartRepository.makeDefault();

  final container = ProviderContainer(
    overrides: [
      localCartRepositoryProvider.overrideWithValue(localCartRepository),
    ],
    observers: [AsyncErrorLogger()],
  );

  final errorLogger = container.read(errorLoggerProvider);
  registerErrorHandlers(errorLogger);
  if (!kDebugMode) {
    await SentryFlutter.init(
      (options) {
        options.dsn = const String.fromEnvironment('SENTRY_DSN');
        options.tracesSampleRate = 0.1;
        options.profilesSampleRate = 0.1;
      },
      appRunner: () => runApp(UncontrolledProviderScope(
          container: container, child: const MyApp())),
    );
  } else {
    runApp(
        UncontrolledProviderScope(container: container, child: const MyApp()));
  }
}

void registerErrorHandlers(ErrorLogger errorLogger) {
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    errorLogger.logError(details.exception, details.stack);
  };
  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    errorLogger.logError(error, stack);
    return true;
  };
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('An error occurred'),
      ),
      body: Center(child: Text(details.toString())),
    );
  };
}

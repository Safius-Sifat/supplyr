import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'app_exception.dart';
part 'error_logger.g.dart';

class ErrorLogger {
  Future<void> logError(Object error, StackTrace? stackTrace) async {
    // * This can be replaced with a call to a crash reporting tool of choice
    if (kDebugMode) {
      debugPrint('$error, $stackTrace');
    } else {
      await Sentry.captureException(
        error,
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> logAppException(AppException exception) async {
    // * This can be replaced with a call to a crash reporting tool of choice

    if (kDebugMode) {
      debugPrint('$exception');
    } else {
      await Sentry.captureMessage(
        exception.message,
        level: SentryLevel.error,
      );
    }
  }
}

@riverpod
ErrorLogger errorLogger(ErrorLoggerRef ref) {
  return ErrorLogger();
}

import 'package:flutter/foundation.dart';

/*
Black:   \x1B[30m
Red:     \x1B[31m
Green:   \x1B[32m
Yellow:  \x1B[33m
Blue:    \x1B[34m
Magenta: \x1B[35m
Cyan:    \x1B[36m
White:   \x1B[37m
Reset:   \x1B[0m*/

void showLog(Object message) {
  if (kDebugMode) {
    print('\x1B[34m$message\x1B[0m');
  }
}

void showError(Object message) {
  if (kDebugMode) {
    print('\x1B[31m$message\x1B[0m');
  }
}

void showWarning(Object message) {
  if (kDebugMode) {
    print('\x1B[33m$message\x1B[0m');
  }
}

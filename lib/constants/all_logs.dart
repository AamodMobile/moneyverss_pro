import 'dart:developer';

import 'package:flutter/foundation.dart';

class Log {
  static const isDebug = true;
  static console(Object? msg) {
    if (isDebug) {
      if (kDebugMode) {
        log(msg.toString());
      }
    }
  }
}
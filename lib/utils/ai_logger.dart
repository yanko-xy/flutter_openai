import "dart:developer" as dev;

class AILogger {
  static bool _isEnable = true;

  static set isEnable(bool value) {
    _isEnable = value;
  }

  static void log(String? message) {
    if (!_isEnable) {
      return;
    }

    dev.log(message ?? "", name: "AILogger");
  }
}

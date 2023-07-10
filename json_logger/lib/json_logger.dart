import 'dart:convert';
import 'dart:io';

class Logger {
  late File _logFile;

  Logger(String filePath) {
    _logFile = File(filePath);
    if (!_logFile.existsSync()) {
      _logFile.createSync(recursive: true);
    }
  }

  void logText(String message) {}
  void logJson(Map<String, dynamic> message) {}
}

class TextLogger extends Logger {
  TextLogger(super.filePath);

  @override
  void logText(String message) {
    final time = DateTime.now().toString();
    final logEntry = '[$time] $message\n';
    _logFile.writeAsStringSync(logEntry, mode: FileMode.append);
  
    //super.logText(message);
  }
  
}

class JsonLogger extends Logger {
  JsonLogger(super.filePath);

  @override
  void logJson(message) {
    final time = DateTime.now().toString();
    //
    Map<String, dynamic> logEntry = {'timestamp': time}..addAll(message);
    final jsonEntry = jsonEncode(logEntry) + '\n';
    _logFile.writeAsStringSync(jsonEntry, mode: FileMode.append);
  }
}

class Car {
  late bool isMooving = (speed != 0) ? true : false;
  String brand;
  double speed;
  Logger _textLogFile = TextLogger("log_text.txt");
  Logger _jsonLogFile = JsonLogger("log_json.json");

  Car(this.brand, this.speed);

  void IncreaseSpeed(double speed) {
    if (speed > 0) {
      // для текстового файла
      String messageText =
          "$brand current V=${this.speed + speed}\tprevious V=${this.speed}";
      _textLogFile.logText(messageText);

      // для json файла
      Map<String, dynamic> messageJson = {
        "brand": this.brand,
        "previous speed": this.speed,
        "current speed": this.speed + speed,
      };
      _jsonLogFile.logJson(messageJson);

      this.speed += speed;
    } else {
      throw Exception("speed <= 0");
    }
  }
}

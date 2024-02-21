// Использую енамку для типов лога, т.к. типы логов это константные значения (Общепринятая норма)
// Думаю, по поводу самого класса, пояснений давать не надо, всё итак понятно

enum LogType {
  WARNING('WARNING'),
  ERROR('ERROR'),
  INFO('INFO'),
  DEBUG('DEBUG'),
  Exeption('Exeption'),
  ArgumentError('ArgumentError');

  const LogType(
    this.text,
  );

  final String text;
}

class Logger {
  void log({
    required String message,
    //Дефолтное значение, дабы при логировании информации каждый раз не передевать Logtype.INFO
    LogType logType = LogType.INFO,
  }) {
    DateTime now = DateTime.now();
    print('[${now.toString()}] ${logType.text}: ${message.toLowerCase()}');
  }
}

void main() {
  final appLogger = Logger();
  //Обычное логирование
  appLogger.log(message: 'App was launched');
  //Логирование с явным указанием типа лога
  appLogger.log(message: 'Fatal error', logType: LogType.ERROR);
}

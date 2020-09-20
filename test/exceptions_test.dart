import 'package:dart_cheatsheet_codelab/exceptions.dart';
import 'package:test/test.dart';

void _result(bool result, [List<String> list]) {
  test('collection literals', () {
    expect(result, true, reason: list?.first);
  });
}

class MyLogger extends Logger {
  Type lastType;
  String lastMessage = '';
  bool done = false;

  void logException(Type t, [String message]) {
    lastType = t;
    lastMessage = message ?? lastMessage;
  }

  void doneLogging() => done = true;
}

void main() {
  final errs = <String>[];
  var logger = MyLogger();

  try {
    tryFunction(() => throw Exception(), logger);

    if ('${logger.lastType}' != 'Exception' && '${logger.lastType}' != '_Exception') {
      errs.add('Untrustworthy threw an Exception, but a different type was logged: ${logger.lastType}.');
    }

    if (logger.lastMessage != '') {
      errs.add('Untrustworthy threw an Exception with no message, but a message was logged anyway: \'${logger.lastMessage}\'.');
    }

    if (!logger.done) {
      errs.add('Untrustworthy threw an Exception, and doneLogging() wasn\'t called afterward.');
    }
  } catch (e) {
    _result(false, ['Untrustworthy threw an exception, and an exception of type ${e.runtimeType} was unhandled by tryFunction.']);
  }

  logger = MyLogger();

  try {
    tryFunction(() => throw ExceptionWithMessage('Hey!'), logger);

    if (logger.lastType != ExceptionWithMessage) {
      errs.add('Untrustworthy threw an ExceptionWithMessage(\'Hey!\'), but a different type was logged: ${logger.lastType}.');
    }

    if (logger.lastMessage != 'Hey!') {
      errs.add('Untrustworthy threw an ExceptionWithMessage(\'Hey!\'), but a different message was logged: \'${logger.lastMessage}\'.');
    }

    if (!logger.done) {
      errs.add('Untrustworthy threw an ExceptionWithMessage(\'Hey!\'), and doneLogging() wasn\'t called afterward.');
    }
  } catch (e) {
    _result(false, ['Untrustworthy threw an ExceptionWithMessage(\'Hey!\'), and an exception of type ${e.runtimeType} was unhandled by tryFunction.']);
  }

  logger = MyLogger();
  bool caughtStringException = false;

  try {
    tryFunction(() => throw 'A String', logger);
  } on String {
    caughtStringException = true;
  }

  if (!caughtStringException) {
    errs.add('Untrustworthy threw a string, and it was incorrectly handled inside tryFunction().');
  }

  logger = MyLogger();

  try {
    tryFunction(() {}, logger);

    if (logger.lastType != null) {
      errs.add('Untrustworthy didn\'t throw an Exception, but one was logged anyway: ${logger.lastType}.');
    }

    if (logger.lastMessage != '') {
      errs.add('Untrustworthy didn\'t throw an Exception with no message, but a message was logged anyway: \'${logger.lastMessage}\'.');
    }

    if (!logger.done) {
      errs.add('Untrustworthy didn\'t throw an Exception, but doneLogging() wasn\'t called afterward.');
    }
  } catch (e) {
    _result(false, ['Untrustworthy didn\'t throw an exception, but an exception of type ${e.runtimeType} was unhandled by tryFunction anyway.']);
  }

  if (errs.isEmpty) {
    _result(true);
  } else {
    _result(false, errs);
  }
}

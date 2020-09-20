import 'package:dart_cheatsheet_codelab/named_constructors.dart';
import 'package:test/test.dart';

void _result(bool result, [List<String> list]) {
  test('collection literals', () {
    expect(result, true, reason: list?.first);
  });
}

void main() {
  final errs = <String>[];

  try {
    final result = Color.black();

    if (result == null) {
      errs.add('Called Color.black() and got a null in response.');
    } else {
      if (result.red != 0) {
        errs.add('Called Color.black() and got a Color with red equal to ${result.red} instead of the expected value (0).');
      }

      if (result.green != 0) {
        errs.add('Called Color.black() and got a Color with green equal to ${result.green} instead of the expected value (0).');
      }

      if (result.blue != 0) {
        errs.add('Called Color.black() and got a Color with blue equal to ${result.blue} instead of the expected value (0).');
      }
    }
  } catch (e) {
    _result(false, ['Called Color.black() and got an exception of type ${e.runtimeType}.']);
    return;
  }

  if (errs.isEmpty) {
    _result(true);
  } else {
    _result(false, errs);
  }
}

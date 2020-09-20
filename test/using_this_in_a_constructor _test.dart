import 'package:dart_cheatsheet_codelab/using_this_in_a_constructor.dart';
import 'package:test/test.dart';

void _result(bool result, [List<String> list]) {
  test('collection literals', () {
    expect(result, true, reason: list?.first);
  });
}

void main() {
  final errs = <String>[];

  try {
    final obj = MyClass(1, 'two', 3);

    if (obj == null) {
      errs.add('Called MyClass(1, \'two\', 3) and got a null in response.');
    } else {
      if (obj.anInt != 1) {
        errs.add('Called MyClass(1, \'two\', 3) and got an object with anInt of ${obj.anInt} instead of the expected value (1).');
      }

      if (obj.anInt != 1) {
        errs.add('Called MyClass(1, \'two\', 3) and got an object with aString of \'${obj.aString}\' instead of the expected value (\'two\').');
      }

      if (obj.anInt != 1) {
        errs.add('Called MyClass(1, \'two\', 3) and got an object with aDouble of ${obj.aDouble} instead of the expected value (3).');
      }
    }
  } catch (e) {
    _result(false, ['Called MyClass(1, \'two\', 3) and got an exception of type ${e.runtimeType}.']);
  }

  if (errs.isEmpty) {
    _result(true);
  } else {
    _result(false, errs);
  }
}

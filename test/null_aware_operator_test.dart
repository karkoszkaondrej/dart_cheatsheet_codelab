import 'package:dart_cheatsheet_codelab/null_aware_operator.dart';
import 'package:test/test.dart';

void _result(bool result, [List<String> list]) {
  test('operator', () {
    expect(result, true, reason: list?.first);
  });
}

void main() {
  final errs = <String>[];

  try {
    updateSomeVars();

    if (foo != 'a string') {
      errs.add('Looks like foo somehow ended up with the wrong value.');
    } else if (bar != 'a string') {
      errs.add('Looks like bar ended up with the wrong value.');
    } else if (baz != 'a string') {
      errs.add('Looks like baz ended up with the wrong value.');
    }
  } catch (e) {
    errs.add('Tried calling updateSomeVars and received an exception: ${e.runtimeType}.');
  }

  if (errs.isEmpty) {
    _result(true);
  } else {
    _result(false, errs);
  }
}

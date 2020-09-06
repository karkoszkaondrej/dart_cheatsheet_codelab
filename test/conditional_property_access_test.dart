import 'package:dart_cheatsheet_codelab/conditional_property_access.dart';
import 'package:test/test.dart';

void _result(bool result, [List<String> list]) {
  test('conditional property', () {
    expect(result, true, reason: list?.first);
  });
}

void main() {
  final errs = <String>[];

  try {
    var one = upperCaseIt(null);

    if (one != null) {
      errs.add('Looks like you\'re not returning null for null inputs.');
    }
  } catch (e) {
    errs.add('Tried calling upperCaseIt(null) and got an exception: ${e.runtimeType}.');
  }

  try {
    var two = upperCaseIt('asdf');

    if (two == null) {
      errs.add('Looks like you\'re returning null even when str has a value.');
    } else if (two != 'ASDF') {
      errs.add('Tried upperCaseIt(\'asdf\'), but didn\'t get \'ASDF\' in response.');
    }
  } catch (e) {
    errs.add('Tried calling upperCaseIt(\'asdf\') and got an exception: ${e.runtimeType}.');
  }

  if (errs.isEmpty) {
    _result(true);
  } else {
    _result(false, errs);
  }
}

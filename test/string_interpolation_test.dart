import 'package:dart_cheatsheet_codelab/string_interpolation.dart';
import 'package:test/test.dart';

void _result(bool result, [List<String> list]) {
  test('calculate', () {
    expect(result, true, reason: list?.first);
  });
}

void main() {
  try {
    final str = stringify(2, 3);

    if (str == '2 3') {
      _result(true);
    } else if (str == '23') {
      _result(false, ['Test failed. It looks like you forgot the space!']);
    } else if (str == null) {
      _result(false, ['Test failed. Did you forget to return a value?']);
    } else {
      _result(false, ['That\'s not quite right. Keep trying!']);
    }
  } catch (e) {
    _result(false, ['Tried calling stringify(2, 3), but received an exception: ${e.runtimeType}']);
  }
}

import 'package:dart_cheatsheet_codelab/arrow_syntax.dart';
import 'package:test/test.dart';

void _result(bool result, [List<String> list]) {
  test('collection literals', () {
    expect(result, true, reason: list?.first);
  });
}

void main() {
  final obj = MyClass();
  final errs = <String>[];

  try {
    final product = obj.product;

    if (product != 30) {
      errs.add('The product property returned $product instead of the expected value (30).');
    }
  } catch (e) {
    _result(false, ['Tried to use MyClass.product, but encountered an exception: ${e.runtimeType}.']);
    return;
  }

  try {
    obj.incrementValue1();

    if (obj.value1 != 3) {
      errs.add('After calling incrementValue, value1 was ${obj.value1} instead of the expected value (3).');
    }
  } catch (e) {
    _result(false, ['Tried to use MyClass.incrementValue1, but encountered an exception: ${e.runtimeType}.']);
    return;
  }

  try {
    final joined = obj.joinWithCommas(['one', 'two', 'three']);

    if (joined != 'one,two,three') {
      errs.add('Tried calling joinWithCommas([\'one\', \'two\', \'three\']) and received $joined instead of the expected value (\'one,two,three\').');
    }
  } catch (e) {
    _result(false, ['Tried to use MyClass.joinWithCommas, but encountered an exception: ${e.runtimeType}.']);
    return;
  }

  if (errs.isEmpty) {
    _result(true);
  } else {
    _result(false, errs);
  }
}
import 'package:dart_cheatsheet_codelab/optional_positional_parameters.dart';
import 'package:test/test.dart';

void _result(bool result, [List<String> list]) {
  test('collection literals', () {
    expect(result, true, reason: list?.first);
  });
}

void main() {
  final errs = <String>[];

  try {
    final value = joinWithCommas(1);

    if (value != '1') {
      errs.add('Tried calling joinWithCommas(1) and got $value instead of the expected (\'1\').');
    }
  } catch (e) {
    _result(false, ['Tried calling joinWithCommas(1), but encountered an exception: ${e.runtimeType}.']);
    return;
  }

  try {
    final value = joinWithCommas(1, 2, 3);

    if (value != '1,2,3') {
      errs.add('Tried calling joinWithCommas(1, 2, 3) and got $value instead of the expected (\'1,2,3\').');
    }
  } catch (e) {
    _result(false, ['Tried calling joinWithCommas(1, 2 ,3), but encountered an exception: ${e.runtimeType}.']);
    return;
  }

  try {
    final value = joinWithCommas(1, 2, 3, 4, 5);

    if (value != '1,2,3,4,5') {
      errs.add('Tried calling joinWithCommas(1, 2, 3, 4, 5) and got $value instead of the expected (\'1,2,3,4,5\').');
    }
  } catch (e) {
    _result(false, ['Tried calling stringify(1, 2, 3, 4 ,5), but encountered an exception: ${e.runtimeType}.']);
    return;
  }

  if (errs.isEmpty) {
    _result(true);
  } else {
    _result(false, errs);
  }
}

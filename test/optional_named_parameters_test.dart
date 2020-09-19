import 'package:dart_cheatsheet_codelab/optional_named_parameters.dart';
import 'package:test/test.dart';

void _result(bool result, [List<String> list]) {
  test('collection literals', () {
    expect(result, true, reason: list?.first);
  });
}

void main() {
  final source = MyDataObject();
  final errs = <String>[];

  try {
    final copy = source.copyWith(newInt: 12, newString: 'New!', newDouble: 3.0);

    if (copy == null) {
      errs.add('Tried copyWith(newInt: 12, newString: \'New!\', newDouble: 3.0) and it returned null');
    } else {
      if (copy.anInt != 12) {
        errs.add('Called copyWith(newInt: 12, newString: \'New!\', newDouble: 3.0), and the new object\'s anInt was ${copy.anInt} rather than the expected value (12).');
      }

      if (copy.aString != 'New!') {
        errs.add('Called copyWith(newInt: 12, newString: \'New!\', newDouble: 3.0), and the new object\'s aString was ${copy.aString} rather than the expected value (\'New!\').');
      }

      if (copy.aDouble != 3) {
        errs.add('Called copyWith(newInt: 12, newString: \'New!\', newDouble: 3.0), and the new object\'s aDouble was ${copy.aDouble} rather than the expected value (3).');
      }
    }
  } catch (e) {
    _result(false, ['Called copyWith(newInt: 12, newString: \'New!\', newDouble: 3.0) and got an exception: ${e.runtimeType}']);
  }

  try {
    final copy = source.copyWith();

    if (copy == null) {
      errs.add('Tried copyWith() and it returned null');
    } else {
      if (copy.anInt != 1) {
        errs.add('Called copyWith(), and the new object\'s anInt was ${copy.anInt} rather than the expected value (1).');
      }

      if (copy.aString != 'Old!') {
        errs.add('Called copyWith(), and the new object\'s aString was ${copy.aString} rather than the expected value (\'Old!\').');
      }

      if (copy.aDouble != 2) {
        errs.add('Called copyWith(), and the new object\'s aDouble was ${copy.aDouble} rather than the expected value (2).');
      }
    }
  } catch (e) {
    _result(false, ['Called copyWith() and got an exception: ${e.runtimeType}']);
  }

  if (errs.isEmpty) {
    _result(true);
  } else {
    _result(false, errs);
  }
}

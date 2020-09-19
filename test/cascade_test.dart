import 'package:dart_cheatsheet_codelab/cascades.dart';
import 'package:test/test.dart';

void _result(bool result, [List<String> list]) {
  test('collection literals', () {
    expect(result, true, reason: list?.first);
  });
}

void main() {
  BigObject obj;

  try {
    obj = fillBigObject(BigObject());
  } catch (e) {
    _result(false, [
      'Caught an exception of type ${e.runtimeType} while running fillBigObject'
    ]);
    return;
  }

  if (obj == null) {
    _result(false, ['It looks like fillBigObject returned a null!']);
  } else {
    final errs = <String>[];

    if (obj.anInt != 1) {
      errs.add(
          'The value of anInt was ${obj.anInt} rather than the expected (1).');
    }

    if (obj.aString != 'String!') {
      errs.add(
          'The value of aString was \'${obj.aString}\' rather than the expected (\'String!\').');
    }

    if (obj.aList == null) {
      errs.add('The value of aList was null.');
    }

    if (obj.aList.length != 1) {
      errs.add(
          'The length of aList was ${obj.aList.length} rather than the expected value (1).');
    } else {
      if (obj.aList[0] != 3.0) {
        errs.add(
            'The value found in aList was ${obj.aList[0]} rather than the expected (3.0).');
      }
    }

    if (!obj.done) {
      errs.add('It looks like allDone() wasn\'t called.');
    }

    if (errs.isEmpty) {
      _result(true);
    } else {
      _result(false, errs);
    }
  }
}

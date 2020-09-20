import 'package:dart_cheatsheet_codelab/factory_constructors.dart';
import 'package:test/test.dart';

void _result(bool result, [List<String> list]) {
  test('collection literals', () {
    expect(result, true, reason: list?.first);
  });
}

void main() {
  final errs = <String>[];

  try {
    final obj = IntegerHolder.fromList([]);

    if (obj != null) {
      errs.add('Called IntegerSingle.fromList([]) and didn\'t get a null.');
    }
  } catch (e) {
    _result(false, ['Called IntegerSingle.fromList([]) and got an exception of type ${e.runtimeType}.']);
    return;
  }

  try {
    final obj = IntegerHolder.fromList([1]);

    if (obj == null) {
      errs.add('Called IntegerHolder.fromList([1]) and got a null.');
    } else if (obj is! IntegerSingle) {
      errs.add('Called IntegerHolder.fromList([1]) and got an object of type ${obj.runtimeType} instead of IntegerSingle.');
    } else {
      if ((obj as IntegerSingle).a != 1) {
        errs.add('Called IntegerHolder.fromList([1]) and got an IntegerSingle with an \'a\' value of ${(obj as IntegerSingle).a} instead of the expected (1).');
      }
    }
  } catch (e) {
    _result(false, ['Called IntegerHolder.fromList([]) and got an exception of type ${e.runtimeType}.']);
    return;
  }

  try {
    final obj = IntegerHolder.fromList([1, 2]);

    if (obj == null) {
      errs.add('Called IntegerHolder.fromList([1, 2]) and got a null.');
    } else if (obj is! IntegerDouble) {
      errs.add('Called IntegerHolder.fromList([1, 2]) and got an object of type ${obj.runtimeType} instead of IntegerDouble.');
    } else {
      if ((obj as IntegerDouble).a != 1) {
        errs.add('Called IntegerHolder.fromList([1, 2]) and got an IntegerDouble with an \'a\' value of ${(obj as IntegerDouble).a} instead of the expected (1).');
      }

      if ((obj as IntegerDouble).b != 2) {
        errs.add('Called IntegerHolder.fromList([1, 2]) and got an IntegerDouble with an \'b\' value of ${(obj as IntegerDouble).b} instead of the expected (2).');
      }
    }
  } catch (e) {
    _result(false, ['Called IntegerHolder.fromList([1, 2]) and got an exception of type ${e.runtimeType}.']);
    return;
  }

  try {
    final obj = IntegerHolder.fromList([1, 2, 3]);

    if (obj == null) {
      errs.add('Called IntegerHolder.fromList([1, 2, 3]) and got a null.');
    } else if (obj is! IntegerTriple) {
      errs.add('Called IntegerHolder.fromList([1, 2, 3]) and got an object of type ${obj.runtimeType} instead of IntegerTriple.');
    } else {
      if ((obj as IntegerTriple).a != 1) {
        errs.add('Called IntegerHolder.fromList([1, 2, 3]) and got an IntegerTriple with an \'a\' value of ${(obj as IntegerTriple).a} instead of the expected (1).');
      }

      if ((obj as IntegerTriple).b != 2) {
        errs.add('Called IntegerHolder.fromList([1, 2, 3]) and got an IntegerTriple with an \'a\' value of ${(obj as IntegerTriple).b} instead of the expected (2).');
      }

      if ((obj as IntegerTriple).c != 3) {
        errs.add('Called IntegerHolder.fromList([1, 2, 3]) and got an IntegerTriple with an \'a\' value of ${(obj as IntegerTriple).b} instead of the expected (2).');
      }
    }
  } catch (e) {
    _result(false, ['Called IntegerHolder.fromList([1, 2, 3]) and got an exception of type ${e.runtimeType}.']);
    return;
  }

  if (errs.isEmpty) {
    _result(true);
  } else {
    _result(false, errs);
  }
}

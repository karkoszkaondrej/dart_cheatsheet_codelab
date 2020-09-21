import 'package:dart_cheatsheet_codelab/const_constructors.dart';
import 'package:test/test.dart';

void _result(bool result, [List<String> list]) {
  test('collection literals', () {
    expect(result, true, reason: list?.first);
  });
}

void main() {
  final errs = <String>[];

  try {
    const obj = Recipe(['1 egg', 'Pat of butter', 'Pinch salt'], 120, 200);

    if (obj == null) {
      errs.add('Tried calling Recipe([\'1 egg\', \'Pat of butter\', \'Pinch salt\'], 120, 200) and received a null.');
    } else {
      if (obj.ingredients?.length != 3) {
        errs.add('Called Recipe([\'1 egg\', \'Pat of butter\', \'Pinch salt\'], 120, 200) and got an object with ingredient list of length ${obj.ingredients?.length} rather than the expected length (3).');
      }

      if (obj.calories != 120) {
        errs.add('Called Recipe([\'1 egg\', \'Pat of butter\', \'Pinch salt\'], 120, 200) and got an object with a calorie value of ${obj.calories} rather than the expected value (120).');
      }

      if (obj.milligramsOfSodium != 200) {
        errs.add('Called Recipe([\'1 egg\', \'Pat of butter\', \'Pinch salt\'], 120, 200) and got an object with a milligramsOfSodium value of ${obj.milligramsOfSodium} rather than the expected value (200).');
      }
    }
  } catch (e) {
    _result(false, ['Tried calling Recipe([\'1 egg\', \'Pat of butter\', \'Pinch salt\'], 120, 200) and received a null.']);
  }

  if (errs.isEmpty) {
    _result(true);
  } else {
    _result(false, errs);
  }
}

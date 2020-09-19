import 'package:dart_cheatsheet_codelab/getters_and_setters.dart';
import 'package:test/test.dart';

void _result(bool result, [List<String> list]) {
  test('collection literals', () {
    expect(result, true, reason: list?.first);
  });
}


void main() {
  var foundException = false;

  try {
    final cart = ShoppingCart();
    cart.prices = [12.0, 12.0, -23.0];
  } on InvalidPriceException{
    foundException = true;
  } catch (e) {
    _result(false, ['Tried setting a negative price and received a '
        '${e.runtimeType} instead of an InvalidPriceException.']);
    return;
  }

  if (!foundException) {
    _result(false, ['Tried setting a negative price and didn\'t get an '
        'InvalidPriceException.']);
    return;
  }

  final secondCart = ShoppingCart();

  try {
    secondCart.prices = [1.0, 2.0, 3.0];
  } catch(e) {
    _result(false, ['Tried setting prices with a valid list, but received an'
        ' exception: ${e.runtimeType}.']);
    return;
  }

  if (secondCart.prices == null) {
    _result(false, ['Tried setting prices with a list of three values,'
        ' but _prices ended up being null.']);
    return;
  }

  if (secondCart.prices.length != 3) {
    _result(false, ['Tried setting prices with a list of three values, but _pric'
        'es ended up having length ${secondCart.prices.length}.']);
    return;
  }

  if (secondCart.prices[0] != 1.0 || secondCart.prices[1] != 2.0 ||
      secondCart.prices[2] != 3.0) {
    final vals = secondCart.prices.map((p) => p.toString()).join(', ');
    _result(false, ['Tried setting prices with a list of three values (1, 2, 3),'
        ' but incorrect ones ended up in the price list ($vals) .']);
    return;
  }

  var sum = 0.0;

  try {
    sum = secondCart.total;
  } catch (e) {
    _result(false, ['Tried to get total, but received an exception: '
        '${e.runtimeType}.']);
    return;
  }

  if (sum != 6.0) {
    _result(false, ['After setting prices to (1, 2, 3), total returned '
        '$sum instead of 6.']);
    return;
  }

  _result(true);
}

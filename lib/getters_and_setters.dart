class InvalidPriceException {}

class ShoppingCart {
  List<double> _prices = [];

  List<double> get prices => _prices;

  double get total => _prices.reduce((a, b) => a + b);

  set prices(List<double> value) => value.any((x) => x < 0) ? throw InvalidPriceException()
      : _prices = value;
}

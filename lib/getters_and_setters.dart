class InvalidPriceException {}

class ShoppingCart {
  List<double> _prices = [];

  List<double> get prices => _prices;

// Add a "total" getter here:
  double get total => _prices.reduce((a, b) => a + b);
// Add a "prices" setter here:
  set prices(List<double> value) => _prices = value;
}

import 'Elements.dart';

class Atom {
  Elements data = Elements();
  final String symbol;

  Atom(this.symbol) {
    validSymbol();
  }

  bool validSymbol() => data.symbols.contains(symbol.toUpperCase())
      ? true
      : throw Exception('Invalid Symbol');

  @override
  String toString() => symbol.toUpperCase();
}

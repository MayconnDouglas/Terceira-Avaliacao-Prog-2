class Element {
  final String symbol;
  final String name;
  final String latinName;
  final String weight;

  Element(
      {required this.symbol,
      required this.name,
      required this.latinName,
      required this.weight});

  @override
  String toString() => symbol;
}

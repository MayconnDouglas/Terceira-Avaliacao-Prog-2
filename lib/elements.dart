import 'dart:io';
import 'element.dart';

class Elements extends Iterable {
  static final _instance = Elements._();
  final List<String> symbols = [];

  late List<String> archive;
  static final List<Element> _elements = [];

  Elements._() {
    load();
  }

  factory Elements() => _instance;

  @override
  Iterator<Element> get iterator => _elements.iterator;

  void load() {
    File file = File('./arquivo/elements.csv');
    archive = file.readAsLinesSync();

    for (var i = 1; i < 119; i++) {
      Element e = Element(
          symbol: archive[i].split(',')[1],
          name: archive[i].split(',')[2],
          latinName: archive[i].split(',')[3],
          weight: archive[i].split(',')[0]);

      _elements.add(e);
      symbols.add(e.symbol.toUpperCase());
    }
  }
}

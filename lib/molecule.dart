import 'Elements.dart';

class Molecule implements Comparable {
  late String _formula;
  final String name;
  int SunWeight = 0;

  Molecule({required String formula, required name}) : name = name {
    checkFormula(formula);
    this.formula = formula;
  }
  String get formula => this._formula;

  set formula(String f) {
    SunWeight = 0;
    checkFormula(f);
    _formula = f;
  }

  int get weight => SunWeight;

  void checkFormula(String formula) {
    if (formula.isEmpty) {
      throw Exception('Empty Formula');
    } else {
      final e = Elements();
      List<String> numbers = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];

      String num;
      String prev = '';
      bool v = false;
      int wPrev = 0;

      for (var i = 0; i < formula.length; i++) {
        if (numbers.contains(formula[i])) {
          if (i == 0 ||
              (formula[i] == '1' &&
                  (i == formula.length - 1 ||
                      !numbers.contains(formula[i + 1])))) {
            throw Exception('Invalid Formula');
          }

          if (i + 1 < formula.length && numbers.contains(formula[i + 1])) {
            num = formula[i] + formula[i + 1];
            SunWeight += (int.parse(num) - 2) * wPrev;
          } else {
            SunWeight += (int.parse(formula[i]) - 1) * wPrev;
          }
        } else if (formula[i] == formula[i].toUpperCase()) {
          if (i + 1 < formula.length &&
              !numbers.contains(formula[i + 1]) &&
              formula[i + 1] == formula[i + 1].toLowerCase()) {
            prev = formula[i] + formula[i + 1];

            e.forEach((element) {
              if (prev == element.symbol) {
                wPrev = int.parse(element.weight);
                SunWeight += int.parse(element.weight);
                v = true;
              }
            });

            if (v == false) {
              throw Exception('Ivalid formulaula');
            }
          } else {
            prev = formula[i];

            e.forEach((element) {
              if (prev == element.symbol) {
                wPrev = int.parse(element.weight);
                SunWeight += int.parse(element.weight);
                v = true;
              }
            });

            if (v == false) {
              throw Exception('Ivalid formula');
            }
          }
        }
      }
    }
  }

  @override
  int compareTo(Molecule) => this.weight.compareTo(Molecule.weight);
}

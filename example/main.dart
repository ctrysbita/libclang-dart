import 'package:libclang/libclang.dart';

void main(List<String> args) {
  var index = Index(0, 0);
  var unit =
      TranslationUnit.parse(index, 'example.h', TranslationUnitFlag.none);
  unit.saveTranslationUnit('example.ast', SaveTranslationUnitFlag.none);
  unit.dispose();
  index.dispose();
}

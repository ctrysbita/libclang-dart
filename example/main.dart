import 'dart:ffi';

import 'package:libclang/libclang.dart';

void main(List<String> args) {
  var index = Index(0, 0);
  var unit = TranslationUnit.parse(
      index, 'example/example.h', TranslationUnitFlag.none);

  var cursor = unit.cursor;
  cursor.visitChildren((c, p, client) {
    print('Found ${c.ref.kind.value} ${c.ref.kind.spelling} ${c.spelling}');
    return ChildVisitResult.recurse;
  });

  unit.dispose();
  index.dispose();
}

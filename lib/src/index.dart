import 'dart:ffi';

import 'common.dart';

class Index {
  final Pointer<Void> cxIndex;

  static final _createIndex = libclang.lookupFunction<
      Pointer<Void> Function(Int32, Int32),
      Pointer<Void> Function(int, int)>('clang_createIndex');

  /// Provides a shared context for creating translation units.
  ///
  /// It provides two options:
  ///
  /// - excludeDeclarationsFromPCH: When non-zero, allows enumeration of "local"
  /// declarations (when loading any new translation units). A "local" declaration
  /// is one that belongs in the translation unit itself and not in a precompiled
  /// header that was used by the translation unit. If zero, all declarations
  /// will be enumerated.
  ///
  /// Here is an example:
  ///
  /// TODO: Dart code example.
  /// ```c
  ///   // excludeDeclsFromPCH = 1, displayDiagnostics=1
  ///   Idx = clang_createIndex(1, 1);
  ///
  ///   // IndexTest.pch was produced with the following command:
  ///   // "clang -x c IndexTest.h -emit-ast -o IndexTest.pch"
  ///   TU = clang_createTranslationUnit(Idx, "IndexTest.pch");
  ///
  ///   // This will load all the symbols from 'IndexTest.pch'
  ///   clang_visitChildren(clang_getTranslationUnitCursor(TU),
  ///                       TranslationUnitVisitor, 0);
  ///   clang_disposeTranslationUnit(TU);
  ///
  ///   // This will load all the symbols from 'IndexTest.c', excluding symbols
  ///   // from 'IndexTest.pch'.
  ///   char *args[] = { "-Xclang", "-include-pch=IndexTest.pch" };
  ///   TU = clang_createTranslationUnitFromSourceFile(Idx, "IndexTest.c", 2, args,
  ///                                                  0, 0);
  ///   clang_visitChildren(clang_getTranslationUnitCursor(TU),
  ///                       TranslationUnitVisitor, 0);
  ///   clang_disposeTranslationUnit(TU);
  /// ```
  ///
  /// This process of creating the 'pch', loading it separately, and using it (via
  /// -include-pch) allows 'excludeDeclsFromPCH' to remove redundant callbacks
  /// (which gives the indexer the same performance benefit as the compiler).
  Index(int excludeDeclarationsFromPCH, int displayDiagnostics)
      : cxIndex = _createIndex(excludeDeclarationsFromPCH, displayDiagnostics);

  static final _disposeIndex = libclang.lookupFunction<
      Void Function(Pointer<Void>),
      void Function(Pointer<Void>)>('clang_disposeIndex');

  /// Destroy the given index.
  ///
  /// The index must not be destroyed until all of the translation units created
  /// within that index have been destroyed.
  void dispose() => _disposeIndex(cxIndex);
}

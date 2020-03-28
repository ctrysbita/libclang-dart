part of '../clang.dart';

class TranslationUnit {
  final Pointer<Void> cxTranslationUnit;

  /**
   * Same as \c clang_parseTranslationUnit2, but returns
   * the \c CXTranslationUnit instead of an error code.  In case of an error this
   * routine returns a \c NULL \c CXTranslationUnit, without further detailed
   * error codes.
   */
  TranslationUnit.parse(
      Index index, String sourceFileName, int translationUnitFlag)
      : cxTranslationUnit = _parseTranslationUnit(
          index.cxIndex,
          Utf8.toUtf8(sourceFileName),
          // TODO: Handle args.
          Pointer.fromAddress(0),
          0,
          Pointer.fromAddress(0),
          0,
          translationUnitFlag,
        );

  static final _parseTranslationUnit = _lib.lookupFunction<
      Pointer<Void> Function(Pointer<Void>, Pointer<Utf8>, Pointer<Void>, Int32,
          Pointer<Void>, Uint32, Uint32),
      Pointer<Void> Function(Pointer<Void>, Pointer<Utf8>, Pointer<Void>, int,
          Pointer<Void>, int, int)>('clang_parseTranslationUnit');

  static final _disposeTranslationUnit = _lib.lookupFunction<
      Void Function(Pointer<Void>),
      void Function(Pointer<Void>)>('clang_disposeTranslationUnit');

  /**
   * Destroy the specified CXTranslationUnit object.
   */
  void dispose() => _disposeTranslationUnit(this.cxTranslationUnit);
}

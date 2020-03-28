part of '../clang.dart';

/// Native implementation of [TranslationUnit].
abstract class _TranslationUnitImpl extends Struct {}

class TranslationUnit {
  final Pointer<_TranslationUnitImpl> impl;

  static final _parseTranslationUnit = _lib.lookupFunction<
      Pointer<_TranslationUnitImpl> Function(Pointer<Void>, Pointer<Utf8>,
          Pointer<Void>, Int32, Pointer<Void>, Uint32, Uint32),
      Pointer<_TranslationUnitImpl> Function(
          Pointer<Void>,
          Pointer<Utf8>,
          Pointer<Void>,
          int,
          Pointer<Void>,
          int,
          int)>('clang_parseTranslationUnit');

  /**
   * Same as \c clang_parseTranslationUnit2, but returns
   * the \c CXTranslationUnit instead of an error code.  In case of an error this
   * routine returns a \c NULL \c CXTranslationUnit, without further detailed
   * error codes.
   */
  TranslationUnit.parse(
      Index index, String sourceFileName, int translationUnitFlag)
      : impl = _parseTranslationUnit(
          index.cxIndex,
          Utf8.toUtf8(sourceFileName),
          // TODO: Handle args.
          Pointer.fromAddress(0),
          0,
          Pointer.fromAddress(0),
          0,
          translationUnitFlag,
        );

  static final _disposeTranslationUnit = _lib.lookupFunction<
      Void Function(Pointer<_TranslationUnitImpl>),
      void Function(
          Pointer<_TranslationUnitImpl>)>('clang_disposeTranslationUnit');

  /**
   * Destroy the specified CXTranslationUnit object.
   */
  void dispose() => _disposeTranslationUnit(impl);

  static final _getTranslationUnitCursor = _lib.lookupFunction<
      Pointer<Cursor> Function(Pointer<_TranslationUnitImpl>),
      Pointer<Cursor> Function(
          Pointer<_TranslationUnitImpl>)>('clang_getTranslationUnitCursor');

  /**
   * Retrieve the cursor that represents the given translation unit.
   *
   * The translation unit cursor can be used to start traversing the
   * various declarations within the given translation unit.
   */
  Pointer<Cursor> get cursor => _getTranslationUnitCursor(impl);
}

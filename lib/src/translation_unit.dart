import 'dart:ffi';
import 'package:ffi/ffi.dart';

import 'common.dart';
import 'cursor.dart';
import 'index.dart';

/// Native implementation of [TranslationUnit].
class TranslationUnitImpl extends Struct {}

class TranslationUnit {
  final Pointer<TranslationUnitImpl> impl;

  static final _parseTranslationUnit = libclang.lookupFunction<
      Pointer<TranslationUnitImpl> Function(Pointer<Void>, Pointer<Utf8>,
          Pointer<Void>, Int32, Pointer<Void>, Uint32, Uint32),
      Pointer<TranslationUnitImpl> Function(
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

  static final _disposeTranslationUnit = libclang.lookupFunction<
      Void Function(Pointer<TranslationUnitImpl>),
      void Function(
          Pointer<TranslationUnitImpl>)>('clang_disposeTranslationUnit');

  /**
   * Destroy the specified CXTranslationUnit object.
   */
  void dispose() => _disposeTranslationUnit(impl);

  static final _getTranslationUnitCursor = libclang.lookupFunction<
      Pointer<Cursor> Function(Pointer<TranslationUnitImpl>),
      Pointer<Cursor> Function(
          Pointer<TranslationUnitImpl>)>('clang_getTranslationUnitCursor');

  /**
   * Retrieve the cursor that represents the given translation unit.
   *
   * The translation unit cursor can be used to start traversing the
   * various declarations within the given translation unit.
   */
  Pointer<Cursor> get cursor => _getTranslationUnitCursor(impl);

  static final _getNumDiagnostics = libclang.lookupFunction<
      Uint32 Function(Pointer<TranslationUnitImpl>),
      int Function(Pointer<TranslationUnitImpl>)>('clang_getNumDiagnostics');

  /**
   * Determine the number of diagnostics produced for the given
   * translation unit.
   */
  int get numDiagnostics => _getNumDiagnostics(impl);

  static final _saveTranslationUnit = libclang.lookupFunction<
      Int32 Function(Pointer<TranslationUnitImpl>, Pointer<Utf8>, Uint32),
      int Function(Pointer<TranslationUnitImpl>, Pointer<Utf8>,
          int)>('clang_saveTranslationUnit');

  /**
   * Saves a translation unit into a serialized representation of
   * that translation unit on disk.
   *
   * Any translation unit that was parsed without error can be saved
   * into a file. The translation unit can then be deserialized into a
   * new \c CXTranslationUnit with \c clang_createTranslationUnit() or,
   * if it is an incomplete translation unit that corresponds to a
   * header, used as a precompiled header when parsing other translation
   * units.
   *
   * \param TU The translation unit to save.
   *
   * \param FileName The file to which the translation unit will be saved.
   *
   * \param options A bitmask of options that affects how the translation unit
   * is saved. This should be a bitwise OR of the
   * CXSaveTranslationUnit_XXX flags.
   *
   * \returns A value that will match one of the enumerators of the CXSaveError
   * enumeration. Zero (CXSaveError_None) indicates that the translation unit was
   * saved successfully, while a non-zero value indicates that a problem occurred.
   */
  int saveTranslationUnit(String fileName, int options) =>
      _saveTranslationUnit(impl, Utf8.toUtf8(fileName), options);
}

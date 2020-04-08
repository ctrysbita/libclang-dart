import 'dart:ffi';

import 'package:ffi/ffi.dart';

import 'common.dart';
import 'cursor.dart';
import 'index.dart';
import 'translation_unit_flag.dart';

/// Describes the kind of error that occurred (if any) in a call to
/// [TranslationUnit.saveTranslationUnit].
enum SaveError {
  /// Indicates that no error occurred while saving a translation unit.
  none,

  /// Indicates that an unknown error occurred while attempting to save
  /// the file.
  ///
  /// This error typically indicates that file I/O failed when attempting to
  /// write the file.
  unknown,

  /// Indicates that errors during translation prevented this attempt
  /// to save the translation unit.
  ///
  /// Errors that prevent the translation unit from being saved can be
  /// extracted using [TranslationUnit.numDiagnostics] and
  /// [TranslationUnit.diagnostics]
  translationErrors,

  /// Indicates that the translation unit to be saved was somehow
  /// invalid (e.g., NULL).
  invalidTU
}

/// Native implementation of [TranslationUnit].
class TranslationUnitImpl extends Struct {}

class TranslationUnit {
  final Pointer<TranslationUnitImpl> impl;

  static final _createTranslationUnit = libclang.lookupFunction<
      Pointer<TranslationUnitImpl> Function(Pointer<Void>, Pointer<Utf8>),
      Pointer<TranslationUnitImpl> Function(
          Pointer<Void>, Pointer<Utf8>)>('clang_createTranslationUnit');

  /// Create a translation unit from an AST file (`-emit-ast`).
  TranslationUnit.create(Index index, String astFileName)
      : impl = _createTranslationUnit(index.cxIndex, Utf8.toUtf8(astFileName));

  static final _parseTranslationUnit = libclang.lookupFunction<
      Pointer<TranslationUnitImpl> Function(
    Pointer<Void>,
    Pointer<Utf8>,
    Pointer<Pointer<Utf8>>,
    Int32,
    Pointer<Void>,
    Uint32,
    Uint32,
  ),
      Pointer<TranslationUnitImpl> Function(
    Pointer<Void>,
    Pointer<Utf8>,
    Pointer<Pointer<Utf8>>,
    int,
    Pointer<Void>,
    int,
    int,
  )>('clang_parseTranslationUnit');

  /// Parse the given source file and the translation unit corresponding
  /// to that file.
  ///
  /// This routine is the main entry point for the Clang C API, providing the
  /// ability to parse a source file into a translation unit that can then be
  /// queried by other functions in the API. This routine accepts a set of
  /// command-line arguments so that the compilation can be configured in the
  /// same way that the compiler is configured on the command line.
  TranslationUnit.parse(
    Index index,
    String sourceFileName,
    int translationUnitFlag, {

    /// The command-line arguments that would be passed to the clang executable
    /// if it were being invoked out-of-process. These command-line options will
    /// be parsed and will affect how the translation unit is parsed. Note that
    /// the following options are ignored: '-c', '-emit-ast', '-fsyntax-only'
    /// (which is the default), and '-o \<output file>'.
    List<String> args = const [],
  }) : impl = _parseTranslationUnit(
          index.cxIndex,
          Utf8.toUtf8(sourceFileName),
          () {
            var ptr = allocate<Pointer<Utf8>>(count: args.length);
            for (var i = 0; i < args.length; ++i)
              ptr.elementAt(i).value = Utf8.toUtf8(args[i]);
            return ptr;
          }(),
          args.length,
          // TODO: Handle unsaved files.
          Pointer.fromAddress(0),
          0,
          translationUnitFlag,
        );

  static final _disposeTranslationUnit = libclang.lookupFunction<
      Void Function(Pointer<TranslationUnitImpl>),
      void Function(
          Pointer<TranslationUnitImpl>)>('clang_disposeTranslationUnit');

  /// Destroy the specified CXTranslationUnit object.
  void dispose() => _disposeTranslationUnit(impl);

  // TODO: Replace to original function.
  static final _getTranslationUnitCursor = libclangWrapper.lookupFunction<
      Pointer<Cursor> Function(Pointer<TranslationUnitImpl>),
      Pointer<Cursor> Function(
          Pointer<TranslationUnitImpl>)>('clang_GetTranslationUnitCursor');

  /// Retrieve the cursor that represents the given translation unit.
  ///
  /// The translation unit cursor can be used to start traversing the various
  /// declarations within the given translation unit.
  Pointer<Cursor> get cursor => _getTranslationUnitCursor(impl);

  static final _getNumDiagnostics = libclang.lookupFunction<
      Uint32 Function(Pointer<TranslationUnitImpl>),
      int Function(Pointer<TranslationUnitImpl>)>('clang_getNumDiagnostics');

  /// Determine the number of diagnostics produced for the given translation
  /// unit.
  int get numDiagnostics => _getNumDiagnostics(impl);

  static final _saveTranslationUnit = libclang.lookupFunction<
      Int32 Function(Pointer<TranslationUnitImpl>, Pointer<Utf8>, Uint32),
      int Function(Pointer<TranslationUnitImpl>, Pointer<Utf8>,
          int)>('clang_saveTranslationUnit');

  /// Saves a translation unit into a serialized representation of
  /// that translation unit on disk.
  ///
  /// Any translation unit that was parsed without error can be saved
  /// into a file. The translation unit can then be deserialized into a
  /// new [TranslationUnit] with [TranslationUnit.create] or, if it is an
  /// incomplete translation unit that corresponds to a header, used as a
  /// precompiled header when parsing other translation units.
  ///
  /// [options] is a bitmask of options that affects how the translation unit
  /// is saved. This should be a bitwise OR of the [SaveTranslationUnitFlag].
  SaveError saveTranslationUnit(String fileName, int options) => SaveError
      .values[_saveTranslationUnit(impl, Utf8.toUtf8(fileName), options)];
}

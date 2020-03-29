import 'dart:ffi';

import 'common.dart';
import 'cursor_kind.dart';
import 'translation_unit.dart';

/// A cursor representing some element in the abstract syntax tree for
/// a translation unit.
///
/// The cursor abstraction unifies the different kinds of entities in a
/// program--declaration, statements, expressions, references to declarations,
/// etc.--under a single "cursor" abstraction with a common set of operations.
/// Common operation for a cursor include: getting the physical location in
/// a source file where the cursor points, getting the name associated with a
/// cursor, and retrieving cursors for any child nodes of a particular cursor.
///
/// Cursors can be produced in two specific ways.
/// [TranslationUnit.cursor] produces a cursor for a translation unit, from
/// which one can use [CursorVisitorAddon.visitChildren] to explore the rest of
/// the translation unit. [TranslationUnit.cursorFromLocation] maps from a
/// physical source location to the entity that resides at that location,
/// allowing one to map from the source code into the AST.
class Cursor extends Struct {
  @Uint32()
  int _kind;

  @Int32()
  int xdata;

  // TODO: Inline array support.
  // https://github.com/dart-lang/sdk/issues/35763
  Pointer<Void> data;

  CursorKind get kind => CursorKind(_kind);
}

/// Describes how the traversal of the children of a particular cursor should
/// proceed after visiting a particular child cursor.
///
/// A value of this enumeration type should be returned by each [CursorVisitor]
/// to indicate how [CursorVisitorAddon.visitChildren] proceed.
enum ChildVisitResult {
  /// Terminates the cursor traversal.
  Break,

  /// Continues the cursor traversal with the next sibling of the cursor just
  /// visited, without visiting its children.
  Continue,

  /// Recursively traverse the children of this cursor, using the same visitor
  /// and client data.
  recurse
}

typedef _NativeCursorVisitor = Int32 Function(
    Pointer<Cursor>, Pointer<Cursor>, Pointer<Void>);

typedef CursorVisitor = ChildVisitResult Function(
    Pointer<Cursor>, Pointer<Cursor>, Pointer<Void>);

// TODO: Not work! Pass parameter by value.
final _visitChildren = libclang.lookupFunction<
    Uint32 Function(Pointer<Cursor>,
        Pointer<NativeFunction<_NativeCursorVisitor>>, Pointer<Void>),
    int Function(Pointer<Cursor>, Pointer<NativeFunction<_NativeCursorVisitor>>,
        Pointer<Void>)>('clang_visitChildren');

extension CursorVisitorAddon on Pointer<Cursor> {
  /// Temporary visitor holder since dart:ffi only supports calling static dart
  /// functions from native code.
  static CursorVisitor _visitor = null;

  /// Static callback.
  static int callback(Pointer<Cursor> cursor, Pointer<Cursor> parent,
          Pointer<Void> clientData) =>
      _visitor(cursor, parent, clientData).index;

  int visitChildren(CursorVisitor visitor, [Pointer<Void> clientData]) {
    CursorVisitorAddon._visitor = visitor;

    // Break visiting while exception throws.
    Pointer<NativeFunction<_NativeCursorVisitor>> nativeCallback =
        Pointer.fromFunction(callback, 0);

    return _visitChildren(
        this, nativeCallback, clientData ?? Pointer.fromAddress(0));
  }
}

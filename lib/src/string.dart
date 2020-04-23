import 'dart:ffi';

import 'package:ffi/ffi.dart';

import 'common.dart';

class CXString extends Struct {
  Pointer<Void> data;

  @Uint32()
  int privateFlags;
}

extension StringUtils on Pointer<CXString> {
  /// TODO: Replace to original function.
  static final _getCString = libclangWrapper.lookupFunction<
      Pointer<Utf8> Function(Pointer<CXString>),
      Pointer<Utf8> Function(Pointer<CXString>)>('clang_GetCString');

  String get string => Utf8.fromUtf8(_getCString(this));
}

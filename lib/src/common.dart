import 'dart:cli';
import 'dart:ffi';

import 'dart:io';

final libclang = findLibclang();

// TODO: Remove wrapper.
final libclangWrapper = DynamicLibrary.open('wrapper/wrapper.so');

DynamicLibrary findLibclang() {
  if (Platform.isLinux) {
    if (waitFor(File('/usr/lib/llvm-9/lib/libclang.so').exists()))
      return DynamicLibrary.open('/usr/lib/llvm-9/lib/libclang.so');
  }

  throw Exception('Unsupported platform.');
}

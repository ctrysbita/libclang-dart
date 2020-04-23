import 'dart:ffi';

import 'dart:io';

final libclang = findLibclang();

// TODO: Remove wrapper.
final libclangWrapper = DynamicLibrary.open('wrapper/wrapper.so');

DynamicLibrary findLibclang() {
  if (Platform.isLinux) {
    const paths = [
      '/usr/lib/llvm-10/lib/libclang.so',
      '/usr/lib/llvm-9/lib/libclang.so',
    ];
    var existPath =
        paths.firstWhere((p) => File(p).existsSync(), orElse: () => '');
    if (existPath.isNotEmpty) return DynamicLibrary.open(existPath);
  }

  throw Exception('Unsupported platform.');
}

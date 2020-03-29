import 'dart:ffi';

// TODO: Dynamic allocate dynamic library.
final libclang = DynamicLibrary.open('/usr/lib/llvm-9/lib/libclang.so');

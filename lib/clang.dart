library libclang_dart;

import 'dart:ffi';
import 'package:ffi/ffi.dart';

part 'src/index.dart';
part 'src/translation_unit.dart';
part 'src/translation_unit_flag.dart';

var _lib = DynamicLibrary.open('/usr/lib/llvm-9/lib/libclang.so');
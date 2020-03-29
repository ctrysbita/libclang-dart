# libclang.dart

<a href="https://pub.dev/packages/libclang">
    <img src="https://img.shields.io/pub/v/libclang.svg"
    alt="Pub Package" />
</a>

Dart FFI bindings to libclang.

## Warning

- The package currently trys to call dynamic library `/usr/lib/llvm-9/lib/libclang.so` directly. Look at [here](https://github.com/ctrysbita/libclang-dart/blob/c5b985dd3f04b16b43326b47d3317a767017001c/lib/src/common.dart#L4) for detail.

- According to [#41062](https://github.com/dart-lang/sdk/issues/41062) and [#36730](https://github.com/dart-lang/sdk/issues/36730) from dart SDK, functions related to `CXCursor` are not available until official support of pass/return by value.

The package is still under initial development.
Issues and PRs are welcome.
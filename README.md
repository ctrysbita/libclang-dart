# libclang.dart

<a href="https://pub.dev/packages/libclang">
    <img src="https://img.shields.io/pub/v/libclang.svg"
    alt="Pub Package" />
</a>

Dart FFI bindings to libclang.

The package is still under initial development.
Issues and PRs are welcome.

## Warning

- The package currently trys to call dynamic library `/usr/lib/llvm-{9,10}/lib/libclang.so` directly. Look at [here](https://github.com/ctrysbita/libclang-dart/blob/aac69a6f10d31c13d720dfc4d2943e38c80d7577/lib/src/common.dart#L10-L19) for detail.

- According to [#41062](https://github.com/dart-lang/sdk/issues/41062) and [#36730](https://github.com/dart-lang/sdk/issues/36730) from dart SDK, functions related to `CXCursor` are supported by a wrapper of libclang until official support of pass/return by value.

### Setup Wrapper

Make sure you have g++ installed.

```
make
```

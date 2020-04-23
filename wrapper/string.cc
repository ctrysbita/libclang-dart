#include <clang-c/CXString.h>

extern "C" {

const char* clang_GetCString(CXString* str) { return clang_getCString(*str); }

}
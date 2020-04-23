#include <clang-c/Index.h>

extern "C" {

CXCursor* clang_GetTranslationUnitCursor(CXTranslationUnit unit) {
  auto cursor = clang_getTranslationUnitCursor(unit);
  auto cursor_pointer = new CXCursor(cursor);
  return cursor_pointer;
}

// Temporary placeholder for function pointer.
enum CXChildVisitResult (*global_visitor)(CXCursor*, CXCursor*, CXClientData);

unsigned clang_VisitChildren(CXCursor* cursor,
                             enum CXChildVisitResult (*visitor)(CXCursor*,
                                                                CXCursor*,
                                                                CXClientData),
                             CXClientData client_data) {
  // Only allow one process at same time.
  if (global_visitor != nullptr) return 1;
  global_visitor = visitor;
  auto result = clang_visitChildren(
      *cursor,
      [](CXCursor cursor, CXCursor parent, CXClientData client_data) {
        return global_visitor(&cursor, &parent, client_data);
      },
      client_data);
  global_visitor = nullptr;
  return result;
}

CXString* clang_GetCursorSpelling(CXCursor* cursor) {
  auto str = clang_getCursorSpelling(*cursor);
  auto str_ptr = new CXString(str);
  return str_ptr;
}
}

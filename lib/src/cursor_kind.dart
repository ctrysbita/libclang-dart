part of '../clang.dart';

class CursorKind {
  final int value;

  const CursorKind._(this.value);

  /* Declarations */
  /**
   * A declaration whose specific kind is not exposed via this
   * interface.
   *
   * Unexposed declarations have the same operations as any other kind
   * of declaration; one can extract their location information,
   * spelling, find their definitions, etc. However, the specific kind
   * of the declaration is not reported.
   */
  static const unexposedDecl = CursorKind._(1);
  /** A C or C++ struct. */
  static const structDecl = CursorKind._(2);
  /** A C or C++ union. */
  static const unionDecl = CursorKind._(3);
  /** A C++ class. */
  static const classDecl = CursorKind._(4);
  /** An enumeration. */
  static const enumDecl = CursorKind._(5);
  /**
   * A field (in C) or non-static data member (in C++) in a
   * struct, union, or C++ class.
   */
  static const fieldDecl = CursorKind._(6);
  /** An enumerator constant. */
  static const enumConstantDecl = CursorKind._(7);
  /** A function. */
  static const functionDecl = CursorKind._(8);
  /** A variable. */
  static const varDecl = CursorKind._(9);
  /** A function or method parameter. */
  static const parmDecl = CursorKind._(10);
  /** An Objective-C \@interface. */
  static const objCInterfaceDecl = CursorKind._(11);
  /** An Objective-C \@interface for a category. */
  static const objCCategoryDecl = CursorKind._(12);
  /** An Objective-C \@protocol declaration. */
  static const objCProtocolDecl = CursorKind._(13);
  /** An Objective-C \@property declaration. */
  static const objCPropertyDecl = CursorKind._(14);
  /** An Objective-C instance variable. */
  static const objCIvarDecl = CursorKind._(15);
  /** An Objective-C instance method. */
  static const objCInstanceMethodDecl = CursorKind._(16);
  /** An Objective-C class method. */
  static const objCClassMethodDecl = CursorKind._(17);
  /** An Objective-C \@implementation. */
  static const objCImplementationDecl = CursorKind._(18);
  /** An Objective-C \@implementation for a category. */
  static const objCCategoryImplDecl = CursorKind._(19);
  /** A typedef. */
  static const typedefDecl = CursorKind._(20);
  /** A C++ class method. */
  static const cxxMethod = CursorKind._(21);
  /** A C++ namespace. */
  static const namespace = CursorKind._(22);
  /** A linkage specification, e.g. 'extern "C"'. */
  static const linkageSpec = CursorKind._(23);
  /** A C++ constructor. */
  static const constructor = CursorKind._(24);
  /** A C++ destructor. */
  static const destructor = CursorKind._(25);
  /** A C++ conversion function. */
  static const conversionFunction = CursorKind._(26);
  /** A C++ template type parameter. */
  static const templateTypeParameter = CursorKind._(27);
  /** A C++ non-type template parameter. */
  static const nonTypeTemplateParameter = CursorKind._(28);
  /** A C++ template template parameter. */
  static const templateTemplateParameter = CursorKind._(29);
  /** A C++ function template. */
  static const functionTemplate = CursorKind._(30);
  /** A C++ class template. */
  static const classTemplate = CursorKind._(31);
  /** A C++ class template partial specialization. */
  static const classTemplatePartialSpecialization = CursorKind._(32);
  /** A C++ namespace alias declaration. */
  static const namespaceAlias = CursorKind._(33);
  /** A C++ using directive. */
  static const usingDirective = CursorKind._(34);
  /** A C++ using declaration. */
  static const usingDeclaration = CursorKind._(35);
  /** A C++ alias declaration */
  static const typeAliasDecl = CursorKind._(36);
  /** An Objective-C \@synthesize definition. */
  static const objCSynthesizeDecl = CursorKind._(37);
  /** An Objective-C \@dynamic definition. */
  static const objCDynamicDecl = CursorKind._(38);
  /** An access specifier. */
  static const cxxAccessSpecifier = CursorKind._(39);

  static const firstDecl = unexposedDecl;
  static const lastDecl = cxxAccessSpecifier;

  /* References */
  static const firstRef = CursorKind._(40);
  static const objCSuperClassRef = CursorKind._(40);
  static const objCProtocolRef = CursorKind._(41);
  static const objCClassRef = CursorKind._(42);
  /**
   * A reference to a type declaration.
   *
   * A type reference occurs anywhere where a type is named but not
   * declared. For example, given:
   *
   * \code
   * typedef unsigned size_type;
   * size_type size;
   * \endcode
   *
   * The typedef is a declaration of size_type (CXCursor_TypedefDecl),
   * while the type of the variable "size" is referenced. The cursor
   * referenced by the type of size is the typedef for size_type.
   */
  static const typeRef = CursorKind._(43);
  static const cxxBaseSpecifier = CursorKind._(44);
  /**
   * A reference to a class template, function template, template
   * template parameter, or class template partial specialization.
   */
  static const templateRef = CursorKind._(45);
  /**
   * A reference to a namespace or namespace alias.
   */
  static const namespaceRef = CursorKind._(46);
  /**
   * A reference to a member of a struct, union, or class that occurs in
   * some non-expression context, e.g., a designated initializer.
   */
  static const memberRef = CursorKind._(47);
  /**
   * A reference to a labeled statement.
   *
   * This cursor kind is used to describe the jump to "start_over" in the
   * goto statement in the following example:
   *
   * \code
   *   start_over:
   *     ++counter;
   *
   *     goto start_over;
   * \endcode
   *
   * A label reference cursor refers to a label statement.
   */
  static const labelRef = CursorKind._(48);

  /**
   * A reference to a set of overloaded functions or function templates
   * that has not yet been resolved to a specific function or function template.
   *
   * An overloaded declaration reference cursor occurs in C++ templates where
   * a dependent name refers to a function. For example:
   *
   * \code
   * template<typename T> void swap(T&, T&);
   *
   * struct X { ... };
   * void swap(X&, X&);
   *
   * template<typename T>
   * void reverse(T* first, T* last) {
   *   while (first < last - 1) {
   *     swap(*first, *--last);
   *     ++first;
   *   }
   * }
   *
   * struct Y { };
   * void swap(Y&, Y&);
   * \endcode
   *
   * Here, the identifier "swap" is associated with an overloaded declaration
   * reference. In the template definition, "swap" refers to either of the two
   * "swap" functions declared above, so both results will be available. At
   * instantiation time, "swap" may also refer to other functions found via
   * argument-dependent lookup (e.g., the "swap" function at the end of the
   * example).
   *
   * The functions \c clang_getNumOverloadedDecls() and
   * \c clang_getOverloadedDecl() can be used to retrieve the definitions
   * referenced by this cursor.
   */
  static const overloadedDeclRef = CursorKind._(49);

  /**
   * A reference to a variable that occurs in some non-expression
   * context, e.g., a C++ lambda capture list.
   */
  static const variableRef = CursorKind._(50);

  static const lastRef = variableRef;

  /* Error conditions */
  static const firstInvalid = CursorKind._(70);
  static const invalidFile = CursorKind._(70);
  static const noDeclFound = CursorKind._(71);
  static const notImplemented = CursorKind._(72);
  static const invalidCode = CursorKind._(73);
  static const lastInvalid = invalidCode;

  /* Expressions */
  static const firstExpr = CursorKind._(100);

  /**
   * An expression whose specific kind is not exposed via this
   * interface.
   *
   * Unexposed expressions have the same operations as any other kind
   * of expression; one can extract their location information,
   * spelling, children, etc. However, the specific kind of the
   * expression is not reported.
   */
  static const unexposedExpr = CursorKind._(100);

  /**
   * An expression that refers to some value declaration, such
   * as a function, variable, or enumerator.
   */
  static const declRefExpr = CursorKind._(101);

  /**
   * An expression that refers to a member of a struct, union,
   * class, Objective-C class, etc.
   */
  static const memberRefExpr = CursorKind._(102);

  /** An expression that calls a function. */
  static const callExpr = CursorKind._(103);

  /** An expression that sends a message to an Objective-C
   object or class. */
  static const objCMessageExpr = CursorKind._(104);

  /** An expression that represents a block literal. */
  static const blockExpr = CursorKind._(105);

  /** An integer literal.
   */
  static const integerLiteral = CursorKind._(106);

  /** A floating point number literal.
   */
  static const floatingLiteral = CursorKind._(107);

  /** An imaginary number literal.
   */
  static const imaginaryLiteral = CursorKind._(108);

  /** A string literal.
   */
  static const stringLiteral = CursorKind._(109);

  /** A character literal.
   */
  static const characterLiteral = CursorKind._(110);

  /** A parenthesized expression, e.g. "(1)".
   *
   * This AST node is only formed if full location information is requested.
   */
  static const parenExpr = CursorKind._(111);

  /** This represents the unary-expression's (except sizeof and
   * alignof).
   */
  static const unaryOperator = CursorKind._(112);

  /** [C99 6.5.2.1] Array Subscripting.
   */
  static const arraySubscriptExpr = CursorKind._(113);

  /** A builtin binary operation expression such as "x + y" or
   * "x <= y".
   */
  static const binaryOperator = CursorKind._(114);

  /** Compound assignment such as "+=".
   */
  static const compoundAssignOperator = CursorKind._(115);

  /** The ?: ternary operator.
   */
  static const conditionalOperator = CursorKind._(116);

  /** An explicit cast in C (C99 6.5.4) or a C-style cast in C++
   * (C++ [expr.cast]), which uses the syntax (Type)expr.
   *
   * For example: (int)f.
   */
  static const cStyleCastExpr = CursorKind._(117);

  /** [C99 6.5.2.5]
   */
  static const compoundLiteralExpr = CursorKind._(118);

  /** Describes an C or C++ initializer list.
   */
  static const initListExpr = CursorKind._(119);

  /** The GNU address of label extension, representing &&label.
   */
  static const addrLabelExpr = CursorKind._(120);

  /** This is the GNU Statement Expression extension: ({int X=4; X;})
   */
  static const stmtExpr = CursorKind._(121);

  /** Represents a C11 generic selection.
   */
  static const genericSelectionExpr = CursorKind._(122);

  /** Implements the GNU __null extension, which is a name for a null
   * pointer constant that has integral type (e.g., int or long) and is the same
   * size and alignment as a pointer.
   *
   * The __null extension is typically only used by system headers, which define
   * NULL as __null in C++ rather than using 0 (which is an integer that may not
   * match the size of a pointer).
   */
  static const gNUNullExpr = CursorKind._(123);

  /** C++'s static_cast<> expression.
   */
  static const cxxStaticCastExpr = CursorKind._(124);

  /** C++'s dynamic_cast<> expression.
   */
  static const cxxDynamicCastExpr = CursorKind._(125);

  /** C++'s reinterpret_cast<> expression.
   */
  static const cxxReinterpretCastExpr = CursorKind._(126);

  /** C++'s const_cast<> expression.
   */
  static const cxxConstCastExpr = CursorKind._(127);

  /** Represents an explicit C++ type conversion that uses "functional"
   * notion (C++ [expr.type.conv]).
   *
   * Example:
   * \code
   *   x = int(0.5);
   * \endcode
   */
  static const cxxFunctionalCastExpr = CursorKind._(128);

  /** A C++ typeid expression (C++ [expr.typeid]).
   */
  static const cxxTypeidExpr = CursorKind._(129);

  /** [C++ 2.13.5] C++ Boolean Literal.
   */
  static const cxxBoolLiteralExpr = CursorKind._(130);

  /** [C++0x 2.14.7] C++ Pointer Literal.
   */
  static const cxxNullPtrLiteralExpr = CursorKind._(131);

  /** Represents the "this" expression in C++
   */
  static const cxxThisExpr = CursorKind._(132);

  /** [C++ 15] C++ Throw Expression.
   *
   * This handles 'throw' and 'throw' assignment-expression. When
   * assignment-expression isn't present, Op will be null.
   */
  static const cxxThrowExpr = CursorKind._(133);

  /** A new expression for memory allocation and constructor calls, e.g:
   * "new CXXNewExpr(foo)".
   */
  static const cxxNewExpr = CursorKind._(134);

  /** A delete expression for memory deallocation and destructor calls,
   * e.g. "delete[] pArray".
   */
  static const cxxDeleteExpr = CursorKind._(135);

  /** A unary expression. (noexcept, sizeof, or other traits)
   */
  static const unaryExpr = CursorKind._(136);

  /** An Objective-C string literal i.e. @"foo".
   */
  static const objCStringLiteral = CursorKind._(137);

  /** An Objective-C \@encode expression.
   */
  static const objCEncodeExpr = CursorKind._(138);

  /** An Objective-C \@selector expression.
   */
  static const objCSelectorExpr = CursorKind._(139);

  /** An Objective-C \@protocol expression.
   */
  static const objCProtocolExpr = CursorKind._(140);

  /** An Objective-C "bridged" cast expression, which casts between
   * Objective-C pointers and C pointers, transferring ownership in the process.
   *
   * \code
   *   NSString *str = (__bridge_transfer NSString *)CFCreateString();
   * \endcode
   */
  static const objCBridgedCastExpr = CursorKind._(141);

  /** Represents a C++0x pack expansion that produces a sequence of
   * expressions.
   *
   * A pack expansion expression contains a pattern (which itself is an
   * expression) followed by an ellipsis. For example:
   *
   * \code
   * template<typename F, typename ...Types>
   * void forward(F f, Types &&...args) {
   *  f(static_cast<Types&&>(args)...);
   * }
   * \endcode
   */
  static const packExpansionExpr = CursorKind._(142);

  /** Represents an expression that computes the length of a parameter
   * pack.
   *
   * \code
   * template<typename ...Types>
   * struct count {
   *   static const unsigned value = sizeof...(Types);
   * };
   * \endcode
   */
  static const sizeOfPackExpr = CursorKind._(143);

  /* Represents a C++ lambda expression that produces a local function
   * object.
   *
   * \code
   * void abssort(float *x, unsigned N) {
   *   std::sort(x, x + N,
   *             [](float a, float b) {
   *               return std::abs(a) < std::abs(b);
   *             });
   * }
   * \endcode
   */
  static const lambdaExpr = CursorKind._(144);

  /** Objective-c Boolean Literal.
   */
  static const objCBoolLiteralExpr = CursorKind._(145);

  /** Represents the "self" expression in an Objective-C method.
   */
  static const objCSelfExpr = CursorKind._(146);

  /** OpenMP 4.0 [2.4, Array Section].
   */
  static const ompArraySectionExpr = CursorKind._(147);

  /** Represents an @available(...) check.
   */
  static const objCAvailabilityCheckExpr = CursorKind._(148);

  /**
   * Fixed point literal
   */
  static const fixedPointLiteral = CursorKind._(149);

  static const lastExpr = fixedPointLiteral;

  /* Statements */
  static const firstStmt = CursorKind._(200);
  /**
   * A statement whose specific kind is not exposed via this
   * interface.
   *
   * Unexposed statements have the same operations as any other kind of
   * statement; one can extract their location information, spelling,
   * children, etc. However, the specific kind of the statement is not
   * reported.
   */
  static const unexposedStmt = CursorKind._(200);

  /** A labelled statement in a function.
   *
   * This cursor kind is used to describe the "start_over:" label statement in
   * the following example:
   *
   * \code
   *   start_over:
   *     ++counter;
   * \endcode
   *
   */
  static const labelStmt = CursorKind._(201);

  /** A group of statements like { stmt stmt }.
   *
   * This cursor kind is used to describe compound statements, e.g. function
   * bodies.
   */
  static const compoundStmt = CursorKind._(202);

  /** A case statement.
   */
  static const caseStmt = CursorKind._(203);

  /** A default statement.
   */
  static const defaultStmt = CursorKind._(204);

  /** An if statement
   */
  static const ifStmt = CursorKind._(205);

  /** A switch statement.
   */
  static const switchStmt = CursorKind._(206);

  /** A while statement.
   */
  static const whileStmt = CursorKind._(207);

  /** A do statement.
   */
  static const doStmt = CursorKind._(208);

  /** A for statement.
   */
  static const forStmt = CursorKind._(209);

  /** A goto statement.
   */
  static const gotoStmt = CursorKind._(210);

  /** An indirect goto statement.
   */
  static const indirectGotoStmt = CursorKind._(211);

  /** A continue statement.
   */
  static const continueStmt = CursorKind._(212);

  /** A break statement.
   */
  static const breakStmt = CursorKind._(213);

  /** A return statement.
   */
  static const returnStmt = CursorKind._(214);

  /** A GCC inline assembly statement extension.
   */
  static const gccAsmStmt = CursorKind._(215);
  static const asmStmt = gccAsmStmt;

  /** Objective-C's overall \@try-\@catch-\@finally statement.
   */
  static const objCAtTryStmt = CursorKind._(216);

  /** Objective-C's \@catch statement.
   */
  static const objCAtCatchStmt = CursorKind._(217);

  /** Objective-C's \@finally statement.
   */
  static const objCAtFinallyStmt = CursorKind._(218);

  /** Objective-C's \@throw statement.
   */
  static const objCAtThrowStmt = CursorKind._(219);

  /** Objective-C's \@synchronized statement.
   */
  static const objCAtSynchronizedStmt = CursorKind._(220);

  /** Objective-C's autorelease pool statement.
   */
  static const objCAutoreleasePoolStmt = CursorKind._(221);

  /** Objective-C's collection statement.
   */
  static const objCForCollectionStmt = CursorKind._(222);

  /** C++'s catch statement.
   */
  static const cxxCatchStmt = CursorKind._(223);

  /** C++'s try statement.
   */
  static const cxxTryStmt = CursorKind._(224);

  /** C++'s for (* : *) statement.
   */
  static const cxxForRangeStmt = CursorKind._(225);

  /** Windows Structured Exception Handling's try statement.
   */
  static const sehTryStmt = CursorKind._(226);

  /** Windows Structured Exception Handling's except statement.
   */
  static const sehExceptStmt = CursorKind._(227);

  /** Windows Structured Exception Handling's finally statement.
   */
  static const sehFinallyStmt = CursorKind._(228);

  /** A MS inline assembly statement extension.
   */
  static const mSAsmStmt = CursorKind._(229);

  /** The null statement ";": C99 6.8.3p3.
   *
   * This cursor kind is used to describe the null statement.
   */
  static const nullStmt = CursorKind._(230);

  /** Adaptor class for mixing declarations with statements and
   * expressions.
   */
  static const declStmt = CursorKind._(231);

  /** OpenMP parallel directive.
   */
  static const ompParallelDirective = CursorKind._(232);

  /** OpenMP SIMD directive.
   */
  static const ompSimdDirective = CursorKind._(233);

  /** OpenMP for directive.
   */
  static const ompForDirective = CursorKind._(234);

  /** OpenMP sections directive.
   */
  static const ompSectionsDirective = CursorKind._(235);

  /** OpenMP section directive.
   */
  static const ompSectionDirective = CursorKind._(236);

  /** OpenMP single directive.
   */
  static const ompSingleDirective = CursorKind._(237);

  /** OpenMP parallel for directive.
   */
  static const ompParallelForDirective = CursorKind._(238);

  /** OpenMP parallel sections directive.
   */
  static const ompParallelSectionsDirective = CursorKind._(239);

  /** OpenMP task directive.
   */
  static const ompTaskDirective = CursorKind._(240);

  /** OpenMP master directive.
   */
  static const ompMasterDirective = CursorKind._(241);

  /** OpenMP critical directive.
   */
  static const ompCriticalDirective = CursorKind._(242);

  /** OpenMP taskyield directive.
   */
  static const ompTaskyieldDirective = CursorKind._(243);

  /** OpenMP barrier directive.
   */
  static const ompBarrierDirective = CursorKind._(244);

  /** OpenMP taskwait directive.
   */
  static const ompTaskwaitDirective = CursorKind._(245);

  /** OpenMP flush directive.
   */
  static const ompFlushDirective = CursorKind._(246);

  /** Windows Structured Exception Handling's leave statement.
   */
  static const sehLeaveStmt = CursorKind._(247);

  /** OpenMP ordered directive.
   */
  static const ompOrderedDirective = CursorKind._(248);

  /** OpenMP atomic directive.
   */
  static const ompAtomicDirective = CursorKind._(249);

  /** OpenMP for SIMD directive.
   */
  static const ompForSimdDirective = CursorKind._(250);

  /** OpenMP parallel for SIMD directive.
   */
  static const ompParallelForSimdDirective = CursorKind._(251);

  /** OpenMP target directive.
   */
  static const ompTargetDirective = CursorKind._(252);

  /** OpenMP teams directive.
   */
  static const ompTeamsDirective = CursorKind._(253);

  /** OpenMP taskgroup directive.
   */
  static const ompTaskgroupDirective = CursorKind._(254);

  /** OpenMP cancellation point directive.
   */
  static const ompCancellationPointDirective = CursorKind._(255);

  /** OpenMP cancel directive.
   */
  static const ompCancelDirective = CursorKind._(256);

  /** OpenMP target data directive.
   */
  static const ompTargetDataDirective = CursorKind._(257);

  /** OpenMP taskloop directive.
   */
  static const ompTaskLoopDirective = CursorKind._(258);

  /** OpenMP taskloop simd directive.
   */
  static const ompTaskLoopSimdDirective = CursorKind._(259);

  /** OpenMP distribute directive.
   */
  static const ompDistributeDirective = CursorKind._(260);

  /** OpenMP target enter data directive.
   */
  static const ompTargetEnterDataDirective = CursorKind._(261);

  /** OpenMP target exit data directive.
   */
  static const ompTargetExitDataDirective = CursorKind._(262);

  /** OpenMP target parallel directive.
   */
  static const ompTargetParallelDirective = CursorKind._(263);

  /** OpenMP target parallel for directive.
   */
  static const ompTargetParallelForDirective = CursorKind._(264);

  /** OpenMP target update directive.
   */
  static const ompTargetUpdateDirective = CursorKind._(265);

  /** OpenMP distribute parallel for directive.
   */
  static const ompDistributeParallelForDirective = CursorKind._(266);

  /** OpenMP distribute parallel for simd directive.
   */
  static const ompDistributeParallelForSimdDirective = CursorKind._(267);

  /** OpenMP distribute simd directive.
   */
  static const ompDistributeSimdDirective = CursorKind._(268);

  /** OpenMP target parallel for simd directive.
   */
  static const ompTargetParallelForSimdDirective = CursorKind._(269);

  /** OpenMP target simd directive.
   */
  static const ompTargetSimdDirective = CursorKind._(270);

  /** OpenMP teams distribute directive.
   */
  static const ompTeamsDistributeDirective = CursorKind._(271);

  /** OpenMP teams distribute simd directive.
   */
  static const ompTeamsDistributeSimdDirective = CursorKind._(272);

  /** OpenMP teams distribute parallel for simd directive.
   */
  static const ompTeamsDistributeParallelForSimdDirective = CursorKind._(273);

  /** OpenMP teams distribute parallel for directive.
   */
  static const ompTeamsDistributeParallelForDirective = CursorKind._(274);

  /** OpenMP target teams directive.
   */
  static const ompTargetTeamsDirective = CursorKind._(275);

  /** OpenMP target teams distribute directive.
   */
  static const ompTargetTeamsDistributeDirective = CursorKind._(276);

  /** OpenMP target teams distribute parallel for directive.
   */
  static const ompTargetTeamsDistributeParallelForDirective = CursorKind._(277);

  /** OpenMP target teams distribute parallel for simd directive.
   */
  static const ompTargetTeamsDistributeParallelForSimdDirective =
      CursorKind._(278);

  /** OpenMP target teams distribute simd directive.
   */
  static const ompTargetTeamsDistributeSimdDirective = CursorKind._(279);

  /** C++2a std::bit_cast expression.
   */
  static const builtinBitCastExpr = CursorKind._(280);

  static const lastStmt = builtinBitCastExpr;

  /**
   * Cursor that represents the translation unit itself.
   *
   * The translation unit cursor exists primarily to act as the root
   * cursor for traversing the contents of a translation unit.
   */
  static const translationUnit = CursorKind._(300);

  /* Attributes */
  static const firstAttr = CursorKind._(400);
  /**
   * An attribute whose specific kind is not exposed via this
   * interface.
   */
  static const unexposedAttr = CursorKind._(400);

  static const iBActionAttr = CursorKind._(401);
  static const iBOutletAttr = CursorKind._(402);
  static const iBOutletCollectionAttr = CursorKind._(403);
  static const cxxFinalAttr = CursorKind._(404);
  static const cxxOverrideAttr = CursorKind._(405);
  static const annotateAttr = CursorKind._(406);
  static const asmLabelAttr = CursorKind._(407);
  static const packedAttr = CursorKind._(408);
  static const pureAttr = CursorKind._(409);
  static const constAttr = CursorKind._(410);
  static const noDuplicateAttr = CursorKind._(411);
  static const cudaConstantAttr = CursorKind._(412);
  static const cudaDeviceAttr = CursorKind._(413);
  static const cudaGlobalAttr = CursorKind._(414);
  static const cudaHostAttr = CursorKind._(415);
  static const cudaSharedAttr = CursorKind._(416);
  static const visibilityAttr = CursorKind._(417);
  static const dLLExport = CursorKind._(418);
  static const dLLImport = CursorKind._(419);
  static const nSReturnsRetained = CursorKind._(420);
  static const nSReturnsNotRetained = CursorKind._(421);
  static const nSReturnsAutoreleased = CursorKind._(422);
  static const nSConsumesSelf = CursorKind._(423);
  static const nSConsumed = CursorKind._(424);
  static const objCException = CursorKind._(425);
  static const objCNSObject = CursorKind._(426);
  static const objCIndependentClass = CursorKind._(427);
  static const objCPreciseLifetime = CursorKind._(428);
  static const objCReturnsInnerPointer = CursorKind._(429);
  static const objCRequiresSuper = CursorKind._(430);
  static const objCRootClass = CursorKind._(431);
  static const objCSubclassingRestricted = CursorKind._(432);
  static const objCExplicitProtocolImpl = CursorKind._(433);
  static const objCDesignatedInitializer = CursorKind._(434);
  static const objCRuntimeVisible = CursorKind._(435);
  static const objCBoxable = CursorKind._(436);
  static const flagEnum = CursorKind._(437);
  static const convergentAttr = CursorKind._(438);
  static const warnUnusedAttr = CursorKind._(439);
  static const warnUnusedResultAttr = CursorKind._(440);
  static const alignedAttr = CursorKind._(441);
  static const lastAttr = alignedAttr;

  /* Preprocessing */
  static const preprocessingDirective = CursorKind._(500);
  static const macroDefinition = CursorKind._(501);
  static const macroExpansion = CursorKind._(502);
  static const macroInstantiation = macroExpansion;
  static const inclusionDirective = CursorKind._(503);
  static const firstPreprocessing = preprocessingDirective;
  static const lastPreprocessing = inclusionDirective;

  /* Extra Declarations */
  /**
   * A module import declaration.
   */
  static const moduleImportDecl = CursorKind._(600);
  static const typeAliasTemplateDecl = CursorKind._(601);
  /**
   * A static_assert or _Static_assert node
   */
  static const staticAssert = CursorKind._(602);
  /**
   * a friend declaration.
   */
  static const friendDecl = CursorKind._(603);
  static const firstExtraDecl = moduleImportDecl;
  static const lastExtraDecl = friendDecl;

  /**
   * A code completion overload candidate.
   */
  static const overloadCandidate = CursorKind._(70);
}

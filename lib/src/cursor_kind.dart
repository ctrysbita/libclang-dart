part of '../clang.dart';

class CursorKind {
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
  static const unexposedDecl = 1;
  /** A C or C++ struct. */
  static const structDecl = 2;
  /** A C or C++ union. */
  static const unionDecl = 3;
  /** A C++ class. */
  static const classDecl = 4;
  /** An enumeration. */
  static const enumDecl = 5;
  /**
   * A field (in C) or non-static data member (in C++) in a
   * struct, union, or C++ class.
   */
  static const fieldDecl = 6;
  /** An enumerator constant. */
  static const enumConstantDecl = 7;
  /** A function. */
  static const functionDecl = 8;
  /** A variable. */
  static const varDecl = 9;
  /** A function or method parameter. */
  static const parmDecl = 10;
  /** An Objective-C \@interface. */
  static const objCInterfaceDecl = 11;
  /** An Objective-C \@interface for a category. */
  static const objCCategoryDecl = 12;
  /** An Objective-C \@protocol declaration. */
  static const objCProtocolDecl = 13;
  /** An Objective-C \@property declaration. */
  static const objCPropertyDecl = 14;
  /** An Objective-C instance variable. */
  static const objCIvarDecl = 15;
  /** An Objective-C instance method. */
  static const objCInstanceMethodDecl = 16;
  /** An Objective-C class method. */
  static const objCClassMethodDecl = 17;
  /** An Objective-C \@implementation. */
  static const objCImplementationDecl = 18;
  /** An Objective-C \@implementation for a category. */
  static const objCCategoryImplDecl = 19;
  /** A typedef. */
  static const typedefDecl = 20;
  /** A C++ class method. */
  static const cxxMethod = 21;
  /** A C++ namespace. */
  static const namespace = 22;
  /** A linkage specification, e.g. 'extern "C"'. */
  static const linkageSpec = 23;
  /** A C++ constructor. */
  static const constructor = 24;
  /** A C++ destructor. */
  static const destructor = 25;
  /** A C++ conversion function. */
  static const conversionFunction = 26;
  /** A C++ template type parameter. */
  static const templateTypeParameter = 27;
  /** A C++ non-type template parameter. */
  static const nonTypeTemplateParameter = 28;
  /** A C++ template template parameter. */
  static const templateTemplateParameter = 29;
  /** A C++ function template. */
  static const functionTemplate = 30;
  /** A C++ class template. */
  static const classTemplate = 31;
  /** A C++ class template partial specialization. */
  static const classTemplatePartialSpecialization = 32;
  /** A C++ namespace alias declaration. */
  static const namespaceAlias = 33;
  /** A C++ using directive. */
  static const usingDirective = 34;
  /** A C++ using declaration. */
  static const usingDeclaration = 35;
  /** A C++ alias declaration */
  static const typeAliasDecl = 36;
  /** An Objective-C \@synthesize definition. */
  static const objCSynthesizeDecl = 37;
  /** An Objective-C \@dynamic definition. */
  static const objCDynamicDecl = 38;
  /** An access specifier. */
  static const cxxAccessSpecifier = 39;

  static const firstDecl = unexposedDecl;
  static const lastDecl = cxxAccessSpecifier;

  /* References */
  static const firstRef = 40;
  static const objCSuperClassRef = 40;
  static const objCProtocolRef = 41;
  static const objCClassRef = 42;
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
  static const typeRef = 43;
  static const cxxBaseSpecifier = 44;
  /**
   * A reference to a class template, function template, template
   * template parameter, or class template partial specialization.
   */
  static const templateRef = 45;
  /**
   * A reference to a namespace or namespace alias.
   */
  static const namespaceRef = 46;
  /**
   * A reference to a member of a struct, union, or class that occurs in
   * some non-expression context, e.g., a designated initializer.
   */
  static const memberRef = 47;
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
  static const labelRef = 48;

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
  static const overloadedDeclRef = 49;

  /**
   * A reference to a variable that occurs in some non-expression
   * context, e.g., a C++ lambda capture list.
   */
  static const variableRef = 50;

  static const lastRef = variableRef;

  /* Error conditions */
  static const firstInvalid = 70;
  static const invalidFile = 70;
  static const noDeclFound = 71;
  static const notImplemented = 72;
  static const invalidCode = 73;
  static const lastInvalid = invalidCode;

  /* Expressions */
  static const firstExpr = 100;

  /**
   * An expression whose specific kind is not exposed via this
   * interface.
   *
   * Unexposed expressions have the same operations as any other kind
   * of expression; one can extract their location information,
   * spelling, children, etc. However, the specific kind of the
   * expression is not reported.
   */
  static const unexposedExpr = 100;

  /**
   * An expression that refers to some value declaration, such
   * as a function, variable, or enumerator.
   */
  static const declRefExpr = 101;

  /**
   * An expression that refers to a member of a struct, union,
   * class, Objective-C class, etc.
   */
  static const memberRefExpr = 102;

  /** An expression that calls a function. */
  static const callExpr = 103;

  /** An expression that sends a message to an Objective-C
   object or class. */
  static const objCMessageExpr = 104;

  /** An expression that represents a block literal. */
  static const blockExpr = 105;

  /** An integer literal.
   */
  static const integerLiteral = 106;

  /** A floating point number literal.
   */
  static const floatingLiteral = 107;

  /** An imaginary number literal.
   */
  static const imaginaryLiteral = 108;

  /** A string literal.
   */
  static const stringLiteral = 109;

  /** A character literal.
   */
  static const characterLiteral = 110;

  /** A parenthesized expression, e.g. "(1)".
   *
   * This AST node is only formed if full location information is requested.
   */
  static const parenExpr = 111;

  /** This represents the unary-expression's (except sizeof and
   * alignof).
   */
  static const unaryOperator = 112;

  /** [C99 6.5.2.1] Array Subscripting.
   */
  static const arraySubscriptExpr = 113;

  /** A builtin binary operation expression such as "x + y" or
   * "x <= y".
   */
  static const binaryOperator = 114;

  /** Compound assignment such as "+=".
   */
  static const compoundAssignOperator = 115;

  /** The ?: ternary operator.
   */
  static const conditionalOperator = 116;

  /** An explicit cast in C (C99 6.5.4) or a C-style cast in C++
   * (C++ [expr.cast]), which uses the syntax (Type)expr.
   *
   * For example: (int)f.
   */
  static const cStyleCastExpr = 117;

  /** [C99 6.5.2.5]
   */
  static const compoundLiteralExpr = 118;

  /** Describes an C or C++ initializer list.
   */
  static const initListExpr = 119;

  /** The GNU address of label extension, representing &&label.
   */
  static const addrLabelExpr = 120;

  /** This is the GNU Statement Expression extension: ({int X=4; X;})
   */
  static const stmtExpr = 121;

  /** Represents a C11 generic selection.
   */
  static const genericSelectionExpr = 122;

  /** Implements the GNU __null extension, which is a name for a null
   * pointer constant that has integral type (e.g., int or long) and is the same
   * size and alignment as a pointer.
   *
   * The __null extension is typically only used by system headers, which define
   * NULL as __null in C++ rather than using 0 (which is an integer that may not
   * match the size of a pointer).
   */
  static const gNUNullExpr = 123;

  /** C++'s static_cast<> expression.
   */
  static const cxxStaticCastExpr = 124;

  /** C++'s dynamic_cast<> expression.
   */
  static const cxxDynamicCastExpr = 125;

  /** C++'s reinterpret_cast<> expression.
   */
  static const cxxReinterpretCastExpr = 126;

  /** C++'s const_cast<> expression.
   */
  static const cxxConstCastExpr = 127;

  /** Represents an explicit C++ type conversion that uses "functional"
   * notion (C++ [expr.type.conv]).
   *
   * Example:
   * \code
   *   x = int(0.5);
   * \endcode
   */
  static const cxxFunctionalCastExpr = 128;

  /** A C++ typeid expression (C++ [expr.typeid]).
   */
  static const cxxTypeidExpr = 129;

  /** [C++ 2.13.5] C++ Boolean Literal.
   */
  static const cxxBoolLiteralExpr = 130;

  /** [C++0x 2.14.7] C++ Pointer Literal.
   */
  static const cxxNullPtrLiteralExpr = 131;

  /** Represents the "this" expression in C++
   */
  static const cxxThisExpr = 132;

  /** [C++ 15] C++ Throw Expression.
   *
   * This handles 'throw' and 'throw' assignment-expression. When
   * assignment-expression isn't present, Op will be null.
   */
  static const cxxThrowExpr = 133;

  /** A new expression for memory allocation and constructor calls, e.g:
   * "new CXXNewExpr(foo)".
   */
  static const cxxNewExpr = 134;

  /** A delete expression for memory deallocation and destructor calls,
   * e.g. "delete[] pArray".
   */
  static const cxxDeleteExpr = 135;

  /** A unary expression. (noexcept, sizeof, or other traits)
   */
  static const unaryExpr = 136;

  /** An Objective-C string literal i.e. @"foo".
   */
  static const objCStringLiteral = 137;

  /** An Objective-C \@encode expression.
   */
  static const objCEncodeExpr = 138;

  /** An Objective-C \@selector expression.
   */
  static const objCSelectorExpr = 139;

  /** An Objective-C \@protocol expression.
   */
  static const objCProtocolExpr = 140;

  /** An Objective-C "bridged" cast expression, which casts between
   * Objective-C pointers and C pointers, transferring ownership in the process.
   *
   * \code
   *   NSString *str = (__bridge_transfer NSString *)CFCreateString();
   * \endcode
   */
  static const objCBridgedCastExpr = 141;

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
  static const packExpansionExpr = 142;

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
  static const sizeOfPackExpr = 143;

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
  static const lambdaExpr = 144;

  /** Objective-c Boolean Literal.
   */
  static const objCBoolLiteralExpr = 145;

  /** Represents the "self" expression in an Objective-C method.
   */
  static const objCSelfExpr = 146;

  /** OpenMP 4.0 [2.4, Array Section].
   */
  static const ompArraySectionExpr = 147;

  /** Represents an @available(...) check.
   */
  static const objCAvailabilityCheckExpr = 148;

  /**
   * Fixed point literal
   */
  static const fixedPointLiteral = 149;

  static const lastExpr = fixedPointLiteral;

  /* Statements */
  static const firstStmt = 200;
  /**
   * A statement whose specific kind is not exposed via this
   * interface.
   *
   * Unexposed statements have the same operations as any other kind of
   * statement; one can extract their location information, spelling,
   * children, etc. However, the specific kind of the statement is not
   * reported.
   */
  static const unexposedStmt = 200;

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
  static const labelStmt = 201;

  /** A group of statements like { stmt stmt }.
   *
   * This cursor kind is used to describe compound statements, e.g. function
   * bodies.
   */
  static const compoundStmt = 202;

  /** A case statement.
   */
  static const caseStmt = 203;

  /** A default statement.
   */
  static const defaultStmt = 204;

  /** An if statement
   */
  static const ifStmt = 205;

  /** A switch statement.
   */
  static const switchStmt = 206;

  /** A while statement.
   */
  static const whileStmt = 207;

  /** A do statement.
   */
  static const doStmt = 208;

  /** A for statement.
   */
  static const forStmt = 209;

  /** A goto statement.
   */
  static const gotoStmt = 210;

  /** An indirect goto statement.
   */
  static const indirectGotoStmt = 211;

  /** A continue statement.
   */
  static const continueStmt = 212;

  /** A break statement.
   */
  static const breakStmt = 213;

  /** A return statement.
   */
  static const returnStmt = 214;

  /** A GCC inline assembly statement extension.
   */
  static const gccAsmStmt = 215;
  static const asmStmt = gccAsmStmt;

  /** Objective-C's overall \@try-\@catch-\@finally statement.
   */
  static const objCAtTryStmt = 216;

  /** Objective-C's \@catch statement.
   */
  static const objCAtCatchStmt = 217;

  /** Objective-C's \@finally statement.
   */
  static const objCAtFinallyStmt = 218;

  /** Objective-C's \@throw statement.
   */
  static const objCAtThrowStmt = 219;

  /** Objective-C's \@synchronized statement.
   */
  static const objCAtSynchronizedStmt = 220;

  /** Objective-C's autorelease pool statement.
   */
  static const objCAutoreleasePoolStmt = 221;

  /** Objective-C's collection statement.
   */
  static const objCForCollectionStmt = 222;

  /** C++'s catch statement.
   */
  static const cxxCatchStmt = 223;

  /** C++'s try statement.
   */
  static const cxxTryStmt = 224;

  /** C++'s for (* : *) statement.
   */
  static const cxxForRangeStmt = 225;

  /** Windows Structured Exception Handling's try statement.
   */
  static const sehTryStmt = 226;

  /** Windows Structured Exception Handling's except statement.
   */
  static const sehExceptStmt = 227;

  /** Windows Structured Exception Handling's finally statement.
   */
  static const sehFinallyStmt = 228;

  /** A MS inline assembly statement extension.
   */
  static const mSAsmStmt = 229;

  /** The null statement ";": C99 6.8.3p3.
   *
   * This cursor kind is used to describe the null statement.
   */
  static const nullStmt = 230;

  /** Adaptor class for mixing declarations with statements and
   * expressions.
   */
  static const declStmt = 231;

  /** OpenMP parallel directive.
   */
  static const ompParallelDirective = 232;

  /** OpenMP SIMD directive.
   */
  static const ompSimdDirective = 233;

  /** OpenMP for directive.
   */
  static const ompForDirective = 234;

  /** OpenMP sections directive.
   */
  static const ompSectionsDirective = 235;

  /** OpenMP section directive.
   */
  static const ompSectionDirective = 236;

  /** OpenMP single directive.
   */
  static const ompSingleDirective = 237;

  /** OpenMP parallel for directive.
   */
  static const ompParallelForDirective = 238;

  /** OpenMP parallel sections directive.
   */
  static const ompParallelSectionsDirective = 239;

  /** OpenMP task directive.
   */
  static const ompTaskDirective = 240;

  /** OpenMP master directive.
   */
  static const ompMasterDirective = 241;

  /** OpenMP critical directive.
   */
  static const ompCriticalDirective = 242;

  /** OpenMP taskyield directive.
   */
  static const ompTaskyieldDirective = 243;

  /** OpenMP barrier directive.
   */
  static const ompBarrierDirective = 244;

  /** OpenMP taskwait directive.
   */
  static const ompTaskwaitDirective = 245;

  /** OpenMP flush directive.
   */
  static const ompFlushDirective = 246;

  /** Windows Structured Exception Handling's leave statement.
   */
  static const sehLeaveStmt = 247;

  /** OpenMP ordered directive.
   */
  static const ompOrderedDirective = 248;

  /** OpenMP atomic directive.
   */
  static const ompAtomicDirective = 249;

  /** OpenMP for SIMD directive.
   */
  static const ompForSimdDirective = 250;

  /** OpenMP parallel for SIMD directive.
   */
  static const ompParallelForSimdDirective = 251;

  /** OpenMP target directive.
   */
  static const ompTargetDirective = 252;

  /** OpenMP teams directive.
   */
  static const ompTeamsDirective = 253;

  /** OpenMP taskgroup directive.
   */
  static const ompTaskgroupDirective = 254;

  /** OpenMP cancellation point directive.
   */
  static const ompCancellationPointDirective = 255;

  /** OpenMP cancel directive.
   */
  static const ompCancelDirective = 256;

  /** OpenMP target data directive.
   */
  static const ompTargetDataDirective = 257;

  /** OpenMP taskloop directive.
   */
  static const ompTaskLoopDirective = 258;

  /** OpenMP taskloop simd directive.
   */
  static const ompTaskLoopSimdDirective = 259;

  /** OpenMP distribute directive.
   */
  static const ompDistributeDirective = 260;

  /** OpenMP target enter data directive.
   */
  static const ompTargetEnterDataDirective = 261;

  /** OpenMP target exit data directive.
   */
  static const ompTargetExitDataDirective = 262;

  /** OpenMP target parallel directive.
   */
  static const ompTargetParallelDirective = 263;

  /** OpenMP target parallel for directive.
   */
  static const ompTargetParallelForDirective = 264;

  /** OpenMP target update directive.
   */
  static const ompTargetUpdateDirective = 265;

  /** OpenMP distribute parallel for directive.
   */
  static const ompDistributeParallelForDirective = 266;

  /** OpenMP distribute parallel for simd directive.
   */
  static const ompDistributeParallelForSimdDirective = 267;

  /** OpenMP distribute simd directive.
   */
  static const ompDistributeSimdDirective = 268;

  /** OpenMP target parallel for simd directive.
   */
  static const ompTargetParallelForSimdDirective = 269;

  /** OpenMP target simd directive.
   */
  static const ompTargetSimdDirective = 270;

  /** OpenMP teams distribute directive.
   */
  static const ompTeamsDistributeDirective = 271;

  /** OpenMP teams distribute simd directive.
   */
  static const ompTeamsDistributeSimdDirective = 272;

  /** OpenMP teams distribute parallel for simd directive.
   */
  static const ompTeamsDistributeParallelForSimdDirective = 273;

  /** OpenMP teams distribute parallel for directive.
   */
  static const ompTeamsDistributeParallelForDirective = 274;

  /** OpenMP target teams directive.
   */
  static const ompTargetTeamsDirective = 275;

  /** OpenMP target teams distribute directive.
   */
  static const ompTargetTeamsDistributeDirective = 276;

  /** OpenMP target teams distribute parallel for directive.
   */
  static const ompTargetTeamsDistributeParallelForDirective = 277;

  /** OpenMP target teams distribute parallel for simd directive.
   */
  static const ompTargetTeamsDistributeParallelForSimdDirective = 278;

  /** OpenMP target teams distribute simd directive.
   */
  static const ompTargetTeamsDistributeSimdDirective = 279;

  /** C++2a std::bit_cast expression.
   */
  static const builtinBitCastExpr = 280;

  static const lastStmt = builtinBitCastExpr;

  /**
   * Cursor that represents the translation unit itself.
   *
   * The translation unit cursor exists primarily to act as the root
   * cursor for traversing the contents of a translation unit.
   */
  static const translationUnit = 300;

  /* Attributes */
  static const firstAttr = 400;
  /**
   * An attribute whose specific kind is not exposed via this
   * interface.
   */
  static const unexposedAttr = 400;

  static const iBActionAttr = 401;
  static const iBOutletAttr = 402;
  static const iBOutletCollectionAttr = 403;
  static const cxxFinalAttr = 404;
  static const cxxOverrideAttr = 405;
  static const annotateAttr = 406;
  static const asmLabelAttr = 407;
  static const packedAttr = 408;
  static const pureAttr = 409;
  static const constAttr = 410;
  static const noDuplicateAttr = 411;
  static const cudaConstantAttr = 412;
  static const cudaDeviceAttr = 413;
  static const cudaGlobalAttr = 414;
  static const cudaHostAttr = 415;
  static const cudaSharedAttr = 416;
  static const visibilityAttr = 417;
  static const dLLExport = 418;
  static const dLLImport = 419;
  static const nSReturnsRetained = 420;
  static const nSReturnsNotRetained = 421;
  static const nSReturnsAutoreleased = 422;
  static const nSConsumesSelf = 423;
  static const nSConsumed = 424;
  static const objCException = 425;
  static const objCNSObject = 426;
  static const objCIndependentClass = 427;
  static const objCPreciseLifetime = 428;
  static const objCReturnsInnerPointer = 429;
  static const objCRequiresSuper = 430;
  static const objCRootClass = 431;
  static const objCSubclassingRestricted = 432;
  static const objCExplicitProtocolImpl = 433;
  static const objCDesignatedInitializer = 434;
  static const objCRuntimeVisible = 435;
  static const objCBoxable = 436;
  static const flagEnum = 437;
  static const convergentAttr = 438;
  static const warnUnusedAttr = 439;
  static const warnUnusedResultAttr = 440;
  static const alignedAttr = 441;
  static const lastAttr = alignedAttr;

  /* Preprocessing */
  static const preprocessingDirective = 500;
  static const macroDefinition = 501;
  static const macroExpansion = 502;
  static const macroInstantiation = macroExpansion;
  static const inclusionDirective = 503;
  static const firstPreprocessing = preprocessingDirective;
  static const lastPreprocessing = inclusionDirective;

  /* Extra Declarations */
  /**
   * A module import declaration.
   */
  static const moduleImportDecl = 600;
  static const typeAliasTemplateDecl = 601;
  /**
   * A static_assert or _Static_assert node
   */
  static const staticAssert = 602;
  /**
   * a friend declaration.
   */
  static const friendDecl = 603;
  static const firstExtraDecl = moduleImportDecl;
  static const lastExtraDecl = friendDecl;

  /**
   * A code completion overload candidate.
   */
  static const overloadCandidate = 70;
}

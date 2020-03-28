part of '../clang.dart';

/**
 * Flags that control the creation of translation units.
 *
 * The enumerators in this enumeration type are meant to be bitwise
 * ORed together to specify which options should be used when
 * constructing the translation unit.
 */
class TranslationUnitFlag {
  /**
   * Used to indicate that no special translation-unit options are
   * needed.
   */
  static const none = 0x0;

  /**
   * Used to indicate that the parser should construct a "detailed"
   * preprocessing record; including all macro definitions and instantiations.
   *
   * Constructing a detailed preprocessing record requires more memory
   * and time to parse; since the information contained in the record
   * is usually not retained. However; it can be useful for
   * applications that require more detailed information about the
   * behavior of the preprocessor.
   */
  static const detailedPreprocessingRecord = 0x01;

  /**
   * Used to indicate that the translation unit is incomplete.
   *
   * When a translation unit is considered "incomplete"; semantic
   * analysis that is typically performed at the end of the
   * translation unit will be suppressed. For example; this suppresses
   * the completion of tentative declarations in C and of
   * instantiation of implicitly-instantiation function templates in
   * C++. This option is typically used when parsing a header with the
   * intent of producing a precompiled header.
   */
  static const incomplete = 0x02;

  /**
   * Used to indicate that the translation unit should be built with an
   * implicit precompiled header for the preamble.
   *
   * An implicit precompiled header is used as an optimization when a
   * particular translation unit is likely to be reparsed many times
   * when the sources aren't changing that often. In this case; an
   * implicit precompiled header will be built containing all of the
   * initial includes at the top of the main file (what we refer to as
   * the "preamble" of the file). In subsequent parses; if the
   * preamble or the files in it have not changed; \c
   * clang_reparseTranslationUnit() will re-use the implicit
   * precompiled header to improve parsing performance.
   */
  static const precompiledPreamble = 0x04;

  /**
   * Used to indicate that the translation unit should cache some
   * code-completion results with each reparse of the source file.
   *
   * Caching of code-completion results is a performance optimization that
   * introduces some overhead to reparsing but improves the performance of
   * code-completion operations.
   */
  static const cacheCompletionResults = 0x08;

  /**
   * Used to indicate that the translation unit will be serialized with
   * \c clang_saveTranslationUnit.
   *
   * This option is typically used when parsing a header with the intent of
   * producing a precompiled header.
   */
  static const forSerialization = 0x10;

  /**
   * DEPRECATED: Enabled chained precompiled preambles in C++.
   *
   * Note: this is a *temporary* option that is available only while
   * we are testing C++ precompiled preamble support. It is deprecated.
   */
  static const cxxChainedPCH = 0x20;

  /**
   * Used to indicate that function/method bodies should be skipped while
   * parsing.
   *
   * This option can be used to search for declarations/definitions while
   * ignoring the usages.
   */
  static const skipFunctionBodies = 0x40;

  /**
   * Used to indicate that brief documentation comments should be
   * included into the set of code completions returned from this translation
   * unit.
   */
  static const includeBriefCommentsInCodeCompletion = 0x80;

  /**
   * Used to indicate that the precompiled preamble should be created on
   * the first parse. Otherwise it will be created on the first reparse. This
   * trades runtime on the first parse (serializing the preamble takes time) for
   * reduced runtime on the second parse (can now reuse the preamble).
   */
  static const createPreambleOnFirstParse = 0x100;

  /**
   * Do not stop processing when fatal errors are encountered.
   *
   * When fatal errors are encountered while parsing a translation unit;
   * semantic analysis is typically stopped early when compiling code. A common
   * source for fatal errors are unresolvable include files. For the
   * purposes of an IDE; this is undesirable behavior and as much information
   * as possible should be reported. Use this flag to enable this behavior.
   */
  static const keepGoing = 0x200;

  /**
   * Sets the preprocessor in a mode for parsing a single file only.
   */
  static const singleFileParse = 0x400;

  /**
   * Used in combination with static const SkipFunctionBodies to
   * constrain the skipping of function bodies to the preamble.
   *
   * The function bodies of the main file are not skipped.
   */
  static const limitSkipFunctionBodiesToPreamble = 0x800;

  /**
   * Used to indicate that attributed types should be included in CXType.
   */
  static const includeAttributedTypes = 0x1000;

  /**
   * Used to indicate that implicit attributes should be visited.
   */
  static const visitImplicitAttributes = 0x2000;

  /**
   * Used to indicate that non-errors from included files should be ignored.
   *
   * If set; clang_getDiagnosticSetFromTU() will not report e.g. warnings from
   * included files anymore. This speeds up clang_getDiagnosticSetFromTU() for
   * the case where these warnings are not of interest; as for an IDE for
   * example; which typically shows only the diagnostics in the main file.
   */
  static const ignoreNonErrorsFromIncludedFiles = 0x4000;
}

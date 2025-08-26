# Help Index

## Accessing

- `at`, `atModify`
- `atIfAbsent`, `atIfPresent`
- `atFold`, `atPath`, `atPin`, `atWrap`
- `atAll`
- `atPut`
- `atPutWrap`
- `atIfAbsentPut`
- `atAllPut`, `atAllPutAll`
- `associationAt`, `associationAtIfAbsent`
- `any`, `anyAs`
- `first`, `second`, `third`, `fourth`, `last`

## Adding

- `add`, `addWithOccurrences`
- `addFirst`, `addLast`
- `addAfter`, `addAfterIndex`, `addBefore`
- `addAll`, `addAllIfNotPresent`
- `addAllFirst`, `addAllLast`
- `addIfNotPresent`, `ifAbsentAdd`

## Array Operations

- `depth`, `iota`, `reshape`, `rank`, `shape`
- `cartesianIndex`, `linearIndex`
- `constantArray`

## Arithmetic Operators

- `+`, `-`, `*`, `/`, `^`

## Asserting

- `assert`
- `assertIsOfSize`, `assertIsValidIndex`
- `assertIsCollection`
- `assertIsSmallInteger`
- `assertIsString`

## Binary, Bitwise

- `bitAnd`, `bitOr`, `bitXor`, `bitNot`
- `bitCount`, `highBit`, `lowBit`
- `<<`, `>>`
- `bitShift`, `bitShiftLeft`, `bitShiftRight`
- `bitAt`, `bitAtPut`

## Blocks

- `Block`
- `cull`, `numArgs`, `value`

## Boolean, Logic

- `&`, `&&`, `|`, `||`, `not`
- `false`, `true`
- `boole`
- `allSatisfy`, `anySatisfy`, `noneSatisfy`
- `allTrue`
- `if`, `ifFalse`, `ifTrue`

## Character

- `asLowerCase`, `asString`, `asUpperCase`
- `codePoint`

## Character Predicates

- `isCharacter`
- `isAlphaNumeric`, `isDigit`, `isLetter`
- `isLowerCase`, `isUpperCase`
- `isCarriageReturn`
- `isFormFeed`, `isLineFeed`
- `isSeparator`, `isSpace`, `isTab`

## Collection Tests

- `isArray`, `isVector`, `isMatrix`
- `isCollection`, `isIndexable`
- `isDictionary`, `isSequence`
- `isBag`, `isList`, `isMap`, `isRecord`, `isSet`
- `isRange`, `isSortedList`
- `isBitSet`, `isPriorityQueue`
- `isAssociation`, `isAssociationList`
- `capacity`, `depth`, `size`

## Collection Types & Traits

- `Collection`, `Dictionary`, `Sequence`
- `Indexable`
- `Extensible`, `Removable`
- `Unordered`
- `List`, `IdentityMap`, `Record`, `IdentitySet`
- `IdentityBag`, `Tree`, `Tuple`
- `BitSet`, `PriorityQueue`, `SortedList`
- `ArithmeticProgression`, `Range`
- `Association`
- `Slice`

## Combinatorial Functions

- `!`, `factorial`
- `doubleFactorial`, `subfactorial`
- `factorialPower`, `hyperfactorial`
- `binomial`, `multinomial`
- `catalanNumber`, `catalanTriangle`
- `polygonalNumber`
- `partitionsP`, `partitionsQ`
- `dyckWords`
- `bellNumber`
- `lassalleNumber`
- `lobbNumber`
- `narayanaNumber`
- `vanDerCorputNumber`

## Comparison Operators

- `=`, `~=`
- `==`, `~~`
- `>`, `<`, `<=`, `>=`, `<=>`
- `~`, `!~`
- `isCloseTo`, `isVeryCloseTo`, `isSameAs`

## Complex Numbers

- `i`, `imaginary`, `j`, `real`
- `abs`, `absArg`, `arg`, `conjugate`, `sign`
- `randomComplex`

## Computing Angles

- `vectorAngle`
- `planarAngle`

## Conditionals

- `if`, `ifEmpty`, `ifError`, `ifFalse`, `ifNil`, `ifTrue`
- `whileTrue`, `whileFalse`
- `doWhileTrue`, `doWhileFalse`

## Congruences

- `%`, `powerMod`
- `multiplicativeOrder`
- `chineseRemainder`

## Coordinate Transformations

- `fromPolarCoordinates`, `toPolarCoordinates`
- `rotationMatrix`

## Converting

- `asBit`, `asBoolean`
- `asComplex`, `asFloat`, `asFraction`, `asGaussianInteger`, `asInteger`, `asLargeInteger`, `asNumber`, `asSmallFloat`
- `asCharacter`, `asCodePoint`, `asHexDigit`, `asLowerCase`, `asRegExp`, `asString`, `asUpperCase`, `asWords`
- `asIdentityBag`, `asByteArray`, `asCollection`, `asList`, `asMap`, `asRecord`, `asIdentitySet`, `asSortedList`, `asTree`
- `degreesToRadians`, `radiansToDegrees`

## Copying

- `copy`, `deepCopy`, `postCopy`, `shallowCopy`
- `copyFromTo`, `copyUpTo`
- `copyReplaceAllWith`
- `copyWith`
- `copyWithout`, `copyWithoutAll`, `copyWithoutIdenticalElements`
- `#`, `replicateEach`, `replicateInteger`
- `!`, `duplicateInteger`, `duplicateShape`

## Date

- `asDate`, `Date`
- `dayOfMonth`, `dayOfWeek`, `month`, `year`
- `parseDate`

## Distance Measures

- `euclideanDistance`
- `brayCurtisDistance`, `canberraDistance`, `chessboardDistance`, `manhattanDistance`
- `editDistance`, `hammingDistance`, `levenshteinDistance`

## Division & Divisibility

- `/`, `%`, `//`, `\\`
- `mod`, `powerMod`, `quotient`, `remainder`
- `extendedGcd`, `gcd`, `lcm`
- `divisible`, `isEven`, `isOdd`
- `isCoprime`, `isPrime`
- `modularInverse`

## Divisors

- `divisors`, `divisorSigma`, `divisorSum`

## Duration Functions

- `asSeconds`, `parseDuration`
- `milliseconds`, `centiseconds`, `seconds`
- `minutes`, `hours`, `days`, `weeks`
- `siderealMonths`, `synodicMonths`, `julianYears`

## Elementary Transcendental Functions

- `exp`, `log`, `log2`, `log10`
- `sin`, `cos`, `tan`
- `arcSin`, `arcCos`, `arcTan`
- `sinh`, `cosh`, `tanh`
- `sincHistorical`, `sincNormalized`
- `haversine`

## Enumerating

- `indices`, `shapeIndices`, `shapeIndicesDo`
- `fill`, `table`

## Environment

- `hostName`, `instructionSetArchitecture`, `operatingSystem`
- `currentWorkingDirectory`
- `environmentVariable`, `environmentVariables`
- `systemCommand`

## Equality Testing

- `=`, `~=`
- `==`, `~~`
- `~`, `!~`
- `isCloseTo`, `isCloseToBy`, `isVeryCloseTo`
- `isSameAs`
- `hasEqualElements`, `hasEqualElementsBy`
- `equalByAtNamedSlots`
- `hasEqualSlots`, `hasEqualSlotsBy`
- `allEqual`, `allEqualBy`

## Error Functions

- `erf`, `erfc`

## Error Handling

- `Error`, `error`, `signal`
- `ensure`, `ifError`
- `description`, `messageText`, `name`

## Evaluating

- `cull`, `value`
- `evaluate`

## Exponential Functions

- `log`, `log2`, `log10`
- `^`, `exp`, `squared`
- `cubeRoot`, `sqrt`, `nthRoot`

## File Path

- `pathDirectory`, `pathExtension`, `pathNormalize`
- `pathIsAbsolute`
- `pathJoin`

## File System

- `readBinaryFile`, `writeBinaryFile`
- `readTextFile`, `writeTextFile`
- `removeFile`
- `readDirectory`, `readDirectoryFileNames`
- `makeDirectory`, `removeDirectory`
- `fileInformation`, `modificationTime`

## Floating Point

- `asFloat`, `SmallFloat`
- `fromSignExponentMantissa`, `signExponentMantissa`

## Fractal Functions

- `cantorStaircase`, `minkowskiQuestionMark`

## Fractions, Rational Numbers

- `asFraction`, `Fraction`, `/`
- `denominator`, `numerator`
- `limitDenominator`, `mediant`, `rationalize`
- `continuedFraction`, `fromContinuedFraction`
- `convergents`, `semiconvergents`

## Functional Iteration

- `foldLeft`, `scan`
- `nestList`
- `fixedPoint`, `fixedPointList`
- `nestWhileList`
- `dropWhile`, `takeWhile`

## Functional Programming

- `collect`, `detect`, `reject`, `select`
- `injectInto`, `reduce`, `scan`
- `foldLeft`, `foldRight`
- `withCollect`
- `atLevelCollect`, `deepCollect`, `withLevelCollect`
- `map`, `movingMap`
- `adjacentPairsCollect`, `pairsCollect`
- `windowedReduce`

## Geometry Types & Traits

- `PolarCoordinates`, `PlanarCoordinates`
- `CartesianCoordinates`, `CylindricalCoordinates`, `SphericalCoordinates`
- `Circle`, `Ellipse`, `Line`, `Polygon`, `Rectangle`, `Sphere`
- `AxonometricProjection`

## Geometry Functions

- `asPoint`, `Point`, `IsoSphericalCoordinate`
- `fromSphericalCoordinates`, `toSphericalCoordinates`
- `fromPolarCoordinates`, `toPolarCoordinates`
- `fromCylindricalCoordinates`, `toCylindricalCoordinates`
- `coordinateBoundingBox`, `coordinateBounds`
- `unitVector`

## Graph Functions

- `Graph`
- `asGraph`
- `complementGraph`, `lineGraph`, `undirectedGraph`
- `isDirectedEdge`, `isEdge`, `isUndirectedEdge`
- `isDirected`, `isMixed`, `isUndirected`
- `isEmpty`, `isLoopFree`, `isRegular`, `isSingleton`
- `edgeCount`, `vertexCount`
- `edgeList`, `vertexList`
- `degreeSequence`, `vertexDegree`, `vertexInDegree`, `vertexOutDegree`
- `adjacencyList`, `adjacencyMatrix`, `connectionMatrix`, `incidenceMatrix`
- `completeGraph`, `completeBipartiteGraph`
- `cycleGraph`, `gridGraph`, `pathGraph`, `starGraph`, `wheelGraph`
- `sumGraph`
- `edgeLabels`, `vertexCoordinates`, `vertexLabels`

## Help Files

- `DocumentationTest`, `HelpFile`
- `asDocumentationTest`, `extractDocumentationTests`

## Hyperbolic Functions

- `sinh`, `cosh`, `tanh`
- `i`

## Indexing

- `indices`
- `indicesDo`, `withIndexDo`

## Integer Functions

- `numberCompose`, `numberDecompose`
- `integerDigits`, `integerPartitions`

## Integer Sequences

- `bernoulliSequence`, `fibonacciSequence`, `primesList`
- `fareySequence`, `sternBrocotSequence`
- `calkinWilfTree`, `sternBrocotTree`
- `stolarskyArray`
- `narayanaSequence`, `vanDerLaanSequence`
- `wythoffArray`, `wythoffLower`, `wythoffPair`, `wythoffUpper`

## Interval

- `Interval`
- `includes`, `min`, `max`
- `discretize`, `subdivide`

## Iteration

- `deepDo`, `do`, `doSeparatedBy`, `timesRepeat`
- `fromToDo`, `toByDo`, `toDo`, `upOrDownTo`
- `reverseDo`, `reverseWithDo`
- `associationsDo`, `indicesDo`, `keysAndValuesDo`, `keysDo`, `valuesDo`
- `withDo`, `withIndexDo`

## Json

- `asJson`, `isJson`, `Json`, `parseJson`

## Mathematical Constants

- `e`, `pi`
- `eulerGamma`, `goldenAngle`, `goldenRatio`
- `supergoldenRatio`, `plasticRatio`

## Mathematical Operators

- `+`, `-`, `*`, `/`, `%`, `^`
- `//`, `\\`

## Math & Counting Operations on Lists

- `size`
- `sum`, `product`
- `accumulate`, `prefixSum`
- `differences`, `ratios`
- `max`, `min`, `minMax`
- `count`, `counts`

## Matrix Constructors

- `iota`, `reshape`
- `table`
- `identityMatrix`, `diagonalMatrix`, `constantArray`
- `partition`
- `boxMatrix`, `crossMatrix`, `diamondMatrix`, `diskMatrix`

## Matrix Operations

- `elementType`, `numberOfColumns`, `numberOfRows`
- `isMatrix`, `shape`, `reshape`
- `fill`, `table`
- `zeroMatrix`, `identityMatrix`, `exchangeMatrix`
- `antidiagonalMatrix`, `diagonalMatrix`
- `isSquareMatrix`, `isSymmetricMatrix`
- `isLowerTriangularMatrix`, `isUpperTriangularMatrix`
- `dot`, `inner`, `matrixPower`, `outer`
- `antidiagonal`, `determinant`, `diagonal`
- `inverse`, `matrixRank`, `rowReduce`
- `permanent`, `trace`
- `conjugate`, `conjugateTranspose`, `transpose`
- `kroneckerProduct`
- `lowerTriangularize`, `upperTriangularize`
- `luDecomposition`
- `minor`, `minors`

## Matrix Predicates

- `isMatrix`, `isMatrixOf`
- `isColumnVector`, `isRowVector`
- `isSquareMatrix`, `isDiagonalMatrix`
- `isUpperTriangularMatrix`, `isLowerTriangularMatrix`
- `isSymmetricMatrix`
- `isUnitaryMatrix`

## Methods

- `methodLookupAtType`
- `parameterNames`

## Modular Arithmetic

- `Residue`, `ResidueSet`
- `%`, `commonResidue`, `minimalResidue`, `modularInverse`
- `asResidueSet`, `leastResidueSystem`
- `complement`

## Network

- `Location`, `Url`, `UrlQueryParameters`
- `asUrl`, `asUrlQueryParameters`
- `fragment`, `host`, `hostName`, `href`, `pathName`, `protocol`, `queryParameters`
- `Request`, `Response`
- `fetch`, `fetchText`, `fetchJson`, `fetchByteArray`
- `decodeUri`, `encodeUri`

## Numeric Literals

- `Complex Literals`, `Fraction Literals`, `Integer Literals`, `Number Literals`
- `Radix Syntax`

## Numeric Types & Traits

- `Binary`, `Integer`, `Magnitude`, `Number`
- `Complex`, `Fraction`, `Interval`, `SmallFloat`, `LargeInteger`
- `RandomNumberGenerator`

## Numerical Properties

- `isComplex`, `isFraction`, `isInteger`, `isLargeInteger`, `isNumber`, `isSmallFloat`, `isZero`
- `isEven`, `isNegative`, `isOdd`, `isPositive`
- `isCoprime`, `isPrime`

## Open Sound Control

- `OscBundle`, `OscMessage`, `OscParameter`
- `asOscParameter`
- `addOscListener`, `removeOscListener`

## Operators

- `isSplOperatorCharacter`, `isSplOperatorToken`
- `splOperatorCharacters`, `splOperatorTokenName`, `splOperatorNameTable`
- `isSplPunctuationCharacter`, `isSplPunctuationToken`
- `splPunctuationCharacterNameTable`, `splPunctuationCharacters`, `splPunctuationTokenName`

## Package

- `Package`
- `packageDictionary`, `packageMethods`, `packageTraits`, `packageTypes`

## Parsing Numbers

- `parseLargeInteger`, `parseSmallInteger`
- `parseComplex`, `parseDecimal`, `parseFraction`
- `parseDecimalInteger`

## Partial Application

- `bindLeft`, `bindRight`, `constant`

## Permutations

- `permutations`, `permutationsDo`
- `lexicographicPermutations`, `nextPermutationLexicographic`
- `minimumChangePermutations`
- `plainChanges`
- `isPermutationCycles`, `isPermutationList`, `isPermutationOf`
- `permutationCyclesToPermutationList`, `permutationListToPermutationCycle`
- `permutationCycles`, `permutationList`
- `permutationMatrix`
- `Permutation`
- `asPermutation`, `cycles`, `isDerangement`, `isInvolution`
- `findPermutation`, `permute`
- `inversePermutation`, `permutationOrder`
- `permutationPower`, `permutationProduct`
- `permutationReplace`
- `permutationOrderList`
- `permutationInversions`, `permutationSymbol`
- `permutationFixedPoints`
- `permutationLength`, `permutationSupport`
- `permutationDegree`, `permutationMax`, `permutationMin`
- `permutationPeaks`
- `randomPermutation`, `randomCycle`
- `leftInversionCount`, `rightInversionCount`, `rightInversionCountToPermutation`
- `permutationGraph`
- `permutationRank`, `unrankPermutation`
- `stackSort`
- `lyndonWords`
- `permutationHasPattern`, `permutationPatternPositions`, `reducedPermutation`

## Piecewise Functions

- `abs`, `min`, `max`
- `Piecewise`

## Prime Numbers

- `factorInteger`, `integerExponent`
- `isCoprime`, `isGaussianPrime`, `isPrime`, `isPrimePower`
- `primesBetweenAnd`, `primesList`, `primesUpTo`, `primesUpToDo`
- `indexOfPrime`, `nextPrime`, `prime`
- `primeFactors`, `primeLimit`
- `logIntegral`, `primePi`
- `eulerPhi`
- `randomPrime`
- `isSmoothNumber`

## Printing

- `asString`, `concisePrintString`, `printString`, `storeString`
- `contractTo`, `printStringLimitedTo`, `truncateTo`

## Ranges

- `ArithmeticProgression`, `Range`
- `arithmeticProgression`, `isArithmeticProgression`, `isArithmeticProgressionBy`
- `asRange`, `asRangeList`
- `isIntegerRange`, `isNormal`, `isProper`, `isRange`
- `differences`

## Random Numbers

- `RandomNumberGenerator`, `Stream`
- `LinearCongruential`, `MersenneTwister`, `Sfc32`, `SplitMix`
- `nextRandomFloat`, `randomComplex`, `randomReal`, `randomInteger`, `randomPoint`, `randomPrime`
- `atRandom`, `randomByteArray`
- `randomChoice`, `randomWeightedChoice`, `randomSample`
- `randomRealBipolar`, `randomIntegerBipolar`
- `randomWeightedIndex`
- `fisherYatesShuffle`, `sattoloShuffle`
- `shuffle`, `shuffled`
- `randomPermutation`, `randomCycle`

## Random Number Distributions

- `BetaDistribution`
- `CauchyDistribution`
- `NormalDistribution`
- `PoissonDistribution`
- `TriangularDistribution`
- `UniformDistribution`
- `WeibullDistribution`

## Rearranging & Restructuring Lists

- `++`, `flatten`, `partition`
- `reverse`, `rotateLeft`, `rotateRight`
- `intercalate`, `interleave`, `intersperse`
- `deleteAdjacentDuplicates`, `deleteDuplicates`
- `subsequences`, `subsets`, `substrings`

## Recurrence and Sum Functions

- `bernoulliNumber`, `fibonacci`, `lucasNumber`
- `bernoulliSequence`, `fibonacciSequence`, `fibonacciSequenceUpTo`
- `harmonicNumber`

## Reflection

- `perform`, `respondsTo`
- `type`, `typeOf`
- `elementType`, `elementTypes`
- `elementTypeIfAbsent`
- `methodDictionary`, `traitDictionary`, `typeDictionary`
- `Method`, `Trait`, `Type`
- `slotList`, `slotNameList`, `slotValueList`
- `slotRead`, `slotWrite`
- `equalByAtNamedSlots`
- `hasEqualSlots`, `hasEqualSlotsBy`
- `storeStringAsInitializeSlots`

## Regular Expressions

- `RegExp`
- `asRegExp`, `matchesRegExp`, `splitByRegExp`

## Removing

- `removeAt`, `remove`, `removeKey`
- `removeFirst`, `removeLast`
- `removeIfAbsent`, `removeKeyIfAbsent`
- `removeAllEqualTo`, `removeAll`, `removeAllSuchThat`
- `keysAndValuesRemove`

## Rounding & Truncating

- `ceiling`, `floor`, `round`, `roundTo`, `roundUpTo`
- `fractionalPart`, `integerPart`, `mixedFractionParts`
- `truncate`, `truncateTo`
- `mod`, `quotient`, `remainder`
- `sawtoothWave`

## Scheduling

- `Promise`, `rejectedPromise`, `resolvedPromise`
- `finally`, `onRejection`, `then`, `thenElse`
- `allFulfilled`, `allSettled`, `anyFulfilled`, `anySettled`
- `cancel`, `valueAfter`, `valueAfterWith`, `valueEvery`

## Sequence Alignment and Comparison

- `indexOfSubstring`, `indexOfSubstringStartingAt`, `indexOfSubstringStartingAtIfAbsent`
- `indicesOfSubstring`, `indicesOfSubstringStartingAt`
- `longestCommonSubsequence`
- `longestCommonSubstring`, `longestCommonSubstringList`
- `longestIncreasingSubsequence`, `longestIncreasingSubsequenceList`

## Set operations

- `complement`, `difference`, `intersection`, `symmetricDifference`, `union`
- `nub`
- `combinations`, `powerSet`, `subsets`, `tuples`

## Sorting

- `sort`, `sorted`
- `sortBy`, `sortByOn`, `sortOn`
- `sortedWithIndices`
- `mergeSort`, `mergeSortBy`, `mergeSortByFromTo`
- `quickSort`, `quickSortBy`, `quickSortByFromTo`
- `ordering`
- `isSorted`, `isSortedBy`

## Specifying Angles

- `PlaneAngle`, `degrees`, `radians`
- `degree`, `fromDms`

## Splines

- `bernsteinBasis`

## Statistics

- `mean`, `median`, `commonest`
- `arithmeticMean`, `harmonicMean`, `geometricMean`, `contraharmonicMean`
- `arithmeticGeometricMean`
- `variance`, `standardDeviation`, `meanDeviation`
- `skewness`, `kurtosis`
- `moment`, `centralMoment`, `rootMeanSquare`
- `interquartileRange`, `quantile`, `quartiles`
- `movingAverage`, `movingMedian`
- `exponentialMovingAverage`
- `covariance`, `correlation`, `blomqvistBeta`

## Streams

- `Iterator`, `Stream`, `WriteStream`
- `BlockStream`, `CollectionStream`, `MutableCollectionStream`
- `atEnd`, `next`, `reset`
- `nextPut`, `nextPutAll`
- `nextUntil`, `nextWhile`
- `contents`
- `position`, `setToEnd`
- `asIterator`, `asStream`
- `collect`, `reject`, `select`
- `peek`, `peekFor`
- `skip`, `skipTo`

## Stream Library

- `LsAccum`, `LsAtFold`, `LsAt`, `LsAtWrap`
- `LsBeta`, `LsBind`, `LsBrown`
- `LsCat`, `LsCauchy`, `LsCollect`, `LsCons`, `LsConstant`, `LsCyc`
- `LsDiff`, `LsDrop`, `LsDupEach`
- `LsFin`, `LsFold`, `LsForever`
- `LsGeom`
- `LsIBrown`
- `LsLace`, `LsLast`
- `LsN`
- `LsOnce`
- `LsRand`, `LsRemDup`
- `LsScan`, `LsSelect`, `LsSeq`, `LsSer`, `LsSeries`, `LsSet`, `LsSlidingWindows`
- `LsTake`, `LsTrace`, `LsTuple`
- `LsUnfold`
- `LsWhite`

## String Operations

- `join`, `splitBy`, `splitByRegExp`
- `at`, `characters`, `codePoints`, `drop`, `size`, `reverse`, `take`
- `asLowerCase`, `asUpperCase`, `capitalize`
- `asInteger`, `asNumber`
- `trim`, `withBlanksTrimmed`, `withoutLeadingBlanks`, `withoutTrailingBlanks`
- `lines`, `sentences`, `words`
- `unlines`, `unsentences`, `unwords`
- `padLeft`, `padRight`

## String Tests

- `isString`, `isDecimalIntegerString`, `isFloatString`
- `isLowerCase`, `isUpperCase`

## Syntax Tokens

- `,`, `;`, `:`, `:=`, `:;`
- `[`, `(`, `{`

## Temporal Types and Functions

- `Clock`, `Duration`, `TimeStamp`
- `asTimeStamp`
- `centiseconds`, `milliseconds`, `seconds`
- `hours`, `minutes`
- `days`, `weeks`
- `julianYears`, `siderealMonths`, `synodicMonths`
- `parseDuration`
- `localTimeZoneOffset`, `localeTimeString`

## Text

- `String`, `AsciiString`
- `isBlank`, `isBlankLine`, `isVowel`
- `isAscii`, `isAsciiCodePoint`
- `lines`, `paragraphs`, `sentences`, `words`
- `removeDiacritics`
- `compare`, `precedes`, `precedesOrEqualTo`

## Timing

- `currentDate, `now`, `absoluteTime`
- `timing`

## Tree Operations

- `asTree`, `expressionTree`
- `depth`, `leafCount`, `size`
- `deepCollect`, `deepDo`, `deepIndices`

## Trigonometric Functions

- `degrees`, `radians`
- `degreesToRadians`, `radiansToDegrees`
- `cos`, `sin`, `tan`
- `cosh`, `sinh`, `tanh`
- `sincHistorical`, `sincNormalized`
- `arcCos`, `arcSin`, `arcTan`
- `arcCosh`, `arcSinh`, `arcTanh`
- `haversine`

## Tuning Type and Functions

- `CentsTuning`, `RatioTuning`, `Scale`, `Tuning`
- `asRatioTuning`, `equalTemperamentTuning`
- `asCents`, `asFractions`, `asIntegers`, `asRatios`
- `limit`, `octave`
- `centsToRatio`, `degreeToKey`, `ratioToCents`
- `benedettiHeight`, `keesSemiHeight`, `tenneyHeight`, `weilHeight`, `wilsonHeight`
- `latticePrimes`, `latticeVertices`, `latticeVector`
- `intervalMatrix`, `isConstantStructure`

## Units & Measures

- `Quantity`
- `Mass`, `Length`, `Time`
- `Frequency`, `PlaneAngle`
- `asHertz`, `hertz`, `kiloherz`
- `metres`

## Vector Constructors

- `table`, `!`, `reshape`

## Vector Operations

- `isVector`, `size`
- `@`, `@*`, `at`
- `dot`, `cross`, `norm`
- `sum`, `product`
- `normalize`, `projection`, `standardize`
- `orthogonalize`, `kroneckerProduct`

## Vectors and Paths

- `angleVector`
- `circlePoints`
- `anglePath`

## Window Functions

- `bartlettWindow`, `dirichletWindow`
- `blackmanHarrisWindow`, `blackmanWindow`
- `gaussianWindow`
- `hammingTable`, `hammingWindow`
- `hannTable`, `hannWindow`
- `welchTable`, `welchWindow`

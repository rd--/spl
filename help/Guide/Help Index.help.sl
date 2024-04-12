# Help Index

## Accessing

- `at`, `atModify`, `atPut`
- `atFold`, `atPath`, `atPin`, `atWrap`, `atWrapPut`
- `atAll`, `atAllPut`, `atAllPutAll`
- `atIfAbsent`, `atIfAbsentPut`, `atIfPresent`
- `associationAt`, `associationAtIfAbsent`
- `any`, `anyAs`
- `first`, `second`, `third`, `fourth`, `last`

## Adding

- `addFirst`, `add`, `addLast`, `addWithOccurrences`
- `addAfter`, `addAfterIndex`, `addBefore`
- `addAllFirst`, `addAll`, `addAllIfNotPresent`, `addAllLast`
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
- `assertIsCollection`, `assertIsSmallInteger`, `assertIsString`

## Binary, Bitwise

- `bitAnd`, `bitOr`, `bitXor`, `bitNot`
- `<<`, `>>`, `bitCount`, `bitShift`, `bitShiftLeft`, `bitShiftRight`, `highBit`, `lowBit`
- `bitAt`, `bitAtPut`

## Blocks

- `Block`
- `cull`, `numArgs`, `value`

## Boolean, Logic

- `&`, `&&`, `|`, `||`, `not`
- `false`, `true`
- `boole`
- `allSatisfy`, `anySatisfy`, `noneSatisfy`
- `if`, `ifFalse`, `ifTrue`

## Character

- `asLowerCase`, `asString`, `asUpperCase`
- `codePoint`

## Character Predicates

- `isCharacter`
- `isAlphaNumeric`, `isDigit`, `isLetter`, `isLowerCase`, `isUpperCase`
- `isCarriageReturn`, `isFormFeed`, `isLineFeed`, `isSeparator`, `isSpace`, `isTab`

## Collection Tests

- `isArray`, `isVector`, `isMatrix`
- `isCollection`, `isDictionary`, `isIndexable`, `isSequence`
- `isBag`, `isList`, `isMap`, `isRecord`, `isSet`
- `isBitSet`, `isPriorityQueue`, `isRange`, `isSortedList`
- `isAssociation`, `isAssociationList`
- `capacity`, `depth`, `size`

## Collection Types & Traits

- `Collection`, `Dictionary`, `Sequence`
- `Extensible`, `Indexable`, `Keyed`, `Removable`, `Unordered`
- `Bag`, `List`, `Map`, `Record`, `Set`, `Tree`, `Tuple`
- `BitSet`, `PriorityQueue`, `SortedList`
- `ArithmeticProgression`, `Range`
- `Association`
- `Slice`

## Combinatorial Functions

- `!`, `doubleFactorial`, `factorial`, `factorialPower`, `hyperfactorial`, `subfactorial`
- `binomial`, `catalanNumber`, `multinomial`
- `polygonalNumber`
- `partitionsP`, `partitionsQ`
- `dyckWords`

## Comparison Operators

- `>`, `<`, `<=`, `>=`, `<=>`
- `closeTo`, `veryCloseTo`

## Complex Numbers

- `i`, `imaginary`, `j`, `real`
- `abs`, `absArg`, `arg`, `conjugated`, `sign`
- `randomComplex`

## Conditionals

- `if`, `ifEmpty`, `ifError`, `ifFalse`, `ifNil`, `ifTrue`
- `whileTrue`, `whileFalse`
- `doWhileTrue`, `doWhileFalse`

## Congruences

- `%`, `powerMod`
- `multiplicativeOrder`
- `chineseRemainder`

## Converting

- `asBit`, `asBoolean`
- `asComplex`, `asFloat`, `asFraction`, `asGaussianInteger`, `asInteger`, `asLargeInteger`, `asNumber`, `asSmallFloat`
- `asCharacter`, `asCodePoint`, `asHexDigit`, `asLowerCase`, `asRegExp`, `asString`, `asUpperCase`, `asWords`
- `asBag`, `asByteArray`, `asCollection`, `asList`, `asMap`, `asRecord`, `asSet`, `asSortedList`, `asTree`
- `degreesToRadians`, `radiansToDegrees`

## Copying

- `copy`, `copyFromTo`, `copyUpTo`, `deepCopy`, `postCopy`, `shallowCopy`
- `copyReplaceAllWith`, `copyWith`, `copyWithout`, `copyWithoutAll`, `copyWithoutIdenticalElements`
- `#`, `replicateEach`, `replicateInteger`
- `!`, `duplicateInteger`, `duplicateShape`

## Date

- `asDate`, `Date`
- `dayOfMonth`, `dayOfWeek`, `month`, `year`
- `parseDate`

## Distance Measures

- `brayCurtisDistance`, `canberraDistance`, `chessboardDistance`, `euclideanDistance`, `manhattanDistance`
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
- `sinc`
- `haversine`

## Enumerating

- `indices`, `shapeIndices`
- `fill`

## Equality Testing

- `=`, `==`, `~=`, `~~`, `~`
- `hasEqualElements`, `hasEqualElementsBy`
- `allEqual`, `allEqualBy`

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

## Geometry Types & Traits

- `PolarCoordinate`, `RectangularCoordinate`
- `CartesianCoordinate`, `CylindricalCoordinate`, `SphericalCoordinate`
- `Circle`, `Rectangle`, `Sphere`
- `Angle`, `Projection3`

## Geometry Functions

- `asPoint`, `Point`, `IsoSphericalCoordinate`
- `fromSphericalCoordinates`, `fromPolarCoordinates`
- `toPolarCoordinates`
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
- `edgeLabels`, `vertexLabels`

## Help Files

- `DocumentTest`, `HelpFile`
- `asDocumentTest`, `extractDocumentTests`

## Hyperbolic Functions

- `sinh`, `cosh`, `tanh`
- `i`

## Indexing

- `firstIndex`, `lastIndex`
- `indices`, `indicesDo`, `withIndexDo`
- `firstIndex`, `lastIndexOf`

## Integer Functions

- `numberCompose`, `numberDecompose`
- `integerDigits`, `integerPartitions`

## Integer Sequences

- `bernoulliList`, `fibonacciList`, `primesList`
- `fareySequence`, `sternBrocotSequence`
- `calkinWilfTree`, `sternBrocotTree`

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

## Mathematical Operators

- `+`, `-`, `*`, `/`, `%`, `^`
- `//`, `\\`

## Mathematical Functions

- `sum`, `product`

## Matrix Operations

- `isMatrix`, `shape`, `reshape`, `table`
- `zeroMatrix`, `identityMatrix`, `diagonalMatrix`
- `isSquareMatrix`, `isSymmetricMatrix`
- `dot`, `inner`, `matrixPower`, `outer`
- `determinant`, `diagonal`, `trace`, `transposed`
- `kroneckerProduct`

## Methods

- `methodLookupAtType`
- `parameterNames`

## Modular Arithmetic

- `Residue`, `ResidueSet`
- `%`, `commonResidue`, `minimalResidue`, `modularInverse`
- `asResidueSet`, `leastResidueSystem`
- `complement`

## Network

- `Location`, `Url`
- `hostName`, `href`, `pathName`
- `Request`, `Response`
- `fetch`, `fetchText`, `fetchJson`, `fetchByteArray`
- `decodeUri`, `encodeUri`

## Numeric Literals

- `Complex Literals`, `Fraction Literals`, `Integer Literals`, `Number Literals`
- `Radix Syntax`

## Numeric Types & Traits

- `Binary`, `Integer`, `Magnitude`, `Number`, `Random`
- `Complex`, `Fraction`, `Interval`, `SmallFloat`, `LargeInteger`

## Numerical Properties

- `isComplex`, `isFraction`, `isInteger`, `isLargeInteger`, `isNumber`, `isSmallFloat`, `isZero`
- `isEven`, `isNegative`, `isOdd`, `isPositive`
- `isCoprime`, `isPrime`

## Open Sound Control

- `OscBundle`, `OscMessage`, `OscParameter`
- `asOscParameter`
- `addOscListener`, `removeOscListener`

## Operators

- `operatorCharacterNameTable`, `operatorNameTable`

## Package

- `Package`
- `packageDictionary`, `packageMethods`, `packageTraits`, `packageTypes`

## Parsing Numbers

- `parseDecimalInteger`, `parseInteger`, `parseNumber`

## Partial Application

- `bindLeft`, `bindRight`, `constant`

## Permutations

- `permutations`, `permutationsDo`
- `isPermutationCycles`, `isPermutationList`
- `permutationCycle`, `permutationCycles`, `permutationList`
- `permutationMatrix`
- `Permutation`
- `asPermutation`, `cycles`, `isInvolution`
- `findPermutation`, `permute`
- `inversePermutation`, `permutationOrder`
- `permutationPower`, `permutationProduct`
- `permutationReplace`
- `permutationOrderList

## Piecewise Functions

- `abs`, `min`, `max`
- `Piecewise`

## Prime Numbers

- `factorInteger`, `integerExponent`
- `isCoprime`, `isGaussianPrime`, `isPrime`, `isPrimePower`
- `primesBetweenAnd`, `primesList`, `primesUpTo`, `primesUpToDo`
- `indexOfPrime`, `nextPrime`, `nthPrime`
- `primeFactors`, `primeLimit`
- `logIntegral`, `primePi`
- `eulerPhi`
- `randomPrime`
- `isSmoothNumber`

## Printing

- `printString`, `storeString`

## Ranges

- `ArithmeticProgression`, `Range`
- `arithmeticSeries`, `isArithmeticSeries`, `isArithmeticSeriesBy`
- `asRange`, `asRangeList`
- `isIntegerRange`, `isNormal`, `isProper`, `isRange`
- `differences`

## Random Numbers

- `Random`, `Stream`
- `LinearCongruential`, `Mersenne`, `Sfc32`, `SplitMix`
- `nextRandomFloat`, `randomComplex`, `randomFloat`, `randomInteger`, `randomPrime`
- `atRandom`, `randomByteArray`, `randomSample`
- `randomFloatBipolar`, `randomIntegerBipolar`
- `randomWeightedIndex`

## Random Number Distributions

- `randomIntegerPoissonDistribution`
- `randomFloatCauchyDistribution`, `randomFloatGaussianDistribution`, `randomFloatLinearDistribution`
- `randomFloatEulerianBetaDistribution`, `randomFloatWeibullDistribution`

## Rearranging & Restructuring Lists

- `++`, `flatten`, `partition`
- `reverse`, `rotatedLeft`, `rotatedRight`
- `intercalate`, `interleave`, `intersperse`
- `deleteAdjacentDuplicates`, `deleteDuplicates`
- `subsequences`, `subsets`

## Recurrence and Sum Functions

- `bernoulli`, `fibonacci`
- `bernoulliList`, `fibonacciList`
- `harmonicNumber`

## Reflection

- `perform`, `respondsTo`, `type`, `typeOf`
- `elementType`, `elementTypeIfAbsent`, `elementTypes`
- `methodDictionary`, `traitDictionary`, `typeDictionary`
- `Method`, `Trait`, `Type`
- `slotList`, `slotRead`, `slotWrite`
- `hasEqualSlots`, `storeStringAsInitializeSlots`

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
- `truncated`, `truncateTo`

## Scheduling

- `Promise`, `rejectedPromise`, `resolvedPromise`
- `finally`, `onRejection`, `then`, `thenElse`
- `allFulfilled`, `allSettled`, `anyFulfilled`, `anySettled`
- `cancel`, `valueAfter`, `valueAfterWith`, `valueEvery`

## Sequence Alignment and Comparison

- `indexOfSubcollection`, `indexOfSubcollectionStartingAt`, `indexOfSubcollectionStartingAtIfAbsent`
- `indicesOfSubCollection`
- `longestCommonSequence`
- `longestCommonSubsequence`, `longestCommonSubsequenceList`

## Set operations

- `complement`, `difference`, `intersection`, `symmetricDifference`, `union`
- `nub`
- `combinations`, `powerSet`, `subsets`, `tuples`

## Sorting

- `sort`, `sortBy`, `sorted`, `sortOn`
- `ordering`

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
- `at`, `characters`, `codePoints`, `drop`, `size`, `reversed`, `take`
- `asLowerCase`, `asUpperCase`, `capitalized`
- `asInteger`, `asNumber`
- `trim`, `withBlanksTrimmed`, `withoutLeadingBlanks`, `withoutTrailingBlanks`
- `lines`, `sentences`, `words`
- `unlines`, `unsentences`, `unwords`

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

- `isBlank`, `isBlankLine`, `isVowel`
- `lines`, `paragraphs`, `sentences`, `words`

## Timing

- `now`, `systemTimeInMilliseconds`, `unixTime`, `unixTimeInMilliseconds`
- `millisecondsToRun`

## Tree Operations

- `asTree`, `depth`, `leafCount`, `size`

## Trigonometric Functions

- `Angle`, `degrees`, `radians`
- `degreesToRadians`, `radiansToDegrees`
- `cos`, `sin`, `tan`
- `cosh`, `sinh`, `tanh`
- `sinc`
- `arcCos`, `arcSin`, `arcTan`
- `arcCosh`, `arcSinh`, `arcTanh`
- `haversine`

## Tuning Type and Functions

- `CentsTuning`, `RatioTuning`, `Scale`, `Tuning`
- `asJiTuning`, `equalTemperamentTuning`
- `asCents`, `asFractions`, `asIntegers`, `asRatios`
- `limit`, `octave`
- `centsToRatio`, `degreeToKey`, `ratioToCents`
- `benedettiHeight`, `keesSemiHeight`, `tenneyHeight`, `weilHeight`, `wilsonHeight`
- `latticePrimes`, `latticeVertices`, `latticeVector`

## Units & Measures

- `Angle`, `Distance`, `Frequency`, `Length`
- `asHertz`, `hertz`, `kiloherz`
- `metres`

## Vector Operations

- `dot`, `norm`, `normalize`, `standardize`

## Window Functions

- `bartlettWindow`, `dirichletWindow`
- `blackmanHarrisWindow`, `blackmanWindow`
- `gaussianWindow`
- `hammingTable`, `hammingWindow`
- `hannTable`, `hannWindow`
- `welchTable`, `welchWindow`

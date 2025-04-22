# Mathematical Functions

## Arithmetic Functions

- `accumulate`: cumulative sums in a list
- `differences`: successive differences in a list
- `mean`: mean of a list
- `product`: product of elements in a list
- `ratios`: successive ratios in a list
- `sqrt`: square root
- `sum`: sum of elements in a list

## Arithmetic Functions - Binary Operators

- `*`: multiplication
- `+`: addition
- `-`: subtraction
- `/`: division
- `^`: raised to

## Array Bounds

- `coordinateBoundingBox`: min and max coordinates
- `coordinateBounds`: min and max coordinates
- `minMax`: `min` and `max` values

## Base-Like Representations

- `integerDigits`: gives a list of the decimal digits in the integer n.
- `mixedRadixDecode`: mixed radix decoding
- `mixedRadixEncode`: mixed radix encoding

## Bitwise Functions

- `Bitwise Functions`: Guide

## Combinatorial Functions

- `Combinatorial Functions`: Guide

## Comparison Functions

- `compare`: lexicographical ordering
- `precedes`: lexicographical comparison

## Comparison Functions - Binary Operators

- `<=>`: -1, 0, +1 for less than, equal to, greater than
- `<=`: less than or equal to
- `<`: less than
- `>=`: greater than or equal to
- `>`: greater than

## Complex Number Functions

- `absArg`: absolute value and argument
- `abs`: absolute value
- `arg`: argument
- `conjugated`: complex conjugate
- `imaginary`: imaginary component of a complex number
- `real`: real component of a complex number
- `sign`: sign of

## Congruence Functions

- `%`: modulo
- `chineseRemainder`: chinese remainder theorem
- `multiplicativeOrder`: multiplicative order
- `powerMod`: power modulo

## Continued Fraction and Rational Approximation Functions

- `asFraction`: find rational approximations
- `continuedFraction`: continued fraction expansion
- `convergents`: a list of successive convergents of a continued fraction
- `fromContinuedFraction`: construct exact or inexact numbers from continued fractions

## Data Transform and Smoothing Functions

- `clip`: clip between
- `exponentialMovingAverage`: find the exponential moving average with damping
- `movingAverage`: find the simple moving average with any span
- `movingMap`: map a function over a moving window with any span
- `movingMedian`: find the moving median with any span
- `normalize`: normalize vector
- `rescale`: rescale between
- `standardize`: zero mean and unit sample variance

## Distance and Similarity Measures

- `Distance Functions`: Guide
- `Similarity Functions`: Guide

## Divisibility Functions

- `divisible`: is divisible predicate
- `euclideanAlgorithm`: greatest common divisor
- `extendedEuclideanAlgorithm`: greatest common divisor and Bézout coefficients
- `gcd`: greatest common divisor
- `isCoprime`: is coprime predicate
- `isEven`: is even predicate
- `isOdd`: is odd predicate
- `isPrime`: is prime predicate
- `lcm`: least common multiple
- `modularInverse`: modular inverse

## Division Functions

- `%`: modulo (remainder on division)
- `//`: quotient
- `\\`: remainder
- `quotientRemainder`: integer quotient and remainder
- `quotient`: integer quotient
- `remainder`: integer remainder

## Divisor Functions

- `divisorSigma`: the divisor function
- `divisorSum`: sum of divisors
- `divisors`: list of integers that divide

## Error Functions

- `erf`: error function
- `erfc`: complementary error function
- `inverseErf`: inverse error function

## Exponential Functions

- `^`: raised to
- `cubeRoot`: real-number fractional powers
- `exp`: exponential
- `log10`: base-10 logarithms
- `log2`: base-2 logarithms
- `log`: logarithm
- `nthRoot`: surd
- `sqrt`: square root

## Factoring

- `factorInteger`: find the factors of an integer
- `integerExponent`: highest divisble power of

## Fourier Analysis

- `fft`: fast Fourier transform
- `ifft`: inverse fast Fourier transform

## Fractal Functions

- `blancmangeFunction`: blancmange function
- `minkowskiQuestionMark`: Minkowski ? function
- `minkowskiQuestionMarkInverse`: inverse Minkowski ? function
- `weierstrassFunction`: Weierstrass function

## Integer Functions

- `Integer Functions`: Guide

## Interpolation Functions

- `Interpolation Functions`: Guide

## Numerical Functions

- `boole`: 1 for true, 0 for false
- `ceiling`: round towards +∞
- `floor`: round towards -∞
- `fractionPart`: fractional part
- `integerPart`: integer part
- `mixedFractionParts`: integer and fractional parts
- `round`: round to nearest integer
- `sign`: sign of

## One-Dimensional Lists

- `Range`: range of values in equal steps
- `subdivide`: list of values from equal subdivisions

## Permutations Functions

- `Permutations Functions`: Guide

## Piecewise Functions

- `Piecewise`: general piecewise function
- `abs`: absolute value
- `max`: maximum value
- `min`: minimum value

## Prime Number Functions

- `Prime Number Functions`: Guide

## Rational Number Functions

- `denominator`: denominator of a fraction
- `numerator`: numerator of a fraction

## Resampling Functions

- `downsample`
- `downsampleSteinarsson`
- `matrixResample`
- `resample`
- `upsample`

## Set Functions

- `complement`: find the complement with respect to a universal set
- `groupings`: find all possible groupings of elements
- `intersection`: find the intersection of any number of sets
- `subsets`: find all possible subsets of a set (the powerset)
- `symmetricDifference`: find the symmetric difference of any number of sets
- `tuples`: find all possible tuples of n elements from a set
- `union`: find the union of any number of sets

## Special Functions

- `besselJ`: Bessel function of the first kind

## Statistics Functions

Guide:

- `Statistics Functions`

General:

- `moment`, `centralMoment`
- `rootMeanSquare`

Dispersion:

- `meanDeviation`, `standardDeviation`
- `interquartileRange`, `variance`

Location:

- `mean`, `median`
- `arithmeticMean`, `geometricMean`
- `harmonicMean`, `contraharmonicMean`
- `commonest`

Order:

- `min`, `max`, `minMax`
- `rankedMin`, `rankedMax`
- `quantile`, `quartiles`
- `ordering`, `sort`

Shape:

- `kurtosis`, `skewness`

## Trigonometric Functions

Guide:

- `Trigonometric Functions`

Function List:

- `cos`, `sin`, `tan`
- `cosh`, `sinh`, `tanh`
- `arcCos`, `arcSin`, `arcTan`
- `arcCosh`, `arcSinh`, `arcTanh`
- `sincHistorical`, `sincNormalized`

## Type Predicates

- `isComplex`: is complex number predicate
- `isFraction`: is fraction predicate
- `isInteger`: is small integer predicate
- `isLargeInteger`: is large integer predicate
- `isNumber`: is number predicate
- `isSmallFloat`: is small float predicate

## Vector Functions

- `at`: the _i_-th element of a vector
- `dot`: dot product of two vectors
- `norm`: the norm of a vector
- `normalize`: scale to be unit vector
- `standardize`: shift to have zero mean and unit sample variance
- `projection`: orthogonal projection
- `orthogonalize`: orthonormal to vectors

## Vector Functions - Paths

- `anglePath`: form a path from a sequence steps
- `angleVector`: create a vector at a specified angle
- `circlePoints`: equally distributed points around a circle

## Window Functions

- `Window Functions`: Guide

* * *

Guides: Bitwise Functions, Combinatorial Functions, Distance Functions, Geometry Functions, Integer Functions, Mathematical Constants, Matrix Functions, Permutation Functions, Prime Number Functions, Statistics Functions, Trigonometric Functions, Window Functions

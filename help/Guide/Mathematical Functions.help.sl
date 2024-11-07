# Mathematical Functions

## Angle Computation

- `planarAngle`: planar angle defined by three points
- `vectorAngle`: angle between vectors

## Array Bounds

- `coordinateBoundingBox`: min and max coordinates
- `coordinateBounds`: min and max coordinates
- `minMax`: `min` and `max` values

## Arithmetic Operators

- `*`: multiplication
- `+`: addition
- `-`: subtraction
- `/`: division
- `^`: raised to

## Arithmetic Functions

- `accumulate`: cumulative sums in a list
- `differences`: successive differences in a list
- `mean`: mean of a list
- `product`: product of elements in a list
- `ratios`: successive ratios in a list
- `sqrt`: square root
- `sum`: sum of elements in a list

## Comparison Operators

- `<=>`: -1, 0, +1 for less than, equal to, greater than
- `<=`: less than or equal to
- `<`: less than
- `>=`: greater than or equal to
- `>`: greater than

## Continued Fractions & Rational Approximations

- `asFraction`: find rational approximations
- `continuedFraction`: continued fraction expansion
- `convergents`: a list of successive convergents of a continued fraction
- `fromContinuedFraction`: construct exact or inexact numbers from continued fractions

## Piecewise Functions:

- `Piecewise`: general piecewise function
- `abs`: absolute value
- `max`: maximum value
- `min`: minimum value

## Exponential Functions

- `^`: raised to
- `cubeRoot`: real-number fractional powers
- `exp`: exponential
- `log10`: base-10 logarithms
- `log2`: base-2 logarithms
- `log`: logarithm
- `nthRoot`: surd
- `sqrt`: square root

## Trigonometric Functions

- `arcCos`: arc cosine
- `arcSin`: arc sine
- `arcTan`: arc tangent
- `cos`: cosine
- `sin`: sine
- `sinc`: sinc
- `tan`: tangent

## Hyperbolic Functions

- `arcCosh`: arc hyperbolic cosine
- `arcSinh`: arc hyperbolic sine
- `arcTanh`: arc hyperbolic tangent
- `cosh`: hyperbolic cosine
- `sinh`: hyperbolic sine
- `tanh`: hyperbolic tangent

## Matrix Functions

- `arrayFlatten`: flatten a matrix of matrices
- `arrayRules`: positions and values of nonzero elements
- `choleskyDecomposition`: the Cholesky decomposition
- `conjugateTranspose`: conjugate transpose (Hermitian conjugate)
- `determinant`: determinant
- `dot`: outer product
- `inner`: outer product
- `inverse`: inverse of a square matrix
- `isIntegerMatrix`: is integer matrix
- `luDecomposition`: the LU decomposition
- `matrixPower`: matrix power
- `matrixPrintString`: two dimensional matrix text format
- `matrixRank`: matrix rank, the number of linearly independent rows or columns
- `matrixRotate`: matrix rotation
- `minor`: the indicated minor of a matrix
- `minors`: the minors of a matrix
- `outer`: outer product
- `qrDecomposition`: the QR decomposition
- `rowReduce`: simplified matrix obtained by making linear combinations of rows
- `shape`: list the dimensions of a matrix
- `trace`: trace
- `transposed`: transposition

## Numerical Functions

- `boole`: 1 for true, 0 for false
- `ceiling`: round towards +∞
- `floor`: round towards -∞
- `fractionPart`: fractional part
- `integerPart`: integer part
- `mixedFractionParts`: integer and fractional parts
- `round`: round to nearest integer
- `sign`: sign of

## Division Functions

- `%`: modulo (remainder on division)
- `//`: quotient
- `\\`: remainder
- `quotientRemainder`: integer quotient & remainder
- `quotient`: integer quotient
- `remainder`: integer remainder

## Divisibility

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

## Divisors

- `divisorSigma`: the divisor function
- `divisorSum`: sum of divisors
- `divisors`: list of integers that divide

## Congruences

- `%`: modulo
- `chineseRemainder`: chinese remainder theorem
- `multiplicativeOrder`: multiplicative order
- `powerMod`: power modulo

## Combinatorial Functions

- `binomial`: binomial coefficients
- `catalanNumber`: Catalan numbers
- `doubleFactorial`: double factorial
- `factorialPower`: factorial power
- `factorial`: factorial function (total arrangements of n objects)
- `hyperfactorial`: hyperfactorial function
- `multinomial`: multinomial coefficients
- `polygonalNumber`: triangular and other polygonal numbers
- `subfactorial`: number of derangements of  objects, leaving none unchanged

## Integer Decompositions

- `divisors`: list of integer divisors
- `factorInteger`: list of prime factors
- `fareySequence`: the Farey sequence
- `integerDigits`: list of the digits in integer

## Integer Partitions

- `integerPartitions`: find partitions of integers
- `partitionsP`: number of partitions of an integer
- `partitionsQ`: number of partitions of an integer

## Base-Like Representations

- `integerDigits`: gives a list of the decimal digits in the integer n.
- `mixedRadixDecode`: mixed radix decoding
- `mixedRadixEncode`: mixed radix encoding

## Generating Primes

- `nextPrime`: next prime
- `nthPrime`: the nth prime number
- `primePi`: the number of primes up to
- `primesList`: the list of primes
- `randomPrime`: pick a random prime

## Primality Testing

- `isAlmostPrime`: test if a number is _k_-almost prime
- `isCoprime`: test if numbers are coprime
- `isGaussianPrime`: test if a complex number is a Gaussian prime
- `isPrime`: test if a number is prime
- `millerRabinPrimalityTest`: test if a number is likely prime

## Factoring

- `factorInteger`: find the factors of an integer
- `integerExponent`: highest divisble power of

## Fourier Analysis

- `fft`: fast Fourier transform

## Testing for Types

- `isComplex`: is complex predicate
- `isFraction`: is fraction predicate
- `isInteger`: is integer predicate
- `isLargeInteger`: is extended precision integer predicate
- `isNumber`: is number predicate
- `isSmallFloat`: is float predicate

## Rational Numbers

- `denominator`: denominator of a fraction
- `numerator`: numerator of a fraction

## Complex Numbers

- `absArg`: absolute value and argument
- `abs`: absolute value
- `arg`: argument
- `conjugated`: complex conjugate
- `imaginary`: imaginary component of a complex number
- `real`: real component of a complex number
- `sign`: sign of

## Bitwise Logic Operations

- `bitAnd`: bitwise and
- `bitNot`: bitwise not
- `bitOr`: bitwise or
- `bitXor`: bitwise exclusive or

## Structural Bitwise Operations

- `bitShiftLeft`: bit shift right
- `bitShiftRight`: bit shift left
- `highBit`: bit length

## Single-Bit Operations

- `bitAt`: read bit
- `bitAtPut`: write bit

## Location Statistics

- `commonest`: most common items
- `contraharmonicMean`: contraharmonic mean
- `geometricMean`: geometric mean
- `harmonicMean`: harmonic mean
- `mean`: mean of collection
- `median`: median of sequence

## Dispersion Statistics

- `interquartileRange`: difference between the upper and lower quartiles
- `meanDeviation`: mean absolute deviation
- `standardDeviation`: standard deviation
- `variance`: unbiased estimate of variance

## Shape Statistics

- `kurtosis`: coefficient of kurtosis
- `skewness`: coefficient of skewness

## General Statistics

- `centralMoment`: order r central moment
- `moment`: order r moment
- `rootMeanSquare`: root mean square

## Order Statistics

- `max`: maximun
- `minMax`: minimum and maximun
- `min`: minimum
- `ordering`: grade
- `quantile`: quantile estimate
- `quartiles`: quartile estimate
- `sort`: sort

## Data Transforms and Smoothing

- `clip`: clip between
- `exponentialMovingAverage`: find the exponential moving average with damping
- `movingAverage`: find the simple moving average with any span
- `movingMap`: map a function over a moving window with any span
- `movingMedian`: find the moving median with any span
- `normalize`: normalize vector
- `rescale`: rescale between
- `standardize`: zero mean and unit sample variance

## Window Functions

- `bartlettWindow`: Bartlett apodization function
- `blackmanWindow`: Blackman apodization function
- `dirichletWindow`: Dirichlet apodization function
- `hammingWindow`: Hamming apodization function
- `hannWindow`: Hann apodization function
- `welchWindow`: Welch  apodization function

## Operations on Sets

- `complement`: find the complement with respect to a universal set
- `groupings`: find all possible groupings of elements
- `intersection`: find the intersection of any number of sets
- `subsets`: find all possible subsets of a set (the powerset)
- `symmetricDifference`: find the symmetric difference of any number of sets
- `tuples`: find all possible tuples of n elements from a set
- `union`: find the union of any number of sets

## Permutation Representation

- `cycles`: cyclic permutation representation
- `isPermutationCycles`: test validity
- `isPermutationList`: test validity
- `permutationCycles`: convert to cyclic representation
- `permutationList`: convert to permutation list representation
- `randomPermutation`: random generation of permutations

## Permutation Operations

- `findPermutation`: permutation linking two expressions
- `inversePermutation`: inverse of permutation
- `permutationPower`: _n_-th power of permutation
- `permutationProduct`: product of permutations
- `permutationReplace`: standard action of a permutation on other objects
- `permutations`: all permutations of arguments of an expression
- `permute`: permute arguments of an expression

## Permutation Properties

- `permutationLength`: number of integers moved by permutation
- `permutationMax`: largest integer moved by permutation
- `permutationMin`: smallest integer moved by permutation
- `permutationOrder`: order of a permutation
- `permutationSupport`: integers that are not fixed by permutation

## Permutation Lists

- `ordering`: inverse of a permutation list
- `randomSample`: random generation of permutation lists

## Permutations

- `lexicographicPermutations`: permutations in lexicographic sequence
- `minimumChangePermutations`: permutations in minimum change sequence (Heap’s algorithm)
- `permutations`: permutations
- `plainChanges`: permutations in plain changes sequence (Steinhaus-Johnson-Trotter)

## Distance and Similarity Measures

- `binaryDistance`:  binary distance
- `brayCurtisDistance`: Bray–Curtis distance
- `canberraDistance`: Canberra or Lance-Williams distance
- `chessboardDistance`: chessboard or Chebyshev or sup norm distance
- `correlationDistance`: correlation distance
- `cosineDistance`: angular cosine distance
- `distanceMatrix`: distance matrix
- `editDistance`: edit or Levenshtein distance
- `euclideanDistance`: Euclidean distance
- `hammingDistance`: Hamming distance
- `manhattanDistance`: Manhattan or city block distance
- `minkowskiDistance`: Minkowski distance
- `normalizedSquaredEuclideanDistance`: nomralized squared Euclidean distance
- `squaredEuclideanDistance`: square of the Euclidean distance

## One-Dimensional Lists

- `Range`: range of values in equal steps
- `subdivide`: list of values from equal subdivisions

## Vector Functions

- `at`: the _i_-th element of a vector
- `dot`: dot product of two vectors
- `norm`: the norm of a vector
- `normalize`: scale to be unit vector
- `standardize`: shift to have zero mean and unit sample variance
- `projection`: orthogonal projection
- `orthogonalize`: orthonormal to vectors

## Vectors & Paths

- `anglePath`: form a path from a sequence steps
- `angleVector`: create a vector at a specified angle
- `circlePoints`: equally distributed points around a circle

## Coordinate Transformations

- `fromCylindricalCoordinates`: convert from _(ρ,φ,z)_ to _(x,y,z)_
- `fromPolarCoordinates`: convert from _(r,θ)_ to _(x,y)_
- `fromSphericalCoordinates`: convert from _(r,θ,ϕ)_ to _(x,y,z)_
- `reflectionMatrix`: reflection matrix
- `rotationMatrix`: rotation matrix
- `scalingMatrix`: scaling matrix
- `toCylindricalCoordinates`: convert from _(x,y,z)_ to _(ρ,φ,z)_
- `toPolarCoordinates`: convert from _(x,y)_ to _(r,θ)_
- `toSphericalCoordinates`: convert from _(x,y,z)_ to _(r,θ,ϕ)_

* * *

Guides: Mathematical Constants

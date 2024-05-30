# Mathematical Functions

## Angle Computation

- `vectorAngle`: angle between vectors
- `planarAngle`: planar angle defined by three points

## Array Bounds

- `minMax`: `min` and `max` values
- `coordinateBounds`: min and max coordinates
- `coordinateBoundingBox`: min and max coordinates

## Arithmetic Operators

- `+`: addition
- `-`: subtraction
- `*`: multiplication
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

- `<`: less than
- `>`: greater than
- `<=`: less than or equal to
- `>=`: greater than or equal to
- `<=>`: -1, 0, +1 for less than, equal to, greater than

## Continued Fractions & Rational Approximations

- `continuedFraction`: continued fraction expansion
- `fromContinuedFraction`: construct exact or inexact numbers from continued fractions
- `convergents`: a list of successive convergents of a continued fraction
- `asFraction`: find rational approximations

## Piecewise Functions:

- `min`: minimum value
- `max`: maximum value
- `abs`: absolute value
- `Piecewise`: general piecewise function

## Exponential Functions

- `log`: logarithm
- `log2`: base-2 logarithms
- `log10`: base-10 logarithms
- `exp`: exponential
- `^`: raised to
- `sqrt`: square root
- `cubeRoot`: real-number fractional powers
- `nthRoot`: surd

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

- `inverse`: inverse of a square matrix
- `transposed`: transposition
- `conjugateTranspose`: conjugate transpose (Hermitian conjugate)
- `determinant`: determinant
- `minor`: the indicated minor of a matrix
- `minors`: the minors of a matrix
- `trace`: trace
- `matrixRank`: matrix rank, the number of linearly independent rows or columns
- `matrixPower`: matrix power
- `rowReduce`: simplified matrix obtained by making linear combinations of rows
- `luDecomposition`: the LU decomposition
- `choleskyDecomposition`: the Cholesky decomposition
- `qrDecomposition`: the QR decomposition
- `shape`: list the dimensions of a matrix
- `outer`: outer product
- `inner`: outer product
- `dot`: outer product
- `arrayFlatten`: flatten a matrix of matrices
- `arrayRules`: positions and values of nonzero elements

## Numerical Functions

- `round`: round to nearest integer
- `floor`: round towards -∞
- `ceiling`: round towards +∞
- `integerPart`: integer part
- `fractionPart`: fractional part
- `mixedFractionParts`: integer and fractional parts
- `sign`: sign of
- `boole`: 1 for true, 0 for false

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

- `divisors`: list of integers that divide
- `divisorSigma`: the divisor function
- `divisorSum`: sum of divisors

## Congruences

- `%`: modulo
- `chineseRemainder`: chinese remainder theorem
- `powerMod`: power modulo
- `multiplicativeOrder`: multiplicative order

## Combinatorial Functions

- `factorial`: factorial function (total arrangements of n objects)
- `subfactorial`: number of derangements of  objects, leaving none unchanged
- `factorialPower`: factorial power
- `hyperfactorial`: hyperfactorial function
- `doubleFactorial`: double factorial
- `binomial`: binomial coefficients
- `multinomial`: multinomial coefficients
- `catalanNumber`: Catalan numbers
- `polygonalNumber`: triangular and other polygonal numbers

## Integer Decompositions

- `factorInteger`: list of prime factors
- `divisors`: list of integer divisors
- `integerDigits`: list of the digits in integer
- `fareySequence`: the Farey sequence

## Integer Partitions

- `integerPartitions`: find partitions of integers
- `partitionsP`: number of partitions of an integer
- `partitionsQ`: number of partitions of an integer

## Base-Like Representations

- `integerDigits`: gives a list of the decimal digits in the integer n.
- `mixedRadixEncode`: mixed radix encoding
- `mixedRadixDecode`: mixed radix decoding

## Generating Primes

- `primesList`: the list of primes
- `nthPrime`: the nth prime number
- `nextPrime`: next prime
- `randomPrime`: pick a random prime
- `primePi`: the number of primes up to

## Primality Testing

- `isAlmostPrime`: test if a number is _k_-almost prime
- `isGaussianPrime`: test if a complex number is a Gaussian prime
- `isPrime`: test if a number is prime
- `isCoprime`: test if numbers are coprime
- `millerRabinPrimalityTest`: test if a number is likely prime

## Factoring

- `factorInteger`: find the factors of an integer
- `integerExponent`: highest divisble power of

## Testing for Types

- `isNumber`: is number predicate
- `isInteger`: is integer predicate
- `isSmallFloat`: is float predicate
- `isComplex`: is complex predicate
- `isFraction`: is fraction predicate
- `isLargeInteger`: is extended precision integer predicate

## Rational Numbers

- `numerator`: numerator of a fraction
- `denominator`: denominator of a fraction

## Complex Numbers

- `real`: real component of a complex number
- `imaginary`: imaginary component of a complex number
- `abs`: absolute value
- `arg`: argument
- `absArg`: absolute value and argument
- `conjugated`: complex conjugate
- `sign`: sign of

## Bitwise Logic Operations

- `bitAnd`: bitwise and
- `bitOr`: bitwise or
- `bitXor`: bitwise exclusive or
- `bitNot`: bitwise not

## Structural Bitwise Operations

- `highBit`: bit length
- `bitShiftLeft`: bit shift right
- `bitShiftRight`: bit shift left

## Single-Bit Operations

- `bitAt`: read bit
- `bitAtPut`: write bit

## Location Statistics

- `mean`: mean of collection
- `median`: median of sequence
- `commonest`: most common items
- `harmonicMean`: harmonic mean
- `geometricMean`: geometric mean
- `contraharmonicMean`: contraharmonic mean

## Dispersion Statistics

- `variance`: unbiased estimate of variance
- `standardDeviation`: standard deviation
- `meanDeviation`: mean absolute deviation
- `interquartileRange`: difference between the upper and lower quartiles

## Shape Statistics

- `skewness`: coefficient of skewness
- `kurtosis`: coefficient of kurtosis

## General Statistics

- `moment`: order r moment
- `centralMoment`: order r central moment
- `rootMeanSquare`: root mean square

## Order Statistics

- `min`: minimum
- `max`: maximun
- `minMax`: minimum and maximun
- `sort`: sort
- `ordering`: grade
- `quantile`: quantile estimate
- `quartiles`: quartile estimate

## Data Transforms and Smoothing

- `clip`: clip between
- `rescale`: rescale between
- `normalize`: normalize vector
- `standardize`: zero mean and unit sample variance
- `movingAverage`: find the simple moving average with any span
- `exponentialMovingAverage`: find the exponential moving average with damping
- `movingMedian`: find the moving median with any span
- `movingMap`: map a function over a moving window with any span

## Window Functions

- `bartlettWindow`: Bartlett apodization function
- `blackmanWindow`: Blackman apodization function
- `dirichletWindow`: Dirichlet apodization function
- `hammingWindow`: Hamming apodization function
- `hannWindow`: Hann apodization function
- `welchWindow`: Welch  apodization function

## Operations on Sets

- `union`: find the union of any number of sets
- `intersection`: find the intersection of any number of sets
- `complement`: find the complement with respect to a universal set
- `symmetricDifference`: find the symmetric difference of any number of sets
- `subsets`: find all possible subsets of a set (the powerset)
- `tuples`: find all possible tuples of n elements from a set
- `groupings`: find all possible groupings of elements

## Permutation Representation

- `cycles`: cyclic permutation representation
- `isPermutationCycles`: test validity
- `permutationCycles`: convert to cyclic representation
- `permutationList`: convert to permutation list representation
- `isPermutationList`: test validity
- `randomPermutation`: random generation of permutations

## Permutation Operations

- `permutationReplace`: standard action of a permutation on other objects
- `permutationProduct`: product of permutations
- `inversePermutation`: inverse of permutation
- `permutationPower`: _n_-th power of permutation
- `permute`: permute arguments of an expression
- `findPermutation`: permutation linking two expressions
- `permutations`: all permutations of arguments of an expression

## Permutation Properties

- `permutationOrder`: order of a permutation
- `permutationSupport`: integers that are not fixed by permutation
- `permutationLength`: number of integers moved by permutation
- `permutationMin`: smallest integer moved by permutation
- `permutationMax`: largest integer moved by permutation

## Permutation Lists

- `ordering`: inverse of a permutation list
- `randomSample`: random generation of permutation lists

## Distance and Similarity Measures

- `euclideanDistance`: Euclidean distance
- `squaredEuclideanDistance`: square of the Euclidean distance
- `normalizedSquaredEuclideanDistance`: nomralized squared Euclidean distance
- `manhattanDistance`: Manhattan or city block distance
- `chessboardDistance`: chessboard or Chebyshev or sup norm distance
- `brayCurtisDistance`: Bray–Curtis distance
- `canberraDistance`: Canberra or Lance-Williams distance
- `cosineDistance`: angular cosine distance
- `correlationDistance`: correlation distance
- `binaryDistance`:  binary distance
- `minkowskiDistance`: Minkowski distance
- `distanceMatrix`: distance matrix
- `hammingDistance`: Hamming distance
- `editDistance`: edit or Levenshtein distance

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

- `angleVector`: create a vector at a specified angle
- `circlePoints`: equally distributed points around a circle
- `anglePath`: form a path from a sequence steps

## Coordinate Transformations

- `fromPolarCoordinates`: convert from _(r,θ)_ to _(x,y)_
- `toPolarCoordinates`: convert from _(x,y)_ to _(r,θ)_
- `fromSphericalCoordinates`: convert from _(r,θ,ϕ)_ to _(x,y,z)_
- `toSphericalCoordinates`: convert from _(x,y,z)_ to _(r,θ,ϕ)_
- `fromCylindricalCoordinates`: convert from _(ρ,φ,z)_ to _(x,y,z)_
- `toCylindricalCoordinates`: convert from _(x,y,z)_ to _(ρ,φ,z)_
- `rotationMatrix`: rotation matrix
- `reflectionMatrix`: reflection matrix
- `scalingMatrix`: scaling matrix

* * *

Guides: Mathematical Constants

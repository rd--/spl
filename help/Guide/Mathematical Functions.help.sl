# Mathematical Functions

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
- `powerMod`: power modulo

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
- `integerPartitions`: partition an integer into smaller integers
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

## Window Functions

- `bartlettWindow`: Bartlett apodization function
- `blackmanWindow`: Blackman apodization function
- `dirichletWindow`: Dirichlet apodization function
- `hammingWindow`: Hamming apodization function
- `hannWindow`: Hann apodization function
- `welchWindow`: Welch  apodization function

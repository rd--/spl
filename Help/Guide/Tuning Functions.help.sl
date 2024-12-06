# Tuning Functions

_Accessing_:

- `asCents`: intervals of a tuning in cents
- `asFractions`: intervals of a tuning as ratios in fraction form
- `asIntegers`: intervals of a tuning as integers
- `asRatios`: intervals of a tuning as ratios
- `intervalMatrix`:  all possible intervals in a tuning
- `primeLimit`: prime limit of a fraction
- `limit`: prime limit of a tuning
- `octave`: the ratio of the octave of a tuning

_Alterations_:

- `cancelFlat`: cancel flat
- `cancelSharp`: cancel sharp
- `flat`: lower by one place (a half-tone)
- `sharp`: raise by one place (a half-tone)
- `quarterToneFlat`: lower by half of one place (a quarter-tone)
- `quarterToneSharp`: raise by half of one place (a quarter-tone)

_Constants_:

- `pythagoreanComma`: the Pythagorean or ditonic comma
- `septimalComma`: the septimal comma
- `syntonicComma`: syntonic comma

_Converting_:

- `centsToRatio`: convert interval given as cents to a ratio
- `degreeToKey`: convert from degree to key
- `ratioToCents`: convert interval given as a ratio to cents

_Fraction Functions_:

- `continuedFraction`: continued fraction representation of a number
- `convergents`: convergents corresponding to continued fraction
- `fromContinuedFraction`: reconstructs a number a continued fraction
- `octaveReduced`: reduce a number to within an octave
- `semiconvergents`: semiconvergents corresponding to continued fraction
- `rationalize`: derive an approximate fraction given an error bound

_Instance Creation_:

- `asRatioTuning`: construct ratio tuning
- `equalTemperamentTuning`: construct equal tempered tuning

_Interval complexity measures_:

- `benedettiHeight`: Benedetti height
- `keesSemiHeight`: Kees semi-height
- `tenneyHeight`: Tenney height
- `weilHeight`: Weil height
- `wilsonHeight`: Wilson height

_Lattice Functions_:

- `latticePrimes`: tuning lattice primes
- `latticeVertices`: tuning lattice vertices
- `latticeVector`: tuning lattice vector

_Prime Numbers_:

- `factorInteger`: primes factors
- `primeExponents`: primes exponents of factorization
- `primeFactorization`: prime factors of a fraction
- `primeFactors`: prime factors of a fraction

_Testing_:

- `isConstantStructure`: is a tuning a constant structure
- `isRational`: is a tuning rational
- `isSquareSuperparticular`: is a fraction square superparticular
- `isSuperparticular`: is a fraction superparticular
- `isTuning`: is an object a tuning

_Types & Traits_:

- `CentsTuning`: tuning stored as cents
- `RatioTuning`: tuning stored as ratios
- `Scale`: a sub-set of the indices of a tuning
- `Tuning`: tuning trait

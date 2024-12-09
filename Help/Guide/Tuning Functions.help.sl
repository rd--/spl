# Tuning Functions

_Accessing_:

- `asCents`: intervals in cents
- `asFractions`: intervals as fractions
- `asIntegers`: intervals as integers
- `asRatios`: intervals as ratios
- `intervalMatrix`:  interval matrix
- `primeLimit`: prime limit
- `limit`: prime limit
- `octave`: octave ratio

_Alterations_:

- `cancelFlat`: cancel flat
- `cancelSharp`: cancel sharp
- `flat`: lower half-tone
- `sharp`: raise half-tone
- `quarterToneFlat`: lower quarter-tone
- `quarterToneSharp`: raise quarter-tone

_Constants_:

- `holdersComma`: Holders comma
- `mercatorsComma`: 3^53/2^84
- `pythagoreanChroma`: 2187/2048
- `pythagoreanComma`: 531441/524288
- `pythagoreanLimma`: 256/243
- `septimalComma`: 64/63
- `syntonicComma`: 81/80

_Converting_:

- `asFraction`: as fraction
- `centsToRatio`: cents to ratio
- `degreeToKey`: degree to key
- `ratioToCents`: ratio to cents

_Fraction Functions_:

- `continuedFraction`: continued fraction
- `convergents`: convergents
- `fromContinuedFraction`: to fraction
- `octaveReduced`: octave reduced
- `semiconvergents`: semiconvergents
- `rationalize`: approximate fraction

_Instance Creation_:

- `asRatioTuning`: construct ratio tuning
- `equalTemperamentTuning`: edo

_Interval complexity measures_:

- `benedettiHeight`: Benedetti height
- `keesSemiHeight`: Kees semi-height
- `tenneyHeight`: Tenney height
- `weilHeight`: Weil height
- `wilsonHeight`: Wilson height

_Lattice Functions_:

- `latticeCoordinates`:
- `latticeDrawing`: lattice drawing
- `latticeEdges`: lattice edges
- `latticeGraph`: lattice graph
- `latticePrimes`: tuning lattice primes
- `latticeVector`: tuning lattice vector
- `latticeVectorString`:
- `latticeVertices`: tuning lattice vertices
- `manhattanDistance`: lattice distance
- `wilsonLatticeCoordinates`:

_Prime Numbers_:

- `factorInteger`: primes factors
- `primeExponents`: primes exponents
- `primeFactorization`: prime factors
- `primeFactors`: prime factors

_Testing_:

- `isConstantStructure`: constant structure?
- `isPythagorean`: Pythagorean?
- `isRational`: rational?
- `isSquareSuperparticular`: square superparticular?
- `isSuperparticular`: superparticular?
- `isTuning`: tuning?

_Types & Traits_:

- `CentsTuning`: tuning stored as cents
- `RatioTuning`: tuning stored as ratios
- `Scale`: a sub-set of the indices of a tuning
- `Tuning`: tuning trait

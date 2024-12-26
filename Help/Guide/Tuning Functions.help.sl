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

- `goldenAngle`: ~137.5°
- `goldenRatio`: (√5 + 1) / 2
- `holdersComma`: Holders comma
- `mercatorsComma`: 3^53/2^84
- `metallicMean`: metallic mean
- `pi`: π
- `plasticRatio`: minimal Pisot number
- `pythagoreanChroma`: 2187/2048
- `pythagoreanComma`: 531441/524288
- `pythagoreanLimma`: 256/243
- `septimalComma`: 64/63
- `silverRatio`: √2 + 1
- `supergoldenRatio`: ~85/58
- `supersilverRatio`: ~75/34
- `syntonicComma`: 81/80

_Converting_:

- `asFraction`: as fraction
- `asCentsTuning`: as cents tuning
- `asRatioTuning`: as ratio tuning
- `centsToRatio`: cents to ratio
- `degreeToKey`: degree to key
- `ratioToCents`: ratio to cents

_Fraction Functions_:

- `continuedFraction`: continued fraction
- `convergents`: convergents
- `fromContinuedFraction`: to fraction
- `limitDenominator`: limit denominator
- `octaveReduced`: octave reduced
- `semiconvergents`: semiconvergents
- `rationalize`: approximate fraction

_Instance Creation_:

- `equalTemperamentTuning`: edo
- `namedTuning`: archive lookup

_Interval Functions_:

- `intervalName`: interval name
- `namedInterval`: interval lookup

_Interval complexity measures_:

- `benedettiHeight`: Benedetti height
- `keesSemiHeight`: Kees semi-height
- `tenneyHeight`: Tenney height
- `weilHeight`: Weil height
- `wilsonHeight`: Wilson height

_Lattice Functions_:

- `latticeDrawing`: drawing
- `latticeEdges`: edges
- `latticeGraph`: graph
- `latticePrimes`: primes
- `latticeVector`: vector
- `latticeVectorString`: vector string
- `latticeVertices`: vertices
- `manhattanDistance`: distance metric
- `wilsonLatticeCoordinates`: unit vector

_Library Items_:

- `categorizedTuningArchive`: archive
- `scalaRationalTuningArchive`: archive
- `scalaTuningArchive`: tuning archive

_Metric Functions_:

- `barlowDisharmonicity`: disharmonicity
- `barlowHarmonicity`: harmonicity
- `barlowIndigestibility`: indigestibility
- `barlowIndispensability`: indispensability
- `kurenniemiMajorMinorIndex`: quality

_Notation Functions_:

- `kurenniemiNotation`: draw chord

_Prime Numbers_:

- `factorInteger`: primes factors
- `primeExponents`: primes exponents
- `primeFactorization`: prime factors
- `primeFactors`: prime factors

_Scale Functions_:

- `asLineDrawing`: line drawing
- `asScale`: intervals to scale
- `bjorklundsAlgorithm`: lattice divisions
- `bresenhamLineAlgorithm`: lattice line
- `combinationProductSet`: CPS
- `degreeToKey`: degree to key
- `eulerFokkerGenus`: Euler-Fokker genus
- `horogramDrawing`: circular horogram
- `horogramTable`: text horogram
- `intervalClass`: interval class of
- `intervalClasses`: interval classes
- `intervalsBy`: intervals at step
- `intervals`: intervals
- `isImproper`: predicate
- `isMomentOfSymmetry`: predicate
- `isPhiWeightedMediantNoble`: predicate
- `isProper`: predicate
- `isStrictlyProper`: predicate
- `mediant`: mediant
- `momentOfSymmetry`: scale generator
- `momentOfSymmetryPattern`: MOS
- `phiWeightedMediant`: mediant
- `rectangularHorogramDrawing`: drawing
- `scalaScaleArchive`: scale archive
- `stepArity`: step variety
- `textDrawing`: text drawing
- `tuningIndices`: scale indexing
- `weightedMediant`: mediant

_Testing_:

- `isConstantStructure`: is CS
- `isPythagorean`: is Pythagorean
- `isRational`: is rational
- `isSuperparticular`: is superparticular
- `isTuning`: is tuning

_Types & Traits_:

- `CentsTuning`: cents tuning
- `RatioTuning`: ratio tuning
- `ScalaTuning`: Scala tuning
- `Scale`: scale type
- `Tuning`: tuning trait

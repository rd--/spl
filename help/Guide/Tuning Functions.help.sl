# Tuning Functions

## Accessing

- `asCents`: intervals of a tuning in cents
- `asFractions`: intervals of a tuning as ratios in fraction form
- `asIntegers`: intervals of a tuning as integers
- `asRatios`: intervals of a tuning as ratios
- `primeLimit`: prime limit of a fraction
- `limit`: prime limit of a tuning

## Alterations

- `cancelFlat`: cancel flat
- `cancelSharp`: cancel sharp
- `flat`: lower by one place (a half-tone)
- `sharp`: raise by one place (a half-tone)
- `quarterToneFlat`: lower by half of one place (a quarter-tone)
- `quarterToneSharp`: raise by half of one place (a quarter-tone)

## Converting

- `centsToRatio`: convert interval given as cents to a ratio
- `degreeToKey`: convert from degree to key
- `ratioToCents`: convert interval given as a ratio to cents

## Instance Creation

- `asJiTuning`: construct ratio tuning
- `equalTemperamentTuning`: construct equal tempered tuning

## Interval complexity measures

- `benedettiHeight`: Benedetti height
- `keesSemiHeight`: Kees semi-height
- `tenneyHeight`: Tenney height
- `weilHeight`: Weil height
- `wilsonHeight`: Wilson height

## Lattice Functions

- `latticePrimes`: tuning lattice primes
- `latticeVertices`: tuning lattice vertices
- `latticeVector`: tuning lattice vector

## Prime Numbers

- `factorInteger`: primes factors
- `primeExponents`: primes exponents of factorization
- `primeFactorization`: prime factors of a fraction
- `primeFactors`: prime factors of a fraction

## Testing

- `isRational`: is a tuning rational

## Types & Traits

- `CentsTuning`: tuning stored as cents
- `RatioTuning`: tuning stored as ratios
- `Scale`: a sub-set of the indices of a tuning
- `Tuning`: tuning trait

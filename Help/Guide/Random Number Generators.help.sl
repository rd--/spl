# Random Number Generators

Random number generator traits:

- `RandomNumberGenerator`: trait
- `Stream`: trait

Pseudo random number generators:

- `Sfc32`: Small Fast Counter
- `LinearCongruential`: Thomson 1958
- `MersenneTwister`: Matsumoto 1989
- `SplitMix`: Steele 2014

`System` random number generator:

- `seedRandom`

`RandomNumberGenerator` methods:

- `randomBit`: bit
- `randomBoolean`: boolean
- `randomByteArray`: byte array
- `randomChoice`: choice
- `randomComplex`: complex number
- `randomCycle`: cycle
- `randomInteger`: small integer
- `randomLargeInteger`: large integer
- `randomPermutation`: permutation
- `randomPermutationList`: permutation
- `randomPoint`: point
- `randomPrime`: prime
- `randomReal`: real number
- `randomSubsequence`: subsequence
- `randomWeightedChoice`: biased choice

`Stream` methods:

- `next`: next item
- `nextRandomFloat`
- `nextRandomInteger`

Shuffling:

- `fisherYatesShuffle`: shuffle
- `sattoloShuffle`: shuffle
- `shuffle`: shuffle
- `shuffled`: shuffle

Probablity distributions:

- `BernoulliDistribution`
- `BetaDistribution`
- `BinomialDistribution`
- `CauchyDistribution`
- `ChiSquareDistribution`
- `EmpiricalDistribution`
- `ExponentialDistribution`
- `GammaDistribution`
- `GeometricDistribution`
- `LaplaceDistribution`
- `LogisticDistribution`
- `LogNormalDistribution`
- `NoncentralBetaDistribution`
- `NoncentralChiSquareDistribution`
- `NormalDistribution`
- `ParetoDistribution`
- `PoissonDistribution`
- `StudentTDistribution`
- `TriangularDistribution`
- `UniformDistribution`
- `WeibullDistribution`

Methods at `ProbablityDistribution`:

- `cdf`
- `hazardFunction`
- `inverseCdf`
- `inverseSurvivalFunction`
- `quantile`
- `pdf`
- `randomVariate`
- `survivalFunction`

Random number functions:

- `atRandom`
- `randomSample`

Random Processes

- `BernoulliProcess`
- `ContinuousMarkovProcess`
- `DiscreteMarkovProcess`
- `GeometricBrownianMotionProcess`
- `HiddenMarkovProcess`
- `OrnsteinUhlenbeckProcess`
- `PoissonProcess`
- `RandomWalkProcess`
- `WienerProcess`

Simulation methods:

- `eulerMaruyamaMethod`
- `milsteinMethod`

SuperCollider has distinct unit generators for:

- continuous random numbers
- triggered random numbers
- singleton random numbers
- demand rate random numbers

Random signal generators:

- `BrownNoise`
- `ClipNoise`
- `Crackle`
- `Dust2`
- `Dust`
- `GrayNoise`
- `LfClipNoise`
- `LfNoise0`
- `LfNoise1`
- `LfNoise2`
- `LfdClipNoise`
- `LfdNoise0`
- `LfdNoise1`
- `LfdNoise3`
- `PinkNoise`
- `TwChoose`
- `WhiteNoise`

Unary or binary random method producing a random value for each frame,
which can be used to implement tendency masks:

- `BiLinRand`
- `ExpRandRange`
- `LinRand`
- `RandRange`
- `Sum3Rand`

Unit generators that generate random numbers once:

- `ExpRand`
- `IRand`
- `LinRand`
- `NRand`
- `Rand`

Unit generators that generate random numbers when triggered:

- `CoinGate`
- `TExpRand`
- `TRand`
- `TiRand`
- `TwIndex`

Demand rate random number unit generators:

- `Dbrown`
- `Diwhite`
- `Dwhite`

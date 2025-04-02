# Random Unit Generators

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


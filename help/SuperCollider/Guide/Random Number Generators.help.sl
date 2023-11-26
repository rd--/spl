# Random Number Generators

Sc has distinct Ugens for:

- continuous random numbers (WhiteNoise &etc.)
- triggered random numbers (TRand &etc.)
- singleton random numbers (Rand &etc.)
- demand rate random numbers (Dwhite &etc.)

Random signal generators:
PinkNoise,
WhiteNoise,
GrayNoise,
BrownNoise,
ClipNoise,
LfNoise0,
LfNoise1,
LfNoise2,
LfClipNoise,
LfdNoise0,
LfdNoise1,
LfdNoise3,
LfdClipNoise,
Dust,
Dust2,
Crackle,
TwChoose.

Unary or binary random method producing a random value for each frame:
BiLinRand
ExpRandRange,
LinRand,
RandRange,
Sum3Rand.
These can be used to implement tendency masks.

Ugens that generate random numbers once:
ExpRand,
IRand,
LinRand,
NRand,
Rand.

Ugens that generate random numbers when triggered:
CoinGate,
TExpRand,
TRand,
TiRand,
TwIndex.

# Coin

- _Coin(input)_

Generates a random number between zero and one and answers 1 if it is less than _probablity_, else 0.

```
Coin(SinOsc(0.1, 0)) * 0.1
```

Coin one is always zero:

```
SinOsc(440, 0) * Coin(Dc(1)) * 0.1
```

Coin zero is always zero:

```
SinOsc(440, 0) * Coin(Dc(0))
```

Coin of almost one is almost always one:

```
SinOsc(440, 0) * Coin(Dc(0.999)) * 0.1
```

* * *

See also: BiLinRand, LinRand, Sum3Rand

Categories: Ugen, Math, Operator

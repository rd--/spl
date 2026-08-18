# Coin

- _Coin(p)_

Generates a random number between zero and one and answers `one` if it is less than probablity _p_,
else `zero`.

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

Guides: Unit Generators

Categories: Ugen, Math, Operator

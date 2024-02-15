# Initialised Temporaries Syntax

Rewrite rules:

- _let p = x; let q = y; ..._ ⟹ _var p, q ...; p := x; q := y; ..._

The program below is by James McCartney and is taken from the SuperCollider2 documentation.

```
{- ten voices of a random sine percussion sound -}
let s = { Resonz(Dust(0.2) * 50, Rand(200, 3200), 0.003) } !+ 10;
{- reverb predelay time -}
let z = DelayC(s, 0.048, 0.048);
{- seven length modulated comb delays in parallel -}
let y = { CombL(z, 0.1, LfNoise1(Rand(0, 0.1)) * 0.04 + 0.05, 15) } !+ 7;
{- two parallel chains of four allpass delays -}
4.timesRepeat { y := AllpassC(y, 0.050, [Rand(0, 0.050), Rand(0, 0.050)], 1) };
{- add original sound to reverb -}
s + (0.2 * y)
```

* * *

See also: [Variable Keyword Syntax]

Categories: Syntax

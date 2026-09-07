# Sqrt

- _Sqrt(x)_

Signed square root,
see `signedSqrt` for the definition.

```
>>> -9.Sqrt
-3
```

Compare with `sqrt`:

```
>>> -9.sqrt
0J3
```

Signed square root of sine oscillator:

```
let a = SinOsc(440, 0) * 0.1;
let b = a.Sqrt * 0.1;
[a b]
```

* * *

See also: ^, cubeRoot, nthRoot, signedSqrt, sqrt

Guides: Unit Generators

Categories: Ugen

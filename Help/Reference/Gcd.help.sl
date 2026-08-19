# Gcd

- _Gcd(m, n)_

Signed greatest common divisor.
Alias of `signedGcd`.

Mouse control of frequency:

```
let mx = MouseX(-200, 200, 0, 0.2);
let my = MouseY(-200, 200, 0, 0.2);
let z = SinOsc(0.3, 0) * [mx, my].Gcd(20);
SinOsc(z * 30 + 500, 0) * 0.1
```

* * *

See also: ||, gcd, lcm, Lcm, signedGcd

Guides: Unit Generators

References:
_Apl_
[1](https://aplwiki.com/wiki/GCD),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/plusdot#dyadic),
_Mathematica_
[1](https://mathworld.wolfram.com/GreatestCommonDivisor.html)
[2](https://mathworld.wolfram.com/GCD.html),
_SuperCollider_
[1](https://doc.sccode.org/Overviews/Operators.html#gcd)

Further Reading: McDonnell 1975

Categories: Ugen

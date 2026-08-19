# Lcm

- _Lcm(m, n)_

Signed least common multiple.
Alias of `signedLcm`

Mouse control of frequency:

```
let mx = MouseX(-200, 200, 0, 0.2);
let my = MouseY(-200, 200, 0, 0.2);
let freq = SinOsc(
	0.3,
	0
) * [mx, my].Lcm(20) * 30 + 500;
SinOsc(freq, 0) * 0.1
```

* * *

See also: &&, gcd, Gcd, lcm, signedLcm

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Overviews/Operators.html#lcm)

Categories: Ugen

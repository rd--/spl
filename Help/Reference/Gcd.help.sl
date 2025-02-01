# Gcd

- _Gcd(aNumber, anotherNumber)_

Greatest common divisor.

This definition extends the usual definition and returns a negative number if both operands are negative.
This makes it consistent with the lattice-theoretical interpretation and it’s idempotency, commutative, associative, absorption laws.

```
>>> -1024.Gcd(-256)
-256

>>> -1024.Gcd(-1024.Lcm(-256))
-1024
```

"greater" means "divisible by" in this interpretation, so _Gcd(-1, -1)_ returns a negative number.
This is necessary to make the whole system consistent (fundamental law of arithmetics, idempotency and absorption laws would fail).

Following the example of the programming language _J_, `Gcd` is analogous to logical or:

```
>>> Gcd:/2.table([0 1], [0 1])
[0 1; 1 1]

>>> ||.table([false true], [false true])
[false true; true true]
```

Mouse control of frequency:

```
let mx = MouseX(-200, 200, 0, 0.2);
let my = MouseY(-200, 200, 0, 0.2);
let freq = SinOsc(0.3, 0) * [mx, my].Gcd(20) * 30 + 500;
SinOsc(freq, 0) * 0.1
```

* * *

See also: ||, gcd, lcm, Lcm

References:
_Apl_
[1](https://aplwiki.com/wiki/GCD),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/plusdot#dyadic),
_Mathematica_
[1](https://mathworld.wolfram.com/GreatestCommonDivisor.html)
[2](https://mathworld.wolfram.com/GCD.html),
_SuperCollider_
[1](https://doc.sccode.org/Overviews/Operators.html#lcm)

Further Reading: McDonnell 1975

Categories: Ugen

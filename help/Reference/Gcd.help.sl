# Gcd

Greatest common divisor.

_Gcd(aNumber, anotherNumber)_

This definition extends the usual definition and returns a negative number if both operands are negative.
This makes it consistent with the lattice-theoretical interpretation and its idempotency, commutative, associative, absorption laws.

"greater" means "divisible by" in this interpretation, so _Gcd(-1, -1)_ returns a negative number.
This is necessary to make the whole system consistent (fundamental law of arithmetics, idempotency and absorption laws would fail).

Following the example of the programming language _J_, Gcd is analogous to logical or.

```
let mx = MouseX(-200, 200, 0, 0.2);
let my = MouseY(-200, 200, 0, 0.2);
let freq = SinOsc(0.3, 0) * 20.Gcd([mx, my]) * 30 + 500;
SinOsc(freq, 0) * 0.1
```

* * *

See also: Lcm

References:
_Apl_
[1](https://aplwiki.com/wiki/GCD),
_Mathematica_
[1](https://mathworld.wolfram.com/GreatestCommonDivisor.html)
[2](https://mathworld.wolfram.com/GCD.html)

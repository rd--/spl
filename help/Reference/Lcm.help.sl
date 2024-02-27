# Lcm

- _Lcm(aNumber, anotherNumber)_

Least common multiple.

This definition extends the usual definition and returns a negative number if any of the operands is negative.
This makes it consistent with the lattice-theoretical interpretation and it’s idempotency, commutative, associative, absorption laws.

Following the example of the programming language _J_, `Lcm` is analogous to logical and.

```
let mx = MouseX(-200, 200, 0, 0.2);
let my = MouseY(-200, 200, 0, 0.2);
let freq = SinOsc(0.3, 0) * 20.Lcm([mx, my]) * 30 + 500;
SinOsc(freq, 0) * 0.1
```

* * *

See also: Gcd

References:
_Apl_
[1](https://aplwiki.com/wiki/LCM),
_J_
[1](https://code.jsoftware.com/wiki/Vocabulary/stardot#dyadic),
_Mathematica_
[1](https://mathworld.wolfram.com/LeastCommonMultiple.html)
[2](https://mathworld.wolfram.com/LCM.html)

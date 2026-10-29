# leakDc

- _leakDc(in, coef=0.995)_

Remove dc offset from a signal.

- in: input signal
- coef: leak coefficient

Add dc to a pulse wave and then remove it:

~~~spl syn=A
let a = lfPulse(800, 0, 0.5) * 0.5 + 0.5;
[a * 0.1, leakDc(a, 0.995) * 0.1]
~~~

* * *

See also: dc

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/LeakDC.html)

Categories: Ugen

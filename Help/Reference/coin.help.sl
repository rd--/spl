# coin

- _coin(r, p)_

Random `Boolean` generator.
Generate a random real number between `zero` and `one` and answers if it is less than probablity _p_.

At `zero`, `coin` is always `false`,
at `one`, `coin` is always `true`,
at one third, `coin` is `true` one third of the time.

```
>>> let r = Sfc32(216613);
>>> { r.coin(0.5) } ! 9
[true true false false true true false true true]
```

The unary form is a unit generator variant:

~~~spl syn=A
coin(sinOsc(0.1, 0)) * 0.1
~~~

Coin one is always zero:

~~~spl syn=B
sinOsc(440, 0) * coin(dc(1)) * 0.1
~~~

Coin zero is always zero:

~~~spl syn=C
sinOsc(440, 0) * coin(dc(0))
~~~

Coin of almost one is almost always one:

~~~spl syn=D
sinOsc(440, 0) * coin(dc(0.999)) * 0.1
~~~

* * *

See also: randomBit, randomBoolean, randomComplex, randomInteger, randomReal

Guides: Random Functions

Categories: Random

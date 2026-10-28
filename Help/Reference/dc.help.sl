# dc

- _dc(in=0)_

Create a constant amplitude signal.
This Ugen simply outputs the initial value you give it.

- in: constant value to output, cannot be modulated, set at initialisation time

Silence:

```
dc(0)
```

dc offset, will click on start and finish:

```
sinOsc(440, 0) * 0.1 + dc(0.5)
```

Note the transient before leakDc adapts and suppresses the offset:

```
leakDc(dc(0.5), 0.995)
```

Offset one random sine tone by one silent channel:

```
[dc(0), sinOsc(rand(200, 400), 0) * 0.1]
```

* * *

See also: leakDc, silent

Guides: Unit Generators

References:
_SuperCollider_
[1](https://doc.sccode.org/Classes/DC.html)

Categories: Ugen

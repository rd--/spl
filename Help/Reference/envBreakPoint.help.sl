# envBreakPoint

- _envBreakPoint(breakPointList, curves)_

Answers a `Env` describing a break point envelope.
The input list is arranged as _[l1, t2, l2, t3, l3 .. ln]_.
The initial time (_t1_) is zero.

~~~spl syn=A
let env = envBreakPoint(
	[0 5 1 6 0],
	[4 -4]
).asEnvGen(1);
sinOsc(
	linLin(env, 0, 1, 220, 880),
	0
) * env * 0.1
~~~

Observe calculated `Env` parameters:

```
>>> envBreakPoint([0, 1, 1, 3, 0], -4)
>>> .coordinateList
[0 2 -99 -99 1 1 5 -4 0 2 5 -4]
```

* * *

See also: envGen

Guides: Unit Generators

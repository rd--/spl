# Specialised Constructors

In SuperCollider language the method _lag_ has three meanings.
_x.lag_ means _lag(x, 0.1)_, _x.lag(y)_ means _lag(x, y)_ and _x.lag(y, z)_ means lagUd(x, y, z).

In Sᴘʟ the second and third meanings are written as _x.lag(y)_ and _x.lagUd(y, z)_ respectively.

Implementing the first meaning requires writing an additional method.

```
+[List, Ugen] {
	lag { :self |
		lag(self, 0.1)
	}
}
```

Such shorthands are useful for common idioms.
The `linLin` pseudo-Ugen maps between two linear ranges.
The `range` pseudo-Ugen is `linLin` with an input range of (-1, 1).

```
+ [List, Ugen] {
	range { :self :lo :hi |
		linLin(self, -1, 1, lo, hi)
	}
}
```

The program below uses both of these shorthand notations.

```
sinOsc(
	lfNoise0([1, 3])
	.lag
	.range(100, 300),
	0
) * 0.1
```

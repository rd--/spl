# Specialised Constructors

In SuperCollider language the method _lag_ has three meanings.
_x.lag_ means _Lag(x, 0.1)_, _x.lag(y)_ means _Lag(x, y)_ and _x.lag(y, z)_ means LagUd(x, y, z).

In Spl the second and third meanings are written as _x.Lag(y)_ and _x.LagUd(y, z)_ respectively.

Implementing the first meaning requires writing an additional method.

```
+ Object {
	Lag { :self |
		Lag(self, 0.1)
	}
}
```

Such shorthands are useful for common idioms.
The _LinLin_ pseudo-Ugen maps between two linear ranges.
The _Range_ pseudo-Ugen is LinLin with an input range of (-1, 1).

```
+ Object {
	Range { :self :lo :hi |
		LinLin(self, -1, 1, lo, hi)
	}
}
```

The program below uses both of these shorthand notations.

```
SinOsc(LfNoise0([1, 3]).Lag.Range(100, 300), 0) * 0.1
```

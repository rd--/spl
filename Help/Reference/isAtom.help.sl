# isAtom

- _isAtom(x)_

Answer `true` if the object _x_ is indivisible,
specifically if it does not implement the `Collection` trait.
The opposite predicate is `isCollection`.

At `String`:

```
>>> 'text'.isAtom
true
```

At `Boolean`:

```
>>> false.isAtom
true
```

At `SmallFloat`:

```
>>> 3.141.isAtom
true
```

At `LargeInteger`:

```
>>> 23L.isAtom
true
```

At `Symbol`:

```
>>> `x`.isAtom
true
```

At `Rational`:

```
>>> 2/3.isAtom
true
```

At `Complex`:

```
>>> 2J3.isAtom
true
```

At `Decimal`:

```
>>> 2.3D.isAtom
true
```

At `Decimal`:

```
>>> 2.3D.isAtom
true
```

At `Interval`:

```
>>> (0 -- 1).isAtom
true
```

At `Association`:

```
>>> (1 -> 2).isAtom
true
```

At `Range`:

```
>>> 1:9.isAtom
false
```

At `List`:

```
>>> [1 2 3].isAtom
false
```

At `Record`:

```
>>> (x: 1, y: 2, z: 3).isAtom
false
```

At `Tuple`, which is not properly a collection:

```
>>> (1, 2, 3).isAtom
true
```

* * *

See also: isCollection, isList, isNumber

Guides: List Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/AtomQ.html)

Categories: Testing, Collection

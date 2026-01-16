# identical

- _x == y_

Answers `true` if the object _x_ is identical to another object _y_, else `false`.
`identical` decides if two values are references to the same object.
The operator form is `==`.

Equal strings are identical:

```
>>> 'abc' == 'abc'
true
```

Equal integers are identical:

```
>>> 123 == 123
true
```

Equal complex numbers, fractions and lists are not identical.
At `Complex`:

```
>>> 1J1 == 1J1
false
```

At `Fraction`:

```
>>> 1/3 == 1/3
false
```

At `List`:

```
>>> [1 2 3] == [1 2 3]
false
```

At `SmallFloat`,
negative zero is equal to,
and therefore identical to,
zero:

```
>>> -0 == 0
true
```

`Block`s can be compared for identity,
including the block `==`:

```
>>> == == ==
true
```

* * *

See also: =, ~~, ~, !=, !==, nonidentical

Guides: Comparison Functions

References:
_Lisp_
[1](https://www.lispworks.com/documentation/HyperSpec/Body/f_eq.htm#eq)
_Mathematica_
[1](https://reference.wolfram.com/language/ref/SameQ.html),
_Smalltalk_
5.3.1.2

Categories: Comparing

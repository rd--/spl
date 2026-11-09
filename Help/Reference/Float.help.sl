# Float

- _Float(x)_

Answer a `Float` that closely approximates the value of the number _x_.

At `Float`:

```
>>> Float(23)
23.0

>>> Float(1.pi)
1.pi
```

At `Fraction`:

```
>>> Float(3/4)
0.75
```

At `Integer`:

```
>>> Float(23L)
23
```

Threads over lists:

```
>>> Float[3/4 23L]
[0.75 23]
```

_Note:_
At present there is only one floating point type,
and `Float` is simply an alias for `Float`.

* * *

See also: Integer, Number

Guides: Number Functions

References:
_Smalltalk_
5.6.2.11

Categories: Converting

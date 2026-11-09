# normalInteger

- _normalInteger(x)_

Convert the object _x_ to a normal integer from a special form.
Answers either a small or large integer as required.
`normalInteger` will answer a value that is equal to _x_,
however it may change the type of the value.

At `Integer`,
answer a `Float` if the integer can be properly represented as such,
that is,
if the value would answer `true` for `isSmallInteger`:

```
>>> let x = normalInteger(23L);
>>> (x, x.isFloat, x.isSmallInteger)
(23, true, true)

>>> let x = normalInteger(2 ^ 54);
>>> (x, x.isInteger)
(18014398509481984L, true)
```

At `Float`,
answer a `Float` if it is an integer,
else signal an error:

```
>>> 23.normalInteger
23

>>> {
>>> 	3.141.normalInteger
>>> }.hasError
true
```

Threads over lists:

```
>>> [23 23D 23L].normalInteger
[23 23 23]
```

_Rationale_:
`normalInteger` is a subset of `Integer`,
it is only defined at `Float` and `Integer`.

* * *

See also: Integer, Integer, SmallInteger

Guides: Number Functions

References:
_Mathematica_
[1](https://reference.wolfram.com/language/ref/Normal.html)

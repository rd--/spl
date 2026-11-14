# SmallInteger

- _SmallInteger(x)_

Answer the `Float` that is equal to the number _x_,
which must be an integer value.
`SmallInteger` is a pseudo-type,
it has a pseudo-type predicate `isSmallInteger`.

At `Float`:

```
>>> SmallInteger(23)
23
```

It is an error if the value is not an integer:

```
>>> {
>>> 	SmallInteger(1.pi)
>>> }.hasError
true
```

At `Integer`:

```
>>> SmallInteger(8388608L)
8388608
```

It is an error if the value is cannot be represented as a small integer:

```
>>> {
>>> 	SmallInteger(2L ^ 53L)
>>> }.hasError
true
```

At `Fraction`,
the value must be an integer:

```
>>> SmallInteger(23/1)
23

>>> {
>>> 	SmallInteger(22/7)
>>> }.hasError
true
```

At `Decimal`,
the value must be an integer:

```
>>> SmallInteger(23D)
23

>>> SmallInteger(23.000D)
23

>>> {
>>> 	SmallInteger(3.141D)
>>> }.hasError
true
```

Arithmetic at small integers overflows to `Integer` as required:

```
>>> Float(17L ^ 17L)
827240261886336800000.0

>>> let a = 2L ^ 49L;
>>> let b = a.square;
>>> (a, b, Float(b))
(
	562949953421312.0,
	316912650057057350374175801344L,
	316912650057057350000000000000.0
)
```

However, intermediate integers are erased:

```
>>> let a = 2L ^ 49L;
>>> let b = a * 17L;
>>> (-a, b, Float(-a - b))
(
	-562949953421312L,
	9570149208162304L,
	-10133099161583616.0
)
```

Small integers behave differently from `Integer` for division.
Small integers answer a `Float`,
that may be a small integer,
whereas `Integer` answers a `Fraction`,
which is not an `Integer`:

```
>>> 12.0 / 4.0
3.0

>>> 12L / 4L
3/1

>>> 11.0 / 4.0
2.75

>>> 11L / 4L
11/4
```

_Rationale_:
Arithmetic overflow of `SmallInteger` values is particularly confusing.
The answers remain approximately accurate,
and it is very easy to miss that overflow has occurred.
The interpreter promotes answers that would overflow to the type `Integer`.
It is possible to have the interpreter print a message when overflow occurs,
and also to treat overflow as an error.
The help files generally run without requiring type promotion,
by writing integer literals in expressions that would otherwise overflow with an `L` suffix.
That is,
calculations which would overflow are written using `Integer` values.

* * *

See also: Float, Fraction, Integer, isSmallInteger

Guides: Bitwise Functions, Integer Functions, Number Functions
